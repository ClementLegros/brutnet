import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  //Controller
  final myHoraireBrutController = TextEditingController();
  final myHoraireNetController = TextEditingController();
  final myMensuelBrutController = TextEditingController();
  final myMensuelNetController = TextEditingController();
  final myAnnuelBrutController = TextEditingController();
  final myAnnuelNetController = TextEditingController();

  final myMensuelNetApresImpotController = TextEditingController();
  final myAnnuelNetApresImpotController = TextEditingController();

  //Le statut de base est non cadre
  String statut = "Non-cadre-22%";
  //La valeur est 1 car le statut est cadre de base
  int _statutVal = 1;
  int _moisPrimeVal = 1;
  //Slider
  double _tempsSliderValue = 100;
  double _prelevementSliderValue = 0;

  //function

  void clearAllField()
  {
    myHoraireBrutController.text = "";
    myHoraireNetController.text = "";
    myMensuelBrutController.text = "";
    myMensuelNetController.text = "";
    myAnnuelBrutController.text = "";
    myAnnuelNetController.text = "";

    myMensuelNetApresImpotController.text = "";
    myAnnuelNetApresImpotController.text = "";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Scaffold(
        body: Row(
          children: [
            Container(
              height: 500,
              width: 800,
              margin: const EdgeInsets.all(20),
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                  color: Colors.redAccent,
                  borderRadius: BorderRadius.circular(20),
                  gradient: const LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [Colors.redAccent, Colors.deepOrangeAccent])),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: const [
                      Text("INDIQUEZ VOTRE SALAIRE BRUT",
                          style: TextStyle(color: Colors.white)),
                      Text("INDIQUEZ VOTRE SALAIRE NET",
                          style: TextStyle(color: Colors.white))
                    ],
                  ),
                  const Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: const [
                      Text("Horaire Brut",
                          style: TextStyle(color: Colors.white)),
                      Text("Horaire Net", style: TextStyle(color: Colors.white))
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        height: 50,
                        width: 200,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: TextField(
                          controller: myHoraireBrutController,
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
                  Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: const [
                      Text("Mensuel Brut",
                          style: TextStyle(color: Colors.white)),
                      Text("Mensuel Net", style: TextStyle(color: Colors.white))
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        height: 50,
                        width: 200,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: TextField(
                          controller: myHoraireBrutController,
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
                  Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: const [
                      Text("Annuel Brut",
                          style: TextStyle(color: Colors.white)),
                      Text("Annuel Net", style: TextStyle(color: Colors.white))
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        height: 50,
                        width: 200,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: TextField(
                          controller: myHoraireBrutController,
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
                    children: const [
                      Text("SELECTIONNEZ VOTRE STATUT :",
                      style: TextStyle(color: Colors.white),)
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
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
                                  child:ListTile(
                                    title: const Text('Salarié non cadre'),
                                    leading: Radio(
                                      value: 1,
                                      groupValue: _statutVal,
                                      onChanged: (value) {
                                        setState(() {
                                          _statutVal = int.parse(value.toString());
                                        });
                                      },
                                    ),
                                  ),
                                )
                            ),
                            Expanded(
                                child: SizedBox(
                                  height: 200,
                                  width: 200,
                                  child:ListTile(
                                    title: const Text('Salarié non cadre'),
                                    leading: Radio(
                                      value: 2,
                                      groupValue: _statutVal,
                                      onChanged: (value) {
                                        setState(() {
                                          _statutVal = int.parse(value.toString());
                                        });
                                      },
                                    ),
                                  ),
                                )
                            ),
                            Expanded(
                                child: SizedBox(
                                  height: 200,
                                  width: 200,
                                  child:ListTile(
                                    title: const Text('Salarié non cadre'),
                                    leading: Radio(
                                      value: 3,
                                      groupValue: _statutVal,
                                      onChanged: (value) {
                                        setState(() {
                                          _statutVal = int.parse(value.toString());
                                        });
                                      },
                                    ),
                                  ),
                                )
                            ),
                            Expanded(
                                child: SizedBox(
                                  height: 200,
                                  width: 200,
                                  child:ListTile(
                                    title: const Text('Salarié non cadre'),
                                    leading: Radio(
                                      value: 4,
                                      groupValue: _statutVal,
                                      onChanged: (value) {
                                        setState(() {
                                          _statutVal = int.parse(value.toString());
                                        });
                                      },
                                    ),
                                  ),
                                )
                            ),
                            Expanded(
                                child: SizedBox(
                                  height: 200,
                                  width: 200,
                                  child:ListTile(
                                    title: const Text('Salarié non cadre'),
                                    leading: Radio(
                                      value: 5,
                                      groupValue: _statutVal,
                                      onChanged: (value) {
                                        setState(() {
                                          _statutVal = int.parse(value.toString());
                                        });
                                      },
                                    ),
                                  ),
                                )
                            ),
                          ],
                        ),

                      ),
                    ],
                  )
                ],
              ),
            ),
            //PARTIE DROIT
            Container(
              height: 500,
              width: 800,
              margin: const EdgeInsets.all(20),
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                  color: Colors.redAccent,
                  borderRadius: BorderRadius.circular(20),
                  gradient: const LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [Colors.redAccent, Colors.deepOrangeAccent])),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text("SELECTIONNEZ VOTRE TEMPS DE TRAVAIL : " + _tempsSliderValue.toString()+"%",
                          style: TextStyle(color: Colors.white))
                    ],
                  ),
                  const Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Slider(
                        max:100,
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
                    children: [
                      Text("SELECTIONNEZ LE NOMBRE DE MOIS DE PRIME CONVENTIONNELLE:",
                      style: TextStyle(color: Colors.white),)
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
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
                                  child:ListTile(
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
                                )
                            ),
                            Expanded(
                                child: SizedBox(
                                  height: 200,
                                  width: 200,
                                  child:ListTile(
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
                                )
                            ),
                            Expanded(
                                child: SizedBox(
                                  height: 200,
                                  width: 200,
                                  child:ListTile(
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
                                )
                            ),
                            Expanded(
                                child: SizedBox(
                                  height: 200,
                                  width: 200,
                                  child:ListTile(
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
                                )
                            ),
                            Expanded(
                                child: SizedBox(
                                  height: 200,
                                  width: 200,
                                  child:ListTile(
                                    title: const Text('16 mois'),
                                    leading: Radio(
                                      value: 5,
                                      groupValue: _moisPrimeVal,
                                      onChanged: (value) {
                                        setState(() {
                                          _moisPrimeVal = int.parse(value.toString());
                                        });
                                      },
                                    ),
                                  ),
                                )
                            ),
                          ],
                        ),

                      ),
                    ],
                  ),
                  const Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text("SELECTIONNEZ LE NOMBRE DE MOIS DE PRIME CONVENTIONNELLE:",
                      style: TextStyle(color: Colors.white),)
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Slider(
                        max:100,
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
                    children: [
                      Text("ESTIMATION DE VOTRE SALAIRE NET APRES LE PRELEVEMENT A LA SOURCE",
                        style: TextStyle(color: Colors.white),)
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: const [
                      Text("Annuel Brut",
                          style: TextStyle(color: Colors.white)),
                      Text("Annuel Net", style: TextStyle(color: Colors.white))
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        height: 50,
                        width: 200,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: TextField(
                          controller: myHoraireBrutController,
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      FloatingActionButton(
                          onPressed: (){
                            //Remettre à 0 les champs
                          },
                        child: const Text("Reset", style: TextStyle(color: Colors.grey),),
                        backgroundColor: Colors.white,
                      )
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
