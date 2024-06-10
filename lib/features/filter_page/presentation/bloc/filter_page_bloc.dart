import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'filter_page_event.dart';
part 'filter_page_state.dart';

class FilterPageBloc extends Bloc<FilterPageEvent, FilterPageState> {
  FilterPageBloc() : super(FilterPageInitial()) {
    on<FilterPageEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
