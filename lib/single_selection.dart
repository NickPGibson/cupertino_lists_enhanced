

import 'package:cupertino_lists_enhanced/selection.dart';
import 'package:cupertino_lists_enhanced/selection_item.dart';
import 'package:cupertino_lists_enhanced/selection_tile.dart';
import 'package:cupertino_lists_enhanced/widget_location.dart';
import 'package:flutter/cupertino.dart';

/// Provides a list of options from which the user can select one option.
class CupertinoSingleSelection<T> extends StatelessWidget {

  /// The options from which the user can choose.
  final List<SelectionItem<T>> children;

  /// The item currently selected.
  final T? selected;

  /// Called every time the user selects an item.
  final ValueChanged<T?>? onChanged;

  /// Displayed above the options. Usually a [Text] widget.
  final Widget? header;

  /// Displayed below the options. Usually a [Text] widget.
  final Widget? footer;

  /// The type of the header. If "insetGrouped", the header will be displayed
  /// large and bold like the iOS notes app. If "base", the header will be displayed
  /// smaller, like the iOS settings app.
  final CupertinoListSectionType? headerType;

  /// The type of the footer. If "insetGrouped", no styling will be applied.
  /// If "base", the footer will be displayed in the style of the iOS settings app.
  final CupertinoListSectionType? footerType;

  /// Determines whether the check mark will be located on the leading (left) or trailing (right) side of the tile.
  final WidgetSelectionLocation checkMarkLocation;

  /// Optional checkMark color
  final Color? checkMarkColor;

  const CupertinoSingleSelection({
    required this.children,
    this.selected,
    this.onChanged,
    this.header,
    this.footer,
    this.headerType,
    this.footerType,
    this.checkMarkLocation = WidgetSelectionLocation.trailing,
    this.checkMarkColor,
    super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoSelection(
      header: header,
      footer: footer,
      headerType: headerType,
      footerType: footerType,
      children: children.map((item) => CupertinoSelectionTile<T>(
        title: item.title,
        subtitle: item.subtitle,
        value: item.value,
        isSelected: item.value == selected,
        checkMarkLocation: checkMarkLocation,
        checkMarkColor : checkMarkColor,
        enabled: item.enabled,
        onTap: (item) {
          if (onChanged != null) {
            onChanged!(item);
          }
        }
      )).toList()
    );
  }
}
