import './Widget/btnCalc.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(CalculadoraApp());
}

class CalculadoraApp extends StatefulWidget {
  CalculadoraApp({Key? key}) : super(key: key);

  @override
  _CalculadoraAppState createState() => _CalculadoraAppState();
}

class _CalculadoraAppState extends State<CalculadoraApp> {
  late double num1;
  late double num2;
  late String historial = "";
  late String txtMain = "";
  late String aux;
  late String operacion;
  late double numaux;
  late double total;

  void C() {
    txtMain = "";
    num1 = 0;
    num2 = 0;
    aux = "";
  }

  void AC() {
    txtMain = "";
    num1 = 0;
    num2 = 0;
    aux = "";
    historial = "";
  }

  void cambiarSigno() {
    numaux = int.parse(txtMain) * -1;
    aux = numaux.toString();
    if (aux.endsWith(".0")) aux = aux.substring(0, aux.length - 2);
  }

  void btnOnClick(String btnValor) {
    print(btnValor);
    if (btnValor == 'C') {
      C();
    } else if (btnValor == "AC") {
      AC();
    } else if (btnValor == "DEL") {
      aux = txtMain.substring(0, txtMain.length - 1);
    } else if (btnValor == "+/-") {
      cambiarSigno();
    } else if (btnValor == ".") {
      aux = txtMain + ".";
    } else if (btnValor == "+" ||
        btnValor == "-" ||
        btnValor == "*" ||
        btnValor == "/") {
      num1 = double.parse(txtMain);
      print("Num1 si op:" + num1.toString());
      aux = " ";
      operacion = btnValor;
      historial = num1.toString() + operacion;
    } else if (btnValor == "=") {
      num2 = double.parse(txtMain);
      if (operacion == "+") {
        print(num1);
        print(operacion);
        print(num2);
        aux = (num1 + num2).toString();
        historial = num1.toString() + operacion + num2.toString();
      }
      if (operacion == "-") {
        aux = (num1 - num2).toString();
        historial = num1.toString() + operacion + num2.toString();
      }
      if (operacion == "*") {
        aux = (num1 * num2).toString();
        historial = num1.toString() + operacion + num2.toString();
      }
      if (operacion == "/") {
        if (num2 == 0) {
          aux = "Error";
        } else {
          aux = (num1 / num2).toString();
          if (aux.contains(".")) {
            int n = 0;
            String s_aux;
            for (var i = 0; i < aux.length; i++) {
              s_aux = aux.toLowerCase().substring(i);
              if (s_aux.startsWith(".")) {
                n = i;
              }
            }
            if (aux.length > 6) {
              aux = aux.substring(0, n + 5);
            }
          }
        }
        historial = num1.toString() + operacion + num2.toString();
      }
    } else {
      aux = double.parse(txtMain + btnValor).toString();
      if (aux.endsWith(".0")) {
        aux = aux.substring(0, aux.length - 2);
      }
    }

    setState(() {
      txtMain = aux;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Calculadora',
      theme: ThemeData(primarySwatch: Colors.indigo),
      home: Scaffold(
        backgroundColor: Colors.amber[100],
        appBar: AppBar(
          title: Text('Calculadora Flutter'),
        ),
        body: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Container(
                child: Padding(
                    padding: EdgeInsets.only(right: 12),
                    child: Text(
                      historial,
                      style: GoogleFonts.rubik(
                          textStyle:
                              TextStyle(fontSize: 20, color: Colors.grey[800])),
                    )),
                alignment: Alignment(1.0, 1.0),
              ),
              Container(
                child: Padding(
                    padding: EdgeInsets.all(12),
                    child: Text(
                      txtMain,
                      style: GoogleFonts.rubik(
                          textStyle:
                              TextStyle(fontSize: 40, color: Colors.black)),
                    )),
                alignment: Alignment(1.0, 1.0),
              ),
              Row(
                children: [
                  btn_Calc(
                    txt: 'AC',
                    btnColor: 0xFFc6538c,
                    txtColor: 0xFF000000,
                    txtSize: 24,
                    fun: btnOnClick,
                  ),
                  btn_Calc(
                    txt: 'C',
                    btnColor: 0xFFc6538c,
                    txtColor: 0xFF000000,
                    txtSize: 24,
                    fun: btnOnClick,
                  ),
                  btn_Calc(
                    txt: 'DEL',
                    btnColor: 0xFFc6538c,
                    txtColor: 0xFF000000,
                    txtSize: 22,
                    fun: btnOnClick,
                  ),
                  btn_Calc(
                    txt: '/',
                    btnColor: 0xFFc6538c,
                    txtColor: 0xFF000000,
                    txtSize: 24,
                    fun: btnOnClick,
                  ),
                ],
              ),
              Row(
                children: [
                  btn_Calc(
                    txt: '7',
                    btnColor: 0xFF99ffcc,
                    txtColor: 0xFF000000,
                    txtSize: 24,
                    fun: btnOnClick,
                  ),
                  btn_Calc(
                    txt: '8',
                    btnColor: 0xFF99ffcc,
                    txtColor: 0xFF000000,
                    txtSize: 24,
                    fun: btnOnClick,
                  ),
                  btn_Calc(
                    txt: '9',
                    btnColor: 0xFF99ffcc,
                    txtColor: 0xFF000000,
                    txtSize: 24,
                    fun: btnOnClick,
                  ),
                  btn_Calc(
                    txt: '*',
                    btnColor: 0xFFc6538c,
                    txtColor: 0xFF000000,
                    txtSize: 24,
                    fun: btnOnClick,
                  ),
                ],
              ),
              Row(
                children: [
                  btn_Calc(
                    txt: '4',
                    btnColor: 0xFF99ffcc,
                    txtColor: 0xFF000000,
                    txtSize: 24,
                    fun: btnOnClick,
                  ),
                  btn_Calc(
                    txt: '5',
                    btnColor: 0xFF99ffcc,
                    txtColor: 0xFF000000,
                    txtSize: 24,
                    fun: btnOnClick,
                  ),
                  btn_Calc(
                    txt: '6',
                    btnColor: 0xFF99ffcc,
                    txtColor: 0xFF000000,
                    txtSize: 24,
                    fun: btnOnClick,
                  ),
                  btn_Calc(
                    txt: '-',
                    btnColor: 0xFFc6538c,
                    txtColor: 0xFF000000,
                    txtSize: 24,
                    fun: btnOnClick,
                  ),
                ],
              ),
              Row(
                children: [
                  btn_Calc(
                    txt: '1',
                    btnColor: 0xFF99ffcc,
                    txtColor: 0xFF000000,
                    txtSize: 24,
                    fun: btnOnClick,
                  ),
                  btn_Calc(
                    txt: '2',
                    btnColor: 0xFF99ffcc,
                    txtColor: 0xFF000000,
                    txtSize: 24,
                    fun: btnOnClick,
                  ),
                  btn_Calc(
                    txt: '3',
                    btnColor: 0xFF99ffcc,
                    txtColor: 0xFF000000,
                    txtSize: 24,
                    fun: btnOnClick,
                  ),
                  btn_Calc(
                    txt: '+',
                    btnColor: 0xFFc6538c,
                    txtColor: 0xFF000000,
                    txtSize: 24,
                    fun: btnOnClick,
                  ),
                ],
              ),
              Row(
                children: [
                  btn_Calc(
                    txt: '0',
                    btnColor: 0xFF99ffcc,
                    txtColor: 0xFF000000,
                    txtSize: 24,
                    fun: btnOnClick,
                  ),
                  btn_Calc(
                    txt: '.',
                    btnColor: 0xFF99ffcc,
                    txtColor: 0xFF000000,
                    txtSize: 24,
                    fun: btnOnClick,
                  ),
                  btn_Calc(
                    txt: '+/-',
                    btnColor: 0xFF99ffcc,
                    txtColor: 0xFF000000,
                    txtSize: 24,
                    fun: btnOnClick,
                  ),
                  btn_Calc(
                    txt: '=',
                    btnColor: 0xFFc6538c,
                    txtColor: 0xFF000000,
                    txtSize: 24,
                    fun: btnOnClick,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
