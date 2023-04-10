
### This document explains the real behaviour of iOS, the behaviour of CupertinoListTile from the standard library, and the behaviour of EnhancedCupertinoListTile from this library

* Text Wrapping
  * Actual iOS behaviour:
    * Text is wrapped over several lines if there isn't enough space
  * CupertinoListTile behaviour:
    * Text is not wrapped over several lines, and some text may be lost
  * EnhancedCupertinoListTile behaviour:
    * Text is wrapped over several lines if there isn't enough space



* Text priority
  * Actual iOS behaviour:
    * title has the priority
![Actual ios screenshot](https://raw.githubusercontent.com/NickPGibson/cupertino_lists_enhanced/main/misc/docs/images/actual_ios_text_priority.png)

  * CupertinoListTile behaviour:
    * additionalInfo has the priority
![CupertinoListTile screenshot](https://raw.githubusercontent.com/NickPGibson/cupertino_lists_enhanced/main/misc/docs/images/flutter_text_priority.png)

  * EnhancedCupertinoListTile behaviour:
    * title has the priority
![EnhancedCupertinoListTile screenshot](https://raw.githubusercontent.com/NickPGibson/cupertino_lists_enhanced/main/misc/docs/images/enhanced_text_priority.png)
