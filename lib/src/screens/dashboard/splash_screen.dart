import 'package:flutter/material.dart';
import 'package:placess_2021/src/core/base_widget.dart';
import 'package:placess_2021/src/screens/auth/login_screen.dart';
import 'package:placess_2021/src/screens/dashboard/dashboard_screen.dart';
import 'package:placess_2021/src/viewmodels/splash_view_model.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseWidget<SplashViewModel>(
      model: SplashViewModel(
        service: Provider.of(context)
      ),
      onModelReady: (model) => _onModelReady(model, context),
      builder: (context, SplashViewModel model, child) {
        return Scaffold(
          body: Container(
            // width: MediaQuery.of(context).size.width,
            // height: MediaQuery.of(context).size.height,

            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/splash_logo.jpg"),
                    fit: BoxFit.cover,
              )
            ),
          ),
        );
      }
    );
  }

  Future<void> _onModelReady(SplashViewModel model, BuildContext context) async {
    await model.initialize();
    bool isLoggedIn = model.isLoggedIn;

    //wait for 1500ms
    await Future.delayed(Duration(milliseconds: 1500));
    //navigate to login screen if isLoggedIn == false else navigate to Dashboard Screen

    Widget? screen;

    if(isLoggedIn){
      screen = DashboardScreen();

    }
    else{
      screen = LoginScreen();
    }

    Navigator.of(context)
      .pushReplacement(MaterialPageRoute(builder: (_) => screen!));

  }
}
