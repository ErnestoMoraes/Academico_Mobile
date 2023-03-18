import 'package:academico_mobile/app/core/ui/base_state/base_state.dart';
import 'package:academico_mobile/app/core/ui/helpers/size_extensions.dart';
import 'package:academico_mobile/app/core/ui/widgets/label_subtitle.dart';
import 'package:academico_mobile/app/core/ui/widgets/my_appbar.dart';
import 'package:academico_mobile/app/pages/daily/daily_controller.dart';
import 'package:academico_mobile/app/pages/daily/daily_state.dart';
import 'package:academico_mobile/app/pages/daily/widgets/lista_card_disciplina.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DailyPage extends StatefulWidget {
  const DailyPage({super.key});

  @override
  State<DailyPage> createState() => _DailyPageState();
}

class _DailyPageState extends BaseState<DailyPage, DailyController> {
  
  @override
  void onReady() {
    super.onReady();
    controller.loadSemestre();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppbar(title: 'Meus Diários'),
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
              Padding(
                padding: EdgeInsets.only(left: context.percentWidth(0.03)),
                child: const LabelSubtitle(title: 'Disciplinas'),
              ),
              Expanded(
                  child: ListView.builder(
                itemCount: state.semestres.length,
                itemBuilder: (context, index) {
                  final semestre = state.semestres[index].disciplinas;
                  return ListaCardDisciplina(disciplina: semestre[0]);
                },
              ))
            ],
          );
        },
      ),
    );
  }
}


// const Switcher(),
//           const SizedBox(height: 10),
//           Container(
//             padding: const EdgeInsets.all(10),
//             margin: const EdgeInsets.symmetric(horizontal: 10),
//             decoration: BoxDecoration(
//               color: ColorsApp.instance.labelblack2,
//               borderRadius: BorderRadius.circular(5),
//             ),
//             child: SizedBox(
//               height: 50,
//               child: ListView.builder(
//                 scrollDirection: Axis.horizontal,
//                 itemCount: nomeOpcoes.length,
//                 itemBuilder: (context, index) {
//                   return Padding(
//                     padding: const EdgeInsets.only(right: 10),
//                     child: LineSemester(
//                       nameDay: nomeOpcoes[index],
//                       isNow: index == 2 ? true : false,
//                     ),
//                   );
//                 },
//               ),
//             ),
//           ),