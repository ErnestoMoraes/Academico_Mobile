import 'package:academico_mobile/app/core/ui/helpers/size_extensions.dart';
import 'package:academico_mobile/app/core/ui/styles/colors_app.dart';
import 'package:academico_mobile/app/core/ui/styles/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:academico_mobile/app/models/home_model.dart';

class CardHome extends StatelessWidget {
  final HomePageModel listaCards;

  const CardHome({
    Key? key,
    required this.listaCards,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor:
              MaterialStateProperty.all(ColorsApp.instance.primary),
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
              Image.asset(
                listaCards.image,
                height: context.percentWidth(.15),
                fit: BoxFit.cover,
              ),
              SizedBox(
                height: context.screenWidth * 0.035,
              ),
              Text(
                listaCards.name,
                style: TextStyles.instance.texLabelH4.copyWith(
                  fontSize: context.screenWidth * 0.045,
                  color: ColorsApp.instance.cardwhite,
                  fontWeight: TextStyles.instance.textSemiBold.fontWeight,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
