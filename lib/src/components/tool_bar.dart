// Copyright (c) 2014, the InkWave project authors. Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

library inkwave.src.components.tool_bar;

import 'dart:html' as html;
import 'package:liquid/liquid.dart';
import 'package:liquid/vdom.dart' as v;
import 'package:vcss/vcss.dart' as v;
import '../layout.dart';
import '../theme.dart';

const int alignTop = 0;
const int alignBottom = 1;
const int alignMiddle = 2;

String alignToString(int align) {
  switch (align) {
    case 0:
      return 'top';
    case 1:
      return 'bottom';
  }
  return 'middle';
}

class ToolBarStyleSheet extends v.StyleSheet {
  const ToolBarStyleSheet();

  /*
   * if (Layout.type & (Layout.xsScreen | Layout.landscape)) {
   *   height = 48;
   * } else if (Layout.type & Layout.xsScreen) {
   *   height = 56;
   * } else {
   *   height = 64;
   * }
   */
  static const rowHeight = const v.Size.px(64);

  build(ThemedBuilder b) => [
      v.rule('.ToolBar', [
        v.position('relative'),
        v.minHeight(rowHeight),
        b.theme.title(),

        v.rule('&.mediumTall', [
          v.height(rowHeight * 2)
        ]),

        v.rule('&.tall', [
          v.height(rowHeight * 3)
        ]),
      ]),

      v.rule('.ToolBarRow', [
        v.display('flex'),
        v.alignItems('center'),
        v.height(rowHeight),
        v.padding('0 ${Layout.gridSize * 3}'), // gridSize * 2 on mobile

        v.rule('&.bottom', [
          v.position('absolute'),
          v.left(0),
          v.right(0),
          v.bottom(0)
        ]),

        v.rule('&.middle', [
          v.position('absolute'),
          v.left(0),
          v.right(0),
          v.top(0)
        ])
      ])
    ];
}

final toolBar = v.componentFactory(ToolBar);
class ToolBar extends Component {
  static const css = const ToolBarStyleSheet();

  void create() {
    element = new html.DivElement()
      ..classes.add('ToolBar');
  }

  build() => v.rootDecorator();
}

final toolBarRow = v.componentFactory(ToolBarRow);
class ToolBarRow extends Component {
  @property(immutable: true) final int align;

  ToolBarRow({this.align: alignTop});

  void create() {
    element = new html.DivElement();
    element.classes
      ..add('ToolBarRow')
      ..add(alignToString(align));
  }

  build() => v.rootDecorator();
}
