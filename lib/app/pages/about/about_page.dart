import 'package:academico_mobile/app/core/ui/helpers/size_extensions.dart';
import 'package:academico_mobile/app/core/ui/styles/colors_app.dart';
import 'package:academico_mobile/app/core/ui/styles/text_styles.dart';
import 'package:academico_mobile/app/pages/about/widgets/tile_about.dart';
import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1C1C1C),
      appBar: AppBar(
        backgroundColor: const Color(0xFF1C1C1C),
        elevation: 0,
        title: Text(
          'Sobre',
          style: context.textStyles.texLabelH1.copyWith(
            color: context.colorsApp.cardwhite,
            fontSize: context.percentHeight(.03),
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Container(
            color: const Color(0xFF1C1C1C),
            width: double.infinity,
            child: Column(
              children: [
                Image.asset(
                  'assets/images/logos/logo_academico.png',
                 width: context.percentWidth(.6),
                ),
                Text(
                  'Acadêmico Mobile',
                  style: context.textStyles.texLabelH1.copyWith(
                    color: context.colorsApp.cardwhite,
                    fontSize: context.percentHeight(.025),
                  ),
                ),
                SizedBox(height: context.percentHeight(.01)),
                Text('Versão 1.0.0',
                    style: context.textStyles.texLabelH4.copyWith(
                      color: context.colorsApp.cardwhite,
                      fontSize: context.percentHeight(.015),
                    ),),
              ],
            ),
          ),
          SizedBox(height: context.percentHeight(.05)),
          Expanded(
            child: SingleChildScrollView(
              padding:
                  EdgeInsets.symmetric(horizontal: context.percentWidth(.08)),
              child: Column(
                children: const [
                  TileAbout(
                    text:
                        'Descrição do aplicativo: Forneça uma breve descrição do aplicativo, explicando sua finalidade e recursos principais.',
                  ),
                  TileAbout(
                    text:
                        'Desenvolvedores ou equipe: Liste os nomes ou informações sobre a equipe de desenvolvimento do aplicativo.',
                  ),
                  TileAbout(
                    text:
                        'Informações de contato: Se desejar, forneça informações de contato, como um endereço de e-mail ou site, para que os usuários possam entrar em contato com a equipe de suporte ou fornecer feedback.',
                  ),
                  TileAbout(
                    text:
                        'Licenças e créditos: Se o seu aplicativo usar bibliotecas de terceiros ou recursos de código aberto, mencione as licenças relevantes e dê crédito aos autores originais.',
                  ),
                  TileAbout(
                    text:
                        'Outras informações: Dependendo do aplicativo, você pode incluir outras informações relevantes, como links para perfis de mídia social, link para avaliação do aplicativo na loja, etc.',
                  ),
                ],
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.all(context.percentHeight(.03)),
            alignment: Alignment.center,
            child: Text(
              'Obrigado',
              style: TextStyle(
                color: context.colorsApp.cardwhite,
                fontSize: context.percentHeight(.02),
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
