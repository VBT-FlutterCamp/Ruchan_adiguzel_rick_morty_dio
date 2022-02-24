import 'package:flutter/material.dart';
import 'rickmorties_viewmodel.dart';

class RickmortiesView extends RickmortiesViewModel {
  final String nullImage =
      "https://rickandmortyapi.com/api/character/avatar/1.jpeg";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          fetchAllData();
        },
        child: const Icon(Icons.add),
      ),
      appBar: AppBar(
        title: const Text("Rick and Morty"),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return Card(
            color: Colors.cyan,
            elevation: 0,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            child: ListTile(
              leading: CircleAvatar(
                backgroundImage: NetworkImage(models[index].image ?? nullImage),
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
