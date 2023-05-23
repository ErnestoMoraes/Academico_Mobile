import 'package:academico_mobile/app/core/secure_storage/secure_storage.dart';
import 'package:academico_mobile/app/core/ui/base_state/base_state.dart';
import 'package:academico_mobile/app/core/ui/helpers/size_extensions.dart';
import 'package:academico_mobile/app/core/ui/widgets/my_input_button.dart';
import 'package:academico_mobile/app/pages/splash/splash_controller.dart';
import 'package:academico_mobile/app/pages/splash/splash_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends BaseState<SplashPage, SplashController> {
  final SecureStorage _secureStorage = SecureStorage();
  late String username;
  late String password;
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      username = await _secureStorage.getUserName() ?? '';
      password = await _secureStorage.getPassWord() ?? '';
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<SplashController, SplashState>(
      listener: (context, state) {
        state.status.matchAny(
          any: () => hideLoader(),
          loading: () => showLoader(),
          loaded: () {
            hideLoader();
            Navigator.of(context).pushReplacementNamed('/home');
          },
          error: () {
            hideLoader();
            showError('Error ao realizar login');
          },
        );
      },
      child: Scaffold(
        body: Stack(
          children: [
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/logos/logo_ifce.png',
                    height: context.percentWidth(.5),
                    fit: BoxFit.cover,
                  ),
                  SizedBox(
                    height: context.percentHeight(.1),
                  ),
                  MyInputButton(
                    width: context.percentWidth(.6),
                    height: context.percentHeight(.07),
                    label: 'Acessar',
                    onPressed: () async {
                      if (username.toString().isNotEmpty &&
                          password.toString().isNotEmpty) {
                        controller.splashLogin(username, password);
                      } else {
                        Navigator.of(context).pushNamed('/login');
                      }
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
