import 'package:resources/src/enum/general_enum.dart';

extension LoadingStatusExtension on LoadingStatus {
  bool get isLoading => this == LoadingStatus.Loading;

  bool get isInit => this == LoadingStatus.Init;

  bool get isError => this == LoadingStatus.Error;

  bool get isLoaded => this == LoadingStatus.Loaded;

  bool get isProcessing => this == LoadingStatus.Processing;
}