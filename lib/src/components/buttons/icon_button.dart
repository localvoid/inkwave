// Copyright (c) 2014, the InkWave project authors. Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

library inkwave.src.components.buttons.icon_button;

import 'package:liquid/liquid.dart';
import 'package:liquid/vdom.dart' as v;
import 'package:vcss/vcss.dart' as v;
import 'button_base.dart';
import '../../layout.dart';
import '../../elements/paper.dart';
import '../icon.dart';

class IconButtonStyleSheet extends v.StyleSheet {
  static const size = const v.Size.px(32);

  final require = const [ButtonBase.css, Icon.css];

  const IconButtonStyleSheet();

  build(_) => [
      v.rule('.IconButton', [
        ButtonBaseStyleSheet.baseStyle(),
        PaperStyleSheet.circleStyle(),
        v.padding(Layout.gridSize),
      ]),
    ];
}

final iconButton = v.componentFactory(IconButton);
class IconButton extends ButtonBase {
  static const css = const IconButtonStyleSheet();

  @property(required: true)
  v.SvgIcon icon;

  IconButton({this.icon, bool disabled: false, bool noink: false})
      : super(disabled: disabled, noink: noink);

  void create() {
    super.create();
    element.classes.add('IconButton');
  }

  build() =>
      super.build().decorate(
        v.root()(
          new Icon(icon)
        )
      );
}
