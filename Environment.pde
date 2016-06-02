
float getZoom (float speed)
{
  return 1 / sqrt(speed * 0.001);
}

float getCenterX (float distVal, int distExp)
{
  return distVal * pow(10, distExp);
}

float getSplineY (float x)
{
  return noise(x * 0.001, 0.123456789) * height*2;
}
/*
float getSplineAngle (float x)
{
  return (noise(x * 0.005, 0.123456789) * PI) - HALF_PI;
}
*/
float getTopSplineRadius (float x, boolean pressed)
{
  float min = height * 0.1;
  float max = height * (pressed ? 0.8 : 0.4);
  return map(noise(x * 0.01, 1.23456789), 0, 1, min, max);
}

float getBotSplineRadius (float x, boolean pressed)
{
  float min = -height * 0.1;
  float max = -height * (pressed ? 0.8 : 0.4);
  return map(noise(x * 0.011, 2.345678901), 0, 1, min, max);
}

float getHue (float x, float y, float combo)
{
  float k = 0.0031;
  return noise(x * k, y * k, combo);
}

float getSaturation (float x, float y, boolean pressed)
{
  float k = 0.0013;
  return noise(x * k, y * k, pressed ? 3.456789012 : 4.567890123);
}

float getValue (float x, float y, boolean pressed)
{
  float k = 0.0072;
  float n = noise(x * k, y * k, pressed ? 5.678901234 : 6.789012345);
  return n <= 0.22 ? sqrt(n) : n;
}

color getBgColor (float x, float y, float combo)
{
  colorMode(HSB, 1, 1, 1);
  return color(getHue(x, y, combo), 0.7, 0.6);
}

color getFgColor (float x, float y, float combo, boolean pressed)
{
  colorMode(HSB, 1, 1, 1);
  return color(getHue(x, y, combo), getSaturation(x, y, pressed), getValue(x, y, pressed));
}

// ---- ---- ---- ----

void drawEnvironment ()
{
  float speed = sqrt(1);
  float zoom = getZoom(speed);
  float w = max(1, zoom);
  float centerX = getCenterX(distanceValue, distanceExponent);
  float centerY = getSplineY(centerX);


  //background(255);
  
  pushMatrix();
  translate(width/2, height/2);
  rotate(atan2(centerY - getSplineY(centerX-10), 10));
  //noFill();
  noStroke();
  
  //beginShape();
  
  for (float y = -height*.7; y < height*.7; y += 4) {
    for (float x = -width*.7; x < width*.7; x += 4) {
      float r = centerY + y;
      float c = centerX + x;
      if (r > centerY + getTopSplineRadius(c, false) || r < centerY + getBotSplineRadius(c, false))
        fill(getFgColor(c, r, 0, false));
      else
        fill(getBgColor(c, r, 0));
      rect(x, y, 4, 4);
    }
  }

  //vertex(width, height);
  //vertex(0, height);
  //endShape();
  popMatrix();
  //distanceValue += speed;
  
  //println(frameRate);
}