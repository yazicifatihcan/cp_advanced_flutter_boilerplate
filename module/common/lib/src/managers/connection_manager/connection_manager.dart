import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';

///This class is created for managing connection status.
class ConnectionManager {
  ConnectionManager._();

  static final _instance = ConnectionManager._();

  ///Connection manager instance
  static ConnectionManager get instance => _instance;

  final _hasConnectionStreamController = StreamController<bool>();
  final _serverPingStreamController = StreamController<ConnectionStatusModel>();

  late final String _serverPingURL;

  final Duration _lookUpConnectionDelay = const Duration(seconds: 10);

  final String _checkInternetURL = 'google.com';

  ///This function initialize the necessary fields within [ConnectionManager]
  ///You have to initialize the class before using
  /// anything within [ConnectionManager]
  void init(String serverPingUrl) {
    _serverPingURL = serverPingUrl;
    Timer.periodic(
      _lookUpConnectionDelay,
      (timer) => isInternetAvailable(),
    );
    Timer.periodic(
      _lookUpConnectionDelay,
      (timer) => _serverPing(_serverPingURL),
    );
  }

  ///This method checks if there is valid internet connection.
  Future<bool> isInternetAvailable() async {
    try {
      final result = await InternetAddress.lookup(_checkInternetURL);
      final isActive = result.isNotEmpty && result[0].rawAddress.isNotEmpty;
      _updateStreamController(isActive);

      return isActive;
    } on SocketException catch (_) {
      _updateStreamController(false);

      return false;
    }
  }

  ///It's updating the controller for stream
  void _updateStreamController(bool result) {
    _hasConnectionStreamController.sink.add(result);
  }

  ///It return current internet status as bool as stream.
  Stream<bool> getInternetAvailabilityStream() {
    return _hasConnectionStreamController.stream;
  }

  void _updateServerPingStreamController(ConnectionStatusModel model) {
    _serverPingStreamController.sink.add(model);
  }

  ///It return current internet performance as
  ///[ConnectionStatusModel] as stream.
  Stream<ConnectionStatusModel> serverPingStream() {
    return _serverPingStreamController.stream;
  }

  Future<void> _serverPing(String serverPingUrl) async {
    final stopwatch = Stopwatch()..start();

    try {
      final response = await HttpClient()
          .getUrl(Uri.parse(serverPingUrl))
          .then((value) => value.close());
      if (response.statusCode == HttpStatus.ok) {
        stopwatch.stop();
        _createConnectionModel(stopwatch.elapsedMilliseconds, false);
        _updateServerPingStreamController(
            _createConnectionModel(stopwatch.elapsedMilliseconds, false),);
      }
    } catch (e) {
      final model = ConnectionStatusModel(
        color: Colors.red,
        connectionStatus: ConnectionStatusEnum.error,
        isWebSocket: false,
        title: 'Internet bağlantısı yok.',
      );
      _updateServerPingStreamController(model);
    }
  }

  ConnectionStatusModel _createConnectionModel(
    int stopWatchValue,
    bool isWebSocket,
  ) {
    if (stopWatchValue > 400) {
      return ConnectionStatusModel(
        isWebSocket: isWebSocket,
        connectionStatus: ConnectionStatusEnum.slow,
        connectionDelay: stopWatchValue,
        color: Colors.red,
        title: 'Your connection speed is bad.',
      );
    } else if (stopWatchValue > 250 && stopWatchValue < 400) {
      return ConnectionStatusModel(
        isWebSocket: isWebSocket,
        connectionStatus: ConnectionStatusEnum.normal,
        connectionDelay: stopWatchValue,
        color: Colors.orange,
        title: 'Your connection speed is normal.',
      );
    } else if (stopWatchValue > 0 && stopWatchValue < 250) {
      return ConnectionStatusModel(
        isWebSocket: isWebSocket,
        connectionStatus: ConnectionStatusEnum.ok,
        connectionDelay: stopWatchValue,
        color: Colors.green,
        title: 'Your connection speed is good.',
      );
    }
    return ConnectionStatusModel(
      isWebSocket: isWebSocket,
    );
  }
}

///Class that returns everytingh related to connection statusses.
class ConnectionStatusModel {
  ///
  ConnectionStatusModel({
    this.isWebSocket,
    this.connectionStatus,
    this.connectionDelay,
    this.color,
    this.title,
  });

  ///Is current connection is webSocket.
  final bool? isWebSocket;

  ///Is current connection status as [ConnectionStatusModel].
  final ConnectionStatusEnum? connectionStatus;

  ///Delay value for the current check.
  final int? connectionDelay;

  ///Color that represent current connection status.
  final Color? color;

  ///Title that represent current connection.
  final String? title;
}

///Enum that represent ConnectionStatus
enum ConnectionStatusEnum {
  ///Enum that represent Status is good.
  ok,

  ///Enum that represent Status is normal.
  normal,

  ///Enum that represent Status is slow.
  slow,

  ///Enum that represent Status is error.
  error
}
