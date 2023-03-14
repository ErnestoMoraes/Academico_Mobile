import 'package:academico_mobile/app/core/ui/helpers/size_extensions.dart';
import 'package:academico_mobile/app/core/ui/styles/colors_app.dart';
import 'package:academico_mobile/app/core/ui/styles/text_styles.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    List<Map<String, String>> listaCards = [
      {
        'title': 'Calendário',
        'image': 'assets/images/logos/logo_ifce_preto.png',
        'route': '/schedule',
      },
      {
        'title': 'Notas',
        'image': 'assets/images/logos/logo_ifce_preto.png',
        'route': '/schedule',
      },
      {
        'title': 'Frequência',
        'image': 'assets/images/logos/logo_ifce_preto.png',
        'route': '/schedule',
      },
      {
        'title': 'Disciplinas',
        'image': 'assets/images/logos/logo_ifce_preto.png',
        'route': '/schedule',
      },
      {
        'title': 'Horários',
        'image': 'assets/images/logos/logo_ifce_preto.png',
        'route': '/schedule',
      },
      {
        'title': 'Histórico',
        'image': 'assets/images/logos/logo_ifce_preto.png',
        'route': '/schedule',
      },
      {
        'title': 'Sair',
        'image': 'assets/images/logos/logo_ifce_preto.png',
        'route': '/schedule',
      },
    ];
    return Scaffold(
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: context.screenHeight * 0.03),
            Text(
              'Bem vindo ao Qacademico',
              style: TextStyles.instance.texLabelH4,
            ),
            Text(
              'Ernesto Moraes',
              style: TextStyles.instance.labelPage.copyWith(fontSize: 22),
            ),
          ],
        ),
        centerTitle: false,
        automaticallyImplyLeading: false,
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(height: context.percentHeight(.1)),
            Expanded(
              child: GridView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 30,
                  crossAxisSpacing: 30,
                ),
                itemCount: 6,
                itemBuilder: (context, index) {
                  return ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                          ColorsApp.instance.cardwhite),
                      shape: MaterialStateProperty.all(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                    ),
                    onPressed: () {
                      // Navigator.pushNamed(context, listaCards[index]['route']!);
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            listaCards[index]['image']!,
                            fit: BoxFit.cover,
                            height: context.screenHeight * 0.2,
                          ),
                          SizedBox(height: context.screenHeight * 0.05),
                          Text(
                            listaCards[index]['title']!,
                            style: TextStyles.instance.texLabelH4.copyWith(
                                color: ColorsApp.instance.background,
                                fontWeight: TextStyles
                                    .instance.textExtraBold.fontWeight),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
