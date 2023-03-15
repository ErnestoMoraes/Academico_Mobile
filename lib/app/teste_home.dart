import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class TesteHome extends StatefulWidget {
  const TesteHome({Key? key}) : super(key: key);

  @override
  State<TesteHome> createState() => _TesteHomeState();
}

class _TesteHomeState extends State<TesteHome> {
  late WebViewController controller;

  @override
  void initState() {
    controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..loadRequest(Uri.parse(
          'https://qacademico.ifce.edu.br/qacademico/index.asp?t=2000'));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: Center(child: WebViewWidget(controller: controller)),
    );
  }
}
