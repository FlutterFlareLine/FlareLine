library flareline_uikit;
import 'package:rx_event_bus/rx_event_bus.dart';

class GlobalEvent {

  // EventBus
  static EventBus eventBus = EventBus();
}

class EventInfo{
  dynamic obj;

  String eventType;

  EventInfo(this.obj, this.eventType);
}
