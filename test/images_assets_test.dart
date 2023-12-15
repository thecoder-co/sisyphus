import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:sisypius/resources/resources.dart';

void main() {
  test('images_assets assets test', () {
    expect(File(ImagesAssets.avatar).existsSync(), isTrue);
    expect(File(ImagesAssets.btcIcon).existsSync(), isTrue);
  });
}
