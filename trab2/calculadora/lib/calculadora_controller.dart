import 'package:flutter/material.dart';

class CalculadoraController {
  String entrada = '0';

  String sub = '0.00';

  String _entrada = '0';
  double numero1 = 0.0;
  double numero2 = 0.0;
  String operador = '';

  onPressComper(String rotulo) {
    if (rotulo == 'C') {
      _entrada = '0';
      numero1 = 0.0;
      numero2 = 0.0;
      operador = '';
      sub = '0.00';
    } else if (rotulo == '+' ||
        rotulo == 'x' ||
        rotulo == '-' ||
        rotulo == '/') {
      numero1 = double.parse(entrada);

      sub = double.parse(entrada).toStringAsFixed(2);

      operador = rotulo;

      _entrada = '0';
    } else if (rotulo == '.') {
      if (_entrada.contains('.')) {
      } else {
        _entrada = _entrada + rotulo;
      }
    } else if (rotulo == '=') {
      numero2 = double.parse(entrada);

      if (operador == '+') {
        _entrada = (numero1 + numero2).toString();
      }
      if (operador == '-') {
        _entrada = (numero1 - numero2).toString();
      }
      if (operador == 'x') {
        _entrada = (numero1 * numero2).toString();
      }
      if (operador == '/') {
        _entrada = (numero1 / numero2).toString();
      }

      sub = double.parse(_entrada).toStringAsFixed(2);

      numero1 = 0;
      numero2 = 0;
      operador = '';
    } else {
      _entrada = _entrada + rotulo;
    }

    entrada = double.parse(_entrada).toStringAsFixed(2);
  }
}
