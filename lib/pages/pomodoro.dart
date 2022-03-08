import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:pomodoro/components/cronometro.dart';
import 'package:pomodoro/components/inputTime.dart';
import 'package:pomodoro/store/pomodoro.store.dart';
import 'package:provider/provider.dart';

class Pomodoro extends StatelessWidget {
  const Pomodoro({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final store = Provider.of<PomodoroStore>(context);
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(child: Cronometro()),
          Padding(
              padding: const EdgeInsets.symmetric(vertical: 40),
              child: Observer(
                builder: (_) => Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    InputTime(
                      title: 'Trabalho',
                      value: store.tempoTrabalho,
                      inc: store.iniciated && store.estaTrabalhando()
                          ? null
                          : store.incrementarTempoTrabalho,
                      dec: store.iniciated && store.estaTrabalhando()
                          ? null
                          : store.decrementarTempoTrabalho,
                    ),
                    InputTime(
                      title: 'Descanso',
                      value: store.tempoDescanso,
                      inc: store.iniciated && store.estaDescansando()
                          ? null
                          : store.incrementarTempoDescanso,
                      dec: store.iniciated && store.estaDescansando()
                          ? null
                          : store.decrementarTempoDescanso,
                    ),
                  ],
                ),
              )),
        ],
      ),
    );
  }
}
