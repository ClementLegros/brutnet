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
  /* -- controller -- */
  final myHoraireBrutController = TextEditingController();
  final myHoraireNetController = TextEditingController();
  final myMensuelBrutController = TextEditingController();
  final myMensuelNetController = TextEditingController();
  final myAnnuelBrutController = TextEditingController();
  final myAnnuelNetController = TextEditingController();
  final myMensuelNetApresImpotController = TextEditingController();
  final myAnnuelNetApresImpotController = TextEditingController();

  /* -- variable -- */

  //Le statut de base est non cadre
  String statut = "Non-cadre-22%";
  //La valeur est 1 car le statut est cadre de base
  int _statutVal = 1;
  //La valeut est 1 car le nombre de mois de prime est généralement de 12
  int _moisPrimeVal = 1;

  //La valeur est 100 car le temps de travail est généralement de 100%
  double _tempsSliderValue = 100;
  //la valeur est de 0 car voila
  double _prelevementSliderValue = 0;

  /* -- function -- */


  void UpdateTempsDeTravail(value)
  {
    setState(() {
      _tempsSliderValue = value;
    });
    //Il faut mettre à jour les salaires étant donné que le temps de travail diffère
    //On teste donc si des valeurs ont déjà était rentrer dans les inputText
    if(myMensuelBrutController.text != null)
    {
      int pourcentage = 100 - int.parse(value);
      double salaireActu = double.parse(myMensuelBrutController.text);
      double nouveauSalaire = salaireActu - (pourcentage/100 * salaireActu);
      myMensuelBrutController.text = nouveauSalaire.toString();
      calculDuSalaire(myMensuelBrutController.text ,"brut","m");
    }
  }

  //On créer une fonction pour update le statut car le statut est passé à d'autre widget et
  //doit être final, cependant une variable final ne peux pas être modifier donc on ruse
  //En passant une fonction qui permet de modifier le chiffre
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

  //Permet de vider le text de tout les TextInput
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

  //Dans cette fonction on calcul le salaire en fonction de 3 critères
  //brut net définis si la valeur est du brut ou du net et jma si c'est journalier, mensuel ou annuel
  void calculDuSalaire(input, brutnet, hma) {

    var value = double.tryParse(input);
    if (value == null) {
      //Modifier pour enlever si c'est de l'alpha
      clearAllField();
      return;
    }

    //On récupère le pourcentage du statut en fonction de la valeur actuelle
    //de la checkbox
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
        //On change les text ici pour éviter d'altérer le tapper,
        //car si tout les champs sont mis à la fin lorsque l'on tappera sur n'importe quel champs,
        //il mettra à jour celui dans lequel on tape
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
        //On change les text ici pour éviter d'altérer le tapper,
        //car si tout les champs sont mis à la fin lorsque l'on tappera sur n'importe quel champs,
        //il mettra à jour celui dans lequel on tape
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
        //On change les text ici pour éviter d'altérer le tapper,
        //car si tout les champs sont mis à la fin lorsque l'on tappera sur n'importe quel champs,
        //il mettra à jour celui dans lequel on tape
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
        //On change les text ici pour éviter d'altérer le tapper,
        //car si tout les champs sont mis à la fin lorsque l'on tappera sur n'importe quel champs,
        //il mettra à jour celui dans lequel on tape
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
        //On change les text ici pour éviter d'altérer le tapper,
        //car si tout les champs sont mis à la fin lorsque l'on tappera sur n'importe quel champs,
        //il mettra à jour celui dans lequel on tape
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
        //On change les text ici pour éviter d'altérer le tapper,
        //car si tout les champs sont mis à la fin lorsque l'on tappera sur n'importe quel champs,
        //il mettra à jour celui dans lequel on tape
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

  //Change l'intitulé en fonction de la CheckBox coché
  //Index représente la valeur de la check box qui est traduit en string dans le switch
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
    return Scaffold(
        body: Responsive(
      mobile: MyHomePageMobile(),
      tablet: MyHomePageTablet(),
      desktop: MyHomePageWeb(
        //On passe les fonctions au widget
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