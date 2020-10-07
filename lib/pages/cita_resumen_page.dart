import 'package:flutter/material.dart';

class CitaResumenPage extends StatefulWidget {
  @override
  _CitaResumenPageState createState() => _CitaResumenPageState();
}

class _CitaResumenPageState extends State<CitaResumenPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
          child: Padding(
          padding: EdgeInsets.symmetric(vertical: 30.0,horizontal: 10.0),
          child: ListView(
            children: [
              Text('Resumen de la cita',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.blueAccent,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 40.0),
              Text('Se ha registrado su cita con exito,',
                textAlign: TextAlign.center,),
              Text('gracias por confiar en nosotros',
                textAlign: TextAlign.center,),
              SizedBox(height: 40.0),
              _cardResumen(),
              SizedBox(height: 60.0),
              _imagenPerfil(),
            ],
          ),
        ),
        ),
        floatingActionButton: FlatButton(
          onPressed: (){
          Navigator.pushNamed(context, 'dashboard');
          }, 
          child: Icon(Icons.arrow_back_ios),
          ),
    );
  }

  Widget _cardResumen(){
    return Container(
      alignment: Alignment.centerLeft,
      margin: EdgeInsets.symmetric(horizontal:30.0),
      padding: EdgeInsets.symmetric(vertical:10.0, horizontal:10.0),
      color: Colors.grey,
      child: Column(
        children:<Widget>[
          Text('Medico :'),
          SizedBox(height: 10.0,),
          Text('Fecha :'),
          SizedBox(height: 10.0,),
          Text('Cita :'),
        ]
      ),
    );
  }
  Widget _imagenPerfil(){
    return Container(
      margin:EdgeInsets.symmetric(horizontal:120.0),
      height: 120.0,
      decoration: BoxDecoration(
        color:Colors.blueAccent,
        borderRadius: BorderRadius.circular(100.0),
      ),
      child:  Icon(Icons.photo,size:50.0, color: Colors.white),
    );
  }
}