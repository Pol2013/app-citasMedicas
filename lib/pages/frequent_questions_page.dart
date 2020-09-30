import 'package:app_citas/models/frequentquestion_model.dart';
import 'package:app_citas/providers/frequentquestion_provider.dart';
import 'package:app_citas/providers/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Item {
  Item({
    this.expandedValue,
    this.headerValue,
    this.isExpanded = false,
  });

  String expandedValue;
  String headerValue;
  bool isExpanded;
}

List<Item> generateItems(int numberOfItems) {
  return List.generate(numberOfItems, (int index) {
    return Item(
      headerValue: 'Pregunta ${index + 1}',
      expandedValue:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce et dui purus. Phasellus mollis, eros in pharetra tincidunt, ex lorem congue sapien, eget imperdiet lectus dolor fringilla sapien. Morbi semper urna fringilla, fringilla elit eu, euismod nibh. Nullam posuere elementum tortor at suscipit. Sed in libero congue, egestas dolor vitae, porttitor ante.',
    );
  });
}

class FrequentQuestionsPage extends StatefulWidget {
  FrequentQuestionsPage({Key key}) : super(key: key);
  @override
  _FrequentQuestionsPageState createState() => _FrequentQuestionsPageState();
}

class _FrequentQuestionsPageState extends State<FrequentQuestionsPage> {
  final _frequentquestionProvider = FrequentQuestionProvider();

  List<Item> _data = generateItems(8);

  @override
  Widget build(BuildContext context) {
    _getFrequentQuestions();

    return Scaffold(
      appBar: AppBar(
        title: Text('Preguntas Frecuentes'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(32.0),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                SvgPicture.asset('assets/frequent_questions_logo.svg'),
                Text('Preguntas Frecuentes'),
                SizedBox(
                  height: 20.0,
                ),
                _body(),
                ButtonTheme(
                  minWidth: 400.0,
                  child: RaisedButton(
                    textColor: Colors.white,
                    color: Colors.blue,
                    child: Text("Regresar"),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(30.0),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildPanel() {
    return ExpansionPanelList(
      expansionCallback: (int index, bool isExpanded) {
        setState(() {
          _data[index].isExpanded = !isExpanded;
        });
      },
      children: _data.map<ExpansionPanel>((Item item) {
        return ExpansionPanel(
          headerBuilder: (BuildContext context, bool isExpanded) {
            return ListTile(
              title: Text(item.headerValue),
            );
          },
          body: ListTile(
            title: Text(item.expandedValue),
          ),
          isExpanded: item.isExpanded,
        );
      }).toList(),
    );
  }

  _getFrequentQuestions() async {
    await _frequentquestionProvider.getFrequentQuestions();
  }

  Widget _body() {
    return FutureBuilder(
      future: _frequentquestionProvider.getFrequentQuestions(),
      builder: (BuildContext context,
          AsyncSnapshot<List<FrequentquestionModel>> snapshot) {
        if (snapshot.hasData) {
          return ExpansionPanelList(
              expansionCallback: (int index, bool isExpanded) {
                setState(() {
                  snapshot.data[index].isExpanded = !isExpanded;
                });
              },
              children: snapshot.data.map<ExpansionPanel>(
                  (FrequentquestionModel frequentquestion) {
                return ExpansionPanel(
                  headerBuilder: (BuildContext context, bool isExpanded) {
                    return ListTile(
                      title: Text(frequentquestion.question),
                    );
                  },
                  body: ListBody(
                    children: [Text(frequentquestion.answer)],
                  ),
                  isExpanded: frequentquestion.isExpanded,
                );
              }).toList());
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
