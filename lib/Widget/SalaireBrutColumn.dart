import 'package:flutter/material.dart';

class SalaireBrutColumn extends StatefulWidget {
  //Variable
  final calculDuSalaire;
  final myHoraireBrutController;
  final myMensuelBrutController;
  final myAnnuelBrutController;

  const SalaireBrutColumn({Key? key, this.calculDuSalaire, this.myHoraireBrutController, this.myMensuelBrutController, this.myAnnuelBrutController}) : super(key: key);

  @override
  State<SalaireBrutColumn> createState() => _SalaireBrutColumnState();
}

class _SalaireBrutColumnState extends State<SalaireBrutColumn> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "INDIQUEZ VOTRE SALAIRE BRUT",
          style: TextStyle(color: Colors.white ,fontWeight: FontWeight.bold),
        ),
        const Spacer(),
        Text(
          "Horaire Brut",
          style: TextStyle(color: Colors.white),
        ),
        Container(
          width: 125,
          height: 50,
          child: TextField(
            controller: widget.myHoraireBrutController,
              decoration: InputDecoration(
                fillColor: Colors.white,
                filled: true,
                  hintText: 'horaire'
              ),
              style: TextStyle(
                color: Colors.black
              ),
              onChanged: (text){
                widget.calculDuSalaire(text,"brut","h");
              },
            ),
        ),
        const Spacer(),
        Text(
          "Mensuel Brut",
          style: TextStyle(color: Colors.white),
        ),
        Container(
          width: 125,
          height: 50,
          child: TextField(
            controller: widget.myMensuelBrutController,
            decoration: InputDecoration(
              fillColor: Colors.white,
              filled: true,
                hintText: 'mensuel'
            ),
            style: TextStyle(
                color: Colors.black
            ),
            onChanged: (text){
              widget.calculDuSalaire(text,"brut","m");
            },
          ),
        ),
        const Spacer(),
        Text(
          "Annuel Brut",
          style: TextStyle(color: Colors.white),
        ),
        Container(
          width: 125,
          height: 50,
          child: TextField(
            controller: widget.myAnnuelBrutController,
            decoration: InputDecoration(
              fillColor: Colors.white,
              filled: true,
              hintText: 'annuel'
            ),
            style: TextStyle(
                color: Colors.black
            ),
            onChanged: (text){
              widget.calculDuSalaire(text,"brut","a");
            },
          ),
        )
      ],
    );
  }
}
