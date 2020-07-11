import 'package:flutter/material.dart';

class DashBoardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
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
              Padding(
                padding: const EdgeInsets.all(32.0),
                child: Column(
                  children: <Widget>[
                    FlutterLogo(
                      size: 50.0,
                    ),
                    SizedBox(height: 50.0),
                    Text(
                      'Triaje',
                      style: TextStyle(
                        color: Colors.blueAccent,
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 80.0),
                    Text(
                        'Lorem ipsum dolor sit amet, consectetur adipiscing imperdiet'),
                    SizedBox(
                      height: 20.0,
                    ),
                    ButtonTheme(
                      minWidth: 400.0,
                      child: RaisedButton(
                        textColor: Colors.white,
                        color: Colors.blue,
                        child: Text("Iniciar Triaje"),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => DashBoardPage()),
                          );
                        },
                        shape: new RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(30.0),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                child: Center(
                  child: Text('Cita'),
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
                  // Update the state of the app.
                  // ...
                },
              ),
              ListTile(
                title: Text('Foros'),
                onTap: () {
                  // Update the state of the app.
                  // ...
                },
              ),
            ]),
          )),
    );
  }
}
