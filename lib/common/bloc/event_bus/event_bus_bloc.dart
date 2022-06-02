import 'package:flutter_bloc/flutter_bloc.dart';

import 'event_bus_event.dart';
import 'event_bus_state.dart';

class EventBusBloc extends Bloc<EventBusEvent, EventBusState> {
  EventBusBloc() : super(EventBusInitState()){
   on<EventBusEvent>((event, emit) {
     switch (event.runtimeType) {
       case EventBusCheckCallEvent:
         EventBusCheckCallState();
         break;
       case EventBusShowCallEvent:
         EventBusShowCallState();
         break;
       case EventBusRequestInitDataCartEvent:
         EventBusRequestInitDataCartState();
         break;
       case EventBusRequestInitDataNotificationEvent:
         EventBusRequestInitDataNotificationState(
             count: (event as EventBusRequestInitDataNotificationEvent).count);
     break;
     case EventBusRequestInitDataPersonalEvent:
       EventBusRequestInitDataPersonalState();
     break;
   }
   });
  }
}
