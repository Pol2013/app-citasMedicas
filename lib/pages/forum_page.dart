import 'package:app_citas/blocs/forum_bloc.dart';
import 'package:app_citas/blocs/provider.dart';
import 'package:app_citas/pages/addquestion_page.dart';
import 'package:flutter/material.dart';

class ForumPage extends StatefulWidget {
  @override
  _ForumPageState createState() => _ForumPageState();
}


class _ForumPageState extends State<ForumPage> {
  
  
  List<String> _questions = ['Se el primero en hacer tu pregunta...'];
  String reply='Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce et dui purus. Phasellus mollis, eros in pharetra tincidunt, ex lorem congue sapien, eget imperdiet lectus dolor fringilla sapien. Morbi semper urna fringilla, fringilla elit eu, euismod nibh. Nullam posuere elementum tortor at suscipit. Sed in libero congue, egestas dolor vitae, porttitor ante.';

  @override
  Widget build(BuildContext context) {
    final bloc = Provider.add(context);

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20.0,horizontal: 20.0),
        child: SafeArea(
          child: ListView(
              children: <Widget>[
                _header(),
                Column(
                  children:_listQuestions(bloc),
                ),
              ],
            )
          ),
        ),
      //),
      floatingActionButton: Align(  
        alignment: Alignment.bottomRight,
        child: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: (){
            Navigator.pop(context);
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => AddquestionPage(),
              ),
            );
          }
        ),
      ),
    );
  }
  Widget _header(){
    return Container(
      height: 150.0,
      padding: EdgeInsets.symmetric(vertical:5.0,horizontal: 10.0),
      child: Column(
        children: <Widget>[
          Text('Foro',
              style: TextStyle(
                fontSize: 20.0,color: Color(0xFF1F6280),
              ),
          ),
          SizedBox(height: 10.0),
          TextField(
            decoration: InputDecoration(
              contentPadding: EdgeInsets.all(10.0),
              labelText: 'Pregunta...',
              prefix: Icon(
                Icons.search,
                color:Color(0xFF319DCC),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15.0),
                borderSide: BorderSide(
                  color:Color(0xFF319DCC),
                ),
              ),
            ),
            onChanged: (value){
              //searchResults(value);
            },
          ),
          SizedBox(height: 10.0),
          RaisedButton(
              textColor: Colors.white,
              color: Colors.blue,
              child: Text("Buscar"),
              onPressed: () {
              },
              shape: new RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(30.0),
              ),
            ),
        ],
      ),
    );
  }

  List<Widget> _listQuestions(ForumBloc bloc){

    _loadData(bloc);
    int items=_questions.length;
    List<Widget> buildQuestions=List();
    for (var i = 0; i < items; i++) {
      buildQuestions.add(_itemQuestion(_questions[i],reply));
      buildQuestions.add(SizedBox(height: 20.0,));
    }
    print(_questions);
    return  buildQuestions;
  }
  void _loadData(ForumBloc bloc){
    
    List<String> lista =bloc.question;
    if(bloc.question!=null){
      lista.forEach((element) {
        _questions.add(element);
      });
    }
  }

  Widget _itemQuestion(String question,String reply){
    return  Container(
      color: Color(0xFF3DC5FF),
      child: Theme(
        data: ThemeData(accentColor: Colors.black87),
          child: ExpansionTile(
          title: Text(question,
          style: TextStyle(color:Colors.white)),
          children: <Widget>[
            Container(
              color: Color(0xFF8ADCFF),
                child: ListTile(
                title: Text(reply),
              ),
            ),

          ],
        ),
      )
    );
  }
  
}