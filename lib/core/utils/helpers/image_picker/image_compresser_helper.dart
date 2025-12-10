import 'dart:io';
import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:flutter/foundation.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:q_bank/core/core.dart';
import 'package:image/image.dart' as img;
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart';

class ImageCompressorHelper {
  CustomLogger logger = CustomLogger(title: "Image Compressor helper");

  // Supported input formats
  static const supportedFormats = ['.jpg', '.jpeg', '.png', '.heic', '.webp'];
  static const int defaultCompressionQuality = 55;
  static const int jpgEncodeQuality = 85;

  Future<XFile?> compressImage(XFile file) async {
    final output = await _processImage(file, outputType: OutputType.file);
    return output is XFile ? output : null;
  }

  Future<Uint8List?> compressImageToByteType(XFile file) async {
    final output = await _processImage(file, outputType: OutputType.bytes);
    return output is Uint8List ? output : null;
  }

  Future<File> convertAndCompressImage(File file) async {
    final fileSize = await file.length();

    if (fileSize > 2 * 1024 * 1024) {
      logger.i('Compressing large file (${fileSize / (1024 * 1024)} MB)');
      return await _compressImageIfNeeded(file);
    } else {
      return file;
    }
  }

  // Main processing method ================================================
  Future<dynamic> _processImage(
    XFile file, {
    required OutputType outputType,
    int quality = defaultCompressionQuality,
  }) async {
    final filePath = file.path;
    final fileExtension = path.extension(filePath).toLowerCase();

    // Check format support
    if (!supportedFormats.contains(fileExtension)) {
      throw UnsupportedError('Unsupported image format: $fileExtension');
    }

    // Handle HEIC conversion
    if (fileExtension == '.heic') {
      return await _handleHeicConversion(
        file,
        quality: quality,
        outputType: outputType,
      );
    }

    // Process other formats
    if (outputType == OutputType.bytes) {
      return await FlutterImageCompress.compressWithFile(
        filePath,
        quality: quality,
      );
    } else {
      final tempDir = await getTemporaryDirectory();
      final outputPath = path.join(
        tempDir.path,
        '${path.basenameWithoutExtension(filePath)}_compressed.jpg',
      );

      return await FlutterImageCompress.compressAndGetFile(
        filePath,
        outputPath,
        quality: quality,
      );
    }
  }

  // HEIC Conversion ======================================================
  Future<dynamic> _handleHeicConversion(
    XFile file, {
    required int quality,
    required OutputType outputType,
  }) async {
    if (Platform.isIOS) {
      // Use native iOS compression for HEIC
      return outputType == OutputType.bytes
          ? await FlutterImageCompress.compressWithFile(
              file.path,
              quality: quality,
            )
          : await _compressAndGetFile(file.path, quality);
    } else {
      // Android HEIC handling
      final bytes = await file.readAsBytes();
      final codec = await ui.instantiateImageCodec(bytes);
      final frame = await codec.getNextFrame();
      final byteData = await frame.image.toByteData(
        format: ui.ImageByteFormat.png,
      );

      if (outputType == OutputType.bytes) {
        return byteData?.buffer.asUint8List();
      } else {
        final tempDir = await getTemporaryDirectory();
        final outputFile = File(
          path.join(
            tempDir.path,
            '${path.basenameWithoutExtension(file.path)}_converted.jpg',
          ),
        );
        await outputFile.writeAsBytes(byteData!.buffer.asUint8List());
        return outputFile;
      }
    }
  }

  Future<XFile> _compressAndGetFile(String path, int quality) async {
    final tempDir = await getTemporaryDirectory();
    final outputPath =
        '${tempDir.path}/${DateTime.now().millisecondsSinceEpoch}.jpg';
    final result = await FlutterImageCompress.compressAndGetFile(
      path,
      outputPath,
      quality: quality,
    );
    if (result == null) {
      throw Exception('Image compression failed');
    }
    return result;
  }

  // Compression Logic ====================================================
  Future<File> _compressImageIfNeeded(File file) async {
    final filePath = file.path;
    final extension = path.extension(filePath).toLowerCase();
    final isJpeg = extension == '.jpg' || extension == '.jpeg';

    if (!isJpeg) {
      file = await _convertToJpg(file);
    }

    final tempDir = await getTemporaryDirectory();
    final outputPath = path.join(
      tempDir.path,
      '${path.basenameWithoutExtension(filePath)}_compressed.jpg',
    );

    final result = await FlutterImageCompress.compressAndGetFile(
      file.path,
      outputPath,
      quality: defaultCompressionQuality,
    );

    return File(result!.path);
  }

  // Format Conversion ====================================================
  Future<File> _convertToJpg(File file) async {
    final bytes = await file.readAsBytes();
    final image = img.decodeImage(bytes);

    if (image == null) throw Exception('Image decoding failed');

    final jpgBytes = img.encodeJpg(image, quality: jpgEncodeQuality);
    final tempDir = await getTemporaryDirectory();
    final outputPath = path.join(
      tempDir.path,
      '${DateTime.now().millisecondsSinceEpoch}_${path.basenameWithoutExtension(file.path)}_converted.jpg',
    );

    return File(outputPath)..writeAsBytesSync(jpgBytes);
  }
}

enum OutputType { file, bytes }
