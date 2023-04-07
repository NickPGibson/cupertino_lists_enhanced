import 'package:cupertino_lists_enhanced/list_section.dart';
import 'package:cupertino_lists_enhanced/multi_selection.dart';
import 'package:cupertino_lists_enhanced/route.dart';
import 'package:cupertino_lists_enhanced/selection_item.dart';
import 'package:cupertino_lists_enhanced/single_selection.dart';
import 'package:cupertino_lists_enhanced/widget_location.dart';
import 'package:flutter/cupertino.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const CupertinoApp(
      home: MyHomePage(),
      debugShowCheckedModeBanner: false,
      theme: CupertinoThemeData(
        scaffoldBackgroundColor: CupertinoColors.tertiarySystemGroupedBackground
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  String? _singleSelectionValue = "X";
  var _multiSelectionValues = <String?>{"A", "C"};
  String? _routeValue = "Wi-Fi";

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        middle: Text('Cupertino Lists Enhanced'),
      ),
      child: SafeArea(
        child: Column(
          children: [
            CupertinoSingleSelection<String>(
              header: const Text("SINGLE SELECTION"),
              footer: const Text("Choose a single item from a list of options."),
              selected: _singleSelectionValue,
              onChanged: (newValue) {
                setState(() {
                  _singleSelectionValue = newValue!;
                });
              },
              children: [
                SelectionItem<String>(
                  title: const Text("Off"),
                  value: "X",
                ),
                SelectionItem<String>(
                  title: const Text("Wi-Fi"),
                  value: "Y",
                ),
                SelectionItem<String>(
                  title: const Text("Mobile Data"),
                  enabled: false,
                  value: "Z",
                ),
              ]
            ),
            CupertinoMultiSelection<String>(
              header: Text("Multi Selection".toUpperCase()),
              footer: const Text("Choose multiple items from a list of options."),
              selected: _multiSelectionValues,
              onChanged: (newValue) {
                setState(() {
                  _multiSelectionValues = newValue;
                });
              },
              checkMarkLocation: WidgetSelectionLocation.leading,
              children: [
                SelectionItem<String>(
                  title: const Text("Option one"),
                  subtitle: const Text("Disabled and selected"),
                  value: "A",
                  enabled: false
                ),
                SelectionItem<String>(
                  title: const Text("Option two"),
                  subtitle: const Text("With subtitle!"),
                  value: "B",
                ),
                SelectionItem<String>(
                  title: const Text("Option three"),
                  value: "C",
                ),
                SelectionItem<String>(
                  title: const Text("Option four"),
                  value: "D",
                ),
                SelectionItem<String>(
                  title: const Text("Option five"),
                  subtitle: const Text("Disabled and not selected!"),
                  value: "E",
                  enabled: false
                )
              ]
            ),
            EnhancedCupertinoListSection.insetGrouped(
              header: const Text("FULL SCREEN DIALOG"),
              footer: const Text("Uses showCupertinoSingleSelectionPage to open a full page dialog to select an item."),
              headerType: CupertinoListSectionType.base,
              footerType: CupertinoListSectionType.base,
              children: [
                CupertinoListTile(
                  title: const Text("Background App Refresh"),
                  additionalInfo: Text(_routeValue ?? ""),
                  onTap: () async {
                    await showCupertinoSingleSelectionPage(
                      context: context,
                      title: const Text("Background App Refresh"),
                      initial: _routeValue,
                      onChanged: (newValue) {
                        setState(() {
                          _routeValue = newValue;
                        });
                      },
                      header: const Text("BACKGROUND APP REFRESH"),
                      footer: const Text("Background app refresh requires an internet connection."),
                      children: [
                        SelectionItem<String>(
                          title: const Text("Off"),
                          value: "Off",
                        ),
                        SelectionItem<String>(
                          title: const Text("Wi-Fi"),
                          value: "Wi-Fi",
                        ),
                        SelectionItem<String>(
                          title: const Text("Mobile Data"),
                          value: "Mobile Data",
                        ),
                      ]
                    );
                  },
                  trailing: const CupertinoListTileChevron(),
                )
              ],
            )
          ]
        )
      )
    );
  }
}
