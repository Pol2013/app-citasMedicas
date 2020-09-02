import 'package:app_citas/blocs/forum_bloc.dart';
import 'package:app_citas/blocs/provider.dart';
import 'package:app_citas/pages/forum_page.dart';
import 'package:flutter/material.dart';

class AddquestionPage extends StatefulWidget {
  @override
  _AddquestionPageState createState() => _AddquestionPageState();
}

class _AddquestionPageState extends State<AddquestionPage> {
  TextEditingController _textController= TextEditingController();
  List<String> _questions=List();

  String _quest='';

  @override

  Widget build(BuildContext context) {
    final bloc = Provider.add(context);
    return Scaffold(
      body:SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal:20.0,vertical: 10.0),
            child: Column(
              children: <Widget>[
                SizedBox(height: 5.0,),
                Text('Añadir Pregunta',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Color(0xFF1F6280),
                  ),
                ),
                SizedBox(height: 20.0,),
                _builTextField(),
                SizedBox(height: 20.0,),
                _buttonAdd(bloc),
                SizedBox(height: 10.0,),
                _buttonBehind()
              ],
            ),
          ),
        ),
      ),      
    );
  }
  Widget _builTextField(){
    
    return TextField(
          controller: _textController,
          maxLines: 6,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(vertical:10.0, horizontal: 10.0),
            labelText: 'Nueva pregunta...',
            counterText: '${_quest.length}/30',
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15.0),
              borderSide: BorderSide(
                color:Color(0xFF319DCC),
              ),
            ),
          ),
          onChanged: (value){
            _quest=value;
          },
        );
  }
  Widget _buttonAdd(ForumBloc bloc){

    return ButtonTheme(
      minWidth: 400.0,
      child: RaisedButton(
        textColor: Colors.white,
        color: Colors.blue,
        child: Text("Agregar"),
        onPressed: () {
          _questions.add(_quest);
          bloc.changeQuestions(_questions);
          //print(bloc.question);
          _textController.clear();
        },
        shape: new RoundedRectangleBorder(
          borderRadius: new BorderRadius.circular(30.0),
        ),
      ),
    );
  }

  Widget _buttonBehind(){
    return ButtonTheme(
      minWidth: 400.0,
      child: RaisedButton(
        textColor: Colors.white,
        color: Colors.blue,
        child: Text("Regresar"),
        onPressed: () {
          Navigator.pop(context);
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ForumPage(),
            ),
          );
        },
        shape: new RoundedRectangleBorder(
          borderRadius: new BorderRadius.circular(30.0),
        ),
      ),
    );
  }
}