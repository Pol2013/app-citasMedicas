import 'dart:convert';

import 'package:app_citas/models/symptom_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class TriajeOnePage extends StatefulWidget {
  @override
  _TriajeOnePageState createState() => _TriajeOnePageState();
}

class _TriajeOnePageState extends State<TriajeOnePage> {
  bool selected = false;
  var userStatus = List<bool>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Triage'),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
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
              Text('Marque la casilla si presenta los sintomas indicados'),
              SizedBox(
                height: 20.0,
              ),
              _body(context),
              ButtonTheme(
                minWidth: 400.0,
                child: RaisedButton(
                  textColor: Colors.white,
                  color: Colors.blue,
                  child: Text("Ver resultado"),
                  onPressed: () {
                    Navigator.pushNamed(context, 'triaje_result');
                  },
                  shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(30.0),
                  ),
                ),
              ),
            ],
          ),
        ));
  }

  Widget _body(BuildContext context) {
    return FutureBuilder(
        future: _getTriage(),
        builder:
            (BuildContext context, AsyncSnapshot<List<SymptomModel>> snapshot) {
          if (snapshot.data == null || snapshot.data == []) {
            return Container(child: Center(child: Text("Cargando...")));
          } else {
            return ListView.builder(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemCount: snapshot.data.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  leading: Checkbox(
                      value: userStatus[index],
                      onChanged: (bool val) {
                        setState(() {
                          userStatus[index] = !userStatus[index];
                        });
                      }),
                  title: Text(snapshot.data[index].descripcion),
                );
              },
            );
          }
        });
  }

  Future<List<SymptomModel>> _getTriage() async {
    var response = await http.get("http://10.0.2.2:8000/api/symptom");

    var jsonData = json.decode(response.body);

    List<SymptomModel> sysmptoms = [];

    for (var u in jsonData["obj"]) {
      SymptomModel user = SymptomModel.fromJson(u);

      sysmptoms.add(user);
      userStatus.add(false);
    }

    return sysmptoms;
  }
}
