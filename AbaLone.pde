import processing.video.*;
import java.util.ArrayList;
import java.util.Iterator;
import gab.opencv.*;
 
public int[][] poid = {
  {4, 4, 4, 4, 2, 1, 2, 1, 2, 1, 2, 1, 2, 4, 4, 4, 4}, 
  {4, 4, 4, 2, 1, -2, 1, -2, 1, -2, 1, -2, 1, 2, 4, 4, 4}, 
  {4, 4, 2, 1, -2, 1, 3, 1, 3, 1, 3, 1, -2, 1, 2, 4, 4}, 
  {4, 2, 1, -2, 1, 3, 1, -3, 1, -3, 1, 3, 1, -2, 1, 2, 4}, 
  {2, 1, -2, 1, 3, 1, -3, 1, 6, 1, -3, 1, 3, 1, -2, 1, 2}, 
  {4, 2, 1, 5, 1, 5, 1, 5, 1, 5, 1, 5, 1, 5, 1, 2, 4}, 
  {4, 4, 2, 1, 5, 1, 5, 1, 5, 1, 5, 1, 5, 1, 2, 4, 4}, 
  {4, 4, 4, 2, 1, 5, 1, 5, 1, 5, 1, 5, 1, 2, 4, 4, 4}, 
  {4, 4, 4, 4, 2, 1, 2, 1, 2, 1, 2, 1, 2, 4, 4, 4, 4}, 
};
color trackColor;
float t=25;
Board board;
Capture video;
public int round=70;
int valj=40, vali=70;
public int columns=17, rows=9;
PImage img, img1, img2;
ArrayList<Marble> roleChipsInterface = new ArrayList<Marble>();  
public boolean roleEnded=false, endGame=false;
homePage home;
CVImage cvimg;
ArrayList<Board> listePoint= new ArrayList();
boolean back=false;




void setup() { 
 size(1200,900);
 
 //size(displayWidth,displayHeight);
    home=new homePage();
  home.setup();
   aff(poid);
  affiche(poid);
    String Cameras[]=Capture.list();
  println(Cameras);
 
   
  System.loadLibrary(Core.NATIVE_LIBRARY_NAME);
  video = new Capture(this, 640, 480 );
  trackColor=color(255, 13, 21);

  cvimg = new CVImage(video.width, video.height);
}
void captureEvent(Capture video) {
  video.read();
}
////----------------------- FONCTION DRAW ----------
void draw() {


  home.draw();
}

void mousePressed() {
  home.mousePressed();
}
//// -------pour afficher la matrice ----
public void affiche(int [][] mm)
{
  for (int i=0; i<rows; i++) {
    for ( int j=0; j<columns; j++) {
      print(" "+mm[i][j] + " ");
    }
    println("\n");
  }
}
public void aff(int [][] mm)
{
  for (int i=0; i<rows; i++) {

    for ( int j=0; j<columns; j++) {
      switch(mm[i][j]) {
      case 2:
        mm[i][j]=100; 
        break;
      case -2:
        mm[i][j]=500; 
        break;
      case 3: 
        mm[i][j]=750;
        break;
      case -3:
        mm[i][j]=850; 
        break;
      case 6:
        mm[i][j]=1000; 
        break;
      case 5:
        mm[i][j]=2000; 
        break;
      default : 
        break;
      }
    }
    println("\n");
  }
}
void hexagone(float x, float y, float radius, int npoints) {
  float angle = TWO_PI / npoints;
  beginShape();
  for (float a = 0; a < TWO_PI; a += angle) {
    float sx = x + cos(a) * radius;
    float sy = y + sin(a) * radius;
    vertex(sx, sy);
  }
  endShape(CLOSE);
}


void polygone(float x, float y, int radius, int npoints) {
  float angle = TWO_PI / npoints;
  beginShape();
  for (float a = 0; a < TWO_PI; a += angle) {
    float sx = x + sin(a) * radius;
    float sy = y + cos(a) * radius;
    vertex(sx, sy);
  }
  endShape();
}

void buttonHex(float x, float y, float longueur, float largeur, float size, color clr) {

  fill(clr);
  stroke(150);strokeWeight(10);
  hexagone(x+20, y+40, size, 6);
  hexagone(x+longueur-20, y+40, size, 6);
  noStroke();rect(x, y, longueur, largeur);
}
