import 'package:do_cu_di/common/bloc/snackbar_bloc/snackbar_event.dart';
import 'package:do_cu_di/common/bloc/snackbar_bloc/snackbar_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SnackBarBloc extends Bloc<SnackbarEvent, SnackBarState> {
  final duration = const Duration(seconds: 3);

  SnackBarBloc() : super(InitialSnackbarState()){
    on<SnackbarEvent>((event, emit) {
      if (event is ShowSnackbarEvent) {
        emit(ShowSnackBarState(
            mess: event.content,
            type: event.type,
            duration: event.duration ?? duration));
      }
    });
  }
}
