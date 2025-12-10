import 'package:image_picker/image_picker.dart';
import 'package:injectable/injectable.dart';
import 'package:q_bank/core/core.dart';

@injectable
class ImagePickerHelper {
  final ImagePicker _picker = ImagePicker();
  final ImageCompressorHelper _imageCompressorHelper = ImageCompressorHelper();
  Future<XFile?> cameraCapture() async {
    try {
      final XFile? file = await _picker.pickImage(source: ImageSource.camera);
      if (file != null) {
        return await _imageCompressorHelper.compressImage(file);
      }
      return null;
    } catch (e) {
      rethrow;
    }
  }

  Future<XFile?> pickImageFromGallery() async {
    try {
      final XFile? file = await _picker.pickImage(source: ImageSource.gallery);
      if (file != null) {
        return await _imageCompressorHelper.compressImage(file);
      }
      return null;
    } catch (e) {
      rethrow;
    }
  }

  Future<List<XFile>> pickMultipleImages() async {
    try {
      final List<XFile> files = await _picker.pickMultiImage();
      List<XFile> compressedFiles = [];
      for (var file in files) {
        final compressedFile = await _imageCompressorHelper.compressImage(file);
        if (compressedFile != null) {
          compressedFiles.add(compressedFile);
        }
      }
      return compressedFiles;
    } catch (e) {
      rethrow;
    }
  }
}
