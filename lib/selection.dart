
import 'package:cupertino_lists_enhanced/list_section.dart';
import 'package:flutter/cupertino.dart';

/// Provides a list of options.
/// Most users will use [CupertinoMultiSelection] or [CupertinoSingleSelection], but [CupertinoSelection] can be used to create custom behaviour.
class CupertinoSelection<T> extends StatelessWidget {

  /// Displayed above the options. Usually a [Text] widget.
  final Widget? header;

  /// Displayed below the options. Usually a [Text] widget.
  final Widget? footer;

  /// The type of the header. If "insetGrouped", the header will be displayed
  /// large and bold like the iOS notes app. If "base", the header will be displayed
  /// smaller, like the iOS settings app.
  final CupertinoListSectionType headerType;

  /// The type of the footer. If "insetGrouped", no styling will be applied.
  /// If "base", the footer will be displayed in the style of the iOS settings app.
  final CupertinoListSectionType footerType;

  /// Optional background color
  final Color? backgroundColor;

  /// The options from which the user can choose.
  final List<Widget> children;

  const CupertinoSelection({
    required this.children,
    required this.header,
    required this.footer,
    CupertinoListSectionType? headerType,
    CupertinoListSectionType? footerType,
    this.backgroundColor,
    super.key
  }) :
    headerType = headerType ?? CupertinoListSectionType.base,
    footerType = footerType ?? CupertinoListSectionType.base;

  @override
  Widget build(BuildContext context) {
    return EnhancedCupertinoListSection.insetGrouped(
      header: header,
      footer: footer,
      hasLeading: false,
      headerType: headerType,
      footerType: footerType,
      children: children,
      backgroundColor: backgroundColor
    );
  }
}
