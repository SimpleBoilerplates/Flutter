import 'package:flutter_boilerplate/gen/assets.gen.dart';
import 'package:flutter_boilerplate/start.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

void main() async {
  await dotenv.load(fileName: Assets.env.envProduction);
  start();
}
