# CodeInputRow

验证码输入框

## ScreenShots

![Gif演示](https://raw.githubusercontent.com/sweatfryash/code_input/master/screenshots/codeinput_screenshot1.gif)

## 视频

暂无

## 已知问题

- 进入软件时会报一个关于focusNode的错误但是不影响使用，暂未解决。

  ```
  I/flutter (25026): ══╡ EXCEPTION CAUGHT BY FOUNDATION LIBRARY ╞════════════════════════════════════════════════════════
  I/flutter (25026): The following assertion was thrown while dispatching notifications for FocusNode:
  I/flutter (25026): RenderBox was not laid out: RenderEditable#b3bdd NEEDS-LAYOUT NEEDS-PAINT
  I/flutter (25026): 'package:flutter/src/rendering/box.dart':
  I/flutter (25026): Failed assertion: line 1691 pos 12: 'hasSize'
  I/flutter (25026):
  I/flutter (25026): Either the assertion indicates an error in the framework itself, or we should provide substantially
  I/flutter (25026): more information in this error message to help you determine and fix the underlying cause.
  I/flutter (25026): In either case, please report this assertion by filing a bug on GitHub:
  I/flutter (25026):   https://github.com/flutter/flutter/issues/new?template=BUG.md
  I/flutter (25026):
  I/flutter (25026): When the exception was thrown, this was the stack:
  I/flutter (25026): #2      RenderBox.size (package:flutter/src/rendering/box.dart:1691:12)
  I/flutter (25026): #3      EditableTextState._updateSizeAndTransform (package:flutter/src/widgets/editable_text.dart:1751:40)
  I/flutter (25026): #4      EditableTextState._openInputConnection (package:flutter/src/widgets/editable_text.dart:1437:7)
  I/flutter (25026): #5      EditableTextState._openOrCloseInputConnectionIfNeeded (package:flutter/src/widgets/editable_text.dart:1463:7)
  I/flutter (25026): #6      EditableTextState._handleFocusChanged (package:flutter/src/widgets/editable_text.dart:1729:5)
  I/flutter (25026): #7      ChangeNotifier.notifyListeners (package:flutter/src/foundation/change_notifier.dart:206:21)
  I/flutter (25026): #8      FocusNode._notify (package:flutter/src/widgets/focus_manager.dart:815:5)
  I/flutter (25026): #9      FocusManager._applyFocusChange (package:flutter/src/widgets/focus_manager.dart:1413:12)
  I/flutter (25026): (elided 12 frames from class _AssertionError and package dart:async)
  I/flutter (25026):
  I/flutter (25026): The FocusNode sending notification was:
  I/flutter (25026):   FocusNode#e0f67([PRIMARY FOCUS])
  I/flutter (25026): ════════════════════════════════════════════════════════════════════════════════════════════════════
  ```
