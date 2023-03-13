import 'package:academico_mobile/app/core/ui/helpers/size_extensions.dart';
import 'package:academico_mobile/app/core/ui/widgets/my_input_button.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/logos/logo_ifce.png',
                  height: context.percentHeight(.5),
                  fit: BoxFit.cover,
                ),
                SizedBox(
                  height: context.percentHeight(.1),
                ),
                MyInputButton(
                  width: context.percentWidth(.6),
                  height: context.percentHeight(.13),
                  label: 'Acessar',
                  onPressed: () => Navigator.of(context).pushNamed('/schedule'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
