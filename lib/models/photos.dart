// To parse this JSON data, do
//
//     final photos = photosFromJson(jsonString);

import 'dart:convert';

List<List<Photos>> photosFromJson(String str) => List<List<Photos>>.from(json
    .decode(str)
    .map((x) => List<Photos>.from(x.map((x) => Photos.fromJson(x)))));

String photosToJson(List<List<Photos>> data) => json.encode(List<dynamic>.from(
    data.map((x) => List<dynamic>.from(x.map((x) => x.toJson())))));

class Photos {
  int? albumId;
  int? id;
  String? title;
  String url;
  String? thumbnailUrl;

  Photos({
    this.albumId,
    this.id,
    this.title,
    required this.url,
    this.thumbnailUrl,
  });

  factory Photos.fromJson(Map<String, dynamic> json) => Photos(
        albumId: json["albumId"],
        id: json["id"],
        title: json["title"],
        url: json["url"],
        thumbnailUrl: json["thumbnailUrl"],
      );

  Map<String, dynamic> toJson() => {
        "albumId": albumId,
        "id": id,
        "title": title,
        "url": url,
        "thumbnailUrl": thumbnailUrl,
      };
}
