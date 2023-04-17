import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:text_sizer_plus/text_sizer_plus.dart';
import 'utils.dart';

void main() {
  testWidgets('Respects maxlines', (tester) async {
    await pump(
      tester: tester,
      widget: TextSizerPlus(
        'XXXXX',
        style: TextStyle(fontSize: 27),
        maxLines: 1,
      ),
    );
    var height = tester.getSize(find.byType(RichText)).height;
    expect(height, 27);

    await pump(
      tester: tester,
      widget: SizedBox(
        width: 75,
        child: TextSizerPlus(
          'XXX XXX',
          style: TextStyle(fontSize: 25),
          maxLines: 2,
        ),
      ),
    );
    height = tester.getSize(find.byType(RichText)).height;
    expect(height, 50);
  });

  testWidgets('Unlimited maxLines if parameter null', (tester) async {});
}
