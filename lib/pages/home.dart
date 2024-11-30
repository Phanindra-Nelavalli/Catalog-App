import 'package:catlog_app/widgets/mydrawer.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Catelog App"),
        centerTitle: true,
      ),
      body: Center(
        child: Text("Welcome to the Home page"),
      ),
      drawer: MyDrawer(),
    );
  }
}
