import 'package:flavor_env/gen/assets.gen.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class AppConfigUtils {
  static Future<Map<String, String>> _loadEnv(String file) async {
    final dotEnv = DotEnv();
    await dotEnv.load(fileName: file);
    return dotEnv.env;
  }

  static Future<Map<String, String>> getConfigFromEnv(String env) async {
    final mainEnv = await _loadEnv(env);
    final extraEnv = await _loadEnv(Assets.env.aEnv);
    return {...extraEnv, ...mainEnv};
  }
}
