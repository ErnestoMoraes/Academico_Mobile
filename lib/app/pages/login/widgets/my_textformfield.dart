// import 'package:academico_mobile/app/core/ui/styles/colors_app.dart';
// import 'package:academico_mobile/app/core/ui/styles/text_styles.dart';
// import 'package:flutter/material.dart';

// class MyTextformfield extends StatefulWidget {
//   final TextEditingController controller;
//   final bool? obscureText;
//   const MyTextformfield({
//     super.key,
//     required this.controller,
//     this.obscureText,
//   });

//   @override
//   State<MyTextformfield> createState() => _MyTextformfieldState();
// }

// class _MyTextformfieldState extends State<MyTextformfield> {
//   @override
//   Widget build(BuildContext context) {
//     return TextFormField(
//       controller: controller,
//       obscureText: obscureText,
//       style: TextStyles.instance.texLabelH4.copyWith(
//         color: ColorsApp.instance.labelblack1,
//         fontSize: 20,
//         fontWeight: TextStyles.instance.textButtonLabel.fontWeight,
//       ),
//       decoration: InputDecoration(
//         hintText: 'senha',
//         suffixIcon: IconButton(
//           onPressed: () {
//             setState(() {
//               obscuredText = !obscuredText;
//             });
//           },
//           icon: Icon(_obscuredText ? Icons.visibility : Icons.visibility_off,
//               color: ColorsApp.instance.labelblack1, size: 25),
//         ),
//       ),
//     );
//   }
// }
