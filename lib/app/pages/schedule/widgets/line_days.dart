import 'package:academico_mobile/app/core/ui/helpers/size_extensions.dart';
import 'package:academico_mobile/app/core/ui/styles/colors_app.dart';
import 'package:academico_mobile/app/models/schedule_model.dart';
import 'package:flutter/material.dart';
import '../../../core/ui/styles/text_styles.dart';

class LineDays extends StatefulWidget {
  final Horario day;
  final VoidCallback onPressed;
  Color? color;

  LineDays({
    super.key,
    required this.day,
    required this.onPressed,
    this.color = const Color(0xFF1E1E1E),
  });

  @override
  State<LineDays> createState() => _LineDaysState();
}

class _LineDaysState extends State<LineDays> {
  Color colors() {
    if (widget.day.dia.contains('Sun') || widget.day.dia.contains('Sat')) {
      return ColorsApp.instance.cardnoselected;
    } else {
      return widget.color!;
    }
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(colors()),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          ),
        ),
      ),
      onPressed:
          widget.day.dia.contains('Sun') || widget.day.dia.contains('Sat')
              ? null
              : () {
                  setState(() {
                    widget.color = ColorsApp.instance.cardwhite;
                    widget.onPressed();
                  });
                },
      child: SizedBox(
        height: context.percentHeight(.2),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              widget.day.dia,
              style: TextStyles.instance.texLabelH4.copyWith(
                color: ColorsApp.instance.labelblack3,
                fontWeight: TextStyles.instance.textSemiBold.fontWeight,
              ),
            ),
            Text(
              widget.day.id.toString(),
              style: TextStyles.instance.texLabelH4.copyWith(
                color: ColorsApp.instance.labelblack4,
                fontWeight: TextStyles.instance.textExtraBold.fontWeight,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
