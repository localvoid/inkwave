// Copyright (c) 2014, the InkWave project authors. Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

library inkwave.src.components.buttons.fab;

import 'package:liquid/liquid.dart';
import 'package:liquid/vdom.dart' as v;
import 'package:vcss/vcss.dart' as v;
import 'button_base.dart';
import 'raised_button_base.dart';
import '../../colors.dart';
import '../../layout.dart';
import '../../theme.dart';
import '../../elements/paper.dart';
import '../icon.dart';

class FabStyleSheet extends v.StyleSheet {
  static const size = const v.Size.px(56);
  static const miniSize = const v.Size.px(40);

  final require = const [RaisedButtonBase.css, Icon.css];

  const FabStyleSheet();

  build(ThemedBuilder b) => [
      v.rule('.Fab', [
        ButtonBaseStyleSheet.baseStyle(),
        PaperStyleSheet.circleStyle(),
        v.height(size),
        v.width(size),
        v.background(b.theme.colorAccent.colors[Palette.P500]),
        v.color(white),
        v.padding(Layout.gridSize * 2)
      ]),
    ];
}

final fab = v.componentFactory(Fab);
class Fab extends RaisedButtonBase {
  static const css = const FabStyleSheet();

  @property(required: true)
  v.SvgIcon icon;

  Fab({this.icon, int zDepth: 1, bool disabled: false, bool noink: false})
      : super(zDepth: zDepth, disabled: disabled, noink: noink);

  void create() {
    super.create();
    element.classes.add('Fab');
  }

  build() =>
      super.build().decorate(
        v.root()(
          new Icon(icon)
        )
      );
}
