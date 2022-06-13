import 'package:flutter/material.dart';

class FutsalHomePage extends StatefulWidget {
  FutsalHomePage({Key? key}) : super(key: key);

  @override
  State<FutsalHomePage> createState() => _FutsalHomePageState();
}

class _FutsalHomePageState extends State<FutsalHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        floatHeaderSlivers: true,
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverToBoxAdapter(
              child: Container(
                padding: EdgeInsets.only(left: 30),
                child: Text('Hello'),
              ),
            )
          ];
        },
        body: Container(),
      ),
    );
  }
}
