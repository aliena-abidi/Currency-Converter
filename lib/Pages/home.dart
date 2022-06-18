import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/src/material/colors.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _key = GlobalKey<FormState>();

  TextEditingController currency = TextEditingController();
  double converted = 0;
  String to = 'America';
  String from = 'India';

  List<String> items = [

    'India',
    'China',
    'America',
    'Japan',
  ];
  Map<String,double> indianCurrencies = {
    'China': 0.086,
    'America': 77.82,
    'Japan': 1.64
  };
  Map<String,double> chinaCurrencies = {
    'India': 11.65,
    'America': 0.15,
    'Japan': 19.31
  };
  Map<String,double> americaCurrencies = {
    'China': 6.67,
    'India': 77.68,
    'Japan': 128.82
  };
  Map<String,double> japanCurrencies = {
    'China':0.052,
    'America': 0.0078,
    'India': 0.60
  };

  void fun() {
    if(from=='India'){

    var keys= indianCurrencies.keys.toList();
    for (var i = 0; i < keys.length; i++) {
      // log(keys[i]);
      if (keys[i]==to){
        var value= indianCurrencies[keys[i]];
        converted= double.parse(currency.text )* (value!);
         setState(() {});
         return;
      }
    }
    }
    else if (from=='China'){
      var keys= chinaCurrencies.keys.toList();
    for (var i = 0; i < keys.length; i++) {
      // log(keys[i]);
      if (keys[i]==to){
        var value= chinaCurrencies[keys[i]];
        converted= double.parse(currency.text )* (value!);
         setState(() {});
         return;
      }
    }
    }
    else if (from=="America"){
      var keys= americaCurrencies.keys.toList();
    for (var i = 0; i < keys.length; i++) {
      // log(keys[i]);
      if (keys[i]==to){
        var value= americaCurrencies[keys[i]];
        converted= double.parse(currency.text )* (value!);
         setState(() {});
         return;
      }
    }
    }
    else{
      var keys= japanCurrencies.keys.toList();
    for (var i = 0; i < keys.length; i++) {
      // log(keys[i]);
      if (keys[i]==to){
        var value= japanCurrencies[keys[i]];
        converted= double.parse(currency.text )* (value!);
         setState(() {});
         return;
      }
    }
    }
  }


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.all(8),
            padding: const EdgeInsets.all(5.0),
            child: Form(
              key: _key,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Align(
                    alignment: Alignment.topRight,
                    child: Text(
                      'Contact',
                      style: TextStyle(color: Colors.green, fontSize: 25),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    'CURRENCY CONVERTER',
                    style: TextStyle(color: Colors.blue.shade900, fontSize: 35),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    'From',
                    style: TextStyle(color: Colors.black, fontSize: 25),
                  ),
                  const SizedBox(height: 5),
                  Container(
                    width: 350,
                    height: 54,
                    margin: const EdgeInsets.all(8),
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    decoration: BoxDecoration(
                        border: Border.all(),
                        borderRadius: BorderRadius.circular(14)),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton<String>(
                        hint:const Text('Select'),
                        iconSize: 45,
                        items: items.map(
                          (country) {
                            return DropdownMenuItem<String>(
                              child: Text(country),
                              value: country,
                            );
                          },
                        ).toList(),
                        value: from,
                        elevation: 16,
                        onChanged: (va) {
                          setState(() {
                            from = va!;
                          });
                        },
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  const Text(
                    'To',
                    style: TextStyle(color: Colors.black, fontSize: 25),
                  ),
                  const SizedBox(height: 5),
                  Container(
                    width: 350,
                    height: 54,
                    margin: const EdgeInsets.all(8),
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      border: Border.all(),
                      borderRadius: BorderRadius.circular(14),
                    ),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton<String>(
                        iconSize: 45,
                        items: items
                            .map(
                              (country) => DropdownMenuItem<String>(
                                child: Text(country),
                                value: country,
                              ),
                            )
                            .toList(),
                        value: to,
                        elevation: 16,
                        onChanged: (va) {
                          setState(() {
                            to = va!;
                          });
                        },
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  TextFormField(
                    decoration:InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15)
                        ), hintText: 'Amount'),
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter a value';
                      }
                    },
                    controller: currency,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Container(
                    height: 60,
                    width: 900,
                    margin:
                        const EdgeInsets.symmetric(horizontal: 50, vertical: 25),
                    child: ElevatedButton(
                       onPressed: () {
                         if (_key.currentState!.validate()) {
                          fun();
                        }
                      },
                      child: const Text(
                        'Convert',
                        style:
                            TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
                      ),
                      style: ElevatedButton.styleFrom(
                          primary: Colors.green,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 70, vertical: 15),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15))),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  const Text(
                    'Result',
                    style: TextStyle(fontSize: 20),
                  ),
                  Container(
                      width: 350,
                      height: 100,
                      margin: const EdgeInsets.all(8),
                      padding: const EdgeInsets.all(14),
                      decoration: BoxDecoration(
                          border: Border.all(),
                          borderRadius: BorderRadius.circular(14)),
                      child: Text(
                        'Converted Amount: $converted',
                        textAlign: TextAlign.center,
                        style: const TextStyle(fontSize: 16),
                      )),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
