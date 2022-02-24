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
      appBar: AppBar(),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return ListTile(
            leading: CircleAvatar(
              backgroundImage: NetworkImage(models[index].image ??
                  "https://rickandmortyapi.com/api/character/avatar/1.jpeg"),
            ),
            title: Text(models[index].name ?? ""),
          );
        },
        itemCount: models.length,
      ),
    );
  }
}
