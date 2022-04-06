class BrutNet {
  double _horaireBrut,
      _horaireNet,
      _MensuelBrut,
      _MensuelNet,
      _AnnuelBrut,
      _AnnuelNet;

  BrutNet(this._horaireBrut, this._horaireNet, this._MensuelBrut,
      this._MensuelNet, this._AnnuelBrut, this._AnnuelNet);

  //SETTER AND GETTER
  set horaireBrut(value){

  }

  //FUNCTION

  //Peut importe la valeur de base, pour simplifier tout les calculs on partira tout le temps de l'horaire brut
  void calculateHoraireBrut(double value, String base)
  {
    switch(base)
    {
      case "hBrut":
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

  void calculateHoraireNet(double value)
  {

  }

  void calculateMensuelBrut(double value)
  {

  }
}
