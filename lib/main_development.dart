import 'package:flutter_boilerplate/start.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'gen/assets.gen.dart';

Future<void> main() async {
  await dotenv.load(fileName: Assets.env.envDevelopment);
  await start();
}
