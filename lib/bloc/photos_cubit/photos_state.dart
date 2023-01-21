part of 'photos_cubit.dart';

@immutable
abstract class PhotosState {}

class PhotosInitial extends PhotosState {}

class PhotosLoading extends PhotosState {}

class PhotoSuccess extends PhotosState {}

class PhotoLoadMore extends PhotosState {}

class PhotoFailed extends PhotosState {
  final String? message;
  PhotoFailed(this.message);
}
