import 'package:explore_bali_island_flutter/view/home/models/home_models.dart';
import 'package:http/http.dart';
import 'dart:convert';

part 'nearby_api.dart';
part 'popular_api.dart';

class ApiService {
  Future<List<Popular>> getPopular() async {
    final response = await get(Uri.parse(
        "https://mockend.com/Tri334/explore_bali_island_flutter/popular?limit=10"));
    final data = popularFromJson(response.body);
    return data.toList();
  }

  Future<List<Nearby>> getNearby() async {
    final response = await get(Uri.parse(
        "https://mockend.com/Tri334/explore_bali_island_flutter/nearby?limit=10"));
    final nearby = nearbyFromJson(response.body);

    return nearby;
  }
}
