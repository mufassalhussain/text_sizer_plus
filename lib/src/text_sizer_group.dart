part of text_sizer_plus;

/// Controller to synchronize the fontSize of multiple AutoSizeTexts.
class TextSizerGroup {
  final _listeners = <_TextSizerPlusState, double>{};
  var _widgetsNotified = false;
  var _fontSize = double.infinity;

  void _register(_TextSizerPlusState text) {
    _listeners[text] = double.infinity;
  }

  void _updateFontSize(_TextSizerPlusState text, double maxFontSize) {
    final oldFontSize = _fontSize;
    if (maxFontSize <= _fontSize) {
      _fontSize = maxFontSize;
      _listeners[text] = maxFontSize;
    } else if (_listeners[text] == _fontSize) {
      _listeners[text] = maxFontSize;
      _fontSize = double.infinity;
      for (final size in _listeners.values) {
        if (size < _fontSize) _fontSize = size;
      }
    } else {
      _listeners[text] = maxFontSize;
    }

    if (oldFontSize != _fontSize) {
      _widgetsNotified = false;
      scheduleMicrotask(_notifyListeners);
    }
  }

  void _notifyListeners() {
    if (_widgetsNotified) {
      return;
    } else {
      _widgetsNotified = true;
    }

    for (final textState in _listeners.keys) {
      if (textState.mounted) {
        textState._notifySync();
      }
    }
  }

  void _remove(_TextSizerPlusState text) {
    _updateFontSize(text, double.infinity);
    _listeners.remove(text);
  }
}
