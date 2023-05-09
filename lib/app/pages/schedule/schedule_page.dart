import 'package:academico_mobile/app/core/ui/base_state/base_state.dart';
import 'package:academico_mobile/app/core/ui/helpers/size_extensions.dart';
import 'package:academico_mobile/app/core/ui/styles/colors_app.dart';
import 'package:academico_mobile/app/core/ui/styles/text_styles.dart';
import 'package:academico_mobile/app/core/ui/widgets/my_appbar.dart';
import 'package:academico_mobile/app/pages/schedule/widgets/my_card.dart';
import 'package:academico_mobile/app/models/schedule_model.dart';
import 'package:academico_mobile/app/pages/schedule/schedule_controller.dart';
import 'package:academico_mobile/app/pages/schedule/schedule_state.dart';
import 'package:academico_mobile/app/pages/schedule/widgets/line_days.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SchedulePage extends StatefulWidget {
  const SchedulePage({super.key});

  @override
  State<SchedulePage> createState() => _SchedulePageState();
}

class _SchedulePageState extends BaseState<SchedulePage, ScheduleController> {
  @override
  void onReady() async {
    await controller.loadSchedule();
  }

  List<HorarioDetalhado> list = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppbar.normal(
        title: 'Cronograma de Aulas',
        onPressed: () => Navigator.pop(context),
      ),
      body: BlocConsumer<ScheduleController, ScheduleState>(
        listener: (context, state) {
          state.status.matchAny(
            any: () => hideLoader(),
            loading: () => showLoader(),
            error: () {
              hideLoader();
              showError(state.errorMessage ?? 'Erro ao carregar o cronograma');
            },
          );
        },
        buildWhen: (previous, current) => current.status.matchAny(
          any: () => false,
          initial: () => true,
          loaded: () => true,
        ),
        builder: (context, state) {
          return Padding(
            padding:
                EdgeInsets.symmetric(horizontal: context.percentWidth(0.03)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text('Semana', style: TextStyles.instance.labelPage),
                  ],
                ),
                SizedBox(height: context.percentWidth(0.05)),
                SizedBox(
                  height: 90,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: state.schedule.length,
                    itemBuilder: (context, index) {
                      final now = DateTime.now();
                      final startOfWeek =
                          now.subtract(Duration(days: now.weekday));
                      final List<DateTime> daysOfWeek = [];
                      for (int i = 0; i < 7; i++) {
                        daysOfWeek.add(startOfWeek.add(Duration(days: i)));
                      }
                      list = state
                          .schedule[state.selectedDay ?? DateTime.now().weekday]
                          .horarios;
                      return Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: LineDays(
                          day: state.schedule[index],
                          hoje: daysOfWeek[index].day,
                          color: state.selectedDay == index
                              ? ColorsApp.instance.cardwhite
                              : ColorsApp.instance.cardnoselected,
                          onPressed: () async {
                            await controller.selectedDay(index);
                            list = state.schedule[index].horarios;
                          },
                        ),
                      );
                    },
                  ),
                ),
                SizedBox(height: context.percentWidth(0.05)),
                Row(
                  children: [
                    Text('Disciplinas', style: TextStyles.instance.labelPage),
                  ],
                ),
                SizedBox(height: context.percentWidth(0.05)),
                BlocBuilder<ScheduleController, ScheduleState>(
                  builder: (context, state) {
                    if (list.isEmpty) {
                      return Expanded(
                        child: Center(
                          child: Text(
                            'Nenhuma aula marcada para esse dia',
                            style: TextStyles.instance.textExtraBold
                                .copyWith(color: ColorsApp.instance.cardwhite),
                          ),
                        ),
                      );
                    } else {
                      return Expanded(
                        child: ListView.builder(
                          itemCount: list.length,
                          itemBuilder: (context, index) {
                            return MyCard(
                              horarioDetalhado: list[index],
                            );
                          },
                        ),
                      );
                    }
                  },
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

// return Center(
//                           child: Container(
//                             height: 50,
//                             width: 50,
//                             color: Colors.amber,
//                             child: Text(
//                               'Nenhuma aula marcada para esse dia',
//                               style: TextStyles.instance.textExtraBold.copyWith(
//                                 color: ColorsApp.instance.cardwhite),
//                             ),
//                           ),
//                         );