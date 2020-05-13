import 'package:mobx/mobx.dart';

import 'enum_state.dart';

class ControllerState {

  static statusCheck(ObservableFuture future) {
    if(future == null) {
      return EnumState.initial;
    }
    switch(future.status){
      case FutureStatus.pending:
        return EnumState.loading;
      case FutureStatus.rejected:
        return EnumState.error;
      case FutureStatus.fulfilled:
        return EnumState.loaded;
      default:
        return EnumState.initial;
    }
  }
}