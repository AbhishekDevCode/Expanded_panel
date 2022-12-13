import 'package:flutter/material.dart';
import 'package:expandable/expandable.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Expanded Demo"),
        ),
        body: ExpandableTheme(
            data: const ExpandableThemeData(
                iconColor: Colors.red, useInkWell: true),
            child: ListView(
              physics: const BouncingScrollPhysics(),
              children: <Widget>[
                Card1(),
                // Card2(),
                // Card3(),
              ],
            )));
  }
}

const loremIpsum =
    "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.";

class Card1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ExpandableNotifier(
        child: Padding(
      padding: const EdgeInsets.all(10),
      child: Card(
        clipBehavior: Clip.antiAlias,
        child: Column(
          children: <Widget>[
            // SizedBox(
            //   height: 150,
            //   child: Container(
            //     decoration: const BoxDecoration(
            //       color: Colors.yellow,
            //       shape: BoxShape.rectangle,
            //     ),
            //   ),
            // ),
            Container(
              decoration: BoxDecoration(color: Colors.amber[400]),
              child: ScrollOnExpand(
                scrollOnExpand: true,
                scrollOnCollapse: false,
                child: ExpandablePanel(
                  theme: const ExpandableThemeData(
                    headerAlignment: ExpandablePanelHeaderAlignment.center,
                    tapBodyToCollapse: true,
                  ),
                  header: const Padding(
                      padding: EdgeInsets.all(10),
                      child: Text(
                        "ExpandablePanel",
                        style: TextStyle(color: Colors.red),
                      )),
                  collapsed: const Text(
                    loremIpsum,
                    softWrap: true,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  expanded: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      for (var _ in Iterable.generate(5))
                        Padding(
                            padding: const EdgeInsets.only(bottom: 10),
                            child: Container(
                              decoration:
                                  const BoxDecoration(color: Colors.pink),
                              child: const Text(
                                loremIpsum,
                                softWrap: true,
                                overflow: TextOverflow.fade,
                              ),
                            )),
                    ],
                  ),
                  builder: (_, collapsed, expanded) {
                    return Padding(
                      padding: EdgeInsets.only(left: 10, right: 10, bottom: 10),
                      child: Expandable(
                        collapsed: collapsed,
                        expanded: expanded,
                        theme: const ExpandableThemeData(crossFadePoint: 0),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
