import 'dart:convert';
import 'dart:developer';

import 'package:awesome_app/data/helper/either.dart';
import 'package:awesome_app/data/helper/failure.dart';
import 'package:awesome_app/data/network/api.dart';
import 'package:awesome_app/data/network/dio_handler.dart';
import 'package:awesome_app/data/response/res_get_photos.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class GeneralRepository {
  Future<Either<Failure, ResGetPhotos>> dataPhotos(int page) async {
    try {
      Response res = await dio.get(Api.photoApi,
          options: Api.authorization, queryParameters: {"page": page});

      return Either.success(ResGetPhotos.fromJson(res.data));
    } catch (e, st) {
      if (kDebugMode) {
        log(st.toString());
      }
      return Either.error(Failure(e.toString()));
    }
  }
}
