import 'package:academico_mobile/app/core/secure_storage/secure_storage.dart';
import 'package:academico_mobile/app/core/ui/base_state/base_state.dart';
import 'package:academico_mobile/app/core/ui/helpers/size_extensions.dart';
import 'package:academico_mobile/app/core/ui/styles/colors_app.dart';
import 'package:academico_mobile/app/core/ui/widgets/my_appbar.dart';
import 'package:academico_mobile/app/pages/home/home_controller.dart';
import 'package:academico_mobile/app/pages/home/home_state.dart';
import 'package:academico_mobile/app/pages/home/widgets/card_home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends BaseState<HomePage, HomeController> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final SecureStorage _secureStorage = SecureStorage();
  final prefs = SharedPreferences.getInstance();

  @override
  void onReady() {
    super.onReady();
    controller.loadHomePage();
  }

  void openDrawer() {
    _scaffoldKey.currentState?.openDrawer();
  }

  Widget buildDrawer(BuildContext context) => Drawer(
        backgroundColor: context.colorsApp.background,
        child: Column(
          children: [
            buildHeaderDrawer(context),
            Divider(color: Colors.grey[300], height: 1),
            Expanded(
              child: buildMenuItems(context),
            ),
            finishDrawer(context),
          ],
        ),
      );

  Widget finishDrawer(BuildContext context) => InkWell(
        onTap: () async {
          prefs.then((value) => value.clear());
          await controller.logout();
        },
        child: Container(
          padding: EdgeInsets.only(
            bottom: context.percentWidth(.03),
          ),
          alignment: Alignment.bottomCenter,
          child: Container(
            margin: EdgeInsets.symmetric(
              horizontal: context.percentWidth(.05),
            ),
            padding: EdgeInsets.symmetric(
              horizontal: context.percentWidth(.05),
              vertical: context.percentWidth(.03),
            ),
            decoration: BoxDecoration(
              color: Colors.redAccent,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Icon(
                  Icons.logout,
                  color: Colors.white,
                ),
                SizedBox(width: 30),
                Text(
                  'Sair',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ),
      );

  Widget buildHeaderDrawer(BuildContext context) => Container(
        color: context.colorsApp.background,
        padding: EdgeInsets.only(
            top: 24 + MediaQuery.of(context).padding.top, bottom: 24),
        child: Column(
          children: const [
            CircleAvatar(
              radius: 50,
              backgroundImage:
                  AssetImage('assets/images/images_cards/student.png'),
            ),
            SizedBox(height: 10),
            Text(
              'Academico Mobile',
              style: TextStyle(fontSize: 20, color: Colors.white),
            ),
            SizedBox(height: 4),
            Text(
              'Nome do Aluno IFCE',
              style: TextStyle(
                fontSize: 15,
                color: Colors.white70,
              ),
            ),
          ],
        ),
      );

  Widget buildMenuItems(BuildContext context) => ListView(
        shrinkWrap: true,
        children: [
          ListTile(
            title: const Text(
              'Sobre',
              style: TextStyle(
                fontSize: 20,
                color: Colors.grey,
              ),
            ),
            leading: const Icon(
              Icons.info_outline_rounded,
              size: 30,
              color: Colors.grey,
            ),
            onTap: () => Navigator.of(context).pushNamed('/about'),
          ),
          // ListTile(
          //   title: const Text(
          //     'Contato',
          //     style: TextStyle(
          //       fontSize: 20,
          //       color: Colors.grey,
          //     ),
          //   ),
          //   leading: const Icon(
          //     Icons.comment_sharp,
          //     size: 30,
          //     color: Colors.grey,
          //   ),
          //   onTap: () => Navigator.of(context).pop(),
          // ),
        ],
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: MyAppbar.home(
        title: 'Academico Mobile',
        onPressed: () {
          openDrawer();
        },
      ),
      drawer: Drawer(
        backgroundColor: context.colorsApp.background,
        child: buildDrawer(context),
      ),
      body: BlocConsumer<HomeController, HomeState>(
        listener: (context, state) {
          state.status.matchAny(
            any: () => hideLoader(),
            loading: () => showLoader(),
            error: () {
              hideLoader();
              showError(state.errorMessage ?? 'Error ao carregar Home Page');
            },
            deslogado: () {
              hideLoader();
              _secureStorage.deleteAll();
              Navigator.of(context).pushReplacementNamed('/login');
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
              SizedBox(
                height: context.percentHeight(.02),
              ),
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
