import 'package:academico_mobile/academico_mobile.dart';
import 'package:academico_mobile/app/core/config/env/env.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  await Env.instance.load();
  runApp(const AcademicoMobile());
}
