import 'package:brutnet/Page/HomePageMobile.dart';
import 'package:brutnet/Page/HomePageTablet.dart';
import 'package:brutnet/Page/HomePageWeb.dart';
import 'package:brutnet/Util/BrutNetUtil.dart';
import 'package:brutnet/responsive.dart';
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

  void updateStatutVal(value)
  {
    setState(() {
      _statutVal = value;
    });
    //On regarde si l'une des zones de texte est vide, et si elle ne l'ait pas alors on va venir mettre
    //a jour tout les champs de l'application en appelant la fonction calculDuSalaire
    if(myMensuelBrutController.text != null)
      {
        calculDuSalaire(myMensuelBrutController.text ,"brut","m");
      }
  }

  void clearAllField() {
    myHoraireBrutController.text = "";
    myHoraireNetController.text = "";
    myMensuelBrutController.text = "";
    myMensuelNetController.text = "";
    myAnnuelBrutController.text = "";
    myAnnuelNetController.text = "";

    myMensuelNetApresImpotController.text = "";
    myAnnuelNetApresImpotController.text = "";
  }

  //brut net définis si la valeur est du brut ou du net et jma si c'est journalier, mensuel ou annuel
  void calculDuSalaire(input, brutnet, hma) {
    var value = double.tryParse(input);
    if (value == null) {
      clearAllField();
      return;
    }
    int statut = 0;
    switch(_statutVal)
    {
      case 1:
        statut = 22;
        break;
      case 2:
        statut = 25;
        break;
      case 3:
        statut = 15;
        break;
      case 4:
        statut = 45;
        break;
      case 5:
        statut = 51;
        break;
    }

    //Initialisation des variables
    double horaireBrut = 0;
    double horaireNet = 0;
    double mensuelBrut = 0;
    double mensuelNet = 0;
    double annuelBrut = 0;
    double annuelNet = 0;

    if (brutnet == "brut") {
      if (hma == "h") {
        //On calcul toute les valeurs brut
        horaireBrut = value.roundToDouble();
        mensuelBrut = calculSalaireMensuelFromHoraire(horaireBrut);
        annuelBrut = calculMensuelToAnnuel(mensuelBrut);
        //On calcule tout les valeurs en net
        horaireNet = calculBrutToNet(horaireBrut, statut);
        mensuelNet = calculBrutToNet(mensuelBrut, statut);
        annuelNet = calculBrutToNet(annuelBrut, statut);

        myHoraireNetController.text = horaireNet.toString();
        myMensuelBrutController.text = mensuelBrut.toString();
        myMensuelNetController.text = mensuelNet.toString();
        myAnnuelBrutController.text = annuelBrut.toString();
        myAnnuelNetController.text = annuelNet.toString();
      } else if (hma == "m") {
        //On calcul toute les valeurs brut
        mensuelBrut = value;
        annuelBrut = calculMensuelToAnnuel(mensuelBrut);
        horaireBrut =
            calculSalaireHoraireFromMensuel(mensuelBrut).roundToDouble();
        //On calcule tout les valeurs en net
        horaireNet = calculBrutToNet(horaireBrut, statut);
        mensuelNet = calculBrutToNet(mensuelBrut, statut);
        annuelNet = calculBrutToNet(annuelBrut, statut);

        myHoraireBrutController.text = horaireBrut.toString();
        myHoraireNetController.text = horaireNet.toString();
        myMensuelNetController.text = mensuelNet.toString();
        myAnnuelBrutController.text = annuelBrut.toString();
        myAnnuelNetController.text = annuelNet.toString();
      } else if (hma == "a") {
        //On calcul toute les valeurs brut
        annuelBrut = value;
        mensuelBrut = calculAnnuelToMensuel(annuelBrut);
        horaireBrut =
            calculSalaireHoraireFromMensuel(mensuelBrut).roundToDouble();
        //On calcule tout les valeurs en net
        horaireNet = calculBrutToNet(horaireBrut, statut);
        mensuelNet = calculBrutToNet(mensuelBrut, statut);
        annuelNet = calculBrutToNet(annuelBrut, statut);

        myHoraireBrutController.text = horaireBrut.toString();
        myHoraireNetController.text = horaireNet.toString();
        myMensuelBrutController.text = mensuelBrut.toString();
        myMensuelNetController.text = mensuelNet.toString();
        myAnnuelNetController.text = annuelNet.toString();
      }
    } else if (brutnet == "net") {
      if (hma == "h") {
        //On calcul toute les valeurs brut
        horaireNet = value.roundToDouble();
        mensuelNet = calculSalaireMensuelFromHoraire(horaireNet);
        annuelNet = calculMensuelToAnnuel(mensuelNet);
        //On calcule tout les valeurs en net
        horaireBrut = calculNetToBrut(horaireNet, statut);
        mensuelBrut = calculNetToBrut(mensuelNet, statut);
        annuelBrut = calculNetToBrut(annuelNet, statut);

        myHoraireBrutController.text = horaireBrut.toString();
        myMensuelBrutController.text = mensuelBrut.toString();
        myMensuelNetController.text = mensuelNet.toString();
        myAnnuelBrutController.text = annuelBrut.toString();
        myAnnuelNetController.text = annuelNet.toString();
      } else if (hma == "m") {
        //On calcul toute les valeurs brut
        mensuelNet = value;
        annuelNet = calculMensuelToAnnuel(mensuelNet);
        horaireNet =
            calculSalaireHoraireFromMensuel(mensuelNet).roundToDouble();
        //On calcule tout les valeurs en net
        horaireBrut = calculNetToBrut(horaireNet, statut);
        mensuelBrut = calculNetToBrut(mensuelNet, statut);
        annuelBrut = calculNetToBrut(annuelNet, statut);

        myHoraireBrutController.text = horaireBrut.toString();
        myHoraireNetController.text = horaireNet.toString();
        myMensuelBrutController.text = mensuelBrut.toString();
        myAnnuelBrutController.text = annuelBrut.toString();
        myAnnuelNetController.text = annuelNet.toString();
      } else if (hma == "a") {
        //On calcul toute les valeurs brut
        annuelNet = value;
        mensuelNet = calculAnnuelToMensuel(annuelNet);
        horaireNet =
            calculSalaireHoraireFromMensuel(mensuelNet).roundToDouble();
        //On calcule tout les valeurs en net
        horaireBrut = calculNetToBrut(horaireNet, statut);
        mensuelBrut = calculNetToBrut(mensuelNet, statut);
        annuelBrut = calculNetToBrut(annuelNet, statut);

        myHoraireBrutController.text = horaireBrut.toString();
        myHoraireNetController.text = horaireNet.toString();
        myMensuelBrutController.text = mensuelBrut.toString();
        myMensuelNetController.text = mensuelNet.toString();
        myAnnuelBrutController.text = annuelBrut.toString();
      }
    }

    //A modifier
    myMensuelNetApresImpotController.text = mensuelNet.toString();
    myAnnuelNetApresImpotController.text = annuelNet.toString();
  }

  void changeStatut(index) {
    switch (index) {
      case 1:
        statut = "Non-cadre-22%";
        break;
      case 2:
        statut = "Cadre-25%";
        break;
      case 3:
        statut = "Public-15%";
        break;
      case 4:
        statut = "Indé-45%";
        break;
      case 5:
        statut = "Port-51%";
        break;
      default:
        statut = "Inconnu";
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;
    return Scaffold(
        body: Responsive(
      mobile: MyHomePageMobile(),
      tablet: MyHomePageTablet(),
      desktop: MyHomePageWeb(
        calculSalaire: calculDuSalaire,
        myHoraireBrutController: myHoraireBrutController,
        myMensuelBrutController: myMensuelBrutController,
        myAnnuelBrutController: myAnnuelBrutController,
        myHoraireNetController: myHoraireNetController,
        myMensuelNetController: myMensuelNetController,
        myAnnuelNetController: myAnnuelNetController,
        updateStatutVal: updateStatutVal,
        statutVal: _statutVal,
      ),
    ));
  }
}

/*

return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Scaffold(
        backgroundColor: Colors.black87,
        body: Row(
          children: [
            Expanded(
              flex: 5,
              child: Container(
                margin: const EdgeInsets.all(20),
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                    color: Colors.redAccent,
                    borderRadius: BorderRadius.circular(20),
                    gradient: const LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.black,
                          Colors.black54,
                          Colors.black87
                        ])),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: const [
                        Text("INDIQUEZ VOTRE SALAIRE BRUT",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 20)),
                        Text("INDIQUEZ VOTRE SALAIRE NET",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 20))
                      ],
                    ),
                    const Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: const [
                        Text("Horaire Brut",
                            style:
                                TextStyle(color: Colors.white, fontSize: 20)),
                        Text("Horaire Net",
                            style: TextStyle(color: Colors.white, fontSize: 20))
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Expanded(
                          flex: 1000,
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: TextField(
                              controller: myHoraireBrutController,
                              onChanged: (text) {
                                //On récupère le pourcentage du statut
                                int statut = checkStatut(_statutVal);
                                calculDuSalaire(text, "brut", "h", statut);
                              },
                              decoration: const InputDecoration(
                                hintText: "ex:9.38 //Horaire Brut",
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                            flex: 1000,
                            child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: TextField(
                                  controller: myHoraireNetController,
                                  onChanged: (text) {
                                    //On récupère le pourcentage du statut
                                    int statut = checkStatut(_statutVal);
                                    calculDuSalaire(text, "net", "h", statut);
                                  },
                                  decoration: const InputDecoration(
                                    hintText: "ex:9.38 //Horaire Net",
                                    border: InputBorder.none,
                                  ),
                                )))
                      ],
                    ),
                    const Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text("Mensuel Brut (" + statut + ")",
                            style: const TextStyle(
                                color: Colors.white, fontSize: 20)),
                        const Text("Mensuel Net",
                            style: TextStyle(color: Colors.white, fontSize: 20))
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: TextField(
                              controller: myMensuelBrutController,
                              onChanged: (text) {
                                //On récupère le pourcentage du statut
                                int statut = checkStatut(_statutVal);
                                calculDuSalaire(text, "brut", "m", statut);
                              },
                              decoration: const InputDecoration(
                                hintText: "ex:9.38 //Mensuel Brut",
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                            child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: TextField(
                                  controller: myMensuelNetController,
                                  onChanged: (text) {
                                    //On récupère le pourcentage du statut
                                    int statut = checkStatut(_statutVal);
                                    calculDuSalaire(text, "net", "m", statut);
                                  },
                                  decoration: const InputDecoration(
                                    hintText: "ex:9.38 //Mensuel Net",
                                    border: InputBorder.none,
                                  ),
                                )))
                      ],
                    ),
                    const Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: const [
                        Text("Annuel Brut",
                            style:
                                TextStyle(color: Colors.white, fontSize: 20)),
                        Text("Annuel Net",
                            style: TextStyle(color: Colors.white, fontSize: 20))
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: TextField(
                              controller: myAnnuelBrutController,
                              onChanged: (text) {
                                //On récupère le pourcentage du statut
                                int statut = checkStatut(_statutVal);
                                calculDuSalaire(text, "brut", "a", statut);
                              },
                              decoration: const InputDecoration(
                                hintText: "ex:9.38 //Annuel Brut",
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: TextField(
                                controller: myAnnuelNetController,
                                onChanged: (text) {
                                  //On récupère le pourcentage du statut
                                  int statut = checkStatut(_statutVal);
                                  calculDuSalaire(text, "net", "a", statut);
                                },
                                decoration: const InputDecoration(
                                  hintText: "ex:9.38 //Annuel Net",
                                  border: InputBorder.none,
                                ),
                              )),
                        )
                      ],
                    ),
                    const Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: const [
                        Text(
                          "SELECTIONNEZ VOTRE STATUT :",
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Row(
                              children: [
                                Expanded(
                                    child: SizedBox(
                                  child: ListTile(
                                    title: const Text('non cadre'),
                                    leading: Radio(
                                      value: 1,
                                      groupValue: _statutVal,
                                      onChanged: (value) {
                                        setState(() {
                                          _statutVal =
                                              int.parse(value.toString());
                                          changeStatut(value);
                                        });
                                      },
                                    ),
                                  ),
                                )),
                                Expanded(
                                    child: SizedBox(
                                  child: ListTile(
                                    title: const Text('cadre'),
                                    leading: Radio(
                                      value: 2,
                                      groupValue: _statutVal,
                                      onChanged: (value) {
                                        setState(() {
                                          _statutVal =
                                              int.parse(value.toString());
                                          changeStatut(value);
                                        });
                                      },
                                    ),
                                  ),
                                )),
                                Expanded(
                                    child: SizedBox(
                                  child: ListTile(
                                    title: const Text('Fonction publique'),
                                    leading: Radio(
                                      value: 3,
                                      groupValue: _statutVal,
                                      onChanged: (value) {
                                        setState(() {
                                          _statutVal =
                                              int.parse(value.toString());
                                          changeStatut(value);
                                        });
                                      },
                                    ),
                                  ),
                                )),
                                Expanded(
                                    child: SizedBox(
                                  child: ListTile(
                                    title: const Text('libérale'),
                                    leading: Radio(
                                      value: 4,
                                      groupValue: _statutVal,
                                      onChanged: (value) {
                                        setState(() {
                                          _statutVal =
                                              int.parse(value.toString());
                                          changeStatut(value);
                                        });
                                      },
                                    ),
                                  ),
                                )),
                                Expanded(
                                    child: SizedBox(
                                  child: ListTile(
                                    title: const Text('Portage salarial'),
                                    leading: Radio(
                                      value: 5,
                                      groupValue: _statutVal,
                                      onChanged: (value) {
                                        setState(() {
                                          _statutVal =
                                              int.parse(value.toString());
                                          changeStatut(value);
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
                    )
                  ],
                ),
              ),
            ),
            //PARTIE DROIT
            Expanded(
              flex: 5,
              child: Container(
                margin: const EdgeInsets.all(20),
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                    color: Colors.redAccent,
                    borderRadius: BorderRadius.circular(20),
                    gradient: const LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.black,
                          Colors.black54,
                          Colors.black87
                        ])),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                            "SELECTIONNEZ VOTRE TEMPS DE TRAVAIL : " +
                                _tempsSliderValue.toString() +
                                "%",
                            style: const TextStyle(
                                color: Colors.white, fontSize: 20))
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
                          style: TextStyle(color: Colors.white, fontSize: 20),
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
                                          _moisPrimeVal =
                                              int.parse(value.toString());
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
                                          _moisPrimeVal =
                                              int.parse(value.toString());
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
                                          _moisPrimeVal =
                                              int.parse(value.toString());
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
                                          _moisPrimeVal =
                                              int.parse(value.toString());
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
                                          _moisPrimeVal =
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
                          style: TextStyle(color: Colors.white, fontSize: 20),
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
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        )
                      ],
                    ),
                    const Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: const [
                        Text("Annuel Brut",
                            style:
                                TextStyle(color: Colors.white, fontSize: 20)),
                        Text("Annuel Net",
                            style: TextStyle(color: Colors.white, fontSize: 20))
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Expanded(
                          child: Container(
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
                        ),
                        Expanded(
                            child: Container(
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
                                )))
                      ],
                    ),
                    const Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        FloatingActionButton(
                          onPressed: () {
                            //Remettre à 0 les champs
                            clearAllField();
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
                ),
              ),
            )
          ],
        ),
      ),
    );

 */
