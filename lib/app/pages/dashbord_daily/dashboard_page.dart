import 'package:academico_mobile/app/core/ui/helpers/size_extensions.dart';
import 'package:academico_mobile/app/core/ui/styles/colors_app.dart';
import 'package:academico_mobile/app/core/ui/styles/text_styles.dart';
import 'package:academico_mobile/app/models/daily_model.dart';
import 'package:academico_mobile/app/pages/dashbord_daily/widgets/card_aulas_futuras.dart';
import 'package:academico_mobile/app/pages/dashbord_daily/widgets/card_horario.dart';
import 'package:academico_mobile/app/pages/dashbord_daily/widgets/line_dashboard.dart';
import 'package:academico_mobile/app/pages/dashbord_daily/widgets/line_notas.dart';
import 'package:flutter/material.dart';

class DashboardPage extends StatefulWidget {
  final DisciplinaModel disciplina;
  const DashboardPage({
    super.key,
    required this.disciplina,
  });

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.disciplina.nome),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: context.percentWidth(0.045)),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    widget.disciplina.id.toString(),
                    style: TextStyles.instance.texLabelH4.copyWith(
                      color: ColorsApp.instance.cardwhite,
                      fontWeight: TextStyles.instance.textRegular.fontWeight,
                      fontSize: context.percentWidth(0.04),
                    ),
                  ),
                ],
              ),
              SizedBox(height: context.percentHeight(0.03)),
              Row(
                children: [
                  Text(
                    'Resumo',
                    style: TextStyles.instance.texLabelH4.copyWith(
                      color: ColorsApp.instance.cardwhite,
                      fontWeight: TextStyles.instance.textSemiBold.fontWeight,
                      fontSize: context.percentWidth(0.05),
                    ),
                  ),
                ],
              ),
              Divider(
                color: ColorsApp.instance.cardnoselected,
                thickness: 1,
              ),
              SizedBox(height: context.screenHeight * 0.01),
              CardHorario(
                label: 'Carga Horária Total',
                value: '${widget.disciplina.resumo.cargaHoraria}H',
              ),
              Row(
                children: [
                  Text(
                    'Existem 6 aulas planejadas a mais que as necessárias.',
                    style: TextStyles.instance.texLabelH5.copyWith(
                      color: ColorsApp.instance.cardgrey,
                      fontWeight: TextStyles.instance.textSemiBold.fontWeight,
                    ),
                  ),
                ],
              ),
              SizedBox(height: context.screenHeight * 0.01),
              CardHorario(
                label: 'Você ainda pode ter',
                value: '${widget.disciplina.resumo.faltas} falta(s)',
                color: ColorsApp.instance.cardred,
              ),
              CardFaltasFuturas(
                label: 'Horas aula futuras',
                value: '${widget.disciplina.resumo.aulasFuturas[0]}H',
                percent: '${widget.disciplina.resumo.aulasFuturas[1]}%',
              ),
              SizedBox(height: context.screenHeight * 0.02),
              Row(
                children: [
                  Text(
                    'Contabilidade',
                    style: TextStyles.instance.texLabelH4.copyWith(
                      color: ColorsApp.instance.cardwhite,
                      fontWeight: TextStyles.instance.textSemiBold.fontWeight,
                      fontSize: context.percentWidth(0.05),
                    ),
                  ),
                ],
              ),
              Divider(
                color: ColorsApp.instance.cardnoselected,
                thickness: 1,
              ),
              LineDashboard(
                label: 'Presenças',
                value: widget.disciplina.resumo.presencas[0],
                percent: widget.disciplina.resumo.presencas[1],
              ),
              LineDashboard(
                label: 'Ausências',
                value: widget.disciplina.resumo.ausencias[0],
                percent: widget.disciplina.resumo.ausencias[1],
              ),
              LineDashboard(
                label: 'Pendentes',
                value: widget.disciplina.resumo.pendentes[0],
                percent: widget.disciplina.resumo.pendentes[1],
              ),
              SizedBox(height: context.screenHeight * 0.02),
              Row(
                children: [
                  Text(
                    'Avaliações',
                    style: TextStyles.instance.texLabelH4.copyWith(
                      color: ColorsApp.instance.cardwhite,
                      fontWeight: TextStyles.instance.textSemiBold.fontWeight,
                      fontSize: context.percentWidth(0.05),
                    ),
                  ),
                ],
              ),
              Divider(
                color: ColorsApp.instance.cardnoselected,
                thickness: 1,
              ),
              LineNotas(label: 'N1', value: 7.0.toString()),
              LineNotas(label: 'N2', value: 7.0.toString()),
              LineNotas(label: 'Media Parcial', value: 7.0.toString()),
              LineNotas(label: 'Prova Final', value: 7.0.toString()),
            ],
          ),
        ),
      ),
    );
  }
}
