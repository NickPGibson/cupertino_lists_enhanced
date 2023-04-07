

import 'package:cupertino_lists_enhanced/app_type.dart';
import 'package:cupertino_lists_enhanced/selection_item.dart';
import 'package:cupertino_lists_enhanced/single_selection.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// A page which shows a [CupertinoSingleSelection], like the iOS settings app.
class SingleSelectionPage<T> extends StatefulWidget {
  /// Widget to be displayed on the [AppBar]/[CupertinoNavigationBar] of the scaffold.
  final Widget title;

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

  /// Options from which the user can choose.
  final List<SelectionItem<T>> children;

  /// Initial value to be selected upon opening the page.
  final T? initial;

  /// Called when a user presses any of the options.
  final ValueChanged<T?>? onChanged;

  /// If [scaffoldType] is material, a material scaffold is used. If [scaffoldType] is cupertino, a cupertino scaffold is used.
  final AppType scaffoldType;

  const SingleSelectionPage({
    required this.title,
    required this.children,
    this.initial,
    this.onChanged,
    this.scaffoldType = AppType.cupertino,
    this.header,
    this.footer,
    this.headerType,
    this.footerType,
    Key? key}) : super(key: key);

  @override
  State<SingleSelectionPage<T>> createState() => _SingleSelectionPageState<T>();
}

class _SingleSelectionPageState<T> extends State<SingleSelectionPage<T>> {

  T? _selected;

  @override
  void initState() {
    _selected = widget.initial;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final body = SingleChildScrollView(
      child: CupertinoSingleSelection<T>(
        header: widget.header,
        footer: widget.footer,
        headerType: widget.headerType,
        footerType: widget.footerType,
        children: widget.children,
        selected: _selected,
        onChanged: (newValue) {
          setState(() {
            _selected = newValue;
          });
          if (widget.onChanged != null) {
            widget.onChanged!(_selected);
          }
        },
      ),
    );

    switch (widget.scaffoldType) {
      case AppType.material:
        return Scaffold(
          appBar: AppBar(
            title: widget.title,
          ),
          body: body,
        );
      case AppType.cupertino:
        return CupertinoPageScaffold(
          navigationBar: CupertinoNavigationBar(
            middle: widget.title,
          ),
          child: SafeArea(
            child: body,
          ),
        );
    }
  }
}


/// Opens a [SingleSelectionPage].
/// `initial` is the initial value that will be selected upon opening the page
/// `onChanged` is called every time the user presses an option.
/// `title` is the widget to be displayed on the [AppBar]/[CupertinoNavigationBar] of the scaffold.
/// `routeType` determines whether a [MaterialPageRoute] or a [CupertinoPageRoute] is used.
/// `scaffoldType` determines whether a [Scaffold] or a [CupertinoPageScaffold] is used.
Future<T?> showCupertinoSingleSelectionPage<T>({
  required BuildContext context,
  required Widget title,
  required List<SelectionItem<T>> children,
  T? initial,
  ValueChanged<T?>? onChanged,
  bool useRootNavigator = true,
  Widget? header,
  Widget? footer,
  CupertinoListSectionType? headerType,
  CupertinoListSectionType? footerType,
  AppType routeType = AppType.cupertino,
  AppType scaffoldType = AppType.cupertino
}) => Navigator.of(context, rootNavigator: useRootNavigator).push<T>(
    _getRoute<T>(
      appType: routeType,
      builder: (BuildContext context) => SingleSelectionPage<T>(
        header: header,
        footer: footer,
        headerType: headerType,
        footerType: footerType,
        title: title,
        children: children,
        initial: initial,
        onChanged: onChanged,
        scaffoldType: scaffoldType,
      )
    )
  );


PageRoute<T> _getRoute<T>({required AppType appType, required WidgetBuilder builder}) {
  switch(appType) {
    case AppType.material:
      return MaterialPageRoute(builder: builder);
    case AppType.cupertino:
      return CupertinoPageRoute(builder: builder);
  }
}

