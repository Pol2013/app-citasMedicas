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
          bottomNavigationBar: new TabBar(
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
          ),
          drawer: Drawer(
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
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => FrequentQuestionsPage(),
                    ),
                  );
                },
              ),
              ListTile(
                title: Text('Foros'),
                onTap: () {
                  // Update the state of the app.
                  // ...
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
          )),
    );
  }
}
