import 'package:flutter/material.dart';

import '../../constants.dart';
import '../charts/charts.dart';

class Product {
  String name;
  bool enable;
  Product({this.enable = true, required this.name});
}

class PanelRightPage extends StatefulWidget {
  @override
  _PanelRightPageState createState() => _PanelRightPageState();
}

class _PanelRightPageState extends State<PanelRightPage> {
  List<Product> _products = [
    Product(name: "LED Submersible Lights", enable: true),
    Product(name: "Portable Projector", enable: true),
    Product(name: "Bluetooth Speaker", enable: true),
    Product(name: "Smart Watch", enable: true),
    Product(name: "Temporary Tattoos", enable: true),
    Product(name: "Bookends", enable: true),
    Product(name: "Vegetable Chopper", enable: true),
    Product(name: "Neck Massager", enable: true),
    Product(name: "Facial Cleanser", enable: true),
    Product(name: "Back Cushion", enable: true),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                  right: Constants.kPadding / 2,
                  top: Constants.kPadding / 2,
                  left: Constants.kPadding / 2),
              child: Card(
                elevation: 3,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50),
                ),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    gradient: LinearGradient(
                      colors: [
                        Constants.red.withOpacity(0.9),
                        Constants.orange.withOpacity(0.9),
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                  ),
                  width: double.infinity,
                  child: ListTile(
                    //leading: Icon(Icons.monetization_on),
                    title: Text(
                      "Net Revenue",
                      style: TextStyle(color: Colors.white),
                    ),
                    subtitle: Text(
                      "7% of Sales Avg.",
                      style: TextStyle(color: Colors.white),
                    ),
                    trailing: Chip(
                      label: Text(
                        r"$46,450",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  right: Constants.kPadding / 2,
                  bottom: Constants.kPadding,
                  top: Constants.kPadding,
                  left: Constants.kPadding / 2),
              child: Card(
                elevation: 3,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50)),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    gradient: LinearGradient(
                      colors: [
                        Constants.red.withOpacity(0.9),
                        Constants.orange.withOpacity(0.9),
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                  ),
                  child: Column(
                    children: List.generate(
                      _products.length,
                      (index) => SwitchListTile.adaptive(
                        title: Text(
                          _products[index].name,
                          style: TextStyle(color: Colors.white),
                        ),
                        value: _products[index].enable,
                        onChanged: (newValue) {
                          setState(() {
                            _products[index].enable = newValue;
                          });
                        },
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
