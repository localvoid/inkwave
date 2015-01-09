// Copyright (c) 2014, the InkWave project authors. Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

library inkwave.src.main;

import 'package:vcss/vcss.dart' as v;
import 'theme.dart';

class MainStyleSheet extends v.StyleSheet {
  const MainStyleSheet();

  static const MainStyleSheet instance = const MainStyleSheet();

  build(ThemedBuilder b) => [
      v.rule('html', [
        v.fontFamily(b.theme.fontFamily),
        v.color('#333')
      ])
    ];
}
