library flareline_uikit;

import 'dart:async';

import 'package:flareline_uikit/core/event/global_event.dart';
import 'package:flareline_uikit/core/mvvm/bloc/bloc_base_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logger/logger.dart';

abstract class BlocBaseViewModel<S extends BlocBaseState> extends Cubit<S> {
  var logger = Logger();

  bool _isDisposed = false;

  Map<String, dynamic>? param;

  bool get isRegisterEventBus => false;

  bool get isStickEventBus => false;

  StreamSubscription? _eventBusFn;

  BlocBaseViewModel(BuildContext context, S initialState) : super(initialState) {
    if (isRegisterEventBus) {
      _registerEventBus(context);
    }

    init(context);
  }

  void setArgs(Map<String, dynamic>? param) {
    this.param = param;
  }

  void init(BuildContext context) {}

  void onViewCreated(BuildContext context) {}

  void _registerEventBus(BuildContext context) {
    if (isStickEventBus) {
      _eventBusFn = GlobalEvent.eventBus.onSticky<EventInfo>().listen((event) {
        if (event != null) {
          if (_isDisposed) {
            return;
          }
          handleEventBus(context, event);
        }
      });
      return;
    }
    _eventBusFn = GlobalEvent.eventBus.on<EventInfo>().listen((event) {
      if (event != null) {
        if (_isDisposed) {
          return;
        }
        handleEventBus(context, event);
      }
    });
  }

  void _unRegisterEventBus() {
    if (_eventBusFn != null) {
      _eventBusFn!.cancel();
    }
  }

  void handleEventBus(BuildContext context, EventInfo eventInfo) {}

  @override
  void emit(state) {
    if (_isDisposed) {
      return;
    }
    print(state.toString());
    super.emit(state);
  }

  void log(String msg) {
    logger.f(msg);
  }

  @override
  Future<void> close() {
    if (!_isDisposed) {
      _unRegisterEventBus();
      onSafeDispose();
    }
    _isDisposed = true;
    return super.close();
  }

  void onSafeDispose() {}
}
