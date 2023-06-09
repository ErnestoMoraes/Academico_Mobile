import 'package:academico_mobile/app/core/ui/helpers/size_extensions.dart';
import 'package:academico_mobile/app/core/ui/styles/colors_app.dart';
import 'package:academico_mobile/app/core/ui/styles/text_styles.dart';
import 'package:academico_mobile/app/core/ui/widgets/my_appbar.dart';
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
      appBar: MyAppbar(
          title: widget.disciplina.nome,
          onPressed: () => Navigator.pop(context)),
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
              CardHorario(
                label: 'Você ainda pode ter',
                value: '${widget.disciplina.resumo.faltas} falta(s)',
                color: ColorsApp.instance.cardred,
              ),
              CardFaltasFuturas(
                label: 'Horas aula futuras',
                value: '${widget.disciplina.resumo.aulasFuturas}H',
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
                color: ColorsApp.instance.background,
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
                color: ColorsApp.instance.background,
                thickness: 1,
              ),
              LineNotas(
                  label: 'N1',
                  value: widget.disciplina.avaliacoes[0].toString() == ''
                      ? ' '
                      : widget.disciplina.avaliacoes[0].toString()),
              LineNotas(
                  label: 'N2',
                  value: widget.disciplina.avaliacoes[1].toString() == ''
                      ? ' '
                      : widget.disciplina.avaliacoes[1].toString()),
              LineNotas(
                  label: 'Média Parcial',
                  value: widget.disciplina.avaliacoes[2].toString() == ''
                      ? ' '
                      : widget.disciplina.avaliacoes[2].toString()),
              LineNotas(
                  label: 'Prova Final',
                  value: widget.disciplina.avaliacoes[3].toString() == ''
                      ? ' '
                      : widget.disciplina.avaliacoes[3].toString()),
              LineNotas(
                  label: 'Média Final',
                  value: widget.disciplina.avaliacoes[4].toString() == ''
                      ? ' '
                      : widget.disciplina.avaliacoes[4].toString()),
            ],
          ),
        ),
      ),
    );
  }
}
