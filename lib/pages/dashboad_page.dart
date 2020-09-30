import 'package:app_citas/pages/forum_page.dart';
import 'package:app_citas/pages/frequent_questions_page.dart';
import 'package:app_citas/pages/triaje_page.dart';
import 'package:app_citas/utils/user_preferences.dart';
import 'package:flutter/material.dart';

class DashBoardPage extends StatelessWidget {
  final prefs = new UserPreferences();

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
          appBar: AppBar(
            title: Text('Aspat'),
          ),
          body: TabBarView(
            children: [
              Container(
                child: Center(
                  child: Text('Inicio'),
                ),
              ),
              TriajePage(),
              Container(
                child: Center(
                  child: Text('Cita'),
                ),
              ),
              Container(
                child: Center(
                  child: Text('Historia'),
                ),
              )
            ],
          ),
          bottomNavigationBar: getBottomNavigationBar(),
          drawer: getDrawer(context)),
    );
  }

  Drawer getDrawer(BuildContext context) {
    return Drawer(
      child: ListView(padding: EdgeInsets.zero, children: <Widget>[
        DrawerHeader(
          child: Text(
            'Drawer Header',
            style: TextStyle(color: Colors.white),
          ),
          decoration: BoxDecoration(
            color: Colors.blue,
          ),
        ),
        ListTile(
          title: Text('Citas'),
          onTap: () {
            // Update the state of the app.
            // ...
          },
        ),
        ListTile(
          title: Text('Pregunta Frecuentes'),
          onTap: () {
            Navigator.pushNamed(context, 'frequent_question');
          },
        ),
        ListTile(
          title: Text('Foro'),
          onTap: () {
            Navigator.pop(context);
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ForumPage(),
              ),
            );
          },
        ),
        ListTile(
          title: Text('Cerrar sesión'),
          onTap: () {
            prefs.token = '';
            Navigator.pushReplacementNamed(context, 'login');
          },
        ),
      ]),
    );
  }

  TabBar getBottomNavigationBar() {
    return new TabBar(
      tabs: [
        Tab(
          icon: Icon(Icons.home),
          text: 'Inicio',
        ),
        Tab(
          icon: new Icon(Icons.touch_app),
          text: 'Triaje',
        ),
        Tab(
          icon: new Icon(Icons.add_box),
          text: 'Cita',
        ),
        Tab(
          icon: new Icon(Icons.history),
          text: 'Historia',
        )
      ],
      labelColor: Colors.blue,
      unselectedLabelColor: Colors.lightBlue,
    );
  }
}
