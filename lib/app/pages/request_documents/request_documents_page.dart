import 'package:academico_mobile/app/core/ui/helpers/size_extensions.dart';
import 'package:academico_mobile/app/core/ui/styles/colors_app.dart';
import 'package:flutter/material.dart';

class RequestDocumentsPage extends StatefulWidget {
  const RequestDocumentsPage({super.key});

  @override
  State<RequestDocumentsPage> createState() => _RequestDocumentsPageState();
}

class _RequestDocumentsPageState extends State<RequestDocumentsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Request Documents'),
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
