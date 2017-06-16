class Population {

  DNA[] DNAs;

  Population(int _size) {
    DNAs = new DNA[_size];
    for (int i = 0; i < _size; i++) {
      DNAs[i] = new DNA();
    }
  }

  void drawPopulation() {

    stroke(75);

    for (int i = 0; i < DNAs.length; i++) {

      float countY = i/numPopulationBase;
      float countX = i - countY*numPopulationBase;

      float offsetY = countY * blockSize + blockSize/2;
      float offsetX = countX * blockSize + blockSize/2;

      DNAs[i].drawDNA(offsetX, offsetY);
    }
  }

  void incrementGeneration() {
    DNA selectedDNA = DNAs[selectedDNAIndex];
    for (int i = 0; i < DNAs.length; i++) {
      DNAs[i] = selectedDNA.clone();//DNAs[i].copyValues(selectedDNA);
      DNAs[i].evolve();
    }
    println("==========================");
  }

  void doSomething() {
    DNAs[22].affectLine();
  }
}