import 'package:flavor_env/app.dart';
import 'package:flavor_env/app_config.dart';
import 'package:flavor_env/app_config_utils.dart';
import 'package:flavor_env/gen/assets.gen.dart';
import 'package:flutter/material.dart';

void main() async {
  final env = await AppConfigUtils.getConfigFromEnv(Assets.env.aUat);
  setConfig(env);
  runApp(const MyApp());
}

