import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SelectionStatut extends StatefulWidget {
  //Variable
  final updateStatutVal;
  final statutVal;

  const SelectionStatut({Key? key, this.updateStatutVal, this.statutVal}) : super(key: key);

  @override
  State<SelectionStatut> createState() => _SelectionStatutState();
}

class _SelectionStatutState extends State<SelectionStatut> {

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          const Text("SELECTIONNEZ VOTRE STATUT", style: TextStyle(color: Colors.white),),
          Container(
            width: 650,
            height: 100,
            decoration: BoxDecoration(
              color: Colors.white
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    Radio(
                        value: 1,
                        groupValue: widget.statutVal,
                        onChanged: (value) {
                          widget.updateStatutVal(value);
                        }
                        ),
                    Text("Salarié non cadre")

                  ],
                ),
                Column(
                  children: [
                    Radio(
                        value: 2,
                        groupValue: widget.statutVal,
                        onChanged: (value) {
                          widget.updateStatutVal(value);
                        }
                    ),
                    Text("Salarié Cadre")

                  ],
                ),
                Column(
                  children: [
                    Radio(
                        value: 3,
                        groupValue: widget.statutVal,
                        onChanged: (value) {
                          widget.updateStatutVal(value);
                        }
                    ),
                    Text("Fonction publique")

                  ],
                ),
                Column(
                  children: [
                    Radio(
                        value: 4,
                        groupValue: widget.statutVal,
                        onChanged: (value) {
                          widget.updateStatutVal(value);
                        }
                    ),
                    Flexible(child: Text("Profession libérale"),)

                  ],
                ),
                Column(
                  children: [
                    Radio(
                        value: 5,
                        groupValue: widget.statutVal,
                        onChanged: (value) {
                          widget.updateStatutVal(value);
                        }
                    ),
                    Text("Portage salarial")

                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
