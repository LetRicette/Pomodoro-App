import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:pomodoro/components/cronometroButton.dart';
import 'package:pomodoro/store/pomodoro.store.dart';
import 'package:provider/provider.dart';

class Cronometro extends StatelessWidget {
  const Cronometro({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final store = Provider.of<PomodoroStore>(context);
    return Container(
      color: Colors.red,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Hora de Trabalhar',
            style: TextStyle(
              fontSize: 40,
              color: Colors.white,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            "${store.minuts.toString().padLeft(2, '0')}:${store.seconds.toString().padLeft(2, '0')}",
            style: TextStyle(
              fontSize: 120,
              color: Colors.white,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Observer(
              builder: (_) => Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      if (!store.iniciated)
                        Padding(
                          padding: const EdgeInsets.only(right: 10),
                          child: CronometroButton(
                            text: "Iniciar",
                            icon: Icons.play_arrow,
                            click: store.start,
                          ),
                        ),
                      if (store.iniciated)
                        Padding(
                          padding: const EdgeInsets.only(right: 10),
                          child: CronometroButton(
                            text: "Parar",
                            icon: Icons.stop,
                            click: store.stop,
                          ),
                        ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: CronometroButton(
                          text: "Reiniciar",
                          icon: Icons.refresh,
                          click: store.reStart,
                        ),
                      )
                    ],
                  )),
        ],
      ),
    );
  }
}
