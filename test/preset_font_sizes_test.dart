import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:text_sizer_plus/text_sizer_plus.dart';
import 'utils.dart';

void main() {
  testWidgets('Preset font sizes', (tester) async {
    await pumpAndExpectFontSize(
      tester: tester,
      expectedFontSize: 100,
      widget: SizedBox(
        width: 500,
        height: 100,
        child: TextSizerPlus(
          'XXXXX',
          presetFontSizes: [100, 50, 5],
        ),
      ),
    );

    await pumpAndExpectFontSize(
      tester: tester,
      expectedFontSize: 50,
      widget: SizedBox(
        width: 300,
        height: 100,
        child: TextSizerPlus(
          'XXXXX',
          presetFontSizes: [100, 50, 5],
        ),
      ),
    );

    await pumpAndExpectFontSize(
      tester: tester,
      expectedFontSize: 5,
      widget: SizedBox(
        width: 20,
        height: 100,
        child: TextSizerPlus(
          'XXXXX',
          presetFontSizes: [100, 50, 5],
        ),
      ),
    );
  });
}
