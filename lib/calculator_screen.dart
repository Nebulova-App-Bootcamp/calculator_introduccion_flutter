import 'package:explication_calculator/controllers/calculator_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:math_expressions/math_expressions.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final CalculatorController c = Get.put(CalculatorController());
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: const Text("NEBULOVA CALCULATOR"),
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.only(
              left: 10.0,
              right: 20.0,
              top: 20,
            ),
            child: Obx(
              () => Container(
                color: Colors.white,
                child: Text(
                  c.txtEntrada.value,
                  style: const TextStyle(
                    fontSize: 40,
                    fontFamily: 'RobotoMono',
                  ),
                  textAlign: TextAlign.end,
                ),
              ),
            ),

            // TextField(
            //   inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            //   textInputAction: TextInputAction.none,
            //   keyboardType: TextInputType.number,
            //   decoration: const InputDecoration.collapsed(
            //       hintText: "0",
            //       hintStyle: TextStyle(
            //         fontSize: 40,
            //         fontFamily: 'RobotoMono',
            //       )),
            //   style: const TextStyle(
            //     fontSize: 40,
            //     fontFamily: 'RobotoMono',
            //   ),
            //   textAlign: TextAlign.right,
            //   controller: c.txtEntrada,
            // ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Obx(
              () => Container(
                color: Colors.white,
                child: Text(
                  c.txtResultado.value,
                  style: const TextStyle(
                    fontSize: 40,
                    fontFamily: 'RobotoMono',
                  ),
                  textAlign: TextAlign.end,
                ),
              ),
            ),

            // TextField(
            //   decoration: const InputDecoration.collapsed(
            //       hintText: "Resultado",
            //       fillColor: Colors.deepPurpleAccent,
            //       hintStyle: TextStyle(fontFamily: 'RobotoMono')),
            //   textInputAction: TextInputAction.none,
            //   keyboardType: TextInputType.number,
            //   style: const TextStyle(
            //       fontSize: 42,
            //       fontFamily: 'RobotoMono',
            //       fontWeight: FontWeight.bold
            //       // color: Colors.deepPurpleAccent
            //       ),
            //   textAlign: TextAlign.right,
            //   controller: c.txtResultado,
            // ),
          ),
          GridView.count(
            shrinkWrap: true,
            padding: const EdgeInsets.all(20),
            crossAxisCount: 4,
            children: [
              btnAC('AC', const Color(0xFFF5F7F9)),
              boton(
                '%',
                const Color(0xFFF5F7F9),
              ),
              boton(
                '/',
                const Color(0xFFF5F7F9),
              ),
              btnBorrar(),
              boton('7', Colors.white),
              boton('8', Colors.white),
              boton('9', Colors.white),
              boton(
                '*',
                const Color(0xFFF5F7F9),
              ),
              boton('4', Colors.white),
              boton('5', Colors.white),
              boton('6', Colors.white),
              boton(
                '-',
                const Color(0xFFF5F7F9),
              ),
              boton('1', Colors.white),
              boton('2', Colors.white),
              boton('3', Colors.white),
              boton('+', const Color(0xFFF5F7F9)),
              Container(),
              boton('0', Colors.white),
              boton('.', Colors.white),
              btnIgual(),
            ],
          ),
        ],
      ),
    );
  }

  Widget boton(btntxt, Color btnColor) {
    final CalculatorController c = Get.find();

    return Container(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: TextButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(
            btnColor,
          ),
          shape:
              MaterialStateProperty.all<OutlinedBorder>(const CircleBorder()),
          padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
              const EdgeInsets.all(18.0)),
          shadowColor: MaterialStateProperty.all<Color>(Colors.black),
        ),
        child: Text(
          btntxt,
          style: const TextStyle(
              fontSize: 28.0, color: Colors.black, fontFamily: 'RobotoMono'),
        ),
        onPressed: () {
          c.txtEntrada.value = c.txtEntrada.value + btntxt;
          //c.txtEntrada.text = c.txtEntrada.text + btntxt;
          // setState(() {
          //   txtEntrada.text = txtEntrada.text + btntxt;
          // });
        },
      ),
    );
  }

  Widget btnAC(btntext, Color btnColor) {
    final CalculatorController c = Get.find();
    return Container(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: TextButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(
            btnColor,
          ),
          shape:
              MaterialStateProperty.all<OutlinedBorder>(const CircleBorder()),
          padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
              const EdgeInsets.all(18.0)),
          shadowColor: MaterialStateProperty.all<Color>(Colors.black),
        ),
        child: Text(
          btntext,
          style: const TextStyle(
              fontSize: 28.0, color: Colors.black, fontFamily: 'RobotoMono'),
        ),
        onPressed: () {
          c.txtEntrada.value = "0";
          c.txtResultado.value = "Resultado";
          // c.txtEntrada.text = "";
          // c.txtResultado.text = "";
          // setState(() {
          //   txtEntrada.text = "";
          //   txtResultado.text = "";
          // });
        },
      ),
    );
  }

  Widget btnBorrar() {
    final CalculatorController c = Get.find();
    return Container(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: TextButton(
        style: ButtonStyle(
          backgroundColor:
              MaterialStateProperty.all<Color>(const Color(0xFFF5F7F9)),
          shape:
              MaterialStateProperty.all<OutlinedBorder>(const CircleBorder()),
          padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
              const EdgeInsets.all(18.0)),
          shadowColor: MaterialStateProperty.all<Color>(Colors.black),
        ),
        child: const Icon(Icons.backspace, size: 35, color: Colors.blueGrey),
        onPressed: () {
          c.txtEntrada.value = (c.txtEntrada.value.isNotEmpty)
              ? (c.txtEntrada.value.substring(0, c.txtEntrada.value.length - 1))
              : "0";
          // c.txtEntrada.text = (c.txtEntrada.text.isNotEmpty)
          //     ? (c.txtEntrada.text.substring(0, c.txtEntrada.text.length - 1))
          //     : "";
          // setState(() {
          //   txtEntrada.text = (txtEntrada.text.isNotEmpty)
          //       ? (txtEntrada.text.substring(0, txtEntrada.text.length - 1))
          //       : "";
          // });
        },
      ),
    );
  }

  Widget btnIgual() {
    final CalculatorController c = Get.find();
    return Container(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: TextButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(Colors.pink),
          shape:
              MaterialStateProperty.all<OutlinedBorder>(const CircleBorder()),
          padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
              const EdgeInsets.all(18.0)),
          shadowColor: MaterialStateProperty.all<Color>(Colors.black),
        ),
        child: const Text(
          '=',
          style: TextStyle(
              fontSize: 28.0, color: Colors.white, fontFamily: 'RobotoMono'),
        ),
        onPressed: () {
          Parser p = Parser();
          ContextModel ctxtm = ContextModel();
          Expression exp = p.parse(c.txtEntrada.value);
          c.txtResultado.value =
              exp.evaluate(EvaluationType.REAL, ctxtm).toString();
          // Parser p = Parser();
          // ContextModel ctxtm = ContextModel();
          // Expression exp = p.parse(c.txtEntrada.text);
          // c.txtResultado.text =
          //     exp.evaluate(EvaluationType.REAL, ctxtm).toString();

          // setState(() {
          //   txtResultado.text =
          //       exp.evaluate(EvaluationType.REAL, ctxtm).toString();
          // });
        },
      ),
    );
  }
}
