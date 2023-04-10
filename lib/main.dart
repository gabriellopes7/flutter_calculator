import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String numero = '0';
  double primeiroNumero = 0.0;
  String operacao = '';
  String visor = '';
  void calcular(String tecla) {
    switch (tecla) {
      case '0':
      case '1':
      case '2':
      case '3':
      case '4':
      case '5':
      case '6':
      case '7':
      case '8':
      case '9':
      case ',':
        setState(() {
          numero += tecla;
          numero = numero.replaceAll(',', '.');
          if (!numero.contains('.')) {
            int numeroInt = int.parse(numero);
            numero = numeroInt.toString();
          }
          numero = numero.replaceAll('.', ',');
        });
        break;
      case 'AC':
        setState(() {
          numero = '0';
          operacao = '';
          visor = '';
        });
        break;
      case '<X':
        setState(() {
          if (numero.length > 0) {
            numero = numero.substring(0, numero.length - 1);
          }
          if (numero == '') {
            numero = '0';
          }
        });
        break;
      case '-':
      case 'X':
      case '/':
      case '+':
        operacao = tecla;

        setState(() {
          visor += numero + operacao;
        });
        numero = numero.replaceAll(',', '.');
        primeiroNumero = double.parse(numero);
        numero = numero.replaceAll('.', ',');
        numero = '0';
        break;
      case '=':
        double resultado = 0.0;
        if (operacao == '+') {
          numero = numero.replaceAll(',', '.');
          resultado = primeiroNumero + double.parse(numero);
        }
        if (operacao == '-') {
          numero = numero.replaceAll(',', '.');
          resultado = primeiroNumero - double.parse(numero);
        }
        if (operacao == 'X') {
          numero = numero.replaceAll(',', '.');
          resultado = primeiroNumero * double.parse(numero);
        }
        if (operacao == '/') {
          if (double.parse(numero) * 1 == 0) {
            setState(() => numero = "0 Division");
            return;
          }
          numero = numero.replaceAll(',', '.');
          resultado = primeiroNumero / double.parse(numero);
        }

        List<String> resultadoPartes = resultado.toString().split('.');
        if (int.parse(resultadoPartes[1]) * 1 == 0) {
          setState(() {
            numero = int.parse(resultadoPartes[0]).toString();
            numero = numero.replaceAll('.', ',');
            visor = '';
          });
        } else {
          setState(() {
            numero = resultado.toString();
            numero = numero.replaceAll('.', ',');
            visor = '';
          });
        }

        break;
      default:
        setState(() {
          numero += tecla;
        });
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
          title: Center(
        child: Text("Calculadora"),
      )),
      body: Column(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(visor, style: TextStyle(fontSize: 15)),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(numero, style: TextStyle(fontSize: 72)),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            GestureDetector(
                onTap: () {
                  calcular('AC');
                },
                child: Text("AC", style: TextStyle(fontSize: 48))),
            Text(""),
            Text(""),
            GestureDetector(
                onTap: () => calcular('<X'),
                child: Image.asset(
                  'assets/images/backspace-arrow.png',
                  width: 60,
                )),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            GestureDetector(
              onTap: () {
                calcular('7');
              },
              child: Text(
                "7",
                style: TextStyle(fontSize: 48),
              ),
            ),
            GestureDetector(
              onTap: () => calcular('8'),
              child: Text(
                "8",
                style: TextStyle(fontSize: 48),
              ),
            ),
            GestureDetector(
              onTap: () => calcular('9'),
              child: Text(
                "9",
                style: TextStyle(fontSize: 48),
              ),
            ),
            GestureDetector(
              onTap: () => calcular('/'),
              child: Image.asset(
                'assets/images/division.png',
                width: 40,
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            GestureDetector(
                onTap: () => calcular('4'),
                child: Text("4", style: TextStyle(fontSize: 48))),
            GestureDetector(
                onTap: () => calcular('5'),
                child: Text("5", style: TextStyle(fontSize: 48))),
            GestureDetector(
                onTap: () => calcular('6'),
                child: Text("6", style: TextStyle(fontSize: 48))),
            GestureDetector(
                onTap: () => calcular('X'),
                child: Image.asset(
                  "assets/images/multiply.png",
                  width: 35,
                )),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            GestureDetector(
                onTap: () => calcular('1'),
                child: Text("1", style: TextStyle(fontSize: 48))),
            GestureDetector(
                onTap: () => calcular('2'),
                child: Text("2", style: TextStyle(fontSize: 48))),
            GestureDetector(
                onTap: () => calcular('3'),
                child: Text("3", style: TextStyle(fontSize: 48))),
            GestureDetector(
                onTap: () => calcular('-'),
                child: Text("-", style: TextStyle(fontSize: 48))),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            GestureDetector(
                onTap: () => calcular('0'),
                child: Text("0", style: TextStyle(fontSize: 48))),
            GestureDetector(
                onTap: () => calcular(','),
                child: Text(",", style: TextStyle(fontSize: 48))),
            GestureDetector(
                onTap: () => calcular('='),
                child: Text("=", style: TextStyle(fontSize: 48))),
            GestureDetector(
                onTap: () => calcular('+'),
                child: Text("+", style: TextStyle(fontSize: 48))),
          ],
        )
      ]),
    ));
  }
}
