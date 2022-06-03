import 'package:flutter_bloc/flutter_bloc.dart';

import 'event_bus_event.dart';
import 'event_bus_state.dart';

class EventBusBloc extends Bloc<EventBusEvent, EventBusState> {
  EventBusBloc() : super(EventBusInitState()){
   on<EventBusEvent>((event, emit) {
     switch (event.runtimeType) {
       case EventBusCheckCallEvent:
         emit(EventBusCheckCallState());
         break;
       case EventBusShowCallEvent:
         emit(EventBusShowCallState());
         break;
       case EventBusRequestInitDataCartEvent:
         emit(EventBusRequestInitDataCartState());
         break;
       case EventBusRequestInitDataNotificationEvent:
         emit(EventBusRequestInitDataNotificationState(
             count: (event as EventBusRequestInitDataNotificationEvent).count));
     break;
     case EventBusRequestInitDataPersonalEvent:
       emit(EventBusRequestInitDataPersonalState());
     break;
   }
   });
  }
}
