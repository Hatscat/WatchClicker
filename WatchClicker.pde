import g4p_controls.*;

int distanceValue;
int distanceExponent;

void setup ()
{
  background(0);
  frameRate(30);
  distanceValue = 0;
  distanceExponent = 1;
}

void settings ()
{
  size(320, 320);
  //fullScreen();
}

void draw ()
{
  drawEnvironment();
}