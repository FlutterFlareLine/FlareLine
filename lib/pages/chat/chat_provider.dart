import 'package:flutter/material.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;

class ChatProvider extends ChangeNotifier {
  types.Room? _room;

  types.Room? get room => _room;

  set room(types.Room? room) {
    _room = room;
    notifyListeners();
  }
}
