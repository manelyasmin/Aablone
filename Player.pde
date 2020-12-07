class Player extends PlayerIa {

  Player() { }
Player(color clr,int idPlayer){super(clr,idPlayer);}
Player(PImage img,int idPlayer){super(img,idPlayer);}
//*********
  //-------------------------------  CONSTRUCTEUR ------------------------------------------//

  //-------------------------  set color for selection ----------------------------//
  void setColorSelect(color clr)
  {
    this.selclr=clr;
  }


  //-------------------------------------------------------
  
  ///----------------------

  void permuter()
  { 
    Marble tmp;
    tmp=tabsel[0];
    tabsel[0]=tabsel[1];
    tabsel[1]=tmp;
    tmp=null;
  }

//*******************************************
  void reglerLeSensDeSelection(Marble [] tab)
  { 
    if (cptsel==2) {
      println("changer le sens de selection  pour cpt==2");
      if (horizontal(tab[1], tab[0])) {
        permuter();
      }
      if (diagPrincipal(tab[1], tab[0])) {
        permuter();
      }
      if (diagSecondaire(tab[1], tab[0])) {
        permuter();
      }
    }
    if (cptsel==3) { 
      println("changer le sens de selection  pour cpt==3");
      if (horizontal(tab[2], tab[0])) {
        permuter();
      }
      if (diagPrincipal(tab[2], tab[0])) {
        permuter();
      }
      if (diagSecondaire(tab[2], tab[0])) {
        permuter();
      }
    }
  }
  //-------------------------------------
  void dselec() {
    for (int n=0; n<cptsel; n++)
    {
      tabsel[n].clr=this.tclr;
    }
    board.show();
    cptsel=0;
  }
  ///----------------------------------------------

  //***************************************** * 

  //----------------------------------------------------------------------------------------------

  //------------------------------------------------------------------------------------------------------ 
  //------------------------------------------------------------------------------------------------------ 
  //------------------------------------------------     selectionner    ------------------------------------------------------ 
  //----------------------------------------            -------------------                     ------------------------------------------- 
  //------------------------------------------------------------------------------------------------------ 
  //------------------------------------------------------------------------------------------------------ 
  void select() {


    for (int j=0; j<marbles_list.size(); j++)
    { 
      if (marbles_list.get(j).clicked() && cptsel<2 )
      { 
        tabsel[cptsel]=marbles_list.get(j); 
        tabsel[cptsel].clr=selclr;
        cptsel++;
      }
    }
    //deletimpossible();
    //*************************

    if (cptsel==2 && ((tabsel[0].posi!=tabsel[1].posi &&(tabsel[0].posj+2==tabsel[1].posj ||tabsel[0].posj-2==tabsel[1].posj)) || (tabsel[0].posi==tabsel[1].posi  && (tabsel[0].posj+4==tabsel[1].posj ||tabsel[0].posj-4==tabsel[1].posj) )))
    {
      for (int n=0; n< marbles_list.size(); n++)
      { //dans la meme ligne : 
        if (tabsel[0].posi==tabsel[1].posi && marbles_list.get(n).posi==tabsel[0].posi )
        { 
          println(" dans meme ligne -select-");
          if (this.tabsel[0].posj+4==this.tabsel[1].posj && marbles_list.get(n).posj==tabsel[0].posj+2)
          {   
            this.tabsel[cptsel]=marbles_list.get(n);
            this.tabsel[cptsel].clr=selclr; 
            cptsel++;
          }

          if (this.tabsel[0].posj-4==this.tabsel[1].posj && marbles_list.get(n).posj==tabsel[0].posj-2)
          {  
            this.tabsel[cptsel]=marbles_list.get(n);
            this.tabsel[cptsel].clr=selclr; 
            cptsel++;
          }
        } 

        // dans des lignes differentes  
        if (this.tabsel[0].posi<this.tabsel[1].posi  && this.tabsel[0].posj+2==this.tabsel[1].posj  
          && marbles_list.get(n).posi==tabsel[0].posi+1 && marbles_list.get(n).posj==tabsel[0].posj+1  )

        {   
          println(" dans diffrent ligne -select-");
          println("select i+1,j+1");
          this.tabsel[cptsel]=marbles_list.get(n);
          this.tabsel[cptsel].clr=selclr; 
          cptsel++;
        } 
        if ((this.tabsel[0].posi>this.tabsel[1].posi   && this.tabsel[0].posj+2==this.tabsel[1].posj 
          && marbles_list.get(n).posi==tabsel[0].posi-1 && marbles_list.get(n).posj==tabsel[0].posj+1))
        {   
          println(" dans diffrent ligne -select-");
          println("select i-1,j+1");
          this.tabsel[cptsel]=marbles_list.get(n);
          this.tabsel[cptsel].clr=selclr; 
          cptsel++;
        }    

        //------------- sens inverse--------
        if (this.tabsel[0].posj-2==this.tabsel[1].posj  && marbles_list.get(n).posi==tabsel[0].posi+1 
          && marbles_list.get(n).posj==tabsel[0].posj-1 && this.tabsel[0].posi<this.tabsel[1].posi )
        {  
          println(" dans diffrent ligne -select-");
          println("select i+1,j-1");
          this.tabsel[cptsel]=marbles_list.get(n);
          this.tabsel[cptsel].clr=selclr;  
          cptsel++;
        }
        if (this.tabsel[0].posj-2==this.tabsel[1].posj && marbles_list.get(n).posi==tabsel[0].posi-1 
          && marbles_list.get(n).posj==tabsel[0].posj-1 && this.tabsel[0].posi>this.tabsel[1].posi)
        {  
          println(" dans diffrent ligne -select-");
          println("select i-1,j-1");
          this.tabsel[cptsel]=marbles_list.get(n);
          this.tabsel[cptsel].clr=selclr; 
          cptsel++;
        }
      }
    }
    reglerLeSensDeSelection(tabsel);
  }
  //******************************************************************************//

  //------------------ FONCTION mouveMarble--------------///
  void moveMarble1(Marble m1, int i, int j,int [][] mat) { 


    {
      int s=mat[m1.posi][m1.posj];
      mat[m1.posi][m1.posj]=mat[i][j];
      m1.move(j*valj+round, i*vali+round, i, j);
      m1.clr=this.tclr;
      mat[m1.posi][m1.posj]=s;
    }
  }
  ///-----------------------------------------------------------------  
  void moveMarble2(Marble m1, Marble m2, int i, int j, int i1, int j1,int [][] mat) {
    moveMarble1(m1, i, j,mat);
    moveMarble1(m2, i1, j1,mat);
  }
  //------------------------------------------------------------------------------                                                                    
  void moveMarble3(Marble m1, Marble m2, Marble m3, int i, int j, int i1, int j1, int i2, int j2,int [][] mat) {
    moveMarble1(m1, i, j,mat);
    moveMarble1(m2, i1, j1,mat);
    moveMarble1(m3, i2, j2,mat);
  }
  //------------------------------------------------------------------------------ \\                 //------------------------------------------------------------------------------ 
  //------------------------------------------------------------------------------\\   decaler   //------------------------------------------------------------------------------ 
  //------------------------------------------------------------------------------\\         //------------------------------------------------------------------------------ 
  //-------------------------------------------------------------------------------------------------------------------------------------- 
  void bouger(int i, int j,int [][] mat) {
    Marble m=new Marble();

    m.posi=i;
    m.posj=j;
    if (existDansListe(m)|| push==true) {
      if (cptsel==1 && (i==tabsel[0].posi &&( j+2==tabsel[0].posj ||j-2==tabsel[0].posj ) || (i==tabsel[0].posi+1 || i==tabsel[0].posi-1) &&( j+1==tabsel[0].posj ||j-1==tabsel[0].posj )))
      { 
        moveMarble1(tabsel[0], i, j,mat); 
        dselec();
        roleEnded=true;
      }



      //-****-******************--------------------2 marbles    --------************************************       
      if (cptsel==2) { // nvefrifiyiw esq m appartien au listb ou pas yb9w les mm  traitemnt
        println(" 2 boules  ");

        // --------------diagonale principale-----------

        if (diagPrincipal(tabsel[0], tabsel[1])) {
          if (diagPrincipal(tabsel[1], m)) { 
            moveMarble1(tabsel[0], i, j,mat);
            dselec();
            roleEnded=true;
          }
          if (diagPrincipal(m, tabsel[0])) { 
            moveMarble1(tabsel[1], i, j,mat);
            dselec();
            roleEnded=true;
          }
          if ( horizontal(m, tabsel[0]) || diagSecondaire(m, tabsel[0])) {
            moveMarble2(tabsel[0], tabsel[1], i, j, i+1, j+1,mat);
            dselec();
            roleEnded=true;
          }
          if (horizontal(tabsel[1], m)   ||  diagSecondaire(tabsel[1], m)) {
            moveMarble2(tabsel[1], tabsel[0], i, j, i-1, j-1,mat);
            dselec();
            roleEnded=true;
          }
        }


        //----------------------------------------------
        // ------------- diagonal secondaire --------------------- 
        //---------------------------------------------------- 
        if (diagSecondaire(tabsel[0], tabsel[1])   ) {
          if (diagSecondaire(tabsel[1], m)) { 
            moveMarble1(tabsel[0], i, j,mat);
            dselec();
            roleEnded=true;
          }
          if (diagSecondaire(m, tabsel[0])) { 
            moveMarble1(tabsel[1], i, j,mat);
            dselec();
            roleEnded=true;
          } 
          if ( horizontal(m, tabsel[1]) || diagPrincipal(tabsel[1], m)) {
            moveMarble2(tabsel[0], tabsel[1], i, j, i-1, j+1,mat);
            dselec();
            roleEnded=true;
          }
          if (  horizontal(tabsel[0], m)   || diagPrincipal(m, tabsel[0]) ) {
            moveMarble2(tabsel[0], tabsel[1], i, j, i+1, j-1,mat);
            dselec();
            roleEnded=true;
          }
        }

        //-------------------------Horizontal --------------------------- 
        //------------ ------ dans mm ligne -----------------     
        if (horizontal(tabsel[0], tabsel[1])) {    
          if (horizontal(tabsel[1], m)) { 
            moveMarble1(tabsel[0], i, j,mat);
            dselec();
            roleEnded=true;
          }
          if (horizontal(m, tabsel[0])) { 
            moveMarble1(tabsel[1], i, j,mat);
            dselec();
            roleEnded=true;
          }
          ///--------------------------------------------------------------
          //---------------------------- haut // bas ----------------------------------
          if (diagPrincipal(m, tabsel[0]) || diagSecondaire(tabsel[0], m)) { 
            moveMarble2(tabsel[0], tabsel[1], i, j, i, j+2,mat);
            dselec();
            roleEnded=true;
          }
          if ( diagSecondaire(m, tabsel[1]) || diagPrincipal(tabsel[1], m)) { 
            moveMarble2(tabsel[1], tabsel[0], i, j, i, j-2,mat);
            dselec();
            roleEnded=true;
          }
        }
      }
      //------------------------------------------------------------------------------
      //-------------------------------------------------------------------------------
      if (cptsel==3 ) {

        // --------------diagonale principale-----------

        if (diagPrincipal(tabsel[0], tabsel[2])) {
          if (diagPrincipal(tabsel[1], m)) { 
            moveMarble1(tabsel[0], i, j,mat);
            dselec();
            roleEnded=true;
          }
          if ( diagPrincipal(m, tabsel[0])) { 
            moveMarble1(tabsel[1], i, j,mat);
            dselec();
            roleEnded=true;
          }
          if ( horizontal(m, tabsel[0]) || diagSecondaire(m, tabsel[0])) {
            moveMarble3(tabsel[0], tabsel[2], tabsel[1], i, j, i+1, j+1, i+2, j+2,mat);
            dselec();
            roleEnded=true;
          }
          if (horizontal(tabsel[1], m)   ||  diagSecondaire(tabsel[1], m)) {
            moveMarble3(tabsel[1], tabsel[2], tabsel[0], i, j, i-1, j-1, i-2, j-2,mat);
            dselec();
            roleEnded=true;
          }
        }
        //---------------------------------------------
        // ------------- diagonal secondaire ---------------------            
        //---------------------------------------------------- 
        if (diagSecondaire(tabsel[0], tabsel[2])   ) {
          if (diagSecondaire(tabsel[1], m)) { 
            moveMarble1(tabsel[0], i, j,mat);
            dselec();
            roleEnded=true;
          }
          if (diagSecondaire(m, tabsel[0])) { 
            moveMarble1(tabsel[1], i, j,mat);
            dselec();
            roleEnded=true;
          } 
          if (  horizontal(m, tabsel[1]) || diagPrincipal(tabsel[1], m)) {
            moveMarble3(tabsel[0], tabsel[2], tabsel[1], i, j, i-1, j+1, i-2, j+2,mat);
            dselec();
            roleEnded=true;
          }
          if (  horizontal(tabsel[0], m)   || diagPrincipal(m, tabsel[0]) ) {
            moveMarble3(tabsel[0], tabsel[2], tabsel[1], i, j, i+1, j-1, i+2, j-2,mat);
            dselec();
            roleEnded=true;
          }
        }


        //-------------------------Horizontal --------------------------- 
        //------------ ------ dans mm ligne -----------------     
        if (horizontal(tabsel[0], tabsel[2])) {    
          if (horizontal(tabsel[1], m)) { 
            moveMarble1(tabsel[0], i, j,mat);
            dselec();
            roleEnded=true;
          }
          if (horizontal(m, tabsel[0])) { 
            moveMarble1(tabsel[1], i, j,mat);
            dselec();
            roleEnded=true;
          }
          ///--------------------------------------------------------------
          //---------------------------- haut // bas ----------------------------------
          if (diagPrincipal(m, tabsel[0]) || diagSecondaire(tabsel[0], m)) { 
            moveMarble3(tabsel[0], tabsel[2], tabsel[1], i, j, i, j+2, i, j+4,mat);
            dselec();
            roleEnded=true;
          }
          if ( diagSecondaire(m, tabsel[1]) || diagPrincipal(tabsel[1], m)) { 
            moveMarble3(tabsel[1], tabsel[2], tabsel[0], i, j, i, j-2, i, j-4,mat);
            dselec();
            roleEnded=true;
          }
        }
      }
    } if (existDansListe(m)|| push==true ) dselec();
  } 
  //--------------------------------------------------------------------------------------------------------------------------------  
  void decaler(int [][] mat)
  {
    for (int i=0; i <9; i++) {
      for (int j=0; j<17; j++) {
        float  d =dist(mouseX, mouseY, j*valj+round, i*vali+round);
        if (d<round/2  && mat[i][j]==0)
        {
          bouger(i, j,mat);
        }
      }
    }
  }


  //--------------------------------------------------    ------        ------------------------------------------------------------------------ 
  //-----------------------------------------------   POUSSER 'PUSH'   --------------------------------------------------------------------------------- 
  //-------------------------------------------------    ------      ------------------------------------------------------------------------- 
  void permuterVal(int i, int j, int x, int y,int [][] mat) {

   mat[i][j]=mat[x][y];
   mat[x][y]=0;
  }

  //**--------------------------------------------------------------------------------------------------------------------------------------------------------------
  void push3(ArrayList<Marble> liste,int [][] mat)
  {
    Marble m1;
    int x, y;
    
    {
      for (int a=0; a<liste.size(); a++) { 
        m1=liste.get(a);

        if (m1.clicked() ) 
        {
          x=m1.posi;
          y=m1.posj;
         
          if (horizontal(tabsel[0], tabsel[2]) && horizontal(tabsel[1], m1)) {
            println("---horizontal  right---");
            if ((!endof(x, y) &&  mat[x][y+2]==0))  
            {push=true;
              println("i j+2 push ");
              permuterVal(x, y+2, x, y,mat);
              m1.move((y+2)*valj+round, (x)*vali+round, x, y+2);
              this.decaler(mat);
              dselec(); 
              roleEnded=true;
            }
            if (y+4<=16 && !endof(x, y+2) && mat[x][y+2]==mat[x][y] && mat[x][y+4]==0)  
            {push=true;
              println("i+2 j+2 push ");
              permuterVal(x, y+4, x, y,mat);
              m1.move((y+4)*valj+round, (x)*vali+round, x, y+4);
              this.decaler(mat);
              dselec(); 
              roleEnded=true;
            }

            if (endof(x, y) || (endof(x, y+2) && mat[x][y+2]==mat[x][y])) 
            { push=true;
              liste.remove(m1);
              mat[x][y]=0;
              this.decaler(mat);
              score++; 
              roleEnded=true;
              println("remove i,j+2 ");
            }
          }

          //   gauche        
          if (horizontal(tabsel[0], tabsel[2]) && horizontal(m1, tabsel[0])) {
            println("---horizontal     left ---");
            if ((!endof(x, y) &&  mat[x][y-2]==0))  
            { push=true;
              println("i j-2 push ");
              permuterVal(x, y-2, x, y,mat);
              m1.move((y-2)*valj+round, (x)*vali+round, x, y-2);
              this.decaler(mat);
              dselec();
              roleEnded=true;
            }

            if (y-4>=0 && !endof(x, y-2) && mat[x][y-2]==mat[x][y] && mat[x][y-4]==0)  
            { push=true;
              println("i+2 j+2 push ");
              permuterVal(x, y-4, x, y,mat);
              m1.move((y-4)*valj+round, (x)*vali+round, x, y-4);
              this.decaler(mat);
              dselec(); 
              roleEnded=true;
            }

            if (endof(x, y) || (endof(x, y-2) && mat[x][y-2]==mat[x][y])) 
            {  push=true;
              liste.remove(m1);
              mat[x][y]=0;
              this.decaler(mat);
              score++;
              roleEnded=true;
              println("remove i,j-2 ");
            }
          }

          //   diag principale ---------------  

          if (diagPrincipal(tabsel[0], tabsel[2]) && diagPrincipal(tabsel[1], m1)) {
            println("---digonale primaire  bas ------");
            if (endof(x, y) || (endof(x+1, y+1) && mat[x+1][y+1]==mat[x][y])) 
            {  push=true;
              liste.remove(m1);
              mat[x][y]=0;
              this.decaler(mat);
              score++;
              roleEnded=true;
              println("remove i+1,j+1 ");
            } 


            if ((!endof(x, y) &&  mat[x+1][y+1]==0))  
            { push=true;
              println("i+1 j+1 push ");
              permuterVal(x+1, y+1, x, y,mat);
              m1.move((y+1)*valj+round, (x+1)*vali+round, x+1, y+1);
              this.decaler(mat);
              dselec();
              roleEnded=true;
            }


            if (x+2<=8 && y+2<=16 && !endof(x+1, y+1) && mat[x+1][y+1]==mat[x][y] &&  mat[x+2][y+2]==0)  
            { push=true;
              println("i+2 j+2 push ");
              permuterVal(x+2, y+2, x, y,mat);
              m1.move((y+2)*valj+round, (x+2)*vali+round, x+2, y+2);
              this.decaler(mat);
              dselec();
              roleEnded=true;
            }
          }

          if (diagPrincipal(tabsel[0], tabsel[2]) && diagPrincipal(m1, tabsel[0])) {
            println("---vertical haus ---");
            if ((!endof(x, y) &&  mat[x-1][y-1]==0))  
            {push=true;
              println("i-1 j-1 push ");
              permuterVal(x-1, y-1, x, y,mat);
              m1.move((y-1)*valj+round, (x-1)*vali+round, x-1, y-1);
              this.decaler(mat);
              dselec(); 
              roleEnded=true;
            }

            if (endof(x, y) || (endof(x-1, y-1) && mat[x-1][y-1]==mat[x][y])) 
            { push=true;
              liste.remove(m1);
              mat[x][y]=0;
              this.decaler(mat);
              score++; 
              roleEnded=true;
              println("remove i-1,j-1 ");
            }


            if (x-2>=0 && y-2>=0 &&  !endof(x-1, y-1) && mat[x-1][y-1]==mat[x][y] &&  mat[x-2][y-2]==0)  
            {push=true;
              println("i-1 j-1 push ");
              permuterVal(x-2, y-2, x, y,mat);
              m1.move((y-2)*valj+round, (x-2)*vali+round, x-2, y-2);
              this.decaler(mat);
              dselec(); 
              roleEnded=true;
            }
          }

          //   diag secondaire    
          // haut i-1 j+1

          if (diagSecondaire(tabsel[0], tabsel[2]) && diagSecondaire(m1, tabsel[0])) {
            println("---   diag secondaire ---");
            if (endof(x, y) || (endof(x-1, y+1) && mat[x-1][y+1]==mat[x][y])) 
            { push=true;
              liste.remove(m1);
              mat[x][y]=0;
              this.decaler(mat);
              score++; 
              roleEnded=true;
              println("remove i-1,j+1 ");
            } 
            if ((!endof(x, y) &&  mat[x-1][y+1]==0))  
            {push=true;
              println("push   i-1,j+1  ");
              permuterVal(x-1, y+1, x, y,mat);
              m1.move((y+1)*valj+round, (x-1)*vali+round, x-1, y+1);
              this.decaler(mat);
              dselec(); 
              roleEnded=true;
            }

            if (x-2>=0 && y+2<= 16 && !endof(x-1, y+1) && mat[x-1][y+1]==mat[x][y] &&  mat[x-2][y+2]==0)  
            {push=true;
              println("i-1 j+1 push ");
              permuterVal(x-2, y+2, x, y,mat);
              m1.move((y+2)*valj+round, (x-2)*vali+round, x-2, y+2);
              this.decaler(mat);
              dselec(); 
              roleEnded=true;
            }
          }
          // bas i+1 j-1
          if (diagSecondaire(tabsel[0], tabsel[2]) && diagSecondaire(tabsel[1], m1)) {
            println("---   diag secondaire  i+1,j-1 ---");
            if (endof(x, y) || (endof(x+1, y-1) && mat[x+1][y-1]==mat[x][y])) 
            {  push=true;
              liste.remove(m1);
              mat[x][y]=0;
              this.decaler(mat);
              score++;
              roleEnded=true;
              println("remove i+1,j-1 ");
            } 
            if ((!endof(x, y) &&  mat[x+1][y-1]==0))  
            {push=true;
              println("push  i+1,j-1 ");
              permuterVal(x+1, y-1, x, y,mat);
              m1.move((y-1)*valj+round, (x+1)*vali+round, x+1, y-1);
              this.decaler(mat);
              dselec(); 
              roleEnded=true;
            }

            if (x+2<=8 && y-2>=0 && !endof(x+1, y-1) && mat[x+1][y-1]==mat[x][y] &&  mat[x+2][y-2]==0)  
            {push=true;
              println("i+1,j-1 push ");
              permuterVal(x+2, y-2, x, y,mat);
              m1.move((y-2)*valj+round, (x+2)*vali+round, x+2, y-2);
              this.decaler(mat);
              dselec(); 
              roleEnded=true;
            }
          }
          //--------------------------------------------------
        }if((!push && m1.clicked()) || listb.size()==0)dselec();
      }
    }
  }
  //-----------------------------------------------------------------------------------------------------------------------------
  //**-------------------------------------------------------------------------------------------------------
  void push2(ArrayList<Marble> liste,int [][] mat)
  {//psk ana 9a3 khadmti ahi b la liste mela ntylo une liste w mayhmch ida player or ia apres ki n3yat na3yt ia.list wela player.liste w haka matsa7a9 tamodfi ta hadja
    Marble m1;
    int x, y;
    {for (int a=0; a<liste.size(); a++) { 
        m1=liste.get(a);

        if (m1.clicked() ) 
        {
          x=m1.posi;
          y=m1.posj;
          
          if (horizontal(tabsel[0], tabsel[1]) && horizontal(tabsel[1], m1)) {
            println("---horizontal  right---");
            if (y+2<=16 && !endof(x, y) &&  mat[x][y+2]==0)  
            {push=true;
              println("i j+2 push ");
              permuterVal(x, y+2, x, y,mat);
              m1.move((y+2)*valj+round, (x)*vali+round, x, y+2);
              this.decaler(mat);
              dselec();
              roleEnded=true;
            }

            if (endof(x, y)) 
            { push=true;
              liste.remove(m1);
              mat[x][y]=0;
              this.decaler(mat);
              score++;
              roleEnded=true;
              println("remove i,j+2 ");
            }
          }

          //   gauche        
          if (horizontal(tabsel[0], tabsel[1]) && horizontal(m1, tabsel[0])) {
            println("---horizontal     left ---");
            if (y-2>=0 && !endof(x, y) &&  mat[x][y-2]==0)
            {push=true;
              println("i j-2 push ");
              permuterVal(x, y-2, x, y,mat);
              m1.move((y-2)*valj+round, (x)*vali+round, x, y-2);
              this.decaler(mat);
              dselec();
              roleEnded=true;
            }

            if (endof(x, y)) 
            { push=true;
              liste.remove(m1);
              mat[x][y]=0;
              this.decaler(mat);
              score++;
              roleEnded=true;
              println("remove i,j-2 ");
            }
          }

          //   diag principale ---------------  

          if (diagPrincipal(tabsel[0], tabsel[1]) && diagPrincipal(tabsel[1], m1)) {
            println("---digonale primaire  bas ------");
            if (x+1<=8 && y+1<=16 && !endof(x, y) &&  mat[x+1][y+1]==0) 
            {push=true;
              println("i+1 j+1 push ");
              permuterVal(x+1, y+1, x, y,mat);
              m1.move((y+1)*valj+round, (x+1)*vali+round, x+1, y+1);
              this.decaler(mat);
              dselec();
              roleEnded=true;
            }

            if (endof(x, y)) 
            { push=true;
            liste.remove(m1);
              mat[x][y]=0;
              this.decaler(mat);
              score++;
              roleEnded=true;
              println("remove i+1,j+1 ");
            }
          }

          if (diagPrincipal(tabsel[0], tabsel[1]) && diagPrincipal(m1, tabsel[0])) {
            println("---vertical haus ---");
            if (x-1>=0 && y-1>=0 && !endof(x, y) &&  mat[x-1][y-1]==0)  
            {push=true;
              println("i-1 j-1 push ");
              permuterVal(x-1, y-1, x, y,mat);
              m1.move((y-1)*valj+round, (x-1)*vali+round, x-1, y-1);
              this.decaler(mat);
              dselec();
              roleEnded=true;
            }

            if (endof(x, y)) 
            { push=true;
              liste.remove(m1);
              mat[x][y]=0;
              this.decaler(mat);
              score++;
              roleEnded=true;
              println("remove i-1,j-1 ");
            }
          }

          //   diag secondaire    
          // haut i-1 j+1

          if (diagSecondaire(tabsel[0], tabsel[1]) && diagSecondaire(m1, tabsel[0])) {
            println("---   diag secondaire ---");
            if (endof(x, y)) 
            { push=true;
             liste.remove(m1);
              mat[x][y]=0;
              this.decaler(mat);
              score++;
              roleEnded=true;
              println("remove i-1,j+1 ");
            } 
            if (x-1>=0 && y+1<=16 && !endof(x, y) &&  mat[x-1][y+1]==0)  
            {push=true;
              println("push  i-1,j+1  ");
              permuterVal(x-1, y+1, x, y,mat);
              m1.move((y+1)*valj+round, (x-1)*vali+round, x-1, y+1);
              this.decaler(mat);
              dselec();
              roleEnded=true;
            }
          }
          // bas i+1 j-1
          if (diagSecondaire(tabsel[0], tabsel[1]) && diagSecondaire(tabsel[1], m1)) {
            println("---   diag secondaire  i+1,j-1 ---");
            if (endof(x, y)) 
            { push=true;
              liste.remove(m1);
              mat[x][y]=0;
              this.decaler(mat);
              score++;
              roleEnded=true;
              println("remove i+1,j-1 ");
            } 
            if (x+1<=8 && y-1>=0 && !endof(x, y) &&  mat[x+1][y-1]==0)  
            {push=true;
              println("push  i+1,j-1 ");
              permuterVal(x+1, y-1, x, y,mat);
              m1.move((y-1)*valj+round, (x+1)*vali+round, x+1, y-1);
              this.decaler(mat);
              dselec();
              roleEnded=true;
            }
          }
        }if((!push && m1.clicked()) || listb.size()==0)dselec();
      
    }}
  }
  //--------------------------------------------------------------------------------------------------------------------------------       
  void push(ArrayList<Marble> liste,int [][] mat) {

    switch(cptsel)
    {
    case 2:
      push2(liste,mat);
      push=false; 
      break;
    case 3: 
    push3(liste,mat);
      push=false;
      break;
    }
  }

  //---------------------------------------------------------------

  //----------------------------------------------------     ---------      -----------------------------------------------//
  //----------------------------------------------         CAS POSSIBLE    ------------------------------------------------------------//
  //-----------------------------------------------------    --------        ----------------------------------------//
  boolean existDansListe(Marble mar)
  {
    for (Board b : listb)
    {
      if (mar.posi==b.posx && mar.posj==b.posy)
        return true;
    }
    return false;
  }
  //---------------------------------------------------------------------------------------------------------------
  void casPossibl(int [][] mat)
  {
    listb.clear();
    board.show();
    switch(cptsel)
    {
    case 1:
      casPossible1(mat); 
      break;
    case 2:
      casPossible2(mat); 
      break;
    case 3:
      casPossible3(mat);
      break;
    }

    AfficheVoisin();
  }
  //----------------------------------------------------------------------------------------------------------------
  //-------------------------------------------- 3 boules --------------------------------------------------------------------
  void casPossible3(int [][] mat) {
    println(" casPossible 3 boules ");
    Marble mar=new Marble(); 
    for (int i=0; i <9; i++) {
      for (int j=0; j<17; j++) {
        {
          mar.posi=i;
          mar.posj=j;
          int x=mar.posi;
          int y=mar.posj;
          if (horizontal(tabsel[0], tabsel[2]))
          { 
         //   println(" horizontal  casPossible 3 boules ");
            if ((diagSecondaire(tabsel[0], mar) ||diagPrincipal(mar, tabsel[0]))&& (FreePlace3(x, y, x, y+2, x, y+4,mat)  ))
            {
              Board b=new Board(x, y);
              listb.add(b);
            }

            if ((diagSecondaire(mar, tabsel[1]) || diagPrincipal(tabsel[1], mar))&& (FreePlace3(x, y, x, y-2, x, y-4,mat) ))
            {
              Board b=new Board(x, y);
              listb.add(b);
            }

            if ((horizontal(mar, tabsel[0] ) || horizontal(tabsel[1], mar ) )   &&  (mat[x][y]==0 ||  (mat[x][y]==-mat[tabsel[0].posi][tabsel[0].posj]) ))
            {
              Board b=new Board(x, y);
              listb.add(b);
            }
          }


          //----------------------------------------- diagonal principale  ---------------------------------------
          if (diagPrincipal(tabsel[0], tabsel[2]))
          { 
            println(" diagonal principale  casPossible 3 boules ");
            if ((horizontal(tabsel[1], mar) || diagSecondaire(tabsel[1], mar))&& FreePlace3(x, y, x-1, y-1, x-2, y-2,mat))
            {
              Board b=new Board(x, y);
              listb.add(b);
            }

            if ((horizontal(mar, tabsel[0]) || diagSecondaire(mar, tabsel[0]))&& FreePlace3(x, y, x+1, y+1, x+2, y+2,mat))
            {
              Board b=new Board(x, y);
              listb.add(b);
            }

            if ((diagPrincipal(mar, tabsel[0] ) || diagPrincipal(tabsel[1], mar ) )  &&  (mat[x][y]==0 ||  (mat[x][y]==-mat[tabsel[0].posi][tabsel[0].posj]) ))
            {
              Board b=new Board(x, y);
              listb.add(b);
            }
          }

          //---------------------------------------- diagonal secondaire  -----------------------------------------
          if (diagSecondaire(tabsel[0], tabsel[2]))
          {  
            println(" diagonal secondaire  casPossible 3 boules ");
            if ((horizontal(tabsel[0], mar) || diagPrincipal(mar, tabsel[0]))&& FreePlace3(x, y, x+1, y-1, x+2, y-2,mat))
            {
              Board b=new Board(x, y);
              listb.add(b);
            }
            if ((horizontal(mar, tabsel[1]) || diagPrincipal(tabsel[1], mar))&& FreePlace3(x, y, x-1, y+1, x-2, y+2,mat))
            {
              Board b=new Board(x, y);
              listb.add(b);
            }
            if ((diagSecondaire(mar, tabsel[0] ) || diagSecondaire(tabsel[1], mar ) ) &&  (mat[x][y]==0 ||  (mat[x][y]==-mat[tabsel[0].posi][tabsel[0].posj]) ))
            {
              Board b=new Board(x, y);
              listb.add(b);
            }
          }
        }
      }
    }//zedtha a cause wela yakhlihom selected 
    if(cptsel==3 && listb.size()==0 ) {dselec();}

    }
  

  //----------------------------------------------------------------------------------------------------------------
  //-------------------------------------------- 2 boules --------------------------------------------------------------------
  void casPossible2(int [][]mat) {
    Marble m=new Marble();
  //  println("cas Possibles pour 2 boules");
    for (int i=0; i<9; i++) {
      for (int j=0; j<17; j++) {
        m.posi=i;
        m.posj=j;
        int x=m.posi;
        int y=m.posj;
        //---------------------- cas horizontal ------------------
        if (horizontal(tabsel[0], tabsel[1])) { 
    //      println("cas horizontal");
          if ((diagPrincipal(m, tabsel[0]) || diagSecondaire(tabsel[0], m)) && FreePlace2(x, y, x, y+2,mat)) 
          {//println("10");
            Board b=new Board(x, y); 
            listb.add(b);
          }
          if ((diagSecondaire(m, tabsel[1]) || diagPrincipal(tabsel[1], m)) && FreePlace2(x, y, x, y-2,mat))
          {//println("9");
            Board b=new Board(x, y);
            listb.add(b);
          }
          if (( horizontal(tabsel[1], m) || horizontal(m, tabsel[0]) )  &&  (mat[x][y]==0 ||  (mat[x][y]==- mat[tabsel[0].posi][tabsel[0].posj]) ))
          {println("8");
            Board b=new Board(x, y); 
            listb.add(b);
          }
          
        }

        //-------------------------------------  digonale secondaire ---------------------------------------------
        if (diagSecondaire(tabsel[0], tabsel[1])) {  
          //println("digonale secondaire");
          if ((diagSecondaire(tabsel[1], m) || diagSecondaire(m, tabsel[0])  )  &&  (mat[x][y]==0 ||  (mat[x][y]==- mat[tabsel[0].posi][tabsel[0].posj]) )) {
            Board b=new Board(x, y); println("6");
            listb.add(b);
          }
          if ((horizontal(m, tabsel[1]) || diagPrincipal(tabsel[1], m) )  && FreePlace2(x, y, x-1, y+1,mat)) {println("5");
            Board b=new Board(x, y);  
            listb.add(b);
          }
          if (( horizontal(tabsel[0], m) || diagPrincipal(m, tabsel[0])) && FreePlace2(x, y, x+1, y-1,mat)) { println("4");
            Board b=new Board(x, y); 
            listb.add(b);
          }
        }
        //-----------------------------------   digonal principle -----------------------------------------------------
        if (diagPrincipal(tabsel[0], tabsel[1])) {
          //println("digonale principale  "); 
          if ( (diagPrincipal(tabsel[1], m) || diagPrincipal(m, tabsel[0]) )   &&  (mat[x][y]==0 ||  (mat[x][y]== -mat[tabsel[0].posi][tabsel[0].posj]) ))
          {println("*1");
            Board b=new Board(x, y);  
            listb.add(b);
          }
          if (( horizontal(m, tabsel[0]) || diagSecondaire(m, tabsel[0])  ) && FreePlace2(x, y, x+1, y+1,mat)){println("2");
            Board b=new Board(x, y); 
            listb.add(b);
          }
          if ((horizontal(tabsel[1], m) || diagSecondaire(tabsel[1], m))  && FreePlace2(x, y, x-1, y-1,mat) )  {println("3");
            Board b=new Board(x, y);
            listb.add(b);
          }
        }
      }
    }//j ajoute listb.size==0 a cause wela ki ykon sayr dayr b les mm boules que hwa maydeslectionich et j ajoute f caspossible 3 condition 3La listb aussi 
if(cptsel==2 && (dist(tabsel[0].x,tabsel[0].y,tabsel[1].x,tabsel[1].y)>90 || listb.size()==0)    ){dselec(); println("deselectionner");}


}
  //----------------------------------------------------------------------------------------------------------------
  //-------------------------------------------- 1 boule --------------------------------------------------------------------
  void casPossible1(int [][] mat) {
    Marble mar=new Marble();
    println(" cas 1 boule");
    for (int i=0; i <9; i++) {
      for (int j=0; j<17; j++) {
        {
          mar.posi=i;
          mar.posj=j;
          int x=mar.posi;
          int y=mar.posj;
          if ((horizontal(mar, tabsel[0] ) || horizontal(tabsel[0], mar) || diagSecondaire(mar, tabsel[0])|| diagSecondaire(tabsel[0], mar) 
            || diagPrincipal(mar, tabsel[0]) || diagPrincipal(tabsel[0], mar))&&  mat[x][y]==0)
          {
            Board b=new Board(x, y);
            listb.add(b);
          }
        }
      }
    }
  }
  //---------------------------------------      afficher  -------------------------------
  void AfficheVoisin()
  {
    println(" affiche voisins");
    println(listb.size());
    for (Board b : listb)
     { b.displayVoisin(); println("x="+b.posx+" -y="+b.posy);}
  }
  //----------------------------------------------------     ---------      -----------------------------------------------//
  //----------------------------------------------      ------------------  ------------------------------------------------------------//
  //-----------------------------------------------------    --------        ----------------------------------------//        


  void playing(int [][]mat) {
    select();
    casPossibl(mat);
    decaler(mat); 
  }
}
