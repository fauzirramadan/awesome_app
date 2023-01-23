import 'dart:developer';

import 'package:awesome_app/data/helper/either.dart';
import 'package:awesome_app/data/helper/failure.dart';
import 'package:awesome_app/data/model/photo.dart';
import 'package:awesome_app/data/repository/general_repo.dart';
import 'package:awesome_app/data/response/res_get_photos.dart';
import 'package:awesome_app/utils/notif_utils.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

part 'photos_state.dart';

class PhotosCubit extends Cubit<PhotosState> {
  PhotosCubit() : super(PhotosInitial());

  final GeneralRepository _repo = GeneralRepository();
  int page = 1;
  List<Photo> listPhoto = [];

  Future<void> getPhotos() async {
    emit(PhotosLoading());
    Either<Failure, ResGetPhotos> res = await _repo.dataPhotos(page);
    res.when(error: (e) {
      log(e.toString());
      NotifUtils.showSnackbar("$e", backgroundColor: Colors.red);
      emit(PhotoFailed(e.message));
    }, success: (s) {
      if (s.photos != null) {
        listPhoto = s.photos ?? [];
        emit(PhotoSuccess(listPhoto));
      } else {
        NotifUtils.showSnackbar("Something went wrong",
            backgroundColor: Colors.red);
        emit(PhotoFailed("gagal"));
      }
    });
  }

  Future<void> loadMorePhotos() async {
    emit(PhotoLoadMore());
    Either<Failure, ResGetPhotos> res = await _repo.dataPhotos(page + 1);
    res.when(error: (e) {
      log(e.toString());
      NotifUtils.showSnackbar("$e", backgroundColor: Colors.red);
      emit(PhotoFailed(e.message));
    }, success: (s) {
      if (s.photos != null) {
        listPhoto.addAll(s.photos ?? []);
        page++;
        emit(PhotoSuccess(listPhoto));
      } else {
        NotifUtils.showSnackbar("Something went wrong",
            backgroundColor: Colors.red);
        emit(PhotoFailed("gagal"));
      }
    });
  }
}
