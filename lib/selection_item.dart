
import 'package:flutter/widgets.dart';

class SelectionItem<T> {

  /// `title` will passed to the `title` argument of [CupertinoSingleSelection] and [CupertinoMultiSelection].
  final Widget title;

  /// `subtitle` will passed to the `subtitle` argument of [CupertinoSingleSelection] and [CupertinoMultiSelection].
  final Widget? subtitle;

  /// The value that will be provided through the on onChanged callbacks of
  /// [CupertinoSingleSelection] and [CupertinoMultiSelection] upon clicking the tile.
  final T? value;

  /// Determines if this option can be selected or deselected by the user.
  /// If false, the tile will be greyed out and not selectable by the user.
  final bool enabled;

  SelectionItem({required this.title, this.subtitle, this.value, this.enabled = true});
}
