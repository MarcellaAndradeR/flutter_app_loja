import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_loja/Tiles/category_tile.dart';

class ProductTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<QuerySnapshot>(
      future: Firestore.instance.collection("Products").getDocuments(),
      builder: (context, snapshot){
        if (!snapshot.hasData)
          return Center(
            child: CircularProgressIndicator(),
          );
        else {

          var dividedTiles = ListTile.dividerTile(
            tile: snapshot.data.documents.map(
                  (doc) {
                return CategoryTile(doc);
              }).toList(),
              color: Colors.grey[500],).toList();

          return ListView(
            children: dividedTiles,
          );
        }
      },

    );
  }
}
