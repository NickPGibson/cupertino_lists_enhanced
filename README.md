# Cupertino style options lists

* A list of options in the style of the iOS settings app. Choose an item (or items) from a list of options. 
* Improves CupertinoListTile and CupertinoListSection widgets from the standard library to provide behaviour more closely resembling iOS.

### Features
* **Single-selection:** Select a single item from a list of options.
* **Multi-selection:** Select multiple items from a list of options.
* **Disable** certain choices
* Place the check mark at the **leading** or **trailing** edge
* **showCupertinoSingleSelectionPage** provides a full screen dialog to select an option, similar to the iOS settings app
* **Additional Customisation:** Combine new-style curved lists with original-style headers and footers, like the iOS settings app
  * Use the **headerType** and **footerType** arguments of **EnhancedCupertinoListSection**, **CupertinoMultiSelection** and **CupertinoSingleSelection** 
* **EnhancedCupertinoListTile** provides functionality that resembles the behaviour of iOS more closely

## Why use EnhancedCupertinoListTile?

CupertinoListTile, provided by Flutter's standard widget library, is great, but its behaviour is different to iOS in certain ways. EnhancedCupertinoListTile aims to be an improved CupertinoListTile, providing additional features and resembling the behaviour of iOS more closely.  

* In iOS, when the title or subtitle text is too long to fit on one line, it will wrap onto several lines. However, CupertinoListTile from Flutter's standard library will attempt to fit the text onto one line, and long text strings will be cut off, potentially leading to important information to be lost. EnhancedCupertinoListTile more closely resembles iOS behaviour by wrapping long text strings over several lines
* EnhancedCupertinoListTile resembles real iOS behaviour by giving titles and subtitles priority over the additionalInfo for the space. The additionalInfo text will use spare space left by the title and subtitles, and an ellipsis will be added if there isn't room to show it all. (Standard CupertinoListTiles give priority to the additionalInfo over the titles and subtitles - causing the title and subtitle to be cut off - and will throw an overflow error if the additionalInfo is too long). 


![Example screenshot](https://raw.githubusercontent.com/NickPGibson/cupertino_lists_enhanced/main/misc/images/example.png)

## Documentation

Documentation is available within the source code and [here.](https://pub.dev/documentation/cupertino_lists_enhanced/latest/index.html)

## Feature requests and bugs

Please provide feature requests and bugs at the [issue tracker](https://github.com/NickPGibson/cupertino_lists_enhanced/issues).
