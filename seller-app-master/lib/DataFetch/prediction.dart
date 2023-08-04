import 'dart:convert';
import 'dart:core';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

Future<String> potato() async {
  var headers = {'Content-Type': 'application/json'};
  var request = http.Request(
      'POST', Uri.parse('https://55f9-103-165-2-13.in.ngrok.io/ml-model'));
  request.body = json.encode({"a": 0, "b": 0, "c": 0, "d": 15, "e": 1, "f": 2});
  request.headers.addAll(headers);

  http.StreamedResponse response = await request.send();
  String ans = "";
  if (response.statusCode == 200) {
    ans = await response.stream.bytesToString();
    print(ans);
  } else {
    print('response.reasonPhrase2');
  }
  return ans;
}

Future<String> tomato(int num) async {
  print(num);
  var headers = {'Content-Type': 'application/json'};
  var request = http.Request(
      'POST', Uri.parse('https://796f-103-165-2-13.in.ngrok.io/ml-model'));
  request.body =
      json.encode({"a": num, "b": 0, "c": 0, "d": 15, "e": 1, "f": 2});
  request.headers.addAll(headers);

  http.StreamedResponse response = await request.send();
  String ans = "";
  if (response.statusCode == 200) {
    ans = await response.stream.bytesToString();
    print('ans');
  } else {
    print('response.reasonPhrase');
  }
  return ans;
}

class prediction extends StatefulWidget {
  const prediction({Key? key}) : super(key: key);

  @override
  State<prediction> createState() => _predictionState();
}

class _predictionState extends State<prediction> {
  TextEditingController controller = TextEditingController();
  var list = [
    'potato',
    'tomato',
    'peas',
    'pumkin',
    'cucumber',
    'pointed grourd ',
    'Raddish',
    'Bitter gourd',
    'onion',
    'garlic',
    'cabage',
    'califlower',
    'chilly',
    'okra',
    'brinjal',
    'ginger',
    'radish'
  ];
  String predicted = "";
  int num = 0;


  Future<String> _incrementCounter() async {
    int num=0;
    for (int i = 0; i < 17; i++) {
      if (controller.text == list[i]) {
        num = i;
        break;
      }
    }
    final String pred = await tomato(num);
    // var predm = JsonDecoder(pred);
    String x = "";
    x += pred[pred.length - 3];
    x += pred[pred.length - 2];
    setState(() {
      predicted = x;
    });
    return x;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: const Text('Price Prediction'),
          backgroundColor: Color.fromARGB(255, 0, 0, 0),
          centerTitle: true,
        ),
        body: Center(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    const SizedBox(
                      height: 150,
                    ),
                    const Text(
                      'Vegetable Name : ',
                      style: TextStyle(
                        fontSize: 35,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    // (
                    Container(
                      // color: Colors.black,
                      height: 100,
                      child: TextField(
                        controller: controller,
                        // keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30.0),
                            ),
                            filled: true,
                            hintStyle: TextStyle(color: Colors.grey[800]),
                            hintText: "    Vegetable",
                            fillColor: Colors.white70),
                      ),
                    ),
                    // ),
                    Padding(
                      padding: const EdgeInsets.only(left: 80),
                      child: SizedBox(
                        width: 200,
                        height: 50,
                        child: TextButton(
                          onPressed: _incrementCounter,
                          style: TextButton.styleFrom(
                            backgroundColor: Color.fromARGB(255, 0, 0, 0),
                          ),
                          child: const Text(
                            'Submit',
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 40.0),
                      child: Center(
                        child: Text(
                          'Best Price : ${'₹ '+ predicted}',
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ]),
            )
        )
    );
  }
}




