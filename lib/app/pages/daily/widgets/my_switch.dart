import 'package:academico_mobile/app/core/ui/helpers/size_extensions.dart';
import 'package:academico_mobile/app/core/ui/styles/colors_app.dart';
import 'package:academico_mobile/app/core/ui/styles/text_styles.dart';
import 'package:academico_mobile/app/pages/daily/daily_controller.dart';
import 'package:academico_mobile/app/pages/daily/daily_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MySwitch extends StatefulWidget {
  const MySwitch({
    super.key,
  });

  @override
  State<MySwitch> createState() => _MySwitchState();
}

class _MySwitchState extends State<MySwitch> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DailyController, DailyState>(
      builder: (context, state) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              width: context.percentWidth(0.4),
              height: context.percentHeight(0.05),
              decoration: BoxDecoration(
                color: state.isNow
                    ? ColorsApp.instance.cardwhite
                    : ColorsApp.instance.cardnoselected,
                borderRadius: BorderRadius.circular(5),
              ),
              child: TextButton(
                onPressed: () => context.read<DailyController>().changeIsNow(),
                child: Text(
                  'Diário atual',
                  style: TextStyles.instance.texLabelH2.copyWith(
                    color: state.isNow
                        ? ColorsApp.instance.background
                        : ColorsApp.instance.labelblack4,
                    fontSize: context.percentHeight(0.017),
                    fontWeight: TextStyles.instance.textSemiBold.fontWeight,
                  ),
                ),
              ),
            ),
            Container(
              width: context.percentWidth(0.4),
              height: context.percentHeight(0.05),
              decoration: BoxDecoration(
                color: !state.isNow
                    ? ColorsApp.instance.cardwhite
                    : ColorsApp.instance.cardnoselected,
                borderRadius: BorderRadius.circular(5),
              ),
              child: TextButton(
                onPressed: () => context.read<DailyController>().changeIsNow(),
                child: Text(
                  'Diário anteriores',
                  style: TextStyles.instance.texLabelH2.copyWith(
                    color: !state.isNow
                        ? ColorsApp.instance.background
                        : ColorsApp.instance.labelblack4,
                    fontSize: context.percentHeight(0.017),
                    fontWeight: TextStyles.instance.textSemiBold.fontWeight,
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
