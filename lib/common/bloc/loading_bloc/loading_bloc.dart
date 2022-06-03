import 'package:flutter_bloc/flutter_bloc.dart';

import 'loading_event.dart';
import 'loading_state.dart';

class LoadingBloc extends Bloc<LoadingEvent, LoadingState> {
  factory LoadingBloc() => _instance;

  LoadingBloc._() : super(Loaded()){
    on<LoadingEvent>((event, emit){
      switch (event.runtimeType) {
        case StartLoading:
          emit(Loading());
          break;
        case FinishLoading:
          emit(Loaded());
          break;
        case ShowNewYearCardEvent:
          emit(ShowPopUpState(event.showNewYear));
          break;
      }
    });
  }

  static final LoadingBloc _instance = LoadingBloc._();

  static LoadingBloc get instance => _instance;

}
