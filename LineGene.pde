class LineGene {

  float[] StartPoint;
  float[] EndPoint;
  float StrokeWeight;
  color c;

  LineGene() {
    StartPoint = new float[2];
    EndPoint = new float[2];
    StrokeWeight = random(1.5);
    c = color(360, random(100), random(100));
    StartPoint[0] = random(-boundaryX, boundaryX);
    StartPoint[1] = random(-boundaryX, boundaryX);
    EndPoint[0] = random(-boundaryY, boundaryY);
    EndPoint[1] = random(-boundaryY, boundaryY);
  }

  LineGene(float[] _bounds) {
    StartPoint = new float[2];
    EndPoint = new float[2];
    StrokeWeight = random(1.5);
    c = color(360, random(100), random(100));
    StartPoint[0] = _bounds[0];
    StartPoint[1] = random(-boundaryX, boundaryX);
    EndPoint[0] = _bounds[1];
    EndPoint[1] = random(-boundaryY, boundaryY);
  }

  LineGene(float[] _s, float[] _e, color _c, float _weight) {
    StartPoint = new float[2];
    EndPoint = new float[2];
    StartPoint = _s;
    EndPoint = _e;
    StrokeWeight = _weight;
    c = _c;
  }

  LineGene clone() {
    float[] newS = new float[2];
    float[] newE = new float[2];
    newS[0] = StartPoint[0];
    newS[1] = StartPoint[1];
    newE[0] = EndPoint[0];
    newE[1] = EndPoint[1];

    return new LineGene(newS, newE, c, StrokeWeight);
  }

  float[] getStart() {
    return StartPoint;
  }

  float[] getEnd() {
    return EndPoint;
  }

  float getWeight() {
    return StrokeWeight;
  }

  color getColor() {
    return c;
  }

  float[] getBoundary() {
    float[] boundaries = new float[2];

    boundaries[0] = abs(StartPoint[0]) > abs(StartPoint[1]) ? StartPoint[0] : StartPoint[1];
    boundaries[1] = EndPoint[0] > EndPoint[1] ? EndPoint[0] : EndPoint[1];

    return boundaries;
  }

  void mutate() {
    float p1 = StartPoint[0];
    float p2 = StartPoint[1];
    StartPoint[0] = EndPoint[1];
    StartPoint[1] = EndPoint[0];
    EndPoint[0] = p2;
    EndPoint[1] = p1;
  }

  void reset() {
    StartPoint[0] = random(-boundaryX, boundaryX);
    StartPoint[1] = random(-boundaryX, boundaryX);
    EndPoint[0] = random(-boundaryY, boundaryY);
    EndPoint[1] = random(-boundaryY, boundaryY);
  }

  void shiver() {
    StartPoint[0] += random(-1, 1)/100;
    StartPoint[1] += random(-1, 1)/100;
    EndPoint[0] += random(-1, 1)/100;
    EndPoint[1] += random(-1, 1)/100;
  }

  void shifter() {
    StartPoint[0]++;
    EndPoint[0]++;
  }
}