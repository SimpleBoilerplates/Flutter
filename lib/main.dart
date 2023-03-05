import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_boilerplate/gen/assets.gen.dart';
import 'package:flutter_boilerplate/start.dart';

Future<void> main() async {
  await dotenv.load(fileName: Assets.env.envStaging);

  await start();
}
