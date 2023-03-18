import 'package:academico_mobile/app/core/ui/styles/colors_app.dart';
import 'package:academico_mobile/app/core/ui/styles/text_styles.dart';
import 'package:flutter/material.dart';

import 'package:academico_mobile/app/models/home_model.dart';
import 'package:loading_gifs/loading_gifs.dart';

class CardHome extends StatelessWidget {
  final HomePageModel listaCards;

  const CardHome({
    Key? key,
    required this.listaCards,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        backgroundColor:
            MaterialStateProperty.all(ColorsApp.instance.cardwhite),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          ),
        ),
      ),
      onPressed: () => Navigator.pushNamed(context, listaCards.url),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: 
              FadeInImage.assetNetwork(
                placeholder: cupertinoActivityIndicator,
                image: listaCards.image,
                height: 100,
                width: 110,
                fit: BoxFit.cover,
              ),
            ),
            Text(
              listaCards.name,
              style: TextStyles.instance.texLabelH4.copyWith(
                color: ColorsApp.instance.background,
                fontWeight: TextStyles.instance.textSemiBold.fontWeight,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
