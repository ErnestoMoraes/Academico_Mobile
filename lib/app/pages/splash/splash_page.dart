import 'package:academico_mobile/app/core/secure_storage/secure_storage.dart';
import 'package:academico_mobile/app/core/ui/helpers/size_extensions.dart';
import 'package:academico_mobile/app/core/ui/widgets/my_input_button.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  final SecureStorage _secureStorage = SecureStorage();
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      var username = await _secureStorage.getUserName();
      var password = await _secureStorage.getPassWord();
      debugPrint('username: $username');
      debugPrint('password: $password');
    });
  }

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
                  onPressed: () =>
                      Navigator.of(context).popAndPushNamed('/login'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
