class Sound {
  
  PApplet pa;
  //SoundFile sounds[];
  int i;
  
  PApplet parent;
  public Sound(PApplet pa) {
    this.pa = pa;
    loadSounds();
  }
  
  void loadSounds(){
    println("ziel");
    //sounds[0] = new SoundFile(pa, "blaster.mp3");
  }
  
  void playSound(int number) {
  //  sounds[number].play();
  }
}
