// Copyright (c) 2014, the InkWave project authors. Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

library inkwave.src.components.buttons.radio_button;

import 'dart:html' as html;
import 'package:liquid/liquid.dart';
import 'package:liquid/vdom.dart' as v;
import 'package:vcss/vcss.dart' as v;
import 'button_base.dart';
import '../../elements/paper.dart';
import '../../layout.dart';
import '../../transitions.dart';
import '../../colors.dart';

class RadioButtonStyleSheet extends v.StyleSheet {
  static const size = const v.Size.px(48);
  static const radioSize = const v.Size.px(16);
  static final color = paletteGreen.colors[Palette.P700];

  const RadioButtonStyleSheet();

  final require = const [ButtonBase.css];

  build(_) => [
      v.rule('.RadioButton', [
        ButtonBaseStyleSheet.baseStyle(),
        PaperStyleSheet.circleStyle(),
        v.width(size),
        v.height(size),
        v.padding(Layout.gridSize * 2),
        v.color(black),

        v.rule('&.checked', [
          v.color(color),
        ]),
      ]),

      v.rule('.RadioButton_l1', [
        v.position('absolute'),
        v.top(0),
        v.left(0),
        v.width(radioSize),
        v.height(radioSize),
        v.border('2px solid #5a5a5a'),
        v.borderRadius('50%'),
        v.transition('border-color 0.14s $swiftEaseOut 0.14s'),

        v.rule('.RadioButton.checked &', [
          v.borderColor(color),
          v.transition('border-color 0.14s $swiftEaseIn 0.14s'),
        ])
      ]),

      v.rule('.RadioButton_l2', [
        v.position('absolute'),
        v.top(0),
        v.left(0),
        v.width(radioSize),
        v.height(radioSize),
        v.background('#5a5a5a'),
        v.borderRadius('50%'),
        v.transform('scale(1)'),
        v.transition('transform 0.28s $swiftEaseOut, background 0.14s $swiftEaseOut 0.14s'),

        v.rule('.RadioButton.checked &', [
          v.transition('transform 0.28s $swiftEaseIn, background 0.14s $swiftEaseIn 0.14s'),
          v.background(color),
          v.transform('scale(0.5)')
        ])
      ]),

      v.rule('.RadioButton_l3', [
        v.position('absolute'),
        v.top('2px'),
        v.left('2px'),
        v.width('12px'),
        v.height('12px'),
        v.background(white),
        v.borderRadius('50%'),
        v.transform('scale(1)'),
        v.transition('transform 0.28s $swiftEaseIn'),

        v.rule('.RadioButton.checked &', [
          v.transition('transform 0.28s $swiftEaseOut'),
          v.transform('scale(0)')
        ])
      ])
    ];
}

final radioButton = v.componentFactory(RadioButton);
class RadioButton extends ButtonBase {
  static const css = const RadioButtonStyleSheet();

  @property()
  bool checked;

  @property(immutable: true)
  bool toggles;

  RadioButton({this.checked: false, this.toggles: true, bool disabled: false, bool noink: false})
    : super(disabled: disabled, noink: noink);

  void create() {
    super.create();
    element.classes.add('RadioButton');

    content
      ..append(new html.DivElement()..classes.add('RadioButton_l1'))
      ..append(new html.DivElement()..classes.add('RadioButton_l2'))
      ..append(new html.DivElement()..classes.add('RadioButton_l3'));
  }

  void init() {
    super.init();
    element.onClick.listen(_handleClick);
  }

  void handleDown(html.Event e) {
    super.handleDown(e);
    element.classes.add('down');
  }

  void handleUp(html.Event e) {
    super.handleUp(e);
    element.classes.remove('down');
  }

  void _handleClick(html.MouseEvent e) {
    if (disabled) {
      return;
    }
    handleClick(e);
  }

  void handleClick(html.MouseEvent e) {
    toggle();
  }

  void toggle() {
    if (toggles || !checked) {
      checked = !checked;
      invalidate();
    }
  }

  v.VRootDecorator<html.DivElement> build() =>
      super.build().decorate(
        v.root(classes: checked ? const ['checked'] : null)
      );
}
