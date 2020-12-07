class IaVsIa{
int[][] arr1 = {
  {4, 4, 4, 4, 2, 1, 2, 1, 2, 1, 2, 1, 2, 4, 4, 4, 4}, 
  {4, 4, 4, 2, 1, 2, 1, 2, 1, 2, 1, 2, 1, 2, 4, 4, 4}, 
  {4, 4, 0, 1, 0, 1, 2, 1, 2, 1, 2, 1, 0, 1, 0, 4, 4}, 
  {4, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 4}, 
  {0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0}, 
  {4, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 4}, 
  {4, 4, 0, 1, 0, 1, -2, 1, -2, 1,-2, 1,0, 1, 0, 4, 4}, 
  {4, 4, 4, -2, 1, -2, 1, -2, 1, -2, 1, -2, 1, -2, 4, 4, 4}, 
  {4, 4, 4, 4, -2, 1, -2, 1, -2, 1, -2, 1, -2, 4, 4, 4, 4}, 
};
color clr1, clr2;
tree t,t1;
IA pc,pc1;
Button bh,souha;
PImage pic,pic1,pic2;
int cptch=0;
int playerRole=1;
Button bhome,bquit;
boolean blhome=false,blquit=false;
homePage hm;
homePage home1;
 
public void setup() {
 // println(playerRole);
img=loadImage("bk.jpg");
   background(255);
  clr1 = color(0);
  clr2 = trackColor;
    img1=loadImage("mar6.png");
     img2=loadImage("mar2.png");  
   pc=new IA(clr1,2);
  pc1=new IA(clr2,-2);
  text("Go Home",950,100);
  pic=loadImage("rid.png");
  
  bh=new Button(900,70,pic);
  pic1=loadImage("button2.png");  pic2=loadImage("button3.png");
  roleChipsInterface.add(new Marble(50, 50, 2));
  roleChipsInterface.add(new Marble(50, 50, 1));
  bh.show(); 
  hm=new  homePage();
  board.show();initIaVsIa();
     bhome =new Button(100,500,200,80,50,color(255),"Home " ,110,550); 
       bquit =new Button(500,500,200,80,50,color(255),"quit " ,580,550); 
  
   }


void initIaVsIa() {
      float x,y;
      for (int i=0; i<rows; i++) {
      for ( int j=0; j<columns; j++) {
        x =j*valj+(round);
          y =i*vali+(round);
    
   if (arr1[i][j]==pc.idPlayer) {pc.addMarble(x, y, i, j);}
   if (arr1[i][j]==pc1.idPlayer) { pc1.addMarble(x, y, i, j);}
                    }
                    }
                    }

void Display()
{
//if (blhome==true && bhome.clicked()){home.setup(); }
  if(!endGame ){
     board.show();
       pc.show();
       pc1.show();
       
  bh.show();displayScore(); distplayRoleChipInterface();checkScore();
  // text("Home",920,390);image(pic1,1000,350,90,80);
   //text("Restart",920,490);image(pic2,990,450,110,90);
      
     t=new tree(arr1,null,false,true);
  if (playerRole==1)
    { 
   
    pc.TreeGame(t,pc1.marbles_list);
 
    
    int [][] tmp=pc.creermat(pc.pickBestMove_AlphaBeta(t).matDeJeu,9,17);
  arr1=tmp;
   refresh(tmp);cptch+=t.children.size();
   t.children.clear();   
   roleEnded=true;
 //delay(400);
   }
    
      if(playerRole==2)
   {  
    pc1.TreeGame(t,pc.marbles_list);
   int [][] tmp1=pc1.creermat(pc1.pickBestMove_AlphaBeta(t).matDeJeu,9,17);
   arr1=tmp1;
   refresh(tmp1);cptch+=t.children.size();
   t.children.clear();   
   roleEnded=true;
//delay(400);
   }
    if (roleEnded) 
   { checkScore(); switchRoles(); roleEnded=false;      }
 
}
if(endGame && bhome.clicked() ){home=new homePage();home.setup(); endGame=false;} 
 if(endGame && bquit.clicked()) {exit();}
 
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

void refresh(int [][] matrice) {
    pc.marbles_list.clear();
    pc1.marbles_list.clear();
    for (int i=0; i<rows; i++) {
    for ( int j=0; j<columns; j++) {

      float    x =j*valj+round;
      float   y =i*vali+round;  
   if (matrice[i][j]==pc.idPlayer) {pc.addMarble(x, y, i, j);}
       if (matrice[i][j]==pc1.idPlayer) { pc1.addMarble(x, y, i, j);}
  
  }
    }
}
//--------------




//---------------
void checkScore() {
  if ( pc.score==6) {
    endGameInterface(" IA 1 ", 1); 
    endGame = true;  bhome.drag();bquit.drag();
  }
  if (pc1.score== 6) {
    endGameInterface(" IA  2", 2); 
    
    endGame = true;      bhome.drag();bquit.drag();
  }
}
void endGameInterface(String s, int player) {
  textSize(40);
  fill(70,80,90);
  rect(0, 0, 800, height);
  if (player == 1) {
    fill(clr1); 
    text(s,500, 400);
   
  } else {
    fill(clr2); 
    text(s, 500, 400); 
  }
  fill(255);
  text(" PLAYER WINS : ", 150, 400);
 fill(0);textSize(20); //bhome.show();//bquit.show();
}
void displayScore() {

  textSize(20);noStroke();
  fill(60,70,80);
  rect(800, 0, 400, height);
  fill(255);
  text( "Score IA 1: ", 950, 400 );
  text( 14-pc1.marbles_list.size(), 1140, 400 );
  pc.score=14-pc1.marbles_list.size();
   
  textSize(20);
  fill(255);
  text( "Score IA 2 : ", 950, 500 );
  text( 14-pc.marbles_list.size(), 1140, 500 );
  pc1.score=14-pc.marbles_list.size();}

void distplayRoleChipInterface() {
  textSize(20);  
  if (playerRole == 1) roleChipsInterface.get(0).display(pc.clr,pc.clr);
  else roleChipsInterface.get(1).display(pc1.clr, pc1.clr);
  text( " PLAYER", 920, 130 );
}














}
