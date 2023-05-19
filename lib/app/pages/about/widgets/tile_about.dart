import 'package:academico_mobile/app/core/ui/helpers/size_extensions.dart';
import 'package:academico_mobile/app/core/ui/styles/colors_app.dart';
import 'package:academico_mobile/app/core/ui/styles/text_styles.dart';
import 'package:flutter/material.dart';

class TileAbout extends StatefulWidget {
  final String text;

  const TileAbout({Key? key, required this.text}) : super(key: key);

  @override
  State<TileAbout> createState() => _TileAboutState();
}

class _TileAboutState extends State<TileAbout> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          widget.text,
          textAlign: TextAlign.justify,
          style: context.textStyles.texLabelH4.copyWith(
            color: context.colorsApp.cardwhite,
          ),
        ),
        SizedBox(height: context.percentHeight(.03)),
      ],
    );
  }
}
