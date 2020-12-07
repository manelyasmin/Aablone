class HumanVsHuman {
int[][] arr2 = {
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
Player player1, player2;
color clr1, clr2;
int playerRole=2;
Button bhome,bquit;
homePage hm;
Button bh;
public void setup() {
 
  background(255);
  clr1 = color(219,93,93);
  clr2 = color(#4fc1e9);
  player1= new Player(clr1,2);
  player2= new Player(clr2,-2);
  player1.setColorSelect(color(185,9,9));
  player2.setColorSelect(color(#11779B));
   roleChipsInterface.add(new Marble(50, 50, 2));
  roleChipsInterface.add(new Marble(50, 50, 1));
  text("Go Home",950,100);
  bh=new Button(900,100,loadImage("C:/Users/yucef/Desktop/pic/home_logo.png"));
  bh.show();
  hm=new  homePage(); 
      
  initHumVsHum(); 
 

 bhome =new Button(100,500,200,80,50,color(255),"Home " ,110,550); 
       bquit =new Button(500,500,200,80,50,color(255),"quit " ,580,550); 
}



void initHumVsHum() {
   float x,y;
  for (int i=0; i<rows; i++) {
    for ( int j=0; j<columns; j++) {
       x =j*valj+(round);
          y =i*vali+(round);
     if (arr2[i][j]==player1.idPlayer) { this.player1.addMarble(x, y, i, j);}
      if (arr2[i][j]==player2.idPlayer) { this.player2.addMarble(x, y, i, j);}}}
                                   }


void DisplayHum()
{

 player1.show();
 player2.show();
  displayScore();distplayRoleChipInterface();
checkScore();
if(endGame && bhome.clicked() ){home=new homePage();home.setup(); endGame=false;} 
 if(endGame && bquit.clicked()) {exit();}
 
}
void playerVsPlayer(Player p1,Player p2){

  if (mouseButton == LEFT)
  {  
     
    if (playerRole==1)
    {p1.playing(arr2); p1.push(p2.marbles_list,arr2); println("roleEnded:"+roleEnded);

     }
    if (playerRole==2)
    { p2.playing(arr2);p2.push(p1.marbles_list,arr2);} println("roleEnded:"+roleEnded);
  }
  else if (mouseButton == RIGHT)
  { 
    if (playerRole==1)
    {
      p1.dselec();
    }
    if (playerRole==2)
    {
      p2.dselec();
    }
  }
}
void mousePressed(){

  println("role:"+playerRole);
  println("roleEnded:"+roleEnded);
  if(!endGame){  
   distplayRoleChipInterface();
   playerVsPlayer(player1,player2);
   if (roleEnded) 
   {checkScore(); switchRoles(); roleEnded=false;
   distplayRoleChipInterface();
  } 
}

//  else {println("ended" );}
}
void displayScore() {

  textSize(20);noStroke();
  fill(60,70,80);
  rect(800, 0, 400, height);
  fill(0);
  text( "Score player 1 : ", 950, 400 );
  text( player1.score, 1140, 400 );
  textSize(20);
  fill(0);
  text( "Score player 2 : ", 950, 500 );
  text( player2.score, 1140, 500 );
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
void distplayRoleChipInterface() {
  textSize(30);  
  if (playerRole == 1) roleChipsInterface.get(0).display(player1.clr, player1.selclr);
  else roleChipsInterface.get(1).display(player2.clr, player2.selclr);
  text( " PLAYER", 1000, 200 );
}
void checkScore() {
  if ( player1.score==6) {
    endGameInterface(" Player 1 ", 1); 
    endGame = true; bhome.drag();bquit.drag();
  }
  if (player2.score== 6) {
    endGameInterface(" Player 2", 2); 
    endGame = true; bhome.drag();bquit.drag();
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
  textSize(20);
}
}
