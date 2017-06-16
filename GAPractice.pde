
float boundaryX, boundaryY;
int numPopulationBase;
int selectedDNAIndex;
float blockSize;
float lineSize;

Population Society;


void setup() {
  numPopulationBase = 7;
  size(900, 900);
  blockSize = width/numPopulationBase;
  lineSize = 15;
  noFill();
  ellipseMode(RADIUS);
  rectMode(RADIUS);
  smooth();
  colorMode(HSB);
  boundaryX = blockSize/25;
  boundaryY = blockSize/25;
  Society = new Population(numPopulationBase*numPopulationBase);
}

void draw() {
  drawGrid(numPopulationBase);
  Society.drawPopulation();
}

void keyPressed() {
  if (keyCode == RIGHT) {
    Society.doSomething();
  }
}

void mousePressed() {
  float g = floor(mouseX/blockSize) + floor(mouseY/blockSize)*numPopulationBase;
  selectedDNAIndex = int(g);
  Society.incrementGeneration();
  boundaryX+=0.5;
  boundaryY+=0.5;
}

void drawGrid(int _num) {
  background(200);
  stroke(255);
  strokeWeight(0.5);
  for (int i = 0; i < _num; i++) {
    for (int j = 0; j < _num; j++) {
      noFill();
      rect(blockSize*i, blockSize*j, blockSize, blockSize);      
      fill(255);
      ellipse(blockSize*i, blockSize*j, 2, 2);
    }
  }
}