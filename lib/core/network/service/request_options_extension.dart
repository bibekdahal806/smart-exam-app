import 'dart:io';

import 'package:dio/dio.dart';

extension RequestOptionsX on RequestOptions {
  bool get hasFiles => extra['hasFiles'] == true;
  Map<String, dynamic>? get originalBody => extra['originalBody'];
  Map<String, File>? get files => extra['files'];
}
