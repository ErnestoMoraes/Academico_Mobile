import 'package:academico_mobile/app/core/ui/base_state/base_state.dart';
import 'package:academico_mobile/app/core/ui/helpers/size_extensions.dart';
import 'package:academico_mobile/app/core/ui/styles/colors_app.dart';
import 'package:academico_mobile/app/core/ui/styles/text_styles.dart';
import 'package:academico_mobile/app/core/ui/widgets/label_subtitle.dart';
import 'package:academico_mobile/app/core/ui/widgets/my_appbar.dart';
import 'package:academico_mobile/app/models/daily_model.dart';
import 'package:academico_mobile/app/pages/daily/daily_controller.dart';
import 'package:academico_mobile/app/pages/daily/daily_state.dart';
import 'package:academico_mobile/app/pages/daily/widgets/lista_card_disciplina.dart';
import 'package:academico_mobile/app/pages/daily/widgets/my_switch.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DailyPage extends StatefulWidget {
  const DailyPage({super.key});

  @override
  State<DailyPage> createState() => _DailyPageState();
}

class _DailyPageState extends BaseState<DailyPage, DailyController> {
  late List<DisciplinaModel> list = [];
  @override
  void onReady() async {
    await controller.loadSemestre();
    if (controller.state.isNow) {
      list = controller.state.semestres[0].disciplinas;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppbar.normal(
        title: 'Meus Diários',
        onPressed: () => Navigator.pop(context),
      ),
      body: BlocConsumer<DailyController, DailyState>(
        listener: (context, state) {
          state.status.matchAny(
            any: () => hideLoader(),
            loading: () => showLoader(),
            error: () {
              hideLoader();
              showError(state.errorMessage ?? 'Erro ao buscar semestres');
            },
          );
        },
        buildWhen: (previous, current) => current.status.matchAny(
          any: () => false,
          initial: () => true,
          loaded: () => true,
        ),
        builder: (context, state) {
          return Column(
            children: [
              SizedBox(height: context.percentHeight(0.01)),
              const MySwitch(),
              SizedBox(height: context.percentHeight(0.01)),
              Visibility(
                visible: !state.isNow,
                child: SizedBox(
                  height: context.percentHeight(0.07),
                  width: double.infinity,
                  child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: state.semestres.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        margin: EdgeInsets.all(context.percentHeight(.01)),
                        padding: EdgeInsets.symmetric(
                            horizontal: context.percentWidth(0.02)),
                        decoration: BoxDecoration(
                          color: state.selected == index
                              ? ColorsApp.instance.cardwhite
                              : ColorsApp.instance.cardnoselected,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: TextButton(
                          onPressed: () {
                            setState(() {
                              controller.selectedDay(index);
                              list = state.semestres[index].disciplinas;
                            });
                          },
                          child: Text(
                            state.semestres[index].semestre,
                            style: TextStyles.instance.texLabelH2.copyWith(
                              color: state.selected == index
                                  ? ColorsApp.instance.background
                                  : ColorsApp.instance.labelblack4,
                              fontSize: context.percentHeight(0.017),
                              fontWeight:
                                  TextStyles.instance.textSemiBold.fontWeight,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
              SizedBox(height: context.percentHeight(0.01)),
              Padding(
                padding: EdgeInsets.only(left: context.percentWidth(0.03)),
                child: const LabelSubtitle(title: 'Disciplinas'),
              ),
              BlocConsumer<DailyController, DailyState>(
                listener: (context, state) {
                  state.status.matchAny(
                    any: () => hideLoader(),
                    loading: () => showLoader(),
                    error: () {
                      hideLoader();
                      showError(state.errorMessage ??
                          'Erro ao carregar o cronograma');
                    },
                  );
                },
                buildWhen: (previous, current) => current.status.matchAny(
                  any: () => false,
                  initial: () => true,
                  loaded: () => true,
                ),
                builder: (context, state) {
                  if (state.isNow) {
                    list = state.semestres[0].disciplinas;
                  } else {
                    list = state.semestres[state.selected].disciplinas;
                  }
                  return Expanded(
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: list.length,
                      itemBuilder: (BuildContext context, int index) {
                        return ListaCardDisciplina(
                          disciplina: list[index],
                        );
                      },
                    ),
                  );
                },
              ),
              SizedBox(height: context.percentHeight(0.02))
            ],
          );
        },
      ),
    );
  }
}
