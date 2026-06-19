import 'package:flutter/material.dart';
import 'package:quizapp/perguntas.dart';

class Helper {
  int _numeroDaQuestaoAtual = 0;
  int _contador = 0;
  final List<Widget> _marcadorDePontos = [];
  final List<Perguntas> _perguntas = [
    Perguntas(
      'O metrô é um dos meios de transporte mais seguros do mundo',
      true,
    ),
    Perguntas(
      'A culinária brasileira é uma das melhores do mundo.',
      true,
    ),
    Perguntas(
      'Vacas podem voar, assim como peixes utilizam os pés para andar.',
      false,
    ),
    Perguntas(
      'O Brasil já sediou a Copa do Mundo de futebol.',
      true,
    ),
    Perguntas('A Terra é plana.', false),
    Perguntas(
      'A água ferve a 100°C ao nível do mar.',
      true,
    ),
    Perguntas('O Sol é menor que a Terra.', false),
    Perguntas(
      'O Monte Everest é a montanha mais alta do mundo.',
      true,
    ),
    Perguntas(
      'O polo Sul é mais quente que o polo Norte.',
      false,
    ),
    Perguntas('A luz viaja mais rápido que o som.', true),
    Perguntas('O número pi é exatamente igual a 3.', false),
    Perguntas(
      'O Brasil faz fronteira com a Argentina.',
      true,
    ),
    Perguntas('Um triângulo tem quatro lados.', false),
    Perguntas(
      'O chocolate é feito a partir do cacau.',
      true,
    ),
    Perguntas(
      'Os camelos armazenam água em suas corcovas.',
      false,
    ),
    Perguntas('A laranja é uma fruta cítrica.', true),
    Perguntas('As abelhas são mamíferos.', false),
    Perguntas(
      'A Lua completa uma volta ao redor da Terra em aproximadamente 27 dias.',
      true,
    ),
  ];

  String obterPerguntas() {
    return _perguntas[_numeroDaQuestaoAtual].pergunta;
  }

  bool obterResposta() {
    return _perguntas[_numeroDaQuestaoAtual].resposta;
  }

  void acaoResposta(bool status) {
    if (_contador == _numeroDaQuestaoAtual) {
      if (obterResposta() == status) {
        _marcadorDePontos.add(
          Icon(Icons.check, color: Colors.green),
        );
      } else {
        _marcadorDePontos.add(
          Icon(Icons.close, color: Colors.red),
        );
      }
      if (_numeroDaQuestaoAtual < _perguntas.length - 1) {
        _numeroDaQuestaoAtual++;
      }
      _contador++;
    }
  }

  List<Widget> mostrarStatus() {
    return _marcadorDePontos;
  }
}
