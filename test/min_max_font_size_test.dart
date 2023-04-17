import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:text_sizer_plus/text_sizer_plus.dart';
import 'utils.dart';

void main() {
  testWidgets('Forces valid min and max fontSize', (tester) async {
    await tester.pumpWidget(
      TextSizerPlus(
        'AutoSizeText Test',
        style: TextStyle(fontSize: 25),
        minFontSize: -1,
      ),
    );
    expect(tester.takeException(), isAssertionError);

    await tester.pumpWidget(
      TextSizerPlus(
        'AutoSizeText Test',
        style: TextStyle(fontSize: 25),
        maxFontSize: 0,
      ),
    );
    expect(tester.takeException(), isAssertionError);

    await tester.pumpWidget(
      TextSizerPlus(
        'AutoSizeText Test',
        style: TextStyle(fontSize: 25),
        minFontSize: 20,
        maxFontSize: 10,
      ),
    );
    expect(tester.takeException(), isAssertionError);
  });

  testWidgets('Respects minFontSize', (tester) async {
    await pumpAndExpectFontSize(
      tester: tester,
      expectedFontSize: 15,
      widget: SizedBox(
        width: 10,
        height: 10,
        child: TextSizerPlus(
          'AutoSizeText Test',
          style: TextStyle(fontSize: 25),
          minFontSize: 15,
        ),
      ),
    );
  });

  testWidgets('Is larger than minFontSize if enough space', (tester) async {
    await pumpAndExpectFontSize(
      tester: tester,
      expectedFontSize: 30,
      widget: SizedBox(
        width: 120,
        height: 40,
        child: TextSizerPlus(
          'XXXX',
          style: TextStyle(fontSize: 30, fontFamily: 'Roboto'),
          minFontSize: 15,
        ),
      ),
    );
  });

  testWidgets('Respects maxFontSize', (tester) async {
    await pumpAndExpectFontSize(
      tester: tester,
      expectedFontSize: 20,
      widget: DefaultTextStyle(
        style: TextStyle(fontSize: 30),
        child: TextSizerPlus(
          'AutoSizeText Test',
          maxFontSize: 20,
        ),
      ),
    );

    await pumpAndExpectFontSize(
      tester: tester,
      expectedFontSize: 20,
      widget: TextSizerPlus(
        'AutoSizeText Test',
        style: TextStyle(fontSize: 30),
        maxFontSize: 20,
      ),
    );

    await pumpAndExpectFontSize(
      tester: tester,
      expectedFontSize: 20,
      widget: TextSizerPlus(
        'AutoSizeText Test',
        style: TextStyle(fontSize: 20),
        maxFontSize: 30,
      ),
    );
  });
}
