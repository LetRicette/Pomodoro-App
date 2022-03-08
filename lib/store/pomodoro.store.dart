import 'dart:async';

import 'package:mobx/mobx.dart';

part 'pomodoro.store.g.dart';

class PomodoroStore = _PomodoroStore with _$PomodoroStore;

enum TipoIntervalo { TRABALHO, DESCANSO }

abstract class _PomodoroStore with Store {
  @observable
  bool iniciated = false;

  @observable
  int minuts = 2;

  @observable
  int seconds = 0;

  @observable
  int tempoTrabalho = 2;

  @observable
  int tempoDescanso = 1;

  @observable
  TipoIntervalo tipoIntervalo = TipoIntervalo.DESCANSO;

  Timer? cronometro;

  @action
  void start() {
    iniciated = true;
    cronometro = Timer.periodic(Duration(seconds: 1), (timer) {
      if (minuts == 0 && seconds == 0) {
        trocarTipoIntervalo();
      } else if (seconds == 0) {
        seconds = 59;
        minuts--;
      } else {
        seconds--;
      }
    });
  }

  @action
  void stop() {
    iniciated = false;
    cronometro?.cancel();
  }

  @action
  void reStart() {
    iniciated = false;
    stop();
    minuts = estaTrabalhando() ? tempoTrabalho : tempoDescanso;
    seconds = 0;
  }

  @action
  void incrementarTempoTrabalho() {
    tempoTrabalho++;
    if (estaTrabalhando()) {
      reStart();
    }
  }

  @action
  void decrementarTempoTrabalho() {
    if (tempoTrabalho > 1) {
      tempoTrabalho--;
      if (estaTrabalhando()) {
        reStart();
      }
    }
  }

  @action
  void incrementarTempoDescanso() {
    tempoDescanso++;
    if (estaDescansando()) {
      reStart();
    }
  }

  @action
  void decrementarTempoDescanso() {
    if (tempoDescanso > 1) {
      tempoDescanso--;
      if (estaDescansando()) {
        reStart();
      }
    }
  }

  bool estaTrabalhando() {
    return tipoIntervalo == TipoIntervalo.TRABALHO;
  }

  bool estaDescansando() {
    return tipoIntervalo == TipoIntervalo.DESCANSO;
  }

  void trocarTipoIntervalo() {
    if (estaTrabalhando()) {
      tipoIntervalo = TipoIntervalo.DESCANSO;
      minuts = tempoDescanso;
    } else {
      tipoIntervalo = TipoIntervalo.TRABALHO;
      minuts = tempoTrabalho;
    }
    seconds = 0;
  }
}
