import 'package:flutter/material.dart';

class CitaPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(32.0),
      child: ListView(
        
        children:<Widget>[
          Text('Generar cita',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.blueAccent,
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
          ),
          ),
          SizedBox(height: 20.0),
          _especialidadItem(),
          SizedBox(height: 10.0),
          _motivoItem(),
          SizedBox(height: 50.0),
          _generarCita(context),
          
        ]
      ),
    );
  }
  Widget _especialidadItem(){
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: Colors.white,
        boxShadow: <BoxShadow>[ 
          BoxShadow(
            color: Colors.black26,
            blurRadius: 10.0,
            spreadRadius: 2.0,
            offset: Offset(2.0, 10.0),
          )
        ]
      ),
      child: ExpansionTile(
          title: Text('        ESPECIALIDAD',
          style: TextStyle(
            color: Colors.grey,
            fontSize: 15.0,
          ),
          textAlign: TextAlign.center,
          ),
          children: <Widget>[
            _cardEspecialidad(),
            _cardEspecialidad(),
            _cardEspecialidad(),
          ],
        ),
      );
  }

  Widget _motivoItem(){
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: Colors.white,
        boxShadow: <BoxShadow>[ 
          BoxShadow(
            color: Colors.black26,
            blurRadius: 10.0,
            spreadRadius: 2.0,
            offset: Offset(2.0, 10.0),
          )
        ]
      ),
      child: ExpansionTile(
          title: Text('       MOTIVO',
          style: TextStyle(
            color: Colors.grey,
            fontSize: 15.0,
          ),
          textAlign: TextAlign.center,
          ),
          children: <Widget>[
            Container(
              child: ListTile(
                title: Text('',
                textAlign: TextAlign.center,
                ),
              ),
            ),
          ],
        ),
      );
  }
  Widget _generarCita(BuildContext context){
    return ButtonTheme(
      minWidth: 50.0,
      child: RaisedButton(
        textColor: Colors.white,
        color: Colors.blue,
        child: Text('GENERAR'),
        onPressed: () {
          Navigator.pushNamed(context, 'cita_resumen');
        },
        shape: new RoundedRectangleBorder(
          borderRadius: new BorderRadius.circular(30.0),
        ),
      ),
    );
  }
  Widget _cardEspecialidad(){
    return Container(
      padding: EdgeInsets.symmetric(vertical:10.0, horizontal: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.max,
        children: [
          Container(
            height: 50.0,
            decoration: BoxDecoration(
              color:Colors.blueAccent,
              borderRadius: BorderRadius.circular(50.0),
            ),
            child:  Icon(Icons.accessibility,size:50.0, color: Colors.white),
          ),
          Container(
            child: Column(
              children: [
                Text('Especialidad X'),
                Text('Sub Area'),
              ],
            ),
          ),
          FlatButton(
            child: Icon(Icons.search,size:50.0, color: Colors.grey),
            onPressed: (){},
          ),
        ],
      ),
    );
  }

}