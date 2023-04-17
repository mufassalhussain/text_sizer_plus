part of text_sizer_plus;

/// A Flutter widget that provides an [TextSizerGroup] to its builder function.
class TextSizerGroupBuilder extends StatefulWidget {
  final Widget Function(BuildContext context, TextSizerGroup autoSizeGroup)
      builder;

  /// Creates an [TextSizerGroupBuilder] widget.
  TextSizerGroupBuilder({Key? key, required this.builder}) : super(key: key);

  @override
  _TextSizerGroupBuilderState createState() => _TextSizerGroupBuilderState();
}

class _TextSizerGroupBuilderState extends State<TextSizerGroupBuilder> {
  final _group = TextSizerGroup();

  @override
  Widget build(BuildContext context) {
    return widget.builder(context, _group);
  }
}
