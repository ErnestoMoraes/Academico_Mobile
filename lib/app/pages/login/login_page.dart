// ignore_for_file: unnecessary_string_interpolations, avoid_print
import 'package:academico_mobile/app/core/ui/base_state/base_state.dart';
import 'package:academico_mobile/app/core/ui/helpers/size_extensions.dart';
import 'package:academico_mobile/app/core/ui/styles/colors_app.dart';
import 'package:academico_mobile/app/core/ui/styles/text_styles.dart';
import 'package:academico_mobile/app/core/ui/widgets/my_input_button.dart';
import 'package:academico_mobile/app/pages/login/login_controller.dart';
import 'package:academico_mobile/app/pages/login/login_state.dart';
import 'package:academico_mobile/app/pages/login/widgets/my_sliverfillremaining.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:validatorless/validatorless.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends BaseState<LoginPage, LoginController> {
  final formKey = GlobalKey<FormState>();
  TextEditingController matriculaEC = TextEditingController();
  TextEditingController passwordEC = TextEditingController();
  bool _obscuredText = true;

  @override
  void dispose() {
    matriculaEC.dispose();
    passwordEC.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginController, LoginState>(
      listener: (context, state) {
        state.status.matchAny(
          any: () => hideLoader(),
          login: () => showLoader(),
          loginError: () {
            hideLoader();
            showError('Login ou Senha inválidos');
          },
          error: () {
            hideLoader();
            showError('Error ao realizar login');
          },
          sucess: () {
            hideLoader();
            Navigator.of(context).pushReplacementNamed('/home');
          },
        );
      },
      child: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Scaffold(
          body: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.all(context.screenWidth * .03),
                  child: Form(
                    key: formKey,
                    child: Column(
                      children: [
                        SizedBox(
                          height: context.percentHeight(.15),
                        ),
                        Image.asset(
                          'assets/images/logos/logo_ifce.png',
                          height: context.percentHeight(.2),
                          fit: BoxFit.cover,
                        ),
                        SizedBox(
                          height: context.percentHeight(.05),
                        ),
                        TextFormField(
                          controller: matriculaEC,
                          validator: Validatorless.multiple([
                            Validatorless.required('Matricula Obrigatória'),
                            Validatorless.min(
                                6, 'Matricula deve ter no mínimo 6 caracteres'),
                          ]),
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
                          controller: passwordEC,
                          validator: Validatorless.multiple([
                            Validatorless.required('Senha Obrigatória'),
                            Validatorless.min(
                              6,
                              'Senha deve ter no mínimo 6 caracteres',
                            )
                          ]),
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
                                  height: context.screenHeight * .07,
                                  label: 'Acessar',
                                  onPressed: () async {
                                    final formValid =
                                        formKey.currentState?.validate() ??
                                            false;
                                    if (formValid) {
                                      await controller.login(
                                        matriculaEC.text,
                                        passwordEC.text,
                                      );
                                    }
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: context.screenHeight * .07,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const MySliverfillremaining()
            ],
          ),
        ),
      ),
    );
  }
}
