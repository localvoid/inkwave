// Copyright (c) 2014, the InkWave project authors. Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

library inkwave.src.components.buttons.raised_button;

import 'package:liquid/vdom.dart' as v;
import 'package:vcss/vcss.dart' as v;
import 'button_base.dart';
import 'raised_button_base.dart';
import '../../elements/paper.dart';
import '../../layout.dart';
import '../../theme.dart';

class RaisedButtonStyleSheet extends v.StyleSheet {
  static const height = const v.Size.px(36);
  static const minWidth = const v.Size.px(64);

  final require = const [RaisedButtonBase.css];

  const RaisedButtonStyleSheet();

  build(ThemedBuilder b) => [
      v.rule('.RaisedButton', [
        ButtonBaseStyleSheet.baseStyle(),
        PaperStyleSheet.roundStyle(),
        v.height(height),
        v.minWidth(minWidth),
        v.padding('0 ${Layout.gridSize}'),
        b.theme.button(),
      ]),
    ];
}

final raisedButton = v.componentFactory(RaisedButton);
class RaisedButton extends RaisedButtonBase {
  static const css = const RaisedButtonStyleSheet();

  RaisedButton({int zDepth: 1, bool disabled: false, bool noink: false})
      : super(zDepth: zDepth, disabled: disabled, noink: noink);

  void create() {
    super.create();
    element.classes.add('RaisedButton');
  }
}
