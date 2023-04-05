
import 'package:cupertino_lists_enhanced/list_tile.dart';
import 'package:cupertino_lists_enhanced/widget_location.dart';
import 'package:flutter/cupertino.dart';


class CupertinoSelectionTile<T> extends StatelessWidget {

  final Widget title;
  final Widget? subtitle;
  final T? value;
  final bool isSelected;
  final bool enabled;
  final void Function(T? value)? onTap;
  final WidgetSelectionLocation checkMarkLocation;

  const CupertinoSelectionTile({
    required this.title,
    required this.isSelected,
    required this.checkMarkLocation,
    this.subtitle,
    this.value,
    this.onTap,
    required this.enabled,
    Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return EnhancedCupertinoListTile(
      titleBuilder: (context) => _TitleTextStyle(
        enabled: enabled,
        child: title
      ),
      subtitleBuilder: subtitle != null ?  (context) => _TitleTextStyle(
        enabled: enabled,
        child: subtitle!,
      ): null,
      trailing: checkMarkLocation == WidgetSelectionLocation.trailing ? _icon : null,
      leading: checkMarkLocation == WidgetSelectionLocation.leading ? _icon: null,
      onTap: () {
        if (onTap != null && enabled) {
          onTap!(value);
        }
      },
    );
  }

  Widget get _icon => isSelected ? const Icon(
    CupertinoIcons.check_mark,
    color: CupertinoColors.systemBlue,
  ) : const SizedBox.shrink();
}


class _TitleTextStyle extends StatelessWidget {

  final Widget child;
  final bool enabled;

  const _TitleTextStyle({required this.child, required this.enabled, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => DefaultTextStyle(
    style: DefaultTextStyle.of(context).style.merge(
      TextStyle(
        color: !enabled ? CupertinoColors.inactiveGray : null
      )
    ),
    child: child
  );
}
