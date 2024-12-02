import 'dart:convert';

import 'package:catlog_app/models/catalog.dart';
import 'package:catlog_app/widgets/item_widget.dart';
import 'package:catlog_app/widgets/mydrawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    super.initState();
    loadData();
  }

  void loadData() async {
    // await Future.delayed(Duration(seconds: 4));
    final String catalogJson =
        await rootBundle.loadString("assets/files/catalog.json");
    final decodeData = jsonDecode(catalogJson);
    var productsData = decodeData["products"];
    CatalogModel.items = List.from(productsData)
        .map<Item>((item) => Item.fromMap(item))
        .toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Catelog App"),
        centerTitle: true,
      ),
      body: CatalogModel.items.isNotEmpty
          // ? ListView.builder(
          //   padding: EdgeInsets.all(8.0),
          //   itemCount: CatalogModel.items.length,
          //   itemBuilder: (context, index) {
          //     return ItemWidget(item: CatalogModel.items[index]);
          //   },
          // )
          ? Padding(
              padding: const EdgeInsets.all(12.0),
              child: Card(
                clipBehavior: Clip.antiAlias,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 14,
                      crossAxisSpacing: 6),
                  itemBuilder: (context, index) {
                    final item = CatalogModel.items[index];
                    return GridTile(
                      header: Container(
                        padding: EdgeInsets.all(8),
                        child: Text(
                          item.name,
                          style: TextStyle(color: Colors.white),
                        ),
                        decoration: BoxDecoration(
                          color: Colors.deepPurple,
                        ),
                      ),
                      child: Container(
                          margin: EdgeInsets.only(top: 50),
                          child: Image.network(item.image)),
                      footer: Text(
                        item.price.toString(),
                        style: TextStyle(
                            fontSize: 16,
                            color: Colors.deepPurple,
                            fontWeight: FontWeight.w800),
                      ),
                    );
                  },
                  itemCount: CatalogModel.items.length,
                ),
              ),
            )
          : Center(
              child: CircularProgressIndicator(),
            ),
      drawer: MyDrawer(),
    );
  }
}
