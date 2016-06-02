MainGame game;

float distanceValue;
int distanceExponent;

void setup ()
{
  background(0);
  frameRate(30);

  game = new MainGame();

  distanceValue = 0;
  distanceExponent = 0;
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