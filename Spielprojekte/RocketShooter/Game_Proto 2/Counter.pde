class Counter {
  int startTime;
  int duration;
  int counter, intervall, now, lastTime;

  public void start() {
    startTime = millis();
  }

  public void stop() {
    duration = 0;
    startTime = 0;
  }

  public void reset() {
    duration = 0;
    startTime = millis();
  }

  public int getDuration() {
    return millis()-startTime;
  }
}
