// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:academico_mobile/app/models/my_schedule/schedule_model.dart';

class HourarioDtio {
  final List<Horario> horarios;
  final int index;
  HourarioDtio(this.index, {
    required this.horarios,
  });

  List<HorarioDetalhado> get totalHorarios => horarios[index].horarios;
}
