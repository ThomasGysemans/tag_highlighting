# tag_highlighting

A Flutter package that allows you to highlight certain parts of a text using tags (like in HTML).
This package should only be used to apply different styles to parts of text. If you want more functionality, refer to styled_text package.

## Description

With this Flutter package, you can apply different styles to different parts of your text using tags, just like in HTML. Each tag has specific styles that you can define.

![example-1](https://learnweb.sciencesky.fr/tag_highlighting_example.jpg)

## Installation

It's very easy to install :

- Add in pubspec.yaml file

```yaml
dependencies:
  tag_highlighting: ^0.0.2
```

- Don't forget to update the modifications of the pubspec.yaml file

```
$ flutter pub get
```

- Finally, use tag_highlighting in your flutter project

```javascript
import "package:tag_highlighting/tag_highlighting.dart";
```

## Usage

After importing the package into your project, you can use the TagHighlighting Widget :

```java
class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: TagHighlighting(
        text: "Hello, <bold>World</bold> !", // the text to highlight with the tag(s)
        defaultTextStyle: TextStyle( // the style of the text outside the tag(s)
          color: Colors.black,
          fontSize: 16,
        ),
        textAlign: TextAlign.center, // define the textAlign property of the text here
        tags: [ // contains your tags, you can define as many as you want !
          TagHighlight(
            tagName: "bold", // the name of the tag above.
            textStyle: TextStyle( // the style of "World"
              fontWeight: FontWeight.w900,
              color: Colors.redAccent,
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}
```

WARNING : Does not support quotation marks ("") inside a tag. Ih there are quotation marks, the tag will be ignored. More generally, if the tag is ignored, it's because there is a character inside the tag that is not supported (the French accented letters are supported).

- Summary of all the available arguments inside TagHighlighting Widget

| Name             | Type                 | Default Value  | Description                            |
| ---------------- | -------------------- | -------------- | -------------------------------------- |
| text             | String               | ""             | The text to highlight                  |
| textAlign        | TextAlign            | TextAlign.left | The alignment of the text              |
| defaultTextStyle | TextStyle            | null           | The style of the text outside the tags |
| tags             | List of TagHighlight | const []       | The list of your tags and their style  |

- Summary of all the available arguments inside TagHighlight class

| Name      | Type      | Default Value       | Description                          |
| --------- | --------- | ------------------- | ------------------------------------ |
| tagName   | String    | null, but @required | The name of the tag                  |
| textStyle | TextStyle | null                | The style of the text inside the tag |

As a reminder, if you do not define a text style, the default color of a text is white.

Enjoy Coding !

## Internal dependencies

None, just Flutter !

## Contributing

Do not hesitate to contribute to the project, I just begin :)

## License

MIT License
