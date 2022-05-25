import 'package:brutnet/Widget/SalaireBrutColumn.dart';
import 'package:brutnet/Widget/SelectionStatut.dart';
import 'package:brutnet/Widget/salaireNetColumn.dart';
import 'package:flutter/material.dart';

import '../Widget/RightPart.dart';

class MyHomePageWeb extends StatefulWidget {
  //Variable
  final calculSalaire;
  final myHoraireBrutController;
  final myMensuelBrutController;
  final myAnnuelBrutController;

  final myHoraireNetController;
  final myMensuelNetController;
  final myAnnuelNetController;

  final updateStatutVal;
  final statutVal;

  const MyHomePageWeb(
      {Key? key,
      this.calculSalaire,
      this.myHoraireBrutController,
      this.myMensuelBrutController,
      this.myAnnuelBrutController,
      this.myHoraireNetController,
      this.myMensuelNetController,
      this.myAnnuelNetController,
      this.updateStatutVal,
      this.statutVal})
      : super(key: key);

  @override
  State<MyHomePageWeb> createState() => _MyHomePageWebState();
}

class _MyHomePageWebState extends State<MyHomePageWeb> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          child: Row(
        children: [
          Column(
            children: [
              Container(
                height: 500,
                width: 700,
                margin: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: const Radius.circular(15),
                        topRight: const Radius.circular(15)),
                    gradient: const LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.blue,
                          Colors.blueAccent,
                          Colors.lightBlueAccent,
                          Colors.blueAccent,
                          Colors.blue
                        ])),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SalaireBrutColumn(
                      myMensuelBrutController: widget.myMensuelBrutController,
                      myHoraireBrutController: widget.myHoraireBrutController,
                      myAnnuelBrutController: widget.myAnnuelBrutController,
                      calculDuSalaire: widget.calculSalaire,
                    ),
                    SizedBox(
                      width: 50,
                    ),
                    SalaireNetColumn(
                      myHoraireNetController: widget.myHoraireNetController,
                      myMensuelNetController: widget.myMensuelNetController,
                      myAnnuelNetController: widget.myAnnuelNetController,
                      calculSalaire: widget.calculSalaire,
                    ),
                  ],
                ),
              ),
              Container(
                height: 200,
                width: 700,
                margin: const EdgeInsets.fromLTRB(20, 0, 20, 20),
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        bottomLeft: const Radius.circular(15),
                        bottomRight: const Radius.circular(15)),
                    gradient: const LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.blue,
                          Colors.blueAccent,
                          Colors.lightBlueAccent,
                          Colors.blueAccent,
                          Colors.blue
                        ])),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [SelectionStatut(
                    updateStatutVal: widget.updateStatutVal,
                    statutVal: widget.statutVal,
                  )],
                ),
              ),
            ],
          ),
          Column(
            children: [
              Container(
                height: 700,
                width: 700,
                margin: const EdgeInsets.fromLTRB(20, 20, 20, 20),
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                    gradient: const LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.blue,
                          Colors.blueAccent,
                          Colors.lightBlueAccent,
                          Colors.blueAccent,
                          Colors.blue
                        ])),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    RightPart()
                  ],
                ),
              ),
            ],
          )
        ],
      )),
    );
  }
}
