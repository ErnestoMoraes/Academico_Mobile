import 'package:academico_mobile/app/core/ui/base_state/base_state.dart';
import 'package:academico_mobile/app/core/ui/helpers/size_extensions.dart';
import 'package:academico_mobile/app/core/ui/widgets/my_appbar.dart';
import 'package:academico_mobile/app/pages/home/home_controller.dart';
import 'package:academico_mobile/app/pages/home/home_state.dart';
import 'package:academico_mobile/app/pages/home/widgets/card_home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends BaseState<HomePage, HomeController> {
  @override
  void onReady() {
    super.onReady();
    controller.loadHomePage();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppbar(title: 'Academico Mobile'),
      body: BlocConsumer<HomeController, HomeState>(
        listener: (context, state) {
          state.status.matchAny(
            any: () => hideLoader(),
            loading: () => showLoader(),
            error: () {
              hideLoader();
              showError(state.errorMessage ?? 'Error ao carregar Home Page');
            },
          );
        },
        buildWhen: (previous, current) => current.status.matchAny(
          any: () => false,
          initial: () => true,
          loaded: () => true,
        ),
        builder: (context, state) {
          return Column(
            children: [
              Expanded(
                child: GridView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: context.percentHeight(.03),
                    crossAxisSpacing: context.percentHeight(.03),
                  ),
                  itemCount: state.homePage.length,
                  itemBuilder: (context, index) {
                    final listaCards = state.homePage[index];
                    return CardHome(
                      listaCards: listaCards,
                    );
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
