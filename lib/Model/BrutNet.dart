
class BrutNet {
  String typeValue;
  double baseValue;

  BrutNet(this.baseValue, this.typeValue);



  //Peut importe la valeur de base, pour simplifier tout les calculs on partira tout le temps de l'horaire brut
  void calculateAll()
  {
    List<double> listOfValue = [];

    switch(typeValue)
    {
      case "hBrut":
        listOfValue.add(baseValue);
        calculateHoraireNet(listOfValue, baseValue);
        break;
      case "hNet":
        break;
      case "mBrut":
        break;
      case "mNet":
        break;
      case "aNet":
        break;
      case "aBrut":
        break;
      default:
        break;
    }
  }

  void calculateHoraireNet(List<double> listOfValue, lastValue)
  {

  }

  void calculateMensuelBrut(double value)
  {

  }
}
