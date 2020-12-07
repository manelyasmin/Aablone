  int[][] ar = {
  {4, 4, 4, 4, 0, 1, 0, 1, 0, 1, 0, 1, 0, 4, 4, 4, 4}, 
  {4, 4, 4, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 4, 4, 4}, 
  {4, 4, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 4, 4}, 
  {4, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 4}, 
  {0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0}, 
  {4, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 4}, 
  {4, 4, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 4, 4}, 
  {4, 4, 4, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 4, 4, 4}, 
  {4, 4, 4, 4, 0, 1, 0, 1, 0, 1, 0, 1, 0, 4, 4, 4, 4}, 
};

class Board { 
  
  boolean active=false; 
  float posx, posy;
  int i,j;
  color c;
 PImage bk;
  Board(float posx, float posy ) {
    this.posx=posx;
    this.posy=posy;
  }


  void show() {
    float x,y;
fill(255);stroke(0);strokeWeight(1);
hexagone(posx,posy,390,6);
fill(70,80,90);strokeWeight(2);
  hexagone(posx,posy,380,6); 
 
    for (int i=0; i <rows; i++) {
      for (int j=0; j<columns; j++) {
          x =j*valj+(round);
          y =i*vali+(round);
        switch(ar[i][j]) {
        case 0: 
          {
      fill(250);  
      noStroke();
     ellipse(x, y ,round,round ); 
          break;
          }
          
                         }
      }
    }
  }  
  Board (float posx,float posy,int i,int j){
  this.posx=posx;
  this.posy=posy;
  this.i=i;
  this.j=j;
  
  }

void displayVoisin() {



    fill(#ffce54);noStroke();

   ellipse(posy*valj+round, posx*vali+round, round-10, round-10);
  }
  void setActive(boolean n) {
    this.active=n;
  }

  boolean equals(Board b)
  {
    if (this.posx==b.posx && this.posy==b.posy)
      return true;
    return false;
  }
}
