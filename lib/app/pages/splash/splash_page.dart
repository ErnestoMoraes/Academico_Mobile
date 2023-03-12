import 'package:academico_mobile/app/core/config/env/env.dart';
import 'package:academico_mobile/app/core/ui/styles/app_styles.dart';
import 'package:academico_mobile/app/core/ui/styles/colors_app.dart';
import 'package:academico_mobile/app/core/ui/styles/text_styles.dart';
import 'package:academico_mobile/app/core/ui/widgets/my_input_button.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Splash'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              Env.instance['URL_LOGIN'] ?? 'Sem URL nas variaveis de ambiente',
              style: context.textStyles.texLabelH1,
            ),
            Text(
              'Academico Mobile',
              style: context.textStyles.texLabelH2,
            ),
            Text(
              'Academico Mobile',
              style: context.textStyles.texLabelH3,
            ),
            Text(
              'Academico Mobile',
              style: context.textStyles.texLabelH4,
            ),
            Text(
              'Academico Mobile',
              style: context.textStyles.texLabelH5,
            ),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    style: context.appStyles.buttonStyle,
                    onPressed: () {},
                    child: const Text('Clique aqui'),
                  ),
                ),
              ],
            ),
            TextFormField(
              style: TextStyles.instance.textButtonLabel,
              decoration: const InputDecoration(
                hintText: 'Digite seu nome',
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Expanded(
                  child: MyInputButton(
                    onPressed: () {},
                    label: "Login",
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
