import 'dart:convert';
import 'package:academico_mobile/app/models/my_schedule/classhours_model.dart';

class WeekHoursModel {
  final int id;
  final String dia;
  final List<ClassHoursModel> classHour;

  WeekHoursModel(
      {required this.id, required this.dia, required this.classHour});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'dia': dia,
      'horarios': classHour.map((x) => x.toMap()).toList(),
    };
  }

  factory WeekHoursModel.fromMap(Map<String, dynamic> map) {
    return WeekHoursModel(
      id: map['id']?.toInt() ?? 0,
      dia: map['dia'] ?? '',
      classHour: List<ClassHoursModel>.from(
        map['horarios'].map<ClassHoursModel>(
          (classHoursModel) =>
              ClassHoursModel.fromMap(classHoursModel ?? <ClassHoursModel>{}),
        ),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory WeekHoursModel.fromJson(String source) =>
      WeekHoursModel.fromMap(json.decode(source));
}
