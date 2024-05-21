import 'package:flutter/foundation.dart';
import '../../../core/enum/viewstate.dart';

class BaseModel with ChangeNotifier {
  ViewState _state = ViewState.idle;

  ViewState get state => _state;

  set state(ViewState viewState) {
    debugPrint('State:$viewState');
    _state = viewState;
    notifyListeners();
  }

  set stateWithoutUpdate(ViewState viewState) {
    debugPrint('State:$viewState');
    _state = viewState;
  }

  void updateUI() {
    notifyListeners();
  }
}
