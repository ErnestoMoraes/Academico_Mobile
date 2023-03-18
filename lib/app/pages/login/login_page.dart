// ignore_for_file: unnecessary_string_interpolations, avoid_print
import 'package:academico_mobile/app/core/ui/helpers/size_extensions.dart';
import 'package:academico_mobile/app/core/ui/styles/colors_app.dart';
import 'package:academico_mobile/app/core/ui/styles/text_styles.dart';
import 'package:academico_mobile/app/core/ui/widgets/my_input_button.dart';
import 'package:academico_mobile/app/pages/login/widgets/my_sliverfillremaining.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final formKey = GlobalKey<FormState>();
  TextEditingController matriculaEC = TextEditingController();
  TextEditingController senhaEC = TextEditingController();
  bool _obscuredText = true;
  late WebViewController controller;
  @override
  void initState() {
    controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..loadRequest(Uri.parse(
          'https://qacademico.ifce.edu.br/qacademico/index.asp?t=1001'));
    super.initState();
  }

  @override
  void dispose() {
    matriculaEC.dispose();
    senhaEC.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Form(
                key: formKey,
                child: Column(
                  children: [
                    SizedBox(
                      height: context.percentHeight(.25),
                    ),
                    Image.asset(
                      'assets/images/logos/logo_ifce.png',
                      height: context.percentHeight(.4),
                      fit: BoxFit.cover,
                    ),
                    SizedBox(
                      height: context.percentHeight(.1),
                    ),
                    TextFormField(
                      controller: matriculaEC,
                      keyboardType: TextInputType.number,
                      style: TextStyles.instance.texLabelH4.copyWith(
                        color: ColorsApp.instance.labelblack1,
                        fontSize: 20,
                        fontWeight:
                            TextStyles.instance.textButtonLabel.fontWeight,
                      ),
                      decoration: const InputDecoration(
                        hintText: 'matricula',
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      controller: senhaEC,
                      obscureText: _obscuredText,
                      style: TextStyles.instance.texLabelH4.copyWith(
                        color: ColorsApp.instance.labelblack1,
                        fontSize: 20,
                        fontWeight:
                            TextStyles.instance.textButtonLabel.fontWeight,
                      ),
                      decoration: InputDecoration(
                        hintText: 'senha',
                        suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              _obscuredText = !_obscuredText;
                            });
                          },
                          icon: Icon(
                              _obscuredText
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                              color: ColorsApp.instance.labelblack1,
                              size: 25),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Center(
                      child: Row(
                        children: [
                          Expanded(
                            child: MyInputButton(
                              height: context.percentHeight(.15),
                              label: 'Acessar',
                              onPressed: () {
                                print('${matriculaEC.text}');
                                print('${senhaEC.text}');
                                controller
                                  ..runJavaScript(
                                      "javascript:document.getElementById('txtLogin').value = '${matriculaEC.text}'")
                                  ..runJavaScript(
                                      "javascript:document.getElementById('txtSenha').value = '${senhaEC.text}'")
                                  ..runJavaScript(
                                      "javascript:document.forms['frmLogin'].submit()");
                                print('foi');
                                Navigator.of(context).pushNamed('/teste');
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
            ),
          ),
          const MySliverfillremaining()
        ],
      ),
    );
  }
}
