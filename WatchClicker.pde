import g4p_controls.*;


MainGame game;

int distanceValue;
int distanceExponent;

void setup ()
{
  background(0);
  frameRate(30);

  game = new MainGame();
  createGUI();

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

void mouseClicked() {
  game.onClicked();
}