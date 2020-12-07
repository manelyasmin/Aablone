//var img;
class  Marble {
  float x, y;
  color clr;
  int posi, posj, player;
  ArrayList<Board> listVoisin=new ArrayList<Board>();
  PImage img;
  Marble(float x, float y, color clr, int i, int j) {
    this.x=x;
    this.y=y;
    this.clr=clr;
    this.posi=i;
    this.posj=j;
  }
    Marble(float x, float y, int i, int j) {
    this.x=x;
    this.y=y;
   
    this.posi=i;
    this.posj=j;
  }
  Marble(float x, float y, PImage img, int i, int j) {
    this.x=x;
    this.y=y;
    this.posi=i;
    this.posj=j;
    this.img=img;
  }
  Marble(){};
  Marble(float x, float y, int player) {

    this.x=x;
    this.y=y;
    this.player=player;
  }
  Marble(float x, float y) {
    this.x=x;
    this.y=y;
  } 

  void show() {
   // image(img,this.x-40,this.y-40,80,80);noStroke();
  //strokeWeight(5);
  fill(this.clr);noStroke();
  ellipse(this.x, this.y ,round, round);
   
  }
  void move(float x, float y, int i, int j) {
    this.x = x;
    this.y = y;
    this.posi=i;
    this.posj=j;
  }



  boolean clicked() {
    float d =dist(mouseX, mouseY, this.x, this.y);    
    if (d < round/2)  
    { 
      return true;
    }
    return false;
  }
  public boolean equals(Marble m) {
    if (this.x==m.x && this.y==m.y) return true;
    return false;
  }




  public void display(color clr1, color selclr) {

    if (this.clicked()) fill(selclr);       
    else fill(clr1);
    noStroke();
    ellipse(1050, 120,50,50);
  }
    public void display(PImage img1, PImage imgs) {

    if (this.clicked()) image(img1,900,200,80,80);       
    else image(img1,900,200,80,80);
    noStroke();
   
  }
}
