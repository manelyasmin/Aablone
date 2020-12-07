class Button {
  float x, y, larg, lng, size,strx,stry;
  color cl;
  PImage img;
  boolean overcircl=false;
  String str;
  Button(int x, int y, color cl) {
    this.x=x;
    this.y=y;
    this.cl=cl;
  }
  Button(int x, int y, PImage img) {
    this.x=x;
    this.y=y;
    this.img=img;
  }

  Button(float x, float y, float longueur, float largeur, int size, color cl) {
    this.x=x;
    this.y=y;
    this.lng=longueur;
    this.larg=largeur;
    this.size=size;
    this.cl=cl;
  }
   Button(float x, float y, float longueur, float largeur, int size, color cl,String str,float strx,float stry) {
    this.x=x;
    this.y=y;
    this.lng=longueur;
    this.larg=largeur;
    this.size=size;
    this.cl=cl;
    this.str=str;
    this.strx=strx;
    this.stry=stry;
  }
  //void show() {
  // noStroke();
  // image(this.img,this.x-50,this.y-50);

  // }
  void show() { 

    buttonHex(x, y, lng, larg, size, cl);
  }
  boolean clicked() {
    float d =dist(mouseX, mouseY, this.x+90, this.y+40); 

    if (d<larg/2) 
    {  
      println(d);
      return true;
    }
    return false;
  }
  void drag(){
   
  if(!clicked() && overCircle((int)this.x,(int)this.y, (int)this.size)){buttonHex(x, y, lng, larg, size, color(100));fill(0);text(str,strx,stry);}     
if(clicked() || !overCircle((int)this.x,(int)this.y, (int)this.size)){buttonHex(x, y, lng, larg, size,cl);fill(0);text(str,strx,stry);}
  }
  boolean overCircle(int x,int y  ,int diameter){
  float distx= x-mouseX;
  float disty=y-mouseY;
  if(sqrt(sq(distx)+sq(disty))<diameter/2)
  return true;
  else return false;
  
  
  
  }
}
