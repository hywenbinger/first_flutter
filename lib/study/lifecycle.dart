import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomepage(),
    );
  }
}

class MyHomepage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("生命周期"),
      ),
      body: MyStatefulContentBody(),
    );
  }
}

/// StatefulWidget的生命周期：
///     StatefulWidget createState()
///     StatefulWidget createState()
///     StatefulWidget State constructor()
///     StatefulWidget State initState()
///     StatefulWidget State didChangeDependencies()
///     StatefulWidget State didUpdateWidget()
///     StatefulWidget State build()
///     StatefulWidget State dispose()
class MyStatefulContentBody extends StatefulWidget {
  MyStatefulContentBody() {
    print("StatefulWidget constructor()");
  }

  @override
  _MyStatefulContentBodyState createState() {
    print("StatefulWidget createState()");
    return _MyStatefulContentBodyState();
  }
}

class _MyStatefulContentBodyState extends State<MyStatefulContentBody> {
  _MyStatefulContentBodyState() {
    print("StatefulWidget State constructor()");
  }

  @override
  void initState() {
    super.initState();
    print("StatefulWidget State initState()");
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    print("StatefulWidget State didChangeDependencies()");
  }

  @override
  void didUpdateWidget(MyStatefulContentBody oldWidget) {
    super.didUpdateWidget(oldWidget);
    print("StatefulWidget State didUpdateWidget()");
  }

  @override
  Widget build(BuildContext context) {
    print("StatefulWidget State build()");
    return Center(
      child: Text("This is a text"),
    );
  }

  @override
  void dispose() {
    super.dispose();
    print("StatefulWidget State dispose()");
  }
}

/// StatelessWidget的生命周期：
///   1. constructor()
///   2. build()
class MyStatelessContentBody extends StatelessWidget {
  MyStatelessContentBody() {
    print("StatelessWidget constructor()");
  }

  @override
  Widget build(BuildContext context) {
    print("StatelessWidget build()");
    return Center(
      child: Text("This is a text"),
    );
  }
}
