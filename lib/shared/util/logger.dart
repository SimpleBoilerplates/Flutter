import 'package:flutter_riverpod/flutter_riverpod.dart';

class Logger extends ProviderObserver {
  @override
  void didUpdateProvider(ProviderBase provider, Object? previousValue,
      Object? newValue, ProviderContainer container) {
    if (newValue is StateController<int>) {
      print(
          '[${provider.name ?? provider.runtimeType}] value: ${newValue.state}');
    }
  }
}
