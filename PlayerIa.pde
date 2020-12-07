  class PlayerIa{
  Marble[] tabsel=new Marble[3];
  ArrayList<Marble> marbles_list =new ArrayList<Marble>();
  ArrayList<Board>  listb =new ArrayList<Board>();
  color clr, tclr, selclr;
  Marble m;
  int idPlayer;
  int cptsel=0;
  int score=0;
  public boolean push=false;
  PImage img;


//***********************************************  //***********************************************  //***********************************************  
//***********************************************  //***********************************************  //***********************************************  
//***********************************************  //***********************************************  //***********************************************  
//------------ les FONCTIONS ------------
PlayerIa(){};

//***********************************************  
PlayerIa(color clr,int idPlayer){
    this.clr=clr;
    this.tclr=clr;
    this.idPlayer=idPlayer;
  }
PlayerIa(PImage img,int idPlayer){
    this.img=img;
    this.idPlayer=idPlayer;
  }
//**************************************   
 void addMarble(float x, float y, int i, int j) {
    if (marbles_list.size()<14)
    { m=new Marble(x, y, this.clr, i, j);
    // m=new Marble(x, y, this.img, i, j);
      marbles_list.add(m);} }
//***********************************************      

  void show () {
    for (int i=0; i<marbles_list.size(); i++)
      marbles_list.get(i).show();
  }
//*******************************************
boolean horizontal(Marble m1, Marble m2)
  {

    if (m1.posi==m2.posi && m1.posj+2==m2.posj) return true;
    return false;
  }
//*******************************************
  boolean diagPrincipal(Marble m1, Marble m2)
  {
    if (m1.posi+1==m2.posi && m1.posj+1==m2.posj)
      return true;

    return false;
  }
//*******************************************
  boolean diagSecondaire(Marble m1, Marble m2)
  {
    if (m1.posi+1==m2.posi && m1.posj-1==m2.posj)
      return true; 
    return false;
  }

//*******************************************
 boolean FreePlace3(int i, int j, int i1, int j1, int i2, int j2, int[][] mat)
  {
    if (mat[i][j]==0 && mat[i1][j1]==0 && mat[i2][j2]==0)
      return true;

    return false;
  }
//*******************************************
  boolean FreePlace2(int i, int j, int i1, int j1, int [][] mat)
  {


    if (mat[i][j]==0 && mat[i1][j1]==0)

      return true;
    return false;
  }
//*******************************************
  int[][] creermat(int [][] mat, int l, int c)
  { 
    int[][] tmp=new int[l][c];
    for (int i=0; i<l; i++) {
      for ( int j=0; j<c; j++) {
        tmp[i][j]=mat[i][j];
      }
    }
    return tmp;
  }
//*******************************************
  boolean endof(int i, int j) {
    if (i==0 &&(j==4 || j==12)) { 
      return true;
    }
    if ((i==1||i==7)&&(j==3 || j==13) && tabsel[0].posi==tabsel[1].posi) {  
      return true;
    }
    if ((i==2||i==6) &&(j==2 || j==14) && tabsel[0].posi==tabsel[1].posi) { 
      return true;
    }
    if ((i==3||i==5) &&(j==1 || j==15) && tabsel[0].posi==tabsel[1].posi) { 
      return true;
    }
    if (i==8 &&(j==4 || j==12) && tabsel[0].posi==tabsel[1].posi) {
      return true;
    }
    if (i==4 &&(j==0 || j==16)) { 
      return true;
    }
    if (i==8 &&(j>4 || j<12) && tabsel[0].posi!=tabsel[1].posi) { 
      return true;
    }
    if (i==0 &&(j>4 || j<12) && tabsel[0].posi!=tabsel[1].posi) { 
      return true;
    }
    if (i==1 && j==3 && ((cptsel==2 && diagPrincipal(tabsel[0], tabsel[1]) ) || (cptsel==3 && diagPrincipal(tabsel[0], tabsel[2])))) {  
      return true;
    }
    if (i==2 && j==2 && ((cptsel==2 && diagPrincipal(tabsel[0], tabsel[1])  )|| (cptsel==3 && diagPrincipal(tabsel[0], tabsel[2])))) {  
      return true;
    }
    if (i==3 && j==1 && ((cptsel==2 && diagPrincipal(tabsel[0], tabsel[1])  )|| (cptsel==3 && diagPrincipal(tabsel[0], tabsel[2])))) {  
      return true;
    }
    if (i==5 && j==15 && ((cptsel==2 && diagPrincipal(tabsel[0], tabsel[1]) )|| (cptsel==3 && diagPrincipal(tabsel[0], tabsel[2])))) {  
      return true;
    }
    if (i==6 && j==14 && ((cptsel==2 && diagPrincipal(tabsel[0], tabsel[1]) )|| (cptsel==3 && diagPrincipal(tabsel[0], tabsel[2])))) {  
      return true;
    }
    if (i==7 && j==13 && ((cptsel==2 && diagPrincipal(tabsel[0], tabsel[1]) )||  (cptsel==3 && diagPrincipal(tabsel[0], tabsel[2])))) {  
      return true;
    }
    if (i==1 && j==13 && ((cptsel==2 && diagSecondaire(tabsel[0], tabsel[1])) || (cptsel==3 && diagSecondaire(tabsel[0], tabsel[2])))) {  
      return true;
    }
    if (i==2 && j==14 && ((cptsel==2 && diagSecondaire(tabsel[0], tabsel[1]))|| (cptsel==3 && diagSecondaire(tabsel[0], tabsel[2])))) {  
      return true;
    }
    if (i==3 && j==15 && ((cptsel==2 && diagSecondaire(tabsel[0], tabsel[1]))|| (cptsel==3 && diagSecondaire(tabsel[0], tabsel[2])))) {  
      return true;
    }
    if (i==5 && j==1 && ((cptsel==2 && diagSecondaire(tabsel[0], tabsel[1]) )|| (cptsel==3 && diagSecondaire(tabsel[0], tabsel[2])))) {  
      return true;
    }
    if (i==6 && j==2 && ((cptsel==2 && diagSecondaire(tabsel[0], tabsel[1]))|| (cptsel==3 && diagSecondaire(tabsel[0], tabsel[2])))) {  
      return true;
    }
    if (i==7 && j==3 && ((cptsel==2 && diagSecondaire(tabsel[0], tabsel[1]) )|| (cptsel==3 && diagSecondaire(tabsel[0], tabsel[2])))) {  
      return true;
    }
    return false;
  }
}
