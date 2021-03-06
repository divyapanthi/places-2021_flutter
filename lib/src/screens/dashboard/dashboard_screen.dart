import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:placess_2021/src/core/base_widget.dart';
import 'package:placess_2021/src/screens/dashboard/explore_screen.dart';
import 'package:placess_2021/src/screens/dashboard/favorite_screen.dart';
import 'package:placess_2021/src/screens/dashboard/profile_screen.dart';
import 'package:placess_2021/src/viewmodels/dashboard/dashboard_view_model.dart';
import 'package:placess_2021/src/widgets/shared/app_colors.dart';
import 'package:provider/provider.dart';

class DashboardScreen extends StatelessWidget {
  static const screens = [ExploreScreen(), FavoriteScreen(), ProfileScreen()];
  final GlobalKey<ScaffoldState> _scaffoldKey =GlobalKey();

  @override
  Widget build(BuildContext context) {
    return BaseWidget<DashboardViewModel>(
      model: DashboardViewModel(
        service: Provider.of(context)
      ),
      builder: (context, DashboardViewModel model, Widget? child) {
        return Scaffold(
          key: _scaffoldKey,
          appBar: buildAppBar(model,context),
          body: _buildBody(model),
          bottomNavigationBar: _buildBottomNavigation(context, model),
          drawer: _buildNavigationDrawer(model, context),
        );
      }
    );
  }

  AppBar buildAppBar(DashboardViewModel model, BuildContext context) {
    return AppBar(
          title: Text(model.getAppbarTitle(), style:  TextStyle(color: blackColor87)),
          backgroundColor: whiteColor ,
          leading: IconButton(
            icon: Icon(
                Icons.menu,
                    color: Colors.black87,
          ),onPressed: (){
            bool drawerOpen = _scaffoldKey.currentState!.isDrawerOpen;
            if(!drawerOpen){
              _scaffoldKey.currentState!.openDrawer();
            }
          },),
          actions: [
            IconButton(
              icon: Icon(
                Icons.add,
                size: 40,
                color: blackColor87,
              ),
              onPressed: () {},
            ),
            SizedBox(
              width: 16,
            )
          ],
        );
  }

  Widget _buildBody(DashboardViewModel model) {
    return screens[model.currentIndex];
  }

  Widget _buildBottomNavigation(BuildContext context, DashboardViewModel model) {
    return BottomNavigationBar(
      items: [
        BottomNavigationBarItem(icon: Icon(Icons.explore), label: "Explore"),
        BottomNavigationBarItem(icon: Icon(Icons.favorite_outlined), label: "Favorite"),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
      ],
      onTap: model.changeTab,
      currentIndex: model.currentIndex,
      showSelectedLabels: true,
      showUnselectedLabels: true,
      selectedIconTheme: IconThemeData(color: blackColor87),
      unselectedIconTheme: IconThemeData(color: blackColor54),
      selectedLabelStyle: TextStyle(fontSize: 18 ),
      unselectedLabelStyle: TextStyle(fontSize: 16),
      selectedItemColor: blackColor87,
      unselectedItemColor: blackColor54,
    );
  }

  Widget _buildNavigationDrawer(DashboardViewModel model, BuildContext context) {
    return Container(
      width: 220,
      color: whiteColor,
      child: Drawer(
        child: Column(
          children: [
            Container(
              color: blackColor54,
              height: 80,
            ),
            ListTile(
              title: Text("Explore"),
              trailing: Icon(Icons.explore),
              selected: model.currentIndex == 0,
              onTap:() {
                model.changeTab(0);
                Navigator.of(context).pop();
              }
            ),
            ListTile(
              title: Text("Favorite"),
              trailing: Icon(Icons.favorite_outlined),
              selected: model.currentIndex == 1,
                onTap:() {
                  model.changeTab(1);
                  Navigator.of(context).pop();
                }
            ),

            ListTile(
              title: Text("Profile"),
              trailing: Icon(Icons.person),
              selected: model.currentIndex == 2,
                onTap:() {
                  model.changeTab(2);
                  Navigator.of(context).pop();
                }
            ),

            ListTile(
              title: Text("About us"),
              trailing: Icon(Icons.info),
            ),

            ListTile(
              title: Text("Logout"),
              trailing: Icon(Icons.exit_to_app),
            ),
          ],
        ),
      ),
    );
  }
}
