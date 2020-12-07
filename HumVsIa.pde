class HumVsIa  {
 int[][] arr1 ={
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
Player player1;
color clr1, clr2;
tree t;
IA pc;
Button bh;
Button bhome,bquit;
boolean blhome=false,blquit=false;
int playerRole = 1;
homePage hm;
public void setup() {
 
  background(255);
  clr1 = color(0);
  clr2 = trackColor;
 
  pc=new IA(clr2,2);
  player1= new Player(clr1,-2);
  player1.setColorSelect(color(50));
  roleChipsInterface.add(new Marble(50, 50, 2));
  roleChipsInterface.add(new Marble(50, 50, 1));
   text("Go Home",950,100);
 // bh=new Button(900,100,loadImage("C:/Users/yucef/Desktop/pic/home_logo.png"));
 // bh.show();
  hm=new  homePage();
  initHumanVsIa();
   bhome =new Button(100,500,200,80,50,color(255),"Home " ,110,550); 
        bquit =new Button(500,500,200,80,50,color(255),"quit " ,580,550); 
   }


void initHumanVsIa() {
      float x,y;
      for (int i=0; i<rows; i++) {
      for ( int j=0; j<columns; j++) {
        x =j*valj+(round);
        y =i*vali+(round);
    if (arr1[i][j]==pc.idPlayer) {pc.addMarble(x, y, i, j);}
    if (arr1[i][j]==player1.idPlayer) { this.player1.addMarble(x, y, i, j);} } } }

void Display()
{
//if(bh.clicked() && !back) {println("home");hm.setup(); hm.mousePressed();back=true;}
 player1.show();
 pc.show();
      
       displayScore();
       distplayRoleChipInterface();
       checkScore();
//     delay(200);
  if(endGame && bhome.clicked() ){home=new homePage();home.setup(); endGame=false;} 
 if(endGame && bquit.clicked()) {exit();}  
}

void mousePressed(){
     if(!endGame){
    if (mouseButton == LEFT)
  {  
    if (playerRole==1)
    {
      player1.playing(arr1);player1.push(pc.marbles_list,arr1);
    if (roleEnded ) 
   {switchRoles();roleEnded=false;refresh(arr1);}
    }distplayRoleChipInterface();
   
  }
  if(playerRole==2)
   {  
   t=new tree(arr1,null,false,true);
     
   pc.TreeGame(t,player1.marbles_list);
   println("size"+t.children.size());
   println(pc.pushToCenter(t)+"pshtocenter");
   int [][] tmp=pc.creermat(pc.pickBestMove_MinMax(t).matDeJeu,9,17);
   arr1=tmp;
   refresh(tmp); 
   t.children.clear();   
   roleEnded=true;   
   if (roleEnded) 
   {checkScore(); switchRoles(); roleEnded=false;} 
   }
  
  println("endrol"+roleEnded);
  
 if (mouseButton == RIGHT && playerRole==1)
    {
      player1.dselec();}
       
     }

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
    player1.marbles_list.clear();
    for (int i=0; i<rows; i++) {
    for ( int j=0; j<columns; j++) {

      float    x =j*valj+round;
      float   y =i*vali+round;  
   if (matrice[i][j]==pc.idPlayer) {pc.addMarble(x, y, i, j);}
       if (matrice[i][j]==player1.idPlayer) { this.player1.addMarble(x, y, i, j);}
  
  }
    }board.show();
}
//--------------





//---------------
void checkScore() {
  if ( pc.score==6) {
    endGameInterface(" IA ", 1); 
    endGame = true; bhome.drag();bquit.drag();
  }
  if (player1.score== 6) {
    endGameInterface(" Player", 2); 
    endGame = true; bhome.drag();bquit.drag();
  }
}
void endGameInterface(String s, int player) {
  textSize(30);
    fill(0);
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
  textSize(20);
}
void displayScore() {
  fill(70,80,90);
  rect(800, 0,400 , height);
  textSize(20);stroke(255);
  fill(70,80,90);
  rect(820, 0, 380, height);
  fill(0);
  text( "Score IA : ", 950, 400 );
  text( 14-player1.marbles_list.size(), 1140, 400 );
   pc.score=14-player1.marbles_list.size();
  textSize(20);
  fill(0);
  text( "Score Human : ", 950, 500 );
  text( player1.score, 1140, 500 );
}
void distplayRoleChipInterface() {
  textSize(30);  
  if (playerRole == 1) roleChipsInterface.get(0).display(clr1, clr1);
  else roleChipsInterface.get(1).display(player1.clr, player1.selclr);
  text( " PLAYER", 1000, 200 );
}
}
