import 'package:flutter/material.dart';
import 'package:text_sizer_plus/text_sizer_plus.dart';
import 'animated_input.dart';
import 'text_card.dart';
import 'utils.dart';

class MaxlinesDemo extends StatelessWidget {
  final bool richText;

  MaxlinesDemo(this.richText);

  @override
  Widget build(BuildContext context) {
    return AnimatedInput(
      text: 'This String will be automatically resized to fit on two lines.',
      builder: (input) {
        return Row(
          children: <Widget>[
            Expanded(
              child: TextCard(
                title: 'Text',
                child: !richText
                    ? Text(
                        input,
                        style: TextStyle(fontSize: 30),
                      )
                    : Text.rich(
                        spanFromString(input),
                        style: TextStyle(fontSize: 30),
                      ),
              ),
            ),
            SizedBox(width: 10),
            Expanded(
              child: TextCard(
                title: 'AutoSizeText',
                child: !richText
                    ? TextSizerPlus(
                        input,
                        style: TextStyle(fontSize: 30),
                        maxLines: 2,
                      )
                    : TextSizerPlus.rich(
                        spanFromString(input),
                        style: TextStyle(fontSize: 30),
                        maxLines: 2,
                      ),
              ),
            ),
          ],
        );
      },
    );
  }
}
