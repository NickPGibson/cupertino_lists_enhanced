
import 'package:flutter/cupertino.dart';

class CupertinoSelection<T> extends StatelessWidget {

  final Widget? header;
  final List<Widget> children;

  const CupertinoSelection({required this.children, required this.header, super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoListSection.insetGrouped(
      header: header,
      hasLeading: false,
      children: children,
    );
  }
}
