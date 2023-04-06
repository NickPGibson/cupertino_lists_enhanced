
import 'package:cupertino_lists_enhanced/selection.dart';
import 'package:cupertino_lists_enhanced/selection_item.dart';
import 'package:cupertino_lists_enhanced/selection_tile.dart';
import 'package:cupertino_lists_enhanced/widget_location.dart';
import 'package:flutter/cupertino.dart';

/// Provides a list of options from which the user can select multiple options.
class CupertinoMultiSelection<T> extends StatelessWidget {

  /// The options from which the user can choose.
  final List<SelectionItem<T>> children;

  /// The items currently selected.
  final Set<T?> selected;

  /// Called every time the user selects or deselects an item.
  final ValueChanged<Set<T?>>? onChanged;

  /// Displayed above the options. Usually a [Text] widget.
  final Widget? header;

  /// Determines whether the check mark will be located on the leading (left) or trailing (right) side of the tile.
  final WidgetSelectionLocation checkMarkLocation;

  const CupertinoMultiSelection({
    required this.children,
    required this.selected,
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
        isSelected: _isSelected(item.value),
        enabled: item.enabled,
        onTap: (item) {
          if (onChanged != null) {
            final selectedItems = Set<T?>.of(selected);
            if (_isSelected(item)) {
              selectedItems.remove(item);
            } else {
              selectedItems.add(item);
            }
            onChanged!(selectedItems);
          }
        },
        checkMarkLocation: checkMarkLocation,
      )).toList()
    );
  }

  bool _isSelected(T? item) => selected.contains(item);
}
