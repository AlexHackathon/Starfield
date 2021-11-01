//ArrayList<Particle> firework = new ArrayList<Particle>();
Firework f;
void setup(){
  size(400,400);
  background(0,0,0);
  f = new Firework(20);
}
void draw(){
  fill(0,0,0,50);
  rect(0,0,400,400);
  f.MoveAndShow();
  f.Cleanup();
}
class Firework{
  ArrayList<Particle> firework = new ArrayList<Particle>();
  int posX;
  int posY;
  int particles;
  Firework(int p){
    particles = p;
    posX = (int)(Math.random() * 300);
    posY = (int)(Math.random() * 300);
    for(int i = 0; i < particles; i++){
      if(i%2 == 0){
        firework.add(new Oddball(posX,posY,3,2*PI/particles*i,color(255,0,0)));
      } else {
        firework.add(new Particle(posX,posY,3,2*PI/particles*i,color(255,0,0)));
      }
    } 
  }
  void MoveAndShow(){
    for(Particle i : firework){
      i.Move();
      i.Show();
    }
  }
  void Regenerate(){
    firework = new ArrayList<Particle>();
    posX = (int)(Math.random() * 300);
    posY = (int)(Math.random() * 300);
    for(int i = 0; i < particles; i++){
      if(i%2 == 0){
        firework.add(new Oddball(posX,posY,3,2*PI/particles*i,color(255,0,0)));
      } else {
        firework.add(new Particle(posX,posY,3,2*PI/particles*i,color(255,0,0)));
      }
    } 
  }
  void Cleanup(){
    int particlesOut = 0;
    for(int i = 0; i < firework.size(); i++){
      if(firework.get(i).x > 400 || firework.get(i).x < 0){
        particlesOut += 1;
        continue;
      } 
      if(firework.get(i).y > 400 || firework.get(i).y < 0){
        particlesOut += 1;
        continue;
      }
    }
    if(particlesOut >= particles){
      this.Regenerate();
    }
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
    colorMode(RGB, 255);
    fill(myColor);
    ellipse((float)x,(float)y,diameter, diameter);
  }
}
class Oddball extends Particle{
  int h;
  Oddball(double x, double y, double s, double a, int c){
    super(x,y,s,a,c);
    h = 0;
  }
  void ChangeColor(){
    colorMode(HSB, 400);
    h += 4;
    myColor = color(h,400,400);
  }
  void Show(){
    this.ChangeColor();
    super.Show();
  }
}
