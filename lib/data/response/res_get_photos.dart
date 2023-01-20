// To parse this JSON data, do
//
//     final resGetPhotos = resGetPhotosFromJson(jsonString);

import 'dart:convert';

import '../model/photo.dart';

ResGetPhotos resGetPhotosFromJson(String str) =>
    ResGetPhotos.fromJson(json.decode(str));

String resGetPhotosToJson(ResGetPhotos data) => json.encode(data.toJson());

class ResGetPhotos {
  ResGetPhotos({
    this.page,
    this.perPage,
    this.photos,
    this.totalResults,
    this.nextPage,
    this.prevPage,
  });

  int? page;
  int? perPage;
  List<Photo>? photos;
  int? totalResults;
  String? nextPage;
  String? prevPage;

  factory ResGetPhotos.fromJson(Map<String, dynamic> json) => ResGetPhotos(
        page: json["page"],
        perPage: json["per_page"],
        photos: json["photos"] == null
            ? []
            : List<Photo>.from(json["photos"]!.map((x) => Photo.fromJson(x))),
        totalResults: json["total_results"],
        nextPage: json["next_page"],
        prevPage: json["prev_page"],
      );

  Map<String, dynamic> toJson() => {
        "page": page,
        "per_page": perPage,
        "photos": photos == null
            ? []
            : List<dynamic>.from(photos!.map((x) => x.toJson())),
        "total_results": totalResults,
        "next_page": nextPage,
        "prev_page": prevPage,
      };
}
