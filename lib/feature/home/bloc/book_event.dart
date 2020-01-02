import 'package:equatable/equatable.dart';

abstract class BookEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class Fetch extends BookEvent {}
