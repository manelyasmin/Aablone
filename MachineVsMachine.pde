import processing.video.*;
import java.util.ArrayList;
import java.util.Iterator;
import gab.opencv.*;
public class MachineVsMachine {
  int compteur=0;
  int[][] arr4 ={
    {4, 4, 4, 4, 0, 1, 0, 1, 0, 1, 0, 1, 0, 4, 4, 4, 4}, 
    {4, 4, 4, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 4, 4, 4}, 
    {4, 4, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 4, 4}, 
    {4, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 4}, 
    {0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0}, 
    {4, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 4}, 
    {4, 4, 0, 1, 0, 1, 2, 1, 2, 1, 2, 1, 0, 1, 0, 4, 4}, 
    {4, 4, 4, 2, 1, 2, 1, 2, 1, 2, 1, 2, 1, 2, 4, 4, 4}, 
    {4, 4, 4, 4, 2, 1, 2, 1, 2, 1, 2, 1, 2, 4, 4, 4, 4}, 
  };
  int[][] arr5 = {
    {4, 4, 4, 4, -2, 1, -2, 1, -2, 1, -2, 1, -2, 4, 4, 4, 4}, 
    {4, 4, 4, -2, 1, -2, 1, -2, 1, -2, 1, -2, 1, -2, 4, 4, 4}, 
    {4, 4, 0, 1, 0, 1, -2, 1, -2, 1, -2, 1, 0, 1, 0, 4, 4}, 
    {4, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 4}, 
    {0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0}, 
    {4, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 4}, 
    {4, 4, 0, 1, 0, 1, 2, 1, 2, 1, 2, 1, 0, 1, 0, 4, 4}, 
    {4, 4, 4, 2, 1, 2, 1, 2, 1, 2, 1, 2, 1, 2, 4, 4, 4}, 
    {4, 4, 4, 4, 2, 1, 2, 1, 2, 1, 2, 1, 2, 4, 4, 4, 4}, 
  };

  color clr1, clr2;
  tree t;
  IA pc, pc1;
  PImage p;
  int calc=0;
  float px=0, py=0, mx=0, my=0, closestX=0, closestY=0;
  OpenCV opencv;
  ArrayList<Marble > liste1=new ArrayList();
  ArrayList<Marble > liste2=new ArrayList();
  boolean find=false, suiv=false, bool=false;
  ArrayList<PImage> lp;
  ArrayList<Integer> listcpt=new ArrayList();
  boolean pi=false;
  //  trackColor1=color( );
  int cpt=0, k=0, cpt1=0, playerRole = 2;   
  void setup() {
    video.start();
    background(0);
    clr1 =  trackColor; //rouge
    clr2 = color(0); //jaune
    pc1=new IA(clr1, -2); //me 
    pc=new IA(clr2, 2); //autre machine
    board.show();
    initMachineVsMachine(arr4);
    listcpt.add(9);
  }


  void initMachineVsMachine(int [][] mat) {
    float x, y;
    for (int i=0; i<rows; i++) {
      for ( int j=0; j<columns; j++) {
        x =j*valj+(round);
        y =i*vali+(round);

        if (mat[i][j]==pc.idPlayer) { 
          pc.addMarble(x, y, i, j);
        }
        if (mat[i][j]==pc1.idPlayer) { 
          pc1.addMarble(x, y, i, j);
        }
      }
    }
  }

  void Display()
  { 
    if (!endGame) { 
      board.show();
      refresh(arr4);
      displayScore();
      noFill();
      stroke(255);
      strokeWeight(5);
      rect(895, 95, 310, 310);
      image(video, 900, 100, 300, 300);

      p=cameraTest(); 
      pc.show(); 
      pc1.show(); 

      if (p!=null) { 
        play( );
      }
      delay(900);
    }
  }



  //*************************
  PImage cameraTest() {
    cvimg.copyTo(video);
    Mat tmp1 = cvimg.getGrey();
    Mat tmp2 = new Mat();
    Imgproc.blur(tmp1, tmp2, new Size(3, 3));
    Imgproc.Canny(tmp2, tmp1, 100, 200);
    ArrayList<MatOfPoint> contours = new ArrayList<MatOfPoint>();
    Mat hierarchy = new Mat();

    Imgproc.findContours(tmp1, contours, hierarchy, Imgproc.RETR_LIST, Imgproc.CHAIN_APPROX_SIMPLE);
    pushStyle();
    noFill();
    Iterator<MatOfPoint> it = contours.iterator();
    while (it.hasNext()) {
      MatOfPoint2f poly = new MatOfPoint2f();
      Imgproc.approxPolyDP(new MatOfPoint2f(it.next().toArray()), poly, 25, true);

      if (poly.rows()==6)
      {
        Point [] pts = poly.toArray();


        px=(float)pts[0].x;
        py=(float)pts[0].y;
        mx=px;
        my=py;

        for (int i=0; i<pts.length; i++) {

          px=min((float)pts[i].x, px);
          py=min((float)pts[i].y, py);
          mx=max((float)pts[i].x, mx);
          my=max((float)pts[i].y, my);
        }

        p=video.copy();
        p=p.get((int)px, (int)py, (int)(mx-px), (int)(my-py));
        p.resize(200, 200);
        //noFill();stroke(255);strokeWeight(5);
        //rect(895,495, p.width-5, p.height-5);
        //
        image(p, 900, 500);
      }
    }

    if (p!=null) {
      p.resize(800, 700);
    }
    popStyle();
    tmp1.release();
    tmp2.release();
    return p;
  }

  void detectRouge(PImage temp) {
    float worldrecord=500 ;
    for (int x=70; x<temp.width; x+=40) {
      for (int y=70; y<temp.height; y+=70) {
        color cur=temp.pixels[y*temp.width+x];
        float r1=red(cur);
        float g1=green(cur);
        float b1=blue(cur);

        float r3=red( trackColor);
        float g3=green( trackColor);
        float b3=blue( trackColor);
        //float d= dist(r1, g1, b1, r2, g2, b2); 
        float d= dist(r1, g1, b1, r3, g3, b3); 
        if (d<=350) { 
         // println("d"+d);
          worldrecord=d;
          closestX=x;
          closestY=y;
        }  

        //     }
        if (worldrecord<=150.0) {  
          int j=(int)  ( closestX-round)/40;
          int i=(int)(closestY-round)/70;
          if (i>=0 && j>=0 && i<rows && j<columns) {
            if (arr4[i][j]==0) { 
              arr4[i][j]=pc1.idPlayer;
              //   mat[i][j]=pc1.idPlayer;
            }
            if (arr4[i][j]==pc.idPlayer ) {
              bool=true;
              break;
            }
          }
        }
      }
    }
    if (bool) {
      for (int a=0; a<rows; a++) {
        for (int b=0; b<columns; b++) {
          if (arr4[a][b]==pc1.idPlayer ) {
            arr4[a][b]=0;
          }
        } 
        refresh(arr4);
        println("affiche arr4");
    //    affiche(arr4);
      }
      bool=false;
    }
  }
  //******************************
  int[][] cameraActive(PImage temp ) { 
    refresh(arr4);
    int [][] mat=pc.creermat(arr4, rows, columns);
    refresh(mat);
    temp.loadPixels();
    detectRouge(temp);
    return mat;
  }


  void refresh(int [][] matrice) { //elle vide la liste des deux ordinateurs apres la videe elle parcour la nouvelle matrice est verifie si egale deux ou moins deux et lajoute a la liste corspnd
    pc.marbles_list.clear();
    pc1.marbles_list.clear();
    for (int i=0; i<rows; i++) {
      for ( int j=0; j<columns; j++) {

        float    x =j*valj+round;
        float   y =i*vali+round;  
        if (matrice[i][j]==pc.idPlayer) {
          pc.addMarble(x, y, i, j);
        }
        if (matrice[i][j]==pc1.idPlayer) { 
          pc1.addMarble(x, y, i, j);
        }
      }
    }
  }
  boolean sameMat(int[][] mat1, int[][] mat2) {
    for (int i=0; i<rows; i++) {
      for ( int j=0; j<columns; j++) {
        if (mat1[i][j]!=mat2[i][j]) return false;
      }
    }
    return true;
  }

  void play( ) {
    int [][] matrix=cameraActive(p);
    refresh(matrix);     
    if(calc==11 && (pc1.marbles_list.size()+pc1.score==14) &&  sameMat(arr4,matrix)){

//      println("arr4444");affiche(arr4);
  //     println("matrixxxx");affiche(matrix);
        pc1.TreeGame(t,pc.marbles_list);
      int [][] tmp=pc1.creermat(pc1.pickBestMove_MinMax(t).matDeJeu,rows,columns);
    matrix=tmp;
    refresh(tmp);
    refresh(matrix);
    t.children.clear();   
     roleEnded=true;        
    arr4=pc1.creermat(tmp,9,17);
    matrix=pc1.creermat(arr4,9,17); 
    println("mat");affiche(matrix);
calc=0;
    pi=true;

     }
    if (((pc1.marbles_list.size()+pc1.score==14) && !sameMat(arr4, matrix)) || pi) {
      refresh(arr4);
      refresh(matrix);
      //     println("----matrix-----------------");affiche(matrix);
      t=new tree(matrix, null, false, true);    
      pc.TreeGame(t, pc1.marbles_list);
      int [][] tmp=pc.creermat(pc.pickBestMove_MinMax(t).matDeJeu, 9, 17);
      matrix=pc.creermat(tmp, rows, columns); 
      refresh(tmp); 
  //    println("--------------tmp----");//faffiche(tmp);       
      refresh(matrix);//println("matrix after refresh after tmp");affiche(matrix);
      t.children.clear();   
      roleEnded=true;
      arr4=pc.creermat(tmp, rows, columns);
      calc++;println("cal"+calc);
    }
    if (  compteur==0 && (pc1.marbles_list.size()+pc1.score==14) && sameMat(arr4, matrix) && sameMat(arr4, arr5) && sameMat(arr5, matrix) ) {
      compteur++;
    //  println("compteur"+compteur);
     // calc++;
      t=new tree(matrix, null, false, true);    
      pc.TreeGame(t, pc1.marbles_list);
      int [][] tmp=pc.creermat(pc.pickBestMove_MinMax(t).matDeJeu, 9, 17);
      matrix=pc.creermat(tmp, rows, columns); 
      refresh(tmp);        
      t.children.clear();   
      roleEnded=true;
      refresh(matrix); 
      arr4=pc.creermat(tmp, rows, columns);
    }
    if (roleEnded) {
      for (int i=0; i<rows; i++) {
        for (int j=0; j<columns; j++) {
          if (arr4[i][j]==pc1.idPlayer) {
            arr4[i][j]=0;
            matrix[i][j]=0;
          }
        }
      }
      roleEnded=false;
    }
    //delay(800);
  }


  void  switchRoles() {
    if (playerRole == 1 ) {
      playerRole = 2;
      return;
    }
    if (playerRole == 2 ) {
      playerRole = 1;
      return;
    }
  }
  void endGameInterface(String s, int player) {
    textSize(40);
    fill(126, 115, 100);
    rect(0, 0, 800, height);
    if (player == 1) {
      fill(clr1); 
      text(s, 500, 400);
    } else {
      fill(clr2); 
      text(s, 500, 400);
    }
    fill(255);
    text(" PLAYER WINS : ", 150, 400);
  }
  int numberofmarbles(int idplayer) {
    int cpt=0;
    for (int i=0; i<rows; i++) {
      for ( int j=0; j<columns; j++) {
        if (arr4[i][i]==idplayer)cpt++;
      }
    }

    return cpt;
  }
  void displayScore() {

    textSize(30);
    noStroke();
    fill(70, 80, 90);
    rect(0, 800, width, 200);
    fill(255);
    text( "Score IA 1: ", 400, 850 );
    text( 14-pc.marbles_list.size(), 600, 850 );
    pc.score=14-pc.marbles_list.size();

    textSize(30);
    fill(255);
    text( "Score IA 2 : ", 800, 850 );
    text( 14-pc.marbles_list.size(), 1000, 850 );
    pc1.score=14-pc.marbles_list.size();
  }

  void distplayRoleChipInterface() {
    textSize(20);  
    if (playerRole == 1) roleChipsInterface.get(0).display(pc.clr, pc.clr);
    else roleChipsInterface.get(1).display(pc1.clr, pc1.clr);
    text( " PLAYER", 920, 130 );
  }
}
