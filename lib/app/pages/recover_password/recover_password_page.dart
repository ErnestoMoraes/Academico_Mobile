// ignore_for_file: use_build_context_synchronously

import 'package:academico_mobile/app/core/ui/helpers/loader.dart';
import 'package:academico_mobile/app/core/ui/helpers/messages.dart';
import 'package:academico_mobile/app/core/ui/helpers/size_extensions.dart';
import 'package:academico_mobile/app/core/ui/styles/colors_app.dart';
import 'package:academico_mobile/app/core/ui/styles/text_styles.dart';
import 'package:academico_mobile/app/core/ui/widgets/my_appbar.dart';
import 'package:academico_mobile/app/core/ui/widgets/my_input_button.dart';
import 'package:flutter/material.dart';
import 'package:validatorless/validatorless.dart';

class RecoverPasswordPage extends StatefulWidget {
  const RecoverPasswordPage({super.key});

  @override
  State<RecoverPasswordPage> createState() => _RecoverPasswordPageState();
}

class _RecoverPasswordPageState extends State<RecoverPasswordPage>
    with Loader, Messages {
  bool _obscuredText = true;
  final matriculaEC = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    matriculaEC.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: MyAppbar(
            title: 'Recuperar Senha',
            onPressed: () => Navigator.of(context).pop()),
        body: Padding(
          padding: EdgeInsets.all(context.screenWidth * .03),
          child: Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextFormField(
                  controller: matriculaEC,
                  validator: Validatorless.multiple(
                    [
                      Validatorless.required('Matricula obrigatória'),
                      Validatorless.min(6, 'Matricula inválida'),
                    ],
                  ),
                  obscureText: _obscuredText,
                  keyboardType: TextInputType.number,
                  style: TextStyles.instance.texLabelH4.copyWith(
                    color: ColorsApp.instance.labelblack1,
                    fontSize: 20,
                    fontWeight: TextStyles.instance.textButtonLabel.fontWeight,
                  ),
                  decoration: InputDecoration(
                    hintText: 'Matricula',
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
                SizedBox(
                  height: context.screenHeight * .02,
                ),
                Row(
                  children: [
                    Expanded(
                      child: MyInputButton(
                        height: context.screenHeight * .07,
                        label: 'Enviar',
                        onPressed: () async {
                          final form =
                              formKey.currentState?.validate() ?? false;
                          if (form) {
                            showLoader();
                            await Future.delayed(const Duration(seconds: 2));
                            hideLoader();
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: const Text('Aviso do desenvolvedor'),
                                  content: const Text(
                                      'Olá caro amigo, infelizmente não foi possível implementar essa funcionalidade ainda, mas não se preocupe, ela estará disponível em breve!'),
                                  actions: [
                                    TextButton(
                                      style: ButtonStyle(
                                        backgroundColor:
                                            MaterialStateProperty.all<Color>(
                                                ColorsApp.instance.cardblue),
                                      ),
                                      child: Text('Fechar',
                                          style: TextStyle(
                                              color: ColorsApp
                                                  .instance.cardwhite)),
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                    ),
                                  ],
                                );
                              },
                            );
                          }
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
