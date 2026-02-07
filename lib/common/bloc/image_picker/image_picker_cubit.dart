import 'dart:io';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:injectable/injectable.dart';
import 'package:q_bank/core/core.dart';

@injectable
class ImagePickerCubit extends Cubit<ImagePickerState> {
  final ImagePickerHelper _imagePickerHelper;
  ImagePickerCubit(this._imagePickerHelper) : super(const ImagePickerState());

  Future<void> setImagePickerStatus({bool? isSingleImagePicker}) async {
    return emit(state.copyWith(isSingleImagePicker: isSingleImagePicker));
  }

  Future<void> captureImage() async {
    try {
      XFile? file = await _imagePickerHelper.cameraCapture();
      if (file != null) {
        final newFiles = uniqueFiles(state.files, [File(file.path)]);
        return emit(state.copyWith(files: newFiles));
      } else {
        return emit(
          state.copyWith(error: "Something went wrong while picking image."),
        );
      }
    } catch (e) {
      return emit(state.copyWith(error: e.toString()));
    }
  }

  Future<void> pickImage() async {
    try {
      XFile? file = await _imagePickerHelper.pickImageFromGallery();
      if (file != null) {
        final newFiles = uniqueFiles(state.files, [File(file.path)]);
        return emit(state.copyWith(files: newFiles, error: null));
      } else {
        return emit(
          state.copyWith(error: "Something went wrong while picking image."),
        );
      }
    } catch (e) {
      return emit(state.copyWith(error: e.toString()));
    }
  }

  Future<void> pickMultipleImages() async {
    try {
      List<XFile> files = await _imagePickerHelper.pickMultipleImages();
      if (files.isNotEmpty) {
        var incomingFiles = files.map((e) => File(e.path)).toList();
        var newFiles = uniqueFiles(state.files, incomingFiles);
        return emit(state.copyWith(files: newFiles));
      } else {
        return emit(
          state.copyWith(error: "Something went wrong while picking image."),
        );
      }
    } catch (e) {
      return emit(state.copyWith(error: e.toString()));
    }
  }

  Future<void> removeFileFromMultipleFiles(String filePath) async {
    try {
      var previouFiles = List<File>.from(state.files);
      var newFiles = previouFiles
          .where((file) => file.path != filePath)
          .toList();
      return emit(state.copyWith(files: newFiles));
    } catch (e) {
      return emit(state.copyWith(error: e.toString()));
    }
  }

  Future<void> clearAllFiles() async {
    try {
      return emit(state.copyWith(files: []));
    } catch (e) {
      return emit(state.copyWith(error: e.toString()));
    }
  }

  List<File> uniqueFiles(List<File> existingFiles, List<File> incomingFiles) {
    if (state.isSingleImagePicker) return incomingFiles;
    final paths = existingFiles.map((file) => file.path).toSet();
    final result = [...existingFiles];
    //add only unique files based on their paths.
    for (final file in incomingFiles) {
      if (!paths.contains(file.path)) {
        result.add(file);
      }
    }
    return result;
  }
}

// ImagePickerState
class ImagePickerState extends Equatable {
  final List<File> files;
  final String? error;
  final bool isSingleImagePicker;

  const ImagePickerState({
    this.files = const [],
    this.error,
    this.isSingleImagePicker = false,
  });

  ImagePickerState copyWith({
    List<File>? files,
    String? error,

    bool? isSingleImagePicker,
  }) {
    return ImagePickerState(
      files: files ?? this.files,
      error: error ?? this.error,
      isSingleImagePicker: isSingleImagePicker ?? this.isSingleImagePicker,
    );
  }

  @override
  List<Object?> get props => [files, error, isSingleImagePicker];
}
