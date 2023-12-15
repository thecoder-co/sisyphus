import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:sisypius/resources/resources.dart';

void main() {
  test('svg_assets assets test', () {
    expect(File(SvgAssets.logomark).existsSync(), isTrue);
    expect(File(SvgAssets.logotype).existsSync(), isTrue);
    expect(File(SvgAssets.arrowDown2).existsSync(), isTrue);
    expect(File(SvgAssets.arrowUp2).existsSync(), isTrue);
    expect(File(SvgAssets.clock).existsSync(), isTrue);
    expect(File(SvgAssets.downArrow).existsSync(), isTrue);
    expect(File(SvgAssets.globe).existsSync(), isTrue);
    expect(File(SvgAssets.menuAlt1).existsSync(), isTrue);
    expect(File(SvgAssets.uExpandAlt).existsSync(), isTrue);
    expect(File(SvgAssets.uInfoCircle).existsSync(), isTrue);
  });
}
