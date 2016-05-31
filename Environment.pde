float distValNoiseK = 0.005;
float distExpNoiseK = 0.03;

String[] biomes = new String[] { // class Biome ?
  "DESERT",
  "FOREST",
  "TUNDRA",
  "GRASSLAND",
  "SKY",
  "SEA",
  "SPACE"
};

float getBiome (int distVal, int distExp)
{
  return noise(distVal, distExp) * biomes.length;
}

int getSplineY (int x, int distVal, int distExp)
{
  return (int)map(noise((distVal - x) * distValNoiseK, distExp * distExpNoiseK), 0, 1, 0, height + 1);
}




void updateNoises (int distVal, int distExp)
{
  
}

void drawEnvironment ()
{
  //updateNoises(distanceValue, distanceExponent);
  
  distanceValue -= 1;
  if (distanceValue >= 1000) {
    distanceValue = 1;
    distanceExponent += 3;
  }
  
  background(255);

  noFill();

  beginShape(); 
  

  for (int x = width >> 1; x > 0; x -= 2) {
    float y = getSplineY(x, distanceValue, distanceExponent);
    
    vertex(x, y); 
  }

  //vertex(width, height);
  //vertex(0, height);
  endShape();
}