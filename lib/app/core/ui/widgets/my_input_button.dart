import 'package:academico_mobile/app/core/ui/styles/app_styles.dart';
import 'package:academico_mobile/app/core/ui/styles/colors_app.dart';
import 'package:flutter/material.dart';

class MyInputButton extends StatelessWidget {
  final String label;
  final VoidCallback? onPressed;
  final double? width;
  final double? height;

  const MyInputButton({
    super.key,
    required this.label,
    this.onPressed,
    this.width,
    this.height = 65,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: ElevatedButton(
        style: context.appStyles.buttonStyle.copyWith(
          backgroundColor: MaterialStateProperty.all<Color>(
            ColorsApp.instance.cardblue,
          ),
        ),
        onPressed: onPressed,
        child: Text(label),
      ),
    );
  }
}
