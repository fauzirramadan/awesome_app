import 'package:dio/dio.dart';

class Api {
  static final authorization = Options(headers: {
    "Authorization": "VpKonmdWMy3iMNtsFOZltVSQsjm4XOctpdrWT29df6PLROCAwZMd2rMw"
  });

  static const String baseUrl = "https://api.pexels.com/v1";
  static const String photoApi = "$baseUrl/curated";
}
