// To parse this JSON data, do
//
//     final nearby = nearbyFromJson(jsonString);

part of 'service_api.dart';

List<Nearby> nearbyFromJson(String str) =>
    List<Nearby>.from(json.decode(str).map((x) => Nearby.fromJson(x)));

String nearbyToJson(List<Nearby> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Nearby {
  Nearby({
    required this.desc,
    required this.distant,
    required this.favorite,
    required this.id,
    required this.map,
    required this.img,
    required this.place,
    required this.star,
  });
  String map;

  String desc;
  String distant;
  bool favorite;
  int id;
  String img;
  String place;
  String star;

  factory Nearby.fromJson(Map<String, dynamic> json) => Nearby(
        desc: json["desc"],
        distant: json["distant"],
        favorite: json["favorite"],
        id: json["id"],
        img: json["img"],
        map: json["map"],
        place: json["place"],
        star: json["star"],
      );

  Map<String, dynamic> toJson() => {
        "desc": desc,
        "distant": distant,
        "favorite": favorite,
        "id": id,
        "map": map,
        "img": img,
        "place": place,
        "star": star,
      };
}
