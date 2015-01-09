// Copyright (c) 2014, the InkWave project authors. Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

library inkwave.src.elements.paper;

import 'dart:html' as html;
import 'package:vcss/vcss.dart' as v;
import '../transitions.dart';

class PaperStyleSheet extends v.StyleSheet {
  const PaperStyleSheet();

  static List paperStyle() => [v.position('relative')];
  static List roundStyle() => [v.borderRadius('3px')];
  static List circleStyle() => [v.borderRadius('50%')];

  static String shadow(int z) {
    switch (z) {
      case 1:
        return v.boxShadow('0 1px 4px 0 rgba(0, 0, 0, 0.37)');
      case 2:
        return v.boxShadow('0 2px 2px 0 rgba(0, 0, 0, 0.2),'
                           '0 6px 10px 0 rgba(0, 0, 0, 0.3)');
      case 3:
        return v.boxShadow('0 11px 7px 0 rgba(0, 0, 0, 0.19),'
                           '0 13px 25px 0 rgba(0, 0, 0, 0.3)');
      case 4:
        return v.boxShadow('0 14px 12px 0 rgba(0, 0, 0, 0.17)'
                           '0 20px 40px 0 rgba(0, 0, 0, 0.3)');
      case 5:
        return v.boxShadow('0 17px 17px 0 rgba(0, 0, 0, 0.15),'
                           '0 27px 55px 0 rgba(0, 0, 0, 0.3)');
    }
    return null;
  }

  build(_) => [
      v.rule('.Shadow', [
        v.position('absolute'),
        v.top(0),
        v.right(0),
        v.bottom(0),
        v.left(0),
        v.borderRadius('inherit'),
        v.transition('box-shadow 0.5s $swiftEaseInOut'),

        v.rule('.z1 > &', [
          shadow(1)
        ]),

        v.rule('.z2 > &', [
          shadow(2)
        ]),

        v.rule('.z3 > &', [
          shadow(3)
        ]),

        v.rule('.z4 > &', [
          shadow(4)
        ]),

        v.rule('.z5 > &', [
          shadow(5)
        ])
      ])
    ];
}

abstract class Paper {
  static const css = const PaperStyleSheet();

  static html.DivElement createShadowElement() =>
      new html.DivElement()..classes.add('Shadow');
}

