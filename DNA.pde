class DNA {

  ArrayList<LineGene> Lines;

  DNA() {
    Lines = new ArrayList<LineGene>();
    Lines.add(new LineGene());
  }

  DNA(ArrayList _Lines) {
    Lines = _Lines;
  }

  void drawDNA(float _x, float _y) {

    for (LineGene l : Lines) {
      strokeWeight(l.getWeight());
      stroke(l.getColor());
      line(l.getStart()[0] + _x, l.getEnd()[0] + _y, l.getStart()[1] + _x, l.getEnd()[1] + _y);
      line(-l.getStart()[0] + _x, l.getEnd()[0] + _y, -l.getStart()[1] + _x, l.getEnd()[1] + _y);
      l.shiver();
    }
  }

  void getBoundaries() {
    float boundX, boundY;
    for (LineGene l : Lines) {
      //if (l.getBoundaries
    }
  }

  void evolve() {
    float[] prior = new float[2];
    prior[0] = Lines.get(Lines.size()-1).getStart()[1];
    prior[1] = Lines.get(Lines.size()-1).getEnd()[1];
    Lines.add(new LineGene());

    if (random(1) < 0.1) {
      println("mutate");
      for (int i = 0; i < Lines.size(); i++) {
        Lines.get(i).mutate();
      }
    }
  }

  DNA clone() {
    ArrayList<LineGene> CopyLines = new ArrayList<LineGene>();
    for (LineGene l : Lines) {
      CopyLines.add(l.clone());
    }
    return new DNA(CopyLines);
  }

  void affectLine() {
    for (LineGene l : Lines) {
      l.shifter();
    }
  }
}