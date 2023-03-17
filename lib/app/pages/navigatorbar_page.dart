import 'package:academico_mobile/app/pages/home/home_page.dart';
import 'package:academico_mobile/app/pages/schedule/schedule_router.dart';
import 'package:flutter/material.dart';

class NavigatorbarPage extends StatefulWidget {
  const NavigatorbarPage({super.key});

  @override
  State<NavigatorbarPage> createState() => _NavigatorbarPageState();
}

class _NavigatorbarPageState extends State<NavigatorbarPage> {
  int paginaAtual = 0;
  late PageController _pageController;
  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: paginaAtual);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        children: [
          ScheduleRouter.page,
          HomePage()
        ],
      ),
    );
  }
}
