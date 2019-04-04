import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:lojinha/tiles/category_tile.dart';

class ProductsTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<QuerySnapshot>(
      future: Firestore.instance.collection("products").getDocuments(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else {
          List<Widget> dividerTiles = _getDividerTiles(snapshot);

          return ListView(
            children: dividerTiles,
          );
        }
      },
    );
  }

  List<Widget> _getDividerTiles(AsyncSnapshot<QuerySnapshot> snapshot) {
    var dividerTiles = ListTile.divideTiles(
            tiles: snapshot.data.documents.map((doc) {
              return CategoryTile(doc);
            }).toList(),
            color: Colors.grey[500])
        .toList();
    return dividerTiles;
  }
}
