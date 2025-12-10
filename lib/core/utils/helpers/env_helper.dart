import 'package:flutter_dotenv/flutter_dotenv.dart';

class EnvHelper {
  /// load .env file
  static Future<void> init() async {
    // await dotenv.load(fileName: '.env');
  }

  /// return the value of the variable stored in .env file
  static String get(String envVariableName) =>
      dotenv.env[envVariableName] ?? '';
}
