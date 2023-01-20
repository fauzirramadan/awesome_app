import 'dart:convert';
import 'dart:developer';

import 'package:awesome_app/data/helper/either.dart';
import 'package:awesome_app/data/helper/failure.dart';
import 'package:awesome_app/data/network/api.dart';
import 'package:awesome_app/data/network/dio_handler.dart';
import 'package:awesome_app/data/response/res_get_photos.dart';
import 'package:awesome_app/utils/prefs_utils.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class GeneralRepository {
  Future<Either<Failure, ResGetPhotos>> dataPhotos(
      {bool fromApi = false, String? page}) async {
    try {
      String storeKey = "dataPhotos";
      Map<String, dynamic> data = {};
      if (fromApi) {
        Response res = await dio.get(Api.photoApi,
            options: Api.authorization, queryParameters: {"page": page});
        data = res.data;
        await PrefsUtils().save(storeKey, jsonEncode(data));
      } else {
        var cached = await PrefsUtils().get(storeKey);
        if (cached != null) {
          data = jsonDecode(cached);
        }
      }
      return Either.success(ResGetPhotos.fromJson(data));
    } catch (e, st) {
      if (kDebugMode) {
        log(st.toString());
      }
      return Either.error(Failure(e.toString()));
    }
  }
}
