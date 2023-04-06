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

  String? _singleSelectionValue;
  var _multiSelectionValues = <String?>{"A", "C"};
  String? _routeValue = "Off";

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
              header: const Text("Single Selection"),
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
                  title: const Text("Wi-Fi & Mobile Data"),
                  value: "Z",
                ),
              ]
            ),
            CupertinoMultiSelection<String>(
              header: const Text("Multi Selection"),
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
            CupertinoListSection.insetGrouped(
              header: const Text("showCupertinoSingleSelectionPage"),
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
                          title: const Text("Wi-Fi & Mobile Data"),
                          value: "Wi-Fi & Mobile Data",
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
