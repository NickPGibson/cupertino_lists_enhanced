
import 'package:cupertino_lists_enhanced/selection.dart';
import 'package:cupertino_lists_enhanced/selection_item.dart';
import 'package:cupertino_lists_enhanced/selection_tile.dart';
import 'package:cupertino_lists_enhanced/widget_location.dart';
import 'package:flutter/cupertino.dart';


class CupertinoMultiSelection<T> extends StatelessWidget {

  final List<SelectionItem<T>> children;
  final Set<T?> selected;
  final ValueChanged<Set<T?>>? onChanged;
  final Widget? header;
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
