import 'package:flutter/material.dart';
import 'package:quizapp/helper.dart';

void main() {
  runApp(QuizApp());
}

Helper helper = Helper();

class QuizApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: QuizPage(),
          ),
        ),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  List<Widget> marcadorDePontos = [];

  int numeroDaQuestaoAtual = 0;
  int Contador = 0;
  void acaoResposta(bool status) {
    setState(() {
      if (Contador == numeroDaQuestaoAtual) {
        if (helper
                .perguntas[numeroDaQuestaoAtual]
                .resposta ==
            status) {
          marcadorDePontos.add(
            Icon(Icons.check, color: Colors.green),
          );
        } else {
          marcadorDePontos.add(
            Icon(Icons.close, color: Colors.red),
          );
        }
        if (numeroDaQuestaoAtual <
            helper.perguntas.length - 1) {
          numeroDaQuestaoAtual++;
        }
        Contador++;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 5,
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                helper
                    .perguntas[numeroDaQuestaoAtual]
                    .pergunta,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 25.0),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: TextButton(
              style: TextButton.styleFrom(
                backgroundColor: Colors.deepPurple,
              ),
              child: Text(
                'Verdadeiro',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),
              onPressed: () {
                acaoResposta(true);
              },
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: TextButton(
              style: TextButton.styleFrom(
                backgroundColor: Colors.grey.shade800,
              ),
              child: Text(
                'Falso',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              ),
              onPressed: () {
                acaoResposta(false);
              },
            ),
          ),
        ),
        Row(
          children: marcadorDePontos,
        ), // marcador de pontos
      ],
    );
  }
}
