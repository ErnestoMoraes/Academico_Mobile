import 'package:academico_mobile/app/pages/daily/widgets/list_semester.dart';
import 'package:academico_mobile/app/pages/daily/widgets/switcher.dart';
import 'package:flutter/material.dart';

import '../../core/ui/styles/text_styles.dart';

class DailyPage extends StatelessWidget {
  const DailyPage({super.key});

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
        children: const [
          Switcher(),
          SizedBox(height: 10),
          Visibility(
            visible: true,
            child: ListSemester(),
          ),
        ],
      ),
    );
  }
}
