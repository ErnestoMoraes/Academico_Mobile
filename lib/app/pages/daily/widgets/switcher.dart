import 'package:academico_mobile/app/core/ui/styles/colors_app.dart';
import 'package:flutter/material.dart';

class Switcher extends StatefulWidget {
  const Switcher({super.key});

  @override
  State<Switcher> createState() => _SwitcherState();
}

class _SwitcherState extends State<Switcher> {
  
  EdgeInsetsGeometry padding = const EdgeInsets.symmetric(
    horizontal: 15,
    vertical: 10,
  );
  Color _color1 = ColorsApp.instance.cardwhite;
  Color _color2 = ColorsApp.instance.labelblack2;

  void _changeColor() {
    setState(() {
      if (_color1 == ColorsApp.instance.labelblack2) {
        _color1 = ColorsApp.instance.cardwhite;
        _color2 = ColorsApp.instance.labelblack2;
      } else {
        _color1 = ColorsApp.instance.labelblack2;
        _color2 = ColorsApp.instance.cardwhite;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      margin: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        color: ColorsApp.instance.labelblack2,
        borderRadius: BorderRadius.circular(5),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            InkWell(
              onTap: () {
                _changeColor();
              },
              child: Container(
                padding: padding,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: _color1,
                ),
                child: Text(
                  'Diário atual',
                  style: TextStyle(
                    color: ColorsApp.instance.labelblack4,
                    fontSize: 18,
                  ),
                ),
              ),
            ),
            const SizedBox(width: 10),
            InkWell(
              onTap: () {
                _changeColor();
              },
              child: Container(
                padding: padding,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: _color2,
                ),
                child: Text(
                  'Diários anteriores',
                  style: TextStyle(
                    color: ColorsApp.instance.labelblack4,
                    fontSize: 18,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
