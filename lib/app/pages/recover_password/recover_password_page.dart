import 'package:academico_mobile/app/core/ui/helpers/size_extensions.dart';
import 'package:academico_mobile/app/core/ui/styles/colors_app.dart';
import 'package:academico_mobile/app/core/ui/styles/text_styles.dart';
import 'package:academico_mobile/app/core/ui/widgets/my_appbar.dart';
import 'package:academico_mobile/app/core/ui/widgets/my_input_button.dart';
import 'package:flutter/material.dart';

class RecoverPasswordPage extends StatefulWidget {
  const RecoverPasswordPage({super.key});

  @override
  State<RecoverPasswordPage> createState() => _RecoverPasswordPageState();
}

class _RecoverPasswordPageState extends State<RecoverPasswordPage> {
  bool _obscuredText = true;
  final matriculaEC = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppbar(
          title: 'Recuperar Senha',
          onPressed: () => Navigator.of(context).pop()),
      body: Padding(
        padding: EdgeInsets.all(context.screenWidth * .03),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              controller: matriculaEC,
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
                      _obscuredText ? Icons.visibility : Icons.visibility_off,
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
                    label: 'Acessar',
                    onPressed: () {
                      Navigator.of(context).pushReplacementNamed('/home');
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
