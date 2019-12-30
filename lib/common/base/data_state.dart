import 'dart:core';

class DataState {}

class StateLoading extends DataState {}

class StateError extends DataState {
  final String message;

  StateError(this.message);
}

class StateInitial extends DataState {}

class StateSuccessWithList extends DataState {
  final List<Object> result;

  StateSuccessWithList(this.result);
}

class StateSuccessWithMap extends DataState {
  final Map<String, dynamic> result;

  StateSuccessWithMap(this.result);
}

class StateEmpty extends DataState {}
