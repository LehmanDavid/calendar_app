import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  @override
  List<Object?> get props => [];
}

class UnknownFailure extends Failure {
  final String errorMessage;
  final String stackTrace;

  UnknownFailure(this.errorMessage, this.stackTrace);

  @override
  List<Object?> get props => [errorMessage, stackTrace];
}

class CacheFailure extends Failure {
    final String errorMessage;

  CacheFailure(this.errorMessage, );

  @override
  List<Object?> get props => [errorMessage];
}
