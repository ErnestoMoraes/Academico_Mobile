import 'package:academico_mobile/app/core/ui/helpers/size_extensions.dart';
import 'package:academico_mobile/app/core/ui/styles/text_styles.dart';
import 'package:flutter/material.dart';

class LabelSubtitle extends StatelessWidget {
  final String title;
  const LabelSubtitle({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: EdgeInsets.only(bottom: context.percentWidth(0.03)),
          child: Text(title, style: TextStyles.instance.labelPage),
        ),
      ],
    );
  }
}
