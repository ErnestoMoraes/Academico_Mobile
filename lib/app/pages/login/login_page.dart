import 'package:academico_mobile/app/core/ui/helpers/size_extensions.dart';
import 'package:academico_mobile/app/core/ui/styles/colors_app.dart';
import 'package:academico_mobile/app/core/ui/styles/text_styles.dart';
import 'package:academico_mobile/app/core/ui/widgets/my_input_button.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _obscuredText = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Form(
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
                      style: TextStyles.instance.texLabelH4.copyWith(
                        color: ColorsApp.instance.labelblack1,
                        fontSize: 20,
                        fontWeight:
                            TextStyles.instance.textButtonLabel.fontWeight,
                      ),
                      decoration: const InputDecoration(
                        hintText: 'usuário',
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
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
                              onPressed: () {},
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
          SliverFillRemaining(
            hasScrollBody: false,
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: EdgeInsets.only(bottom: context.percentHeight(.05)),
                child: TextButton(
                  onPressed: () {},
                  child: Text(
                    'Esqueceu seu senha? Recuperar senha',
                    style: TextStyles.instance.texLabelH4.copyWith(
                      color: ColorsApp.instance.labelblack4,
                      fontWeight: TextStyles.instance.textSemiBold.fontWeight,
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
