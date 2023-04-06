

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

  /// Determines whether the check mark will be located on the leading (left) or trailing (right) side of the tile.
  final WidgetSelectionLocation checkMarkLocation;

  const CupertinoSingleSelection({
    required this.children,
    this.selected,
    this.onChanged,
    this.header,
    this.checkMarkLocation = WidgetSelectionLocation.trailing,
    super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoSelection(
      header: header,
      children: children.map((item) => CupertinoSelectionTile<T>(
        title: item.title,
        subtitle: item.subtitle,
        value: item.value,
        isSelected: item.value == selected,
        checkMarkLocation: checkMarkLocation,
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



