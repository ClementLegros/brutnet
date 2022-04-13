import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SalaireNetColumn extends StatefulWidget {
  //Variable
  final calculSalaire;
  final myHoraireNetController;
  final myMensuelNetController;
  final myAnnuelNetController;

  const SalaireNetColumn({Key? key, this.calculSalaire, this.myHoraireNetController, this.myMensuelNetController, this.myAnnuelNetController}) : super(key: key);

  @override
  State<SalaireNetColumn> createState() => _SalaireNetColumnState();
}

class _SalaireNetColumnState extends State<SalaireNetColumn> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "INDIQUEZ VOTRE SALAIRE NET",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        const Spacer(),
        Text(
          "Horaire Net",
          style: TextStyle(color: Colors.white),
        ),
        Container(
          width: 125,
          height: 50,
          child: TextField(
            controller: widget.myHoraireNetController,
            decoration: InputDecoration(
              fillColor: Colors.white,
              filled: true,
            ),
            style: TextStyle(
                color: Colors.black
            ),
            onChanged: (text){
              widget.calculSalaire(text,"net","h");
            },
          ),
        ),
        const Spacer(),
        Text(
          "Mensuel Net",
          style: TextStyle(color: Colors.white),
        ),
        Container(
          width: 125,
          height: 50,
          child: TextField(
            controller: widget.myMensuelNetController,
            decoration: InputDecoration(
              fillColor: Colors.white,
              filled: true,
            ),
            style: TextStyle(
                color: Colors.black
            ),
            onChanged: (text){
              widget.calculSalaire(text,"net","m");
            },
          ),
        ),
        const Spacer(),
        Text(
          "Annuel Net",
          style: TextStyle(color: Colors.white),
        ),
        Container(
          width: 125,
          height: 50,
          child: TextField(
            controller: widget.myAnnuelNetController,
            decoration: InputDecoration(
              fillColor: Colors.white,
              filled: true,
            ),
            style: TextStyle(
                color: Colors.black
            ),
            onChanged: (text){
              widget.calculSalaire(text,"net","a");
            },
          ),
        )
      ],
    );
  }
}
