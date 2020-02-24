import 'package:equatable/equatable.dart';

abstract class ConnectivityState extends Equatable {
  const ConnectivityState();

  @override
  List<Object> get props => [];
}

class AppStarted extends ConnectivityState {}

class InternetAvailable extends ConnectivityState {}

class InternetUnAvailable extends ConnectivityState {}
