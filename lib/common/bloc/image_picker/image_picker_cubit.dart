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

  Future<void> captureImage() async {
    try {
      XFile? file = await _imagePickerHelper.cameraCapture();
      if (file != null) {
        return emit(state.copyWith(file: File(file.path)));
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
        return emit(state.copyWith(file: File(file.path)));
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
        var previousFiles = List<File>.from(state.files);

        // Add only unique files based on their path
        for (var file in files) {
          var newFile = File(file.path);
          if (!previousFiles.any(
            (existingFile) => existingFile.path == newFile.path,
          )) {
            previousFiles.add(newFile);
          }
        }
        return emit(state.copyWith(files: previousFiles));
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

  Future<void> clearSigleFile() async {
    try {
      return emit(state.copyWith(file: null));
    } catch (e) {
      return emit(state.copyWith(error: e.toString()));
    }
  }
}

// ImagePickerState
class ImagePickerState extends Equatable {
  final File? file;
  final List<File> files;
  final String error;

  const ImagePickerState({this.file, this.files = const [], this.error = ''});

  ImagePickerState copyWith({File? file, List<File>? files, String? error}) {
    return ImagePickerState(
      file: file,
      files: files ?? this.files,
      error: error ?? this.error,
    );
  }

  @override
  List<Object?> get props => [file, files, error];
}
