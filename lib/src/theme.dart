// Copyright (c) 2014, the InkWave project authors. Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

library inkwave.src.theme;

import 'package:vcss/vcss.dart' as v;
import 'colors.dart';

class ThemedBuilder extends v.Builder {
  final Theme theme;

  const ThemedBuilder([this.theme = const Theme()]);
}

class Theme {
  final colorPrimary = paletteBlue;
  final colorAccent = palettePink;
  final colorSecondary = paletteGrey;
  final colorDisabled = paletteGrey;
  final colorPage = paletteGrey;

  final textColorBody = const v.HexColor('#333');

  final fontFamily = "RobotoDraft, Roboto, 'Helvetica Neue', sans-serif";

  display4({bool contrast: false}) {
    final ret = [
        v.fontSize('112px'),
        v.fontWeight(300),
        v.lineHeight('112px'),
        v.letterSpacing('-0.04em')
      ];

    if (contrast) {
      ret.add(v.opacity(0.54));
    }
    return ret;
  }

  display3({bool contrast: false}) {
    final ret = [
        v.fontSize('56px'),
        v.fontWeight(400),
        v.lineHeight('56px'),
        v.letterSpacing('-0.02em')
      ];

    if (contrast) {
      ret.add(v.opacity(0.54));
    }
    return ret;
  }

  display2({bool contrast: false}) {
    final ret = [
        v.fontSize('45px'),
        v.fontWeight(400),
        v.lineHeight('48px')
      ];

    if (contrast) {
      ret.add(v.opacity(0.54));
    }
    return ret;
  }

  display1({bool contrast: false}) {
    final ret = [
        v.fontSize('34px'),
        v.fontWeight(400),
        v.lineHeight('40px')
      ];

    if (contrast) {
      ret.add(v.opacity(0.54));
    }
    return ret;
  }

  headline({bool contrast: false}) {
    final ret = [
        v.fontSize('24px'),
        v.fontWeight(400),
        v.lineHeight('32px')
      ];

    if (contrast) {
      ret.add(v.opacity(0.87));
    }
    return ret;
  }

  title({bool contrast: false}) {
    final ret = [
        v.fontSize('20px'),
        v.fontWeight(500),
        v.lineHeight('20px'),
        v.letterSpacing('0.02em')
      ];

    if (contrast) {
      ret.add(v.opacity(0.87));
    }
    return ret;
  }

  subhead2({bool contrast: false}) {
    final ret = [
        v.fontSize('16px'),
        v.fontWeight(400),
        v.lineHeight('28px'),
        v.letterSpacing('0.04em')
      ];

    if (contrast) {
      ret.add(v.opacity(0.87));
    }
    return ret;
  }

  subhead1({bool contrast: false}) {
    final ret = [
        v.fontSize('16px'),
        v.fontWeight(400),
        v.lineHeight('24px'),
        v.letterSpacing('0.04em')
      ];

    if (contrast) {
      ret.add(v.opacity(0.87));
    }
    return ret;
  }

  body2({bool contrast: false}) {
    final ret = [
        v.fontSize('14px'),
        v.fontWeight(500),
        v.lineHeight('24px'),
        v.letterSpacing('0.04em')
      ];

    if (contrast) {
      ret.add(v.opacity(0.87));
    }
    return ret;
  }

  body1({bool contrast: false}) {
    final ret = [
        v.fontSize('14px'),
        v.fontWeight(400),
        v.lineHeight('20px'),
        v.letterSpacing('0.04em')
      ];

    if (contrast) {
      ret.add(v.opacity(0.87));
    }
    return ret;
  }

  caption({bool contrast: false}) {
    final ret = [
        v.fontSize('12px'),
        v.fontWeight(400),
        v.lineHeight('12px'),
        v.letterSpacing('0.08em')
      ];

    if (contrast) {
      ret.add(v.opacity(0.54));
    }
    return ret;
  }

  blockquote({bool contrast: false}) {
    final ret = [
        v.fontSize('24px'),
        v.fontWeight(300),
        v.fontStyle('italic'),
        v.lineHeight('24px'),
        v.letterSpacing('0.08em'),

        v.rule('&:before', [
          v.content('“'),
          v.opacity(0.54)
        ]),

        v.rule('&:after', [
           v.content('”'),
           v.opacity(0.54)
        ])
      ];

    if (contrast) {
      ret.add(v.opacity(0.54));
    }
    return ret;
  }

  menu({bool contrast: false}) {
    final ret = [
        v.fontSize('14px'),
        v.fontWeight(500),
        v.lineHeight('14px'),
        v.letterSpacing('0.04em')
      ];

    if (contrast) {
      ret.add(v.opacity(0.87));
    }
    return ret;
  }

  button({bool contrast: false}) {
    final ret = [
        v.fontSize('14px'),
        v.fontWeight(400),
        v.textTransform('uppercase'),
        v.lineHeight('14px'),
        v.letterSpacing('0.04em')
      ];

    if (contrast) {
      ret.add(v.opacity(0.87));
    }
    return ret;
  }

  const Theme();
}
