import 'package:dart_eval/dart_eval.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: calculator_home());
  }
}

const Color primary_color = Color.fromRGBO(69, 111, 255, 0.8);
const Color background_color_special = Color.fromRGBO(69, 111, 255, 0.1);
const Color background_color = Color.fromRGBO(198, 189, 189, 0.2);

const TextStyle spl_text_style = TextStyle(
  fontSize: 20,
  fontWeight: FontWeight.bold,
  color: primary_color,
);
const TextStyle symbol_style = TextStyle(fontSize: 32, color: primary_color);
const TextStyle number_style = TextStyle(fontSize: 24, color: Colors.black);

class calculator_home extends StatefulWidget {
  const calculator_home({super.key});

  @override
  State<calculator_home> createState() => _calculator_homeState();
}

class _calculator_homeState extends State<calculator_home> {
  String inputValue = "";

  bool isOperator(String x) {
    if (inputValue.endsWith("*") ||
        inputValue.endsWith("/") ||
        inputValue.endsWith("+") ||
        inputValue.endsWith("-"))
      return true;
    return false;
  }

  Widget calButton(Text text, Color background_color, w) {
    return InkWell(
      onTap: () {
        setState(() {
          if (text.data.toString() == "AC") {
            inputValue = "";
          } else if (text.data.toString() == "C") {
            inputValue = inputValue.substring(0, inputValue.length - 1);
          } else if (text.data.toString() == "×") {
            if (!isOperator(text.data.toString())) inputValue += "*";
          } else if (text.data.toString() == "÷") {
            if (!isOperator(text.data.toString())) inputValue += "/";
          } else if (text.data.toString() == "+") {
            if (!isOperator(text.data.toString())) inputValue += "+";
          } else if (text.data.toString() == "-") {
            if (!isOperator(text.data.toString())) inputValue += "-";
          } else if (text.data.toString() == "%") {
            if (!isOperator(text.data.toString())) inputValue += "%";
          } else if (text.data.toString() == "=") {
            var result = eval(inputValue);
            if (result is double && result % 1 != 0) {
              inputValue = result.toStringAsFixed(2); // show 2 decimal places
            } else {
              inputValue = result.toInt().toString(); // show as integer
            }
          } else
            inputValue += text.data.toString();
        });
      },
      borderRadius: BorderRadius.circular(50),
      child: Container(
        height: 60,
        width: w,
        child: Center(child: text),
        decoration: BoxDecoration(
          color: background_color,
          borderRadius: BorderRadius.circular(50),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Calculator",
          style: GoogleFonts.abel(
            letterSpacing: 1.5,
            color: Colors.white,
            fontSize: 30,
            fontWeight: FontWeight.bold,
            fontStyle: FontStyle.normal,
          ),
        ),
        centerTitle: true,
        backgroundColor: primary_color,
      ),
      body: Container(
        margin: EdgeInsets.only(bottom: 60),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              padding: EdgeInsets.all(10),
              alignment: Alignment.centerRight,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                reverse: true,
                child: Text(
                  inputValue,
                  style: TextStyle(fontSize: 80, color: primary_color),
                ),
              ),
              width: double.infinity,
              height: (MediaQuery.of(context).size.height / 3) - 20,
              margin: EdgeInsets.only(bottom: 10),
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                calButton(
                  Text("AC", style: spl_text_style),
                  background_color_special,
                  MediaQuery.of(context).size.width / 5,
                ),
                calButton(
                  Text("C", style: spl_text_style),
                  background_color_special,
                  MediaQuery.of(context).size.width / 5,
                ),
                calButton(
                  Text("%", style: spl_text_style),
                  background_color_special,
                  MediaQuery.of(context).size.width / 5,
                ),
                calButton(
                  Text("÷", style: symbol_style),
                  background_color_special,
                  MediaQuery.of(context).size.width / 5,
                ),
              ],
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                calButton(
                  Text("7", style: number_style),
                  background_color,
                  MediaQuery.of(context).size.width / 5,
                ),
                calButton(
                  Text("8", style: number_style),
                  background_color,
                  MediaQuery.of(context).size.width / 5,
                ),
                calButton(
                  Text("9", style: number_style),
                  background_color,
                  MediaQuery.of(context).size.width / 5,
                ),
                calButton(
                  Text("×", style: symbol_style),
                  background_color_special,
                  MediaQuery.of(context).size.width / 5,
                ),
              ],
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                calButton(
                  Text("4", style: number_style),
                  background_color,
                  MediaQuery.of(context).size.width / 5,
                ),
                calButton(
                  Text("5", style: number_style),
                  background_color,
                  MediaQuery.of(context).size.width / 5,
                ),
                calButton(
                  Text("6", style: number_style),
                  background_color,
                  MediaQuery.of(context).size.width / 5,
                ),
                calButton(
                  Text("-", style: symbol_style.copyWith(fontSize: 40)),
                  background_color_special,
                  MediaQuery.of(context).size.width / 5,
                ),
              ],
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                calButton(
                  Text("1", style: number_style),
                  background_color,
                  MediaQuery.of(context).size.width / 5,
                ),
                calButton(
                  Text("2", style: number_style),
                  background_color,
                  MediaQuery.of(context).size.width / 5,
                ),
                calButton(
                  Text("3", style: number_style),
                  background_color,
                  MediaQuery.of(context).size.width / 5,
                ),
                calButton(
                  Text("+", style: symbol_style),
                  background_color_special,
                  MediaQuery.of(context).size.width / 5,
                ),
              ],
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                calButton(
                  Text("00", style: number_style),
                  background_color,
                  MediaQuery.of(context).size.width / 5,
                ),
                calButton(
                  Text("0", style: number_style),
                  background_color,
                  MediaQuery.of(context).size.width / 5,
                ),
                calButton(
                  Text(".", style: number_style),
                  background_color,
                  MediaQuery.of(context).size.width / 5,
                ),
                calButton(
                  Text("=", style: symbol_style.copyWith(color: Colors.white)),
                  primary_color,
                  MediaQuery.of(context).size.width / 5,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
