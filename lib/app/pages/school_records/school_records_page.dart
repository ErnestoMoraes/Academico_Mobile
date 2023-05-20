import 'package:academico_mobile/app/core/ui/helpers/size_extensions.dart';
import 'package:academico_mobile/app/core/ui/styles/colors_app.dart';
import 'package:flutter/material.dart';

class SchoolRecordsPage extends StatefulWidget {
  const SchoolRecordsPage({super.key});

  @override
  State<SchoolRecordsPage> createState() => _SchoolRecordsPageState();
}

class _SchoolRecordsPageState extends State<SchoolRecordsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('School Records'),
      ),
      body: Center(
        child: Text(
          'Função ainda não implementada',
          style: TextStyle(
            fontSize: context.screenWidth * 0.04,
            color: context.colorsApp.cardwhite,
          ),
        ),
      ),
    );
  }
}
