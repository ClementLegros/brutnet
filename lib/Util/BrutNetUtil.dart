import 'package:brutnet/Model/BrutNet.dart';
import 'package:flutter/material.dart';


double calculSalaireHoraireFromMensuel(mensuel)
{
  //Sur une base de 35 travaillé par semaine
  double horaire = mensuel / ((35 * 52) /12); // 35=Heures , 52=semaines
  return horaire;
}

double calculSalaireMensuelFromHoraire(horaire)
{
  double mensuel = horaire * ((35 * 52) /12);
  return mensuel;
}

double calculBrutToNet(brut, statut)
{
  double net = brut - (statut/100 * brut);
  return net;
}

double calculNetToBrut(net, statut)
{
  double brut = net + (statut/100 * net);
  return brut;
}

double calculMensuelToAnnuel(mensuel)
{
  double annuel = mensuel * 12;
  return annuel;
}

double calculAnnuelToMensuel(annuel)
{
  double mensuel = annuel / 12;
  return mensuel;
}

int checkStatut(input)
{
  int statut = 0;

  switch(input)
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
  return statut;
}