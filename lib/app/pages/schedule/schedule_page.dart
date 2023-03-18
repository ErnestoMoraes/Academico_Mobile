import 'package:academico_mobile/app/core/ui/base_state/base_state.dart';
import 'package:academico_mobile/app/core/ui/helpers/size_extensions.dart';
import 'package:academico_mobile/app/core/ui/styles/colors_app.dart';
import 'package:academico_mobile/app/core/ui/styles/text_styles.dart';
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
  void onReady() {
    controller.loadSchedule();
  }

  List<HorarioDetalhado> list = [];
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
            Text('Cronograma de Aulas', style: TextStyles.instance.labelPage),
        automaticallyImplyLeading: false,
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
                  height: 80,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: state.schedule.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: LineDays(
                            day: state.schedule[index],
                            onPressed: () => setState(() {
                                  list = state.schedule[index].horarios;
                                })),
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
                Expanded(
                  child: list.isEmpty
                      ? Center(
                          child: Text(
                            'Selecione um dia da semana...',
                            style: TextStyles.instance.textButtonLabel.copyWith(
                                color: ColorsApp.instance.cardwhite,
                                fontSize: 18),
                          ),
                        )
                      : ListView.builder(
                          itemCount: list.length,
                          itemBuilder: (context, index) {
                            if (list.isEmpty) {
                              return Center(
                                child: Container(
                                  height: 50,
                                  width: 50,
                                  color: Colors.amber,
                                  child: Text(
                                    'Nenhuma aula marcada para esse dia',
                                    style: TextStyles.instance.textButtonLabel,
                                  ),
                                ),
                              );
                            } else {
                              return MyCard(
                                isNow: false,
                                horario: list[0].horario,
                                sala: list[0].sala,
                                disciplina: list[0].disciplina,
                                professor: list[0].professor,
                              );
                            }
                          },
                        ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
