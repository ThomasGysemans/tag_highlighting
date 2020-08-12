part of tag_highlighting;

/// Use TagHighlight to customize the different parts of you text.
///
/// * [tagName] the name of the tag inside your text.
/// * [textStyle] the style of the text inside the tag.
class TagHighlight {
  /// The name of the tag.
  final String tagName;

  /// Text Style for the text inside the tag.
  final TextStyle textStyle;

  TagHighlight({
    @required this.tagName,
    this.textStyle,
  });
}
