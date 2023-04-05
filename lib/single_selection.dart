

import 'package:cupertino_lists_enhanced/selection.dart';
import 'package:cupertino_lists_enhanced/selection_item.dart';
import 'package:cupertino_lists_enhanced/selection_tile.dart';
import 'package:cupertino_lists_enhanced/widget_location.dart';
import 'package:flutter/cupertino.dart';

class CupertinoSingleSelection<T> extends StatelessWidget {

  final List<SelectionItem<T>> children;
  final T? selected;
  final ValueChanged<T?>? onChanged;
  final Widget? header;
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



