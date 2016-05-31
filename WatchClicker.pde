import g4p_controls.*;

MainGame game;

void setup ()
{
  background(0);
  frameRate(30);
  game = new MainGame();
  createGUI();
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