import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import '../core/network/project_network_manager.dart';
import 'rickmorties.dart';
import 'model/character_model.dart';

class RickmortiesViewModel extends State<RickMorties> {
  final Dio dio = ProjectNetworkManager.instance.dio;
  List<CharacterModel> models = [];

  Future<void> fetchAllData() async {
    final response = await dio.get(ServicePath.EPISODE.rawValue);

    if (response.statusCode == 200) {
      final data = response.data;
      if (data is Map<String, dynamic>) {
        final baseCharacterModel = BaseResponseCharacter.fromJson(data);
        models = baseCharacterModel.results ?? [];
      } else if (data is List) {
        models = data.map((e) => CharacterModel.fromJson(e)).toList();
      }
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
}

enum ServicePath { EPISODE }

extension ServicePathExtension on ServicePath {
  String get rawValue {
    switch (this) {
      case ServicePath.EPISODE:
        return "/episode";
    }
  }
}
