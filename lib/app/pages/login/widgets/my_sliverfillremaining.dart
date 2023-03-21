import 'package:academico_mobile/app/core/ui/helpers/size_extensions.dart';
import 'package:academico_mobile/app/core/ui/styles/colors_app.dart';
import 'package:academico_mobile/app/core/ui/styles/text_styles.dart';
import 'package:flutter/material.dart';

class MySliverfillremaining extends StatelessWidget {
  const MySliverfillremaining({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverFillRemaining(
      hasScrollBody: false,
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Padding(
          padding: EdgeInsets.only(bottom: context.percentHeight(.05)),
          child: TextButton(
            onPressed: () =>
                Navigator.of(context).pushNamed('/recover-password'),
            child: Text(
              'Esqueceu sua senha? Recuperar senha.',
              style: TextStyles.instance.texLabelH4.copyWith(
                color: ColorsApp.instance.labelblack4,
                fontWeight: TextStyles.instance.textSemiBold.fontWeight,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
