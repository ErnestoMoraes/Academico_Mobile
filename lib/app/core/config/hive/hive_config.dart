import 'dart:io';
import 'package:academico_mobile/app/models/schedule_model.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';

class HiveConfig {
  static start() async {
    Directory dir = await getApplicationDocumentsDirectory();
    Hive.registerAdapter(HorarioAdapter());
    Hive.registerAdapter(HorarioDetalhadoAdapter());
    await Hive.initFlutter(dir.path);
  }
}
