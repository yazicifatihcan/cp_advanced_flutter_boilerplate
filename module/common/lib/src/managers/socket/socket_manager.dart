// ignore_for_file: inference_failure_on_function_return_type

import 'dart:async';
import 'dart:developer' show log;
import 'dart:io' show WebSocket;


///
typedef OnStatusChange = Function(SocketStatus);

/// Enum representing different statuses of the WebSocket connection.
enum SocketStatus {
  /// Socket is currently connecting.
  connecting,

  /// Socket has connected.
  connect,

  /// Socket has disconnected.
  disconnect,

  /// Socket has error during connection.
  error,
}

/// A class for managing WebSocket connections.
class AppSocket {
  /// Creates an instance of [AppSocket] with the specified [url],
  /// optional [header], and [onStatusChange] callback.
  AppSocket({
    required this.url,
    required this.onStatusChange,
    this.header,
  });

  /// Controller for managing and broadcasting WebSocket data streams.
  final StreamController<String> controller =
      StreamController.broadcast(sync: true);

  /// WebSocket instance used for communication.
  WebSocket? _channel;

  /// The URL of the WebSocket server.
  final String url;

  /// Optional headers to be included in the WebSocket connection.
  final Map<String, String>? header;

  /// Callback function to handle WebSocket status changes.
  final OnStatusChange onStatusChange;

  /// Closes the WebSocket connection and releases associated resources.
  Future<void> close() async {
    await controller.done;
    await _channel?.close();
    _channel = null;
    _log('close');
  }

  /// Initializes the WebSocket connection and sets up event listeners.
  Future<void> init() async {
    _log('connecting...');
    onStatusChange(SocketStatus.connecting);
    _channel = await _connectToSocket();
    onStatusChange(SocketStatus.connect);
    _log('socket connection initialized');
    await _channel!.done.then(_thenDone);
    _channel!.listen(
      (data) => _listen(data as String),
      onDone: _onDone,
      onError: _onError,
    );
  }

  /// Callback function called when the WebSocket connection is closed.
  void _thenDone(value) {
    if (_channel == null) return;
    _log('then done');
    init();
  }

  /// Callback function called when data is received from the WebSocket.
  void _listen(String data) {
    _log('WebSocket Data: $data');
    controller.add(data);
  }

  /// Callback function called when an error occurs in the WebSocket connection.
  void _onError(dynamic e) {
    onStatusChange(SocketStatus.error);
    _log('Server error: $e');
    init();
  }

  /// Callback function called when the WebSocket connection
  /// is completed or aborted.
  void _onDone() {
    if (_channel == null) return;
    onStatusChange(SocketStatus.disconnect);
    _log('connecting aborted');
    init();
  }

  /// Establishes a WebSocket connection to the specified URL
  ///  with optional headers.
  Future<WebSocket> _connectToSocket() async {
    try {
      return await WebSocket.connect(url, headers: header);
    } catch (e) {
      _log('Error! cannot connect WS connectWs $e');
      await Future<Duration>.delayed(const Duration(seconds: 1));
      return _connectToSocket();
    }
  }

  /// Sends data to the WebSocket server.
  void send(String data) {
    _log('Sent Data: $data');
    _channel!.add(data);
  }

  /// Internal logging function using the Dart developer log.
  void _log(String message) => log(message, name: 'socket');
}
