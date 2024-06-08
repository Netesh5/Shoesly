import 'package:equatable/equatable.dart';

sealed class CommonState extends Equatable {}

class CommonInitialState extends CommonState {
  @override
  List<Object?> get props => [];
}

class CommonLoadingState extends CommonState {
  final bool showLoading;
  CommonLoadingState({this.showLoading = true});
  @override
  List<Object?> get props => [showLoading];
}

class CommonErrorState extends CommonState {
  final String message;
  final bool isWarning;

  CommonErrorState({required this.message, this.isWarning = false});

  @override
  List<String> get props => [message];
}

class CommonSuccessState<Type> extends CommonState {
  final Type data;

  CommonSuccessState({required this.data});

  @override
  List<Type> get props => [data];
}

class CommonNoDataState extends CommonState {
  CommonNoDataState();

  @override
  List<Object?> get props => [];
}
