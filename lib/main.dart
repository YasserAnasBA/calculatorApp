import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:math_expressions/math_expressions.dart';

void main() {
  runApp(DevicePreview(builder: (context) => MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      builder: DevicePreview.appBuilder,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          textTheme: GoogleFonts.cairoTextTheme(
        Theme.of(context).textTheme,
      )),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var x = '';
  String history = '';
  _onClick(String calc) {
    if (x == '0.0') {
      x = '';
    }

    if (calc == '=') {
      Parser p = new Parser();
      Expression exp = p.parse(x);
      print(exp);

      x = exp
          .evaluate(EvaluationType.REAL, ContextModel())
          .toString(); // if context is not available replace it with null.
      history = x;

      print(x);
    } else if (calc == 'C') {
      x = '';
    } else if (calc == 'back') {
      if (x != null && x.length > 0) {
        x = x.substring(0, x.length - 1);
      }
    } else {
      if (x == history) {
        if ((calc == '+' ||
            calc == '-' ||
            calc == '*' ||
            calc == '/' ||
            calc == '%')) {
          print('here');

          x += calc;
        } else {
          x = '';
          x += calc;
        }
      } else {
        x += calc;
      }
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    double screennWidth = MediaQuery.of(context).size.width;
    double buttonWidth = screennWidth / 4;
    Color primary = Colors.white;
    Color secondary = Colors.orange;
    double primarySize = 50;
    double secondarySize = 40;
    double halfScreen = MediaQuery.of(context).size.height / 2;
    double buttonHeight = halfScreen / 5;
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        width: screennWidth,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Container(
                width: screennWidth,
                alignment: Alignment.bottomRight,
                child: Text(
                  history,
                  style: TextStyle(fontSize: 28, color: Colors.grey),
                )),
            Container(
                width: screennWidth,
                alignment: Alignment.bottomRight,
                child: Text(
                  x,
                  style: TextStyle(fontSize: 40, color: Colors.white),
                )),
            Divider(
              color: Colors.grey,
              height: 1,
            ),
            Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                  child: TextButton(
                      style: TextButton.styleFrom(
                          minimumSize: Size(buttonWidth, buttonHeight),
                          backgroundColor: Colors.black,
                          primary: Colors.white,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50))),
                      onPressed: () {
                        _onClick('C');
                      },
                      child: Text(
                        'C',
                        style: TextStyle(
                            fontSize: secondarySize, color: secondary),
                      )),
                ),
                Expanded(
                  child: TextButton(
                      style: TextButton.styleFrom(
                          minimumSize: Size(buttonWidth, buttonHeight),
                          backgroundColor: Colors.black,
                          primary: Colors.white,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50))),
                      onPressed: () {
                        _onClick('back');
                      },
                      child: Icon(
                        Icons.backspace_outlined,
                        color: Colors.orange,
                        size: 30,
                      )),
                ),
                Expanded(
                  child: TextButton(
                      style: TextButton.styleFrom(
                          minimumSize: Size(buttonWidth, buttonHeight),
                          backgroundColor: Colors.black,
                          primary: Colors.white,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50))),
                      onPressed: () {
                        _onClick('%');
                      },
                      child: Text(
                        '%',
                        style: TextStyle(
                            fontSize: secondarySize, color: secondary),
                      )),
                ),
                Expanded(
                  child: TextButton(
                      style: TextButton.styleFrom(
                          minimumSize: Size(buttonWidth, buttonHeight),
                          backgroundColor: Colors.black,
                          primary: Colors.white,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(100))),
                      onPressed: () {
                        _onClick('/');
                      },
                      child: Text(
                        '/',
                        style: TextStyle(
                            fontSize: secondarySize, color: secondary),
                      )),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: TextButton(
                      style: TextButton.styleFrom(
                          minimumSize: Size(buttonWidth, buttonHeight),
                          backgroundColor: Colors.black,
                          primary: Colors.white,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50))),
                      onPressed: () {
                        _onClick('7');
                      },
                      child: Text(
                        '7',
                        style: TextStyle(fontSize: primarySize, color: primary),
                      )),
                ),
                Expanded(
                  child: TextButton(
                      style: TextButton.styleFrom(
                          minimumSize: Size(buttonWidth, buttonHeight),
                          backgroundColor: Colors.black,
                          primary: Colors.white,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50))),
                      onPressed: () {
                        _onClick('8');
                      },
                      child: Text(
                        '8',
                        style: TextStyle(fontSize: primarySize, color: primary),
                      )),
                ),
                Expanded(
                  child: TextButton(
                      style: TextButton.styleFrom(
                          minimumSize: Size(buttonWidth, buttonHeight),
                          backgroundColor: Colors.black,
                          primary: Colors.white,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50))),
                      onPressed: () {
                        _onClick('9');
                      },
                      child: Text(
                        '9',
                        style: TextStyle(fontSize: primarySize, color: primary),
                      )),
                ),
                Expanded(
                  child: TextButton(
                      style: TextButton.styleFrom(
                          minimumSize: Size(buttonWidth, buttonHeight),
                          backgroundColor: Colors.black,
                          primary: Colors.white,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50))),
                      onPressed: () {
                        _onClick('*');
                      },
                      child: Text(
                        'x',
                        style: TextStyle(
                            fontSize: secondarySize, color: secondary),
                      )),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: TextButton(
                      style: TextButton.styleFrom(
                          minimumSize: Size(buttonWidth, buttonHeight),
                          backgroundColor: Colors.black,
                          primary: Colors.white,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50))),
                      onPressed: () {
                        _onClick('4');
                      },
                      child: Text(
                        '4',
                        style: TextStyle(fontSize: primarySize, color: primary),
                      )),
                ),
                Expanded(
                  child: TextButton(
                      style: TextButton.styleFrom(
                          minimumSize: Size(buttonWidth, buttonHeight),
                          backgroundColor: Colors.black,
                          primary: Colors.white,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50))),
                      onPressed: () {
                        _onClick('5');
                      },
                      child: Text(
                        '5',
                        style: TextStyle(fontSize: primarySize, color: primary),
                      )),
                ),
                Expanded(
                  child: TextButton(
                      style: TextButton.styleFrom(
                          minimumSize: Size(buttonWidth, buttonHeight),
                          backgroundColor: Colors.black,
                          primary: Colors.white,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50))),
                      onPressed: () {
                        _onClick('6');
                      },
                      child: Text(
                        '6',
                        style: TextStyle(fontSize: primarySize, color: primary),
                      )),
                ),
                Expanded(
                  child: TextButton(
                      style: TextButton.styleFrom(
                          minimumSize: Size(buttonWidth, buttonHeight),
                          backgroundColor: Colors.black,
                          primary: Colors.white,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50))),
                      onPressed: () {
                        _onClick('-');
                      },
                      child: Text(
                        '-',
                        style: TextStyle(fontSize: 60, color: secondary),
                      )),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: TextButton(
                      style: TextButton.styleFrom(
                          minimumSize: Size(buttonWidth, buttonHeight),
                          backgroundColor: Colors.black,
                          primary: Colors.white,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50))),
                      onPressed: () {
                        _onClick('1');
                      },
                      child: Text(
                        '1',
                        style: TextStyle(fontSize: primarySize, color: primary),
                      )),
                ),
                Expanded(
                  child: TextButton(
                      style: TextButton.styleFrom(
                          minimumSize: Size(buttonWidth, buttonHeight),
                          backgroundColor: Colors.black,
                          primary: Colors.white,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50))),
                      onPressed: () {
                        _onClick('2');
                      },
                      child: Text(
                        '2',
                        style: TextStyle(fontSize: primarySize, color: primary),
                      )),
                ),
                Expanded(
                  child: TextButton(
                      style: TextButton.styleFrom(
                          minimumSize: Size(buttonWidth, buttonHeight),
                          backgroundColor: Colors.black,
                          primary: Colors.white,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50))),
                      onPressed: () {
                        _onClick('3');
                      },
                      child: Text(
                        '3',
                        style: TextStyle(fontSize: primarySize, color: primary),
                      )),
                ),
                Expanded(
                  child: TextButton(
                      style: TextButton.styleFrom(
                          minimumSize: Size(buttonWidth, buttonHeight),
                          backgroundColor: Colors.black,
                          primary: Colors.white,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50))),
                      onPressed: () {
                        _onClick('+');
                      },
                      child: Text(
                        '+',
                        style: TextStyle(
                            fontSize: secondarySize, color: secondary),
                      )),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: TextButton(
                      style: TextButton.styleFrom(
                          minimumSize: Size(buttonWidth, buttonHeight),
                          backgroundColor: Colors.black,
                          primary: Colors.white,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50))),
                      onPressed: () {
                        _onClick('00');
                      },
                      child: Text(
                        '00',
                        style: TextStyle(fontSize: primarySize, color: primary),
                      )),
                ),
                Expanded(
                  child: TextButton(
                      style: TextButton.styleFrom(
                          minimumSize: Size(buttonWidth, buttonHeight),
                          backgroundColor: Colors.black,
                          primary: Colors.white,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50))),
                      onPressed: () {
                        _onClick('0');
                      },
                      child: Text(
                        '0',
                        style: TextStyle(fontSize: primarySize, color: primary),
                      )),
                ),
                Expanded(
                  child: TextButton(
                      style: TextButton.styleFrom(
                          minimumSize: Size(buttonWidth, buttonHeight),
                          backgroundColor: Colors.black,
                          primary: Colors.white,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50))),
                      onPressed: () {
                        _onClick('.');
                      },
                      child: Text(
                        '.',
                        style: TextStyle(fontSize: primarySize, color: primary),
                      )),
                ),
                Expanded(
                  child: TextButton(
                      style: TextButton.styleFrom(
                          minimumSize: Size(buttonWidth, buttonHeight),
                          backgroundColor: Colors.black,
                          primary: Colors.white,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50))),
                      onPressed: () {
                        _onClick('=');
                      },
                      child: Container(
                        padding: EdgeInsets.all(20),
                        decoration: BoxDecoration(
                            color: secondary, shape: BoxShape.circle),
                        child: Text(
                          '=',
                          style: TextStyle(
                              fontSize: secondarySize, color: primary),
                        ),
                      )),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
