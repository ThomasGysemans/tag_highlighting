library tag_highlighting;

import 'package:flutter/material.dart';

part 'TagHighlight.dart';

const String _ALLCHARACTERS =
    r"[\s\wÀÂÆÇÉÈÊËÎÏÔŒÙÛÜŸÿüûùœôïîëêèéçæâà«»€$£¥@&()\-=~#{}\[\]|`\\^°+/²,;:!?§.¨¤*µ%']*";

/// Creates a RichText Widget wich allows you to apply
/// different styles to different parts of your [text].
///
/// Example :
///
/// ```
/// return TagHighlighting(
///   text: "Hello <strong>you</strong>, my friend !",
///   defaultTextStyle: TextStyle(color: Colors.black),
///   tags: [
///     TagHighlight(
///       tagName: "strong", // the name of the tag above.
///       textStyle: TextStyle(fontWeight: FontWeight.bold), // the style of "you".
///     ),
///   ],
/// );
/// ```
///
/// This example will have the effect of colouring
/// the text in black, but colouring "you" in white (default color) and bold.
///
/// WARNING : Does not support quotation marks ("").
class TagHighlighting extends StatefulWidget {
  final List<TagHighlight> tags;
  final String text;

  /// The text style outside your tags.
  final TextStyle defaultTextStyle;

  /// Text alignment of [text].
  final TextAlign textAlign;

  const TagHighlighting({
    Key key,
    this.tags = const [],
    this.text = "",
    this.defaultTextStyle,
    this.textAlign = TextAlign.left,
  }) : super(key: key);

  @override
  _TagHighlightingState createState() => _TagHighlightingState();
}

class _TagHighlightingState extends State<TagHighlighting> {
  @override
  Widget build(BuildContext context) {
    final String text = widget.text;
    final List<TagHighlight> tags = widget.tags;
    final TextStyle defaultTextStyle = widget.defaultTextStyle;

    /// Build the TextSpan Widgets with the different styles and tags' names.
    List<TextSpan> buildTextSpanWidgets() {
      List<TextSpan> spans = [];
      int previous = 0;
      int totalOfTags = tags.length;
      int currentTag = 0;

      tags.forEach((TagHighlight element) {
        String tagName = element.tagName;
        TextStyle textStyle = element.textStyle;
        int count = 0;

        RegExp regex = RegExp("<$tagName>" + _ALLCHARACTERS + "</$tagName>");

        Iterable matches = regex.allMatches(text);
        int numberOfMatches = matches.length;

        matches.forEach((dynamic match) {
          // The text before the tag.
          String normalText = text.substring(previous, match.start);
          String toHighlight = text.substring(match.start, match.end);
          previous = match.end;

          spans.add(TextSpan(
            text: normalText
                .replaceAll("<$tagName>", "")
                .replaceAll("</$tagName>", ""),
            style: defaultTextStyle,
          ));

          spans.add(TextSpan(
            text: toHighlight
                .replaceAll("<$tagName>", "")
                .replaceAll("</$tagName>", ""),
            style: textStyle,
          ));

          count++;

          // to get the end of the text,
          // because we just add the text before a tag.
          // so we forget the end !
          //
          // But, if the user has several tags, the end is added when there
          // are still tags to modify after !
          if (count == numberOfMatches && currentTag == totalOfTags - 1) {
            spans.add(TextSpan(
              text: text.substring(match.end),
              style: defaultTextStyle,
            ));
          }
        });

        currentTag++;
      });

      return spans;
    }

    List<TextSpan> spans = buildTextSpanWidgets();

    return RichText(
      textAlign: widget.textAlign,
      text: TextSpan(
        children: spans,
      ),
    );
  }
}
