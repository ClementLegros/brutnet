import 'package:flutter/material.dart';

class RightPart extends StatefulWidget {
  //Variable

  const RightPart({Key? key}) : super(key: key);

  @override
  State<RightPart> createState() => _RightPartState();
}

class _RightPartState extends State<RightPart> {
  int _moisPrimeVal = 0;
  double _tempsSliderValue = 100;
  double _prelevementSliderValue = 100;

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
                "SELECTIONNEZ VOTRE TEMPS DE TRAVAIL : " +
                    _tempsSliderValue.toString() +
                    "%",
                style: const TextStyle(color: Colors.white))
          ],
        ),
        const Spacer(),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Slider(
              max: 100,
              thumbColor: Colors.white,
              inactiveColor: Colors.white,
              divisions: 10,
              activeColor: Colors.white,
              value: _tempsSliderValue,
              onChanged: (double value) {
                setState(() {
                  _tempsSliderValue = value;
                });
              },
            )
          ],
        ),
        const Spacer(),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: const [
            Text(
              "SELECTIONNEZ LE NOMBRE DE MOIS DE PRIME CONVENTIONNELLE:",
              style: TextStyle(color: Colors.white),
            )
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Expanded(
              child: Container(
                height: 100,
                width: 700,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  children: [
                    Expanded(
                        child: SizedBox(
                      height: 200,
                      width: 200,
                      child: ListTile(
                        title: const Text('12 mois'),
                        leading: Radio(
                          value: 1,
                          groupValue: _moisPrimeVal,
                          onChanged: (value) {
                            setState(() {
                              _moisPrimeVal = int.parse(value.toString());
                            });
                          },
                        ),
                      ),
                    )),
                    Expanded(
                        child: SizedBox(
                      height: 200,
                      width: 200,
                      child: ListTile(
                        title: const Text('13 mois'),
                        leading: Radio(
                          value: 2,
                          groupValue: _moisPrimeVal,
                          onChanged: (value) {
                            setState(() {
                              _moisPrimeVal = int.parse(value.toString());
                            });
                          },
                        ),
                      ),
                    )),
                    Expanded(
                        child: SizedBox(
                      height: 200,
                      width: 200,
                      child: ListTile(
                        title: const Text('14 mois'),
                        leading: Radio(
                          value: 3,
                          groupValue: _moisPrimeVal,
                          onChanged: (value) {
                            setState(() {
                              _moisPrimeVal = int.parse(value.toString());
                            });
                          },
                        ),
                      ),
                    )),
                    Expanded(
                        child: SizedBox(
                      height: 200,
                      width: 200,
                      child: ListTile(
                        title: const Text('15 mois'),
                        leading: Radio(
                          value: 4,
                          groupValue: _moisPrimeVal,
                          onChanged: (value) {
                            setState(() {
                              _moisPrimeVal = int.parse(value.toString());
                            });
                          },
                        ),
                      ),
                    )),
                    Expanded(
                        child: SizedBox(
                      height: 200,
                      width: 200,
                      child: ListTile(
                        title: const Text('16 mois'),
                        leading: Radio(
                          value: 5,
                          groupValue: _moisPrimeVal,
                          onChanged: (value) {
                            setState(() {
                              //_moisPrimeVal =
                              int.parse(value.toString());
                            });
                          },
                        ),
                      ),
                    )),
                  ],
                ),
              ),
            )
          ],
        ),
        const Spacer(),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: const [
            Text(
              "SELECTIONNEZ LE NOMBRE DE MOIS DE PRIME CONVENTIONNELLE:",
              style: TextStyle(color: Colors.white),
            )
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Slider(
              max: 100,
              thumbColor: Colors.white,
              inactiveColor: Colors.white,
              divisions: 10,
              activeColor: Colors.white,
              value: _prelevementSliderValue,
              onChanged: (double value) {
                setState(() {
                  _prelevementSliderValue = value;
                });
              },
            )
          ],
        ),
        const Spacer(),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: const [
            Text(
              "ESTIMATION DE VOTRE SALAIRE NET APRES LE PRELEVEMENT A LA SOURCE",
              style: TextStyle(color: Colors.white),
            )
          ],
        ),
        const Spacer(),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: const [
            Text("Annuel Brut",
                style: TextStyle(color: Colors.white)),
            Text("Annuel Net",
                style: TextStyle(color: Colors.white))
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: TextField(
                //controller: myHoraireBrutController,
                decoration: const InputDecoration(
                  hintText: "ex:9.38",
                  border: InputBorder.none,
                ),
              ),
            ),
            Container(
                height: 50,
                width: 200,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const TextField(
                  decoration: InputDecoration(
                    hintText: "ex:9.38",
                    border: InputBorder.none,
                  ),
                ))
          ],
        ),
        const Spacer(),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            FloatingActionButton(
              onPressed: () {
                //Remettre à 0 les champs
                //clearAllField();
              },
              child: const Text(
                "Reset",
                style: TextStyle(color: Colors.grey),
              ),
              backgroundColor: Colors.white,
            )
          ],
        )
      ],
    ));
  }
}
