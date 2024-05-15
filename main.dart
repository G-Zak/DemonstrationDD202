import 'package:flutter/material.dart';

void main() {
  runApp(IMCApp());
}

class IMCApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('IMC Calculator'),
        ),
        body: IMCCalculator(),
      ),
    );
  }
}

class IMCCalculator extends StatefulWidget {
  @override
  _IMCCalculatorState createState() => _IMCCalculatorState();
}

class _IMCCalculatorState extends State<IMCCalculator> {
  TextEditingController poidsController = TextEditingController();
  TextEditingController tailleController = TextEditingController();
  double imcResult = 0;
  String category = '';

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(height: 20),
          Image.asset(
            'assets/images/avatar.png', // Provide your image path
            height: 200,
            width: 200,
            fit: BoxFit.cover,
          ),
          SizedBox(height: 20),
          TextField(
            controller: poidsController,
            decoration: InputDecoration(
              labelText: 'Poids (kg)',
            ),
            keyboardType: TextInputType.number,
          ),
          SizedBox(height: 10),
          TextField(
            controller: tailleController,
            decoration: InputDecoration(
              labelText: 'Taille (cm)',
            ),
            keyboardType: TextInputType.number,
          ),
          SizedBox(height: 10),
          Row(
            children: [
              Expanded(
                child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      calculateIMC();
                    });
                  },
                  child: Text('Calculer'),
                ),
              ),
              SizedBox(width: 10),
              Expanded(
                child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      poidsController.text = '';
                      tailleController.text = '';
                      imcResult = 0;
                      category = '';
                    });
                  },
                  child: Text('Supprimer'),
                ),
              ),
            ],
          ),
          SizedBox(height: 20),
          Text(
            'IMC: ${imcResult.toStringAsFixed(2)}',
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 10),
          Text(
            'Catégorie: $category',
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  void calculateIMC() {
    double poids = double.parse(poidsController.text);
    double taille = double.parse(tailleController.text) / 100;
    double imc = poids / (taille * taille);
    imcResult = imc;

    if (imc < 20) {
      category = 'Maigre';
    } else if (imc < 22) {
      category = 'Normale';
    } else {
      category = 'Obèse';
    }
  }
}

