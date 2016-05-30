float yoff = 0.0;

String[] biomes = new String[] {
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

PVector getSpline (int distVal, int distExp)
{
  return new PVector(0, 0);
}




void updateNoises (double distance)
{
  
}

void drawEnvironment ()
{
  
  background(255);

  noFill();
  // We are going to draw a polygon out of the wave points
  beginShape(); 
  
  float xoff = 0;       // Option #1: 2D Noise
  // float xoff = yoff; // Option #2: 1D Noise
  
  // Iterate over horizontal pixels
  for (float x = 0; x <= width; x += 10) {
    // Calculate a y value according to noise, map to 
    float y = map(noise(xoff, yoff), 0, 1, 200,300); // Option #1: 2D Noise
    // float y = map(noise(xoff), 0, 1, 200,300);    // Option #2: 1D Noise
    
    // Set the vertex
    vertex(x, y); 
    // Increment x dimension for noise
    xoff += 0.05;
  }
  // increment y dimension for noise
  yoff += 0.01;
  vertex(width, height);
  vertex(0, height);
  endShape(CLOSE);
}