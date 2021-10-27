ArrayList<Particle> firework = new ArrayList<Particle>();
void setup(){
  size(400,400);
  for(int i = 0; i < 20; i++){
    if(2*PI/20*i == PI/2){
      firework.add(new Oddball(200,200,3,2*PI/20*i,color(255,0,0)));
    } else {
      firework.add(new Particle(200,200,3,2*PI/20*i,color(255,0,0)));
    }
  }
  background(0,0,0);
}
void draw(){
  fill(0,0,0,10);
  rect(0,0,400,400);
  for(int i = 0; i < 20; i++){
    firework.get(i).Move();
    firework.get(i).Show();
  }
}
class Particle{
  double x,y,speed,angle;
  int myColor, diameter;
  Particle(double posX, double posY, double s, double a, int c){
    x = posX;
    y = posY;
    speed = s;
    angle = a;
    myColor = c;
    diameter = 20;
  }
  void Move(){
    x += speed * Math.cos(angle);
    y -= speed * Math.sin(angle);
  }
  void Show(){
    fill(myColor);
    ellipse((float)x,(float)y,diameter, diameter);
  }
}
class Oddball extends Particle{
  Oddball(double x, double y, double s, double a, int c){
    super(x,y,s,a,c);
  }
  void ChangeColor(){
    colorMode(HSB, 400);
    for (int i = 0; i < 400; i++) {
      for (int j = 0; j < 400; j++) {
        myColor = color(i,j,400);
      }
    }
  }
  void Show(){
    println("Showing");
    this.ChangeColor();
    println("Changing Color");
    super.Show();
    println("Super showing");
  }
}
