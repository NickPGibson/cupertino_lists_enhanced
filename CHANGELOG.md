
## 0.0.4

* EnhancedCupertinoListTile's behaviour now resembles the real behaviour of iOS more closely:
  * The titles and subtitles of base-type EnhancedCupertinoListTiles (i.e., not notched-type tiles) now wrap over several lines. (Standard CupertinoListTiles from the standard library will only attempt to fit the text on one line, which could lead to important information being cut off)
  * The titles and subtitles of EnhancedCupertinoListTiles now take priority over the additionalInfo for the space. The additionalInfo text will use spare space left by the title and subtitles, and an ellipsis will be added if there isn't room to show it all. (Standard CupertinoListTiles give priority to the additionalInfo over the titles and subtitles (causing the title and subtitle to be cut off), and will throw an overflow error if the additionalInfo is too long)

## 0.0.3

* Added footer.
* Added EnhancedCupertinoListSection which enables mixing of the "base" and "insetGrouped" styles, enabling the new-style curved lists with the original-style headers and footers, creating an appearance like the iOS settings app.
* Added headerType and footerType arguments to enable custom combinations of original and new style lists.

## 0.0.2

* Added showCupertinoSingleSelectionPage and SingleSelectionPage, which provide a simple full screen dialog to select an option, similar to the iOS settings app.

## 0.0.1

* Initial release. Added CupertinoSingleSelection, CupertinoMultiSelection and EnhancedCupertinoListTile.
