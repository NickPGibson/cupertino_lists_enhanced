
import 'package:flutter/widgets.dart';

class SelectionItem<T> {

  final Widget title;
  final Widget? subtitle;
  final T? value;

  final bool enabled;

  SelectionItem({required this.title, this.subtitle, this.value, this.enabled = true});
}
