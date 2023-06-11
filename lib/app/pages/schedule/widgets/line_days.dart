import 'package:academico_mobile/app/core/ui/helpers/size_extensions.dart';
import 'package:academico_mobile/app/core/ui/styles/colors_app.dart';
import 'package:academico_mobile/app/models/schedule_model.dart';
import 'package:flutter/material.dart';
import '../../../core/ui/styles/text_styles.dart';

// ignore: must_be_immutable
class LineDays extends StatefulWidget {
  final int hoje;
  final CronogramaModel day;
  final VoidCallback onPressed;
  Color? color;

  LineDays({
    super.key,
    required this.day,
    required this.onPressed,
    this.color = const Color(0xFF1E1E1E),
    required this.hoje,
  });

  @override
  State<LineDays> createState() => _LineDaysState();
}

class _LineDaysState extends State<LineDays> {
  Color colors() {
    if (widget.day.dia.contains('Sun') || widget.day.dia.contains('Sat')) {
      return ColorsApp.instance.background;
    } else {
      return widget.color!;
    }
  }

  String convertDayOfWeek(String day) {
    switch (day.toLowerCase()) {
      case 'mon':
        return 'Seg';
      case 'tue':
        return 'Ter';
      case 'wed':
        return 'Qua';
      case 'thu':
        return 'Qui';
      case 'fri':
        return 'Sex';
      case 'sat':
        return 'Sáb';
      case 'sun':
        return 'Dom';
      default:
        return 'Invalid';
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
                  widget.onPressed();
                },
      child: SizedBox(
        height: context.percentHeight(.2),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              convertDayOfWeek(widget.day.dia),
              style: TextStyles.instance.texLabelH4.copyWith(
                color: ColorsApp.instance.labelblack3,
                fontWeight: TextStyles.instance.textSemiBold.fontWeight,
              ),
            ),
            Text(
              widget.hoje.toString(),
              style: TextStyles.instance.texLabelH4.copyWith(
                fontSize: context.screenHeight * 0.025,
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
