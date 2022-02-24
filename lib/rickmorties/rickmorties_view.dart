import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'rickmorties_viewmodel.dart';

class RickmortiesView extends RickmortiesViewModel {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          fetchAllData();
        },
        child: Icon(Icons.add),
      ),
      appBar: AppBar(
        title: Text("Rick and Morty"),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return Card(
            color: Colors.amber,
            elevation: 3,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            child: ListTile(
              leading: CircleAvatar(
                backgroundImage: NetworkImage(models[index].image ??
                    "https://rickandmortyapi.com/api/character/avatar/1.jpeg"),
              ),
              title: Text(models[index].name ?? ""),
              subtitle:
                  Text("Episode: ${models[index].episode ?? "Null value"}"),
            ),
          );
        },
        itemCount: models.length,
      ),
    );
  }
}
