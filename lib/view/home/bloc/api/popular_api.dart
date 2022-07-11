// To parse this JSON data, do
//
//     final popular = popularFromJson(jsonString);

part of 'service_api.dart';

List<Popular> popularFromJson(String str) =>
    List<Popular>.from(json.decode(str).map((x) => Popular.fromJson(x)));

String popularToJson(List<Popular> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Popular {
  Popular({
    required this.desc,
    required this.favorite,
    required this.id,
    required this.img,
    required this.map,
    required this.place,
    required this.star,
  });

  String desc;
  bool favorite;
  int id;
  List img;
  String map;
  String place;
  String star;

  factory Popular.fromJson(Map<String, dynamic> json) => Popular(
        desc: json["desc"],
        favorite: json["favorite"],
        id: json["id"],
        img: json["img"].split(','),
        map: json["map"],
        place: json["place"],
        star: json["star"],
      );

  Map<String, dynamic> toJson() => {
        "desc": desc,
        "favorite": favorite,
        "id": id,
        "img": img,
        "map": map,
        "place": place,
        "star": star,
      };
}
