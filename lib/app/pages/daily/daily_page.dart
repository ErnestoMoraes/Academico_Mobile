import 'package:academico_mobile/app/pages/daily/widgets/line_semester.dart';
import 'package:academico_mobile/app/pages/daily/widgets/switcher.dart';
import 'package:flutter/material.dart';

import '../../core/ui/styles/colors_app.dart';
import '../../core/ui/styles/text_styles.dart';

class DailyPage extends StatefulWidget {
  const DailyPage({super.key});

  @override
  State<DailyPage> createState() => _DailyPageState();
}

class _DailyPageState extends State<DailyPage> {
  List<String> nomeOpcoes = [];
  @override
  void initState() {
    nomeOpcoes = [
      '2022.2',
      '2022.1',
      '2021.2',
      '2021.1',
      '2020.2',
    ];
    super.initState();
  }

  String opcaoSelecionada = '2022.2';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Meus Diários',
          style: TextStyles.instance.labelPage,
        ),
        automaticallyImplyLeading: false,
      ),
      body: Column(
        children: [
          const Switcher(),
          const SizedBox(height: 10),
          Container(
            padding: const EdgeInsets.all(10),
            margin: const EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
              color: ColorsApp.instance.labelblack2,
              borderRadius: BorderRadius.circular(5),
            ),
            child: SizedBox(
              height: 50,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: nomeOpcoes.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: LineSemester(
                      nameDay: nomeOpcoes[index],
                      isNow: index == 2 ? true : false,
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
