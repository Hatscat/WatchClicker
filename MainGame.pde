class MainGame {

  int clicDistance = 10;
  int clicExponent = 0;
  String[] distanceUnits = {"m", "km", "Mm", "Gm", "Tm", "Pm", "Em", "Zm", "Ym"};

  void onClicked() {
    //click anywhere on game
    distanceValue = distanceValue + clicDistance * pow(10, clicExponent-distanceExponent);
    checkDistanceExponent();
    setDistanceText();
  }

  void checkDistanceExponent() {
    if (distanceValue > 10000 && (distanceExponent+3)/3 < distanceUnits.length) {
      distanceValue = distanceValue/1000;
      distanceExponent += 3;
      checkDistanceExponent();
    }
    else if(distanceValue < 0) {
      distanceValue = distanceValue*1000;
      distanceExponent -= 3;
      checkDistanceExponent();
    }
  }
  
  void setDistanceText() {
    distanceText.setText(String.format("%.2f", distanceValue) + " " + distanceUnits[distanceExponent/3]); 
  }
  
  void setSpeedText() {
   speedText.setText(String.format("%.2f", distanceValue) + " " + distanceUnits[distanceExponent/3]); 
  }
}