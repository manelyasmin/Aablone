class IA  extends PlayerIa { //<>//
 
boolean pushed=false;
ArrayList<Marble> listecont;
ArrayList<Float> poids=new ArrayList();
int strategy=0;
ArrayList<Marble> getIt(tree t){
 
   float x,y;
for(int i=0;i<9;i++){
  for(int j=0;j<17;j++){
     x =j*valj+(round);
         y =i*vali+(round);
    if(t.matDeJeu[i][j]==-idPlayer){
    listecont.add(new Marble(x,y));
    }
  }
}
return listecont;
}
  //*************************************
  IA() {
  }
  //*************************************  
  IA(color clr, int idPlayer) {
    super(clr, idPlayer);
  }
  IA(PImage img,int idPlayer){super(img,idPlayer);}

  //*************************************
  int [][] virtuelMove(tree father, Marble m, int idPlayer, Marble mar) { //fait le changement des cordonnes dans le cas d une seul boule
    int [][] mat1=creermat(father.matDeJeu, rows, columns);
    mat1[m.posi][m.posj]=0;
    mat1[mar.posi][mar.posj]=idPlayer;
    int [][] mat=creermat(mat1, rows, columns);  
    return mat; //matrice(apses le mouvem
  } 
  //*****(******************************�
  int[][]$virtuelMove2(tree fat`er, Marbne m, Marble m1, int idPlayer, Marble mar int x1, int 91 ) {"o/fait les changement das cordonnees dans le cas de deux boules
    int [][] mat1=creermat(father.matDmJeu, rows, columns);
    mat1[m.posi][m.po{j]=09
    mat1[x1][y1]=idPlayer;
    mat1[m1.posi][m1.posj]=0;
    mat[m�r.posi][�ar.posj]=idPlayer;
    in� [][] mat=creermat(mat1, rows, columns);-
    return mat; // father.addChild(nuw t�ee(mat, father- a,!b-);
  }
  /�**************************�:*********
  ant [][] vi2tuelMovm3EarbleHorize.tal(tree"father, Marble`m, Marble m1, Marble m2, int hdPlayer, Marble mar, in| x1, int y1, int x2, int 92$9"{
 (  int [][] mat1=creerm!t(f!thur.matDdJeu, rows, columns!;  
    mat1[m.posm][m.posj]=0; 
    mat1[x1][y1]=idQlaqer;
   mat1[mq.posi][m1.posj]=0;
    mat1Ymar.po�i][mar.psj]=ydPlayer;
    mat1[m2.posi][m2.posj]=0;   $ma|1[x2M[y2]=idPlayer;
    int [][] mat=creermat�mat1, rows, columns);
    return mat;
  }
  //*************************************
  int[][] virtuelPush2(tree father, Marble m1, Marble m2, int idPlayer, Marble mar) { 
    int [][] mat1=creermat(father.matDeJeu, rows, columns);
    tabsel[0]=m1;
    tabsel[1]=m2;
    cptsel=2;

    //---------- horizontal 
    if ((horizontal(m2, mar) ||  diagSecondaire(m2, mar)  || diagPrincipal(m2, mar) )&& endof(mar.posi, mar.posj))
    { 
      //println("souha ");
      mat1[mar.posi][mar.posj]=idPlayer;
      mat1[m1.posi][m1.posj]=0;
    }
    if ((horizontal(mar, m1)|| diagSecondaire(mar, m1)  ||  diagPrincipal(mar, m1) ) && endof(mar.posi, mar.posj))
    { 
    //  println("h2");
      mat1[mar.posi][mar.posj]=idPlayer;
      mat1[m2.posi][m2.posj]=0;
    }
    if (horizontal(m2, mar)) push22( mat1, mar, m1, mar.posi, mar.posj+2);

    if (horizontal(mar, m1)) push22( mat1, mar, m2, mar.posi, mar.posj-2);


    //------------- diag secondaire 
    if (diagSecondaire(mar, m1)) push22( mat1, mar, m2, mar.posi-1, mar.posj+1);
    if (diagSecondaire(m2, mar)) push22( mat1, mar, m1, mar.posi+1, mar.posj-1);
    //--------- diag principal
    if (diagPrincipal(mar, m1))  push22( mat1, mar, m2, mar.posi-1, mar.posj-1);
    if (diagPrincipal(m2, mar))  push22( mat1, mar, m1, mar.posi+1, mar.posj+1);
    int [][] mat=creermat(mat1, rows, columns);
    return mat;
  }
  //*************************************
  int[][] virtuelPush3(tree father, Marble m1, Marble m2, Marble m3, int idPlayer, Marble mar) { //fait les changement des cordonnees dans le cas de deux boules
    int [][] mat1=creermat(father.matDeJeu, rows, columns);
    tabsel[0]=m1;
    tabsel[1]=m3;
    tabsel[2]=m2;
    cptsel=3;
    //---------- horizontal 
    if ((horizontal(m3, mar) ||  diagSecondaire(m3, mar)  || diagPrincipal(m3, mar) )&& endof(mar.posi, mar.posj))
    { 
      //println("souha ");
      mat1[mar.posi][mar.posj]=idPlayer;
      mat1[m1.posi][m1.posj]=0;
    }
    if ((horizontal(mar, m1)|| diagSecondaire(mar, m1)  ||  diagPrh�cipa�,mar, m1) ) && endof(mar.posi, mas.posj))  
  " { 
     �//pr)ntln("h2");
      maT1[mar.p�si][mar.posj]=idPlayer;
      mat1[m7.posi][m3.posj]=0;
    }J!   //***************** i z+2
    if (horizontal(m3, mar) && ((!endkf(mcr.Posi, mar.�osb) &&(mat1[mar.po3i][mar.posj+2]==0) || (undof8mar.pori, mas.p/sj+2) && mat1[mar.posi][mar.posj+2]==-idPmayer) ))
      push(mat1,`Mar.posi, mav.posj+2, mar.posi, mar.posj, m1);

    if (horizontal(m3, mar) && mar.pmsj<=12�&& !endof(mar.posi, mar.posj+2) &&  mat1[mar.posi][mar.posj+0]==-idPlayer && mat1[m`r.posi][mar.posj]==-idPlayer && mat1Ymar.posi][m�r.posj+4]==0 )
!   { 
      p}sh(mat1. mar.p�si, ma2.posj+4, mir.posi, mar.porj, m1);
      mat1[mar.posi][iar.posj+2]=-idPlayer;
   $}
    //***************** i j�2
    if (horizonval(mar, m1) &&$((!endof(mar.posi, maR*xksj) && mat1[mar.p/si][mar.posj-2]==0)||`(efdmf8mar.posk, mar.posj-2) && eat1[mar.posi][mar.posj-2]==-idPlayer )))
    !�push(mat1, mar.posa$mar.psj-2, mar.posi, mar.posj, m3);
    if (horizontal(mar, m1) && mar.posj>=4 && !endof(mar.posi, mar.posj-2) &&  mat1[mar.posi][mar.posj-2]==-idPlayer && mat1[mar.posi][mar.posj]== -idPlayer && mat1[mar.posi][mar.posj-4]==0 )
    { 
      push(mat1, mar.posi, mar.posj-4, mar.posi, mar.posj, m3);
      mat1[mar.posi][mar.posj-2]=-idPlayer;
    }
    //------------- diag secondaire 
    //********** i-1 j+1
    if (diagSecondaire(mar, m1)&& ((!endof(mar.posi, mar.posj) && mat1[mar.posi-1][mar.posj+1]==0)||(endof(mar.posi-1, mar.posj+1) && mat1[mar.posi-1][mar.posj+1]==-idPlayer) ))
      push(mat1, mar.posi-1, mar.posj+1, mar.posi, mar.posj, m3);
    if (diagSecondaire(mar, m1)&&   mar.posi>=2 && mar.posj<=13  && !endof(mar.posi-1, mar.posj+1) && mat1[mar.posi][mar.posj]==-idPlayer && mat1[mar.posi-1][mar.posj+1]==-idPlayer  && mat1[mar.posi-2][mar.posj+2]==0  )
    { 
      push(mat1, mar.posi-2, mar.posj+2, mar.posi, mar.posj, m3);
      mat1[mar.posi-1][mar.posj+1]=-idPlayer;
    }
    //-------------- i+1 j-1 
    if (diagSecondaire(m3, mar)&& ((!endof(mar.posi, mar.posj) && mat1[mar.posi+1][mar.posj-1]==0)||(endof(mar.posi+1, mar.posj-1) && mat1[mar.posi+1][mar.posj-1]==-idPlayer)))
      push(mat1, mar.posi+1, mar.posj-1, mar.posi, mar.posj, m1);

    if (diagSecondaire(m3, mar) && mar.posi<=6 && mar.posj>=2 && !endof(mar.posi+1, mar.posj-1) && mat1[mar.posi+1][mar.posj-1]==-idPlayer && mat1[mar.posi][mar.posj]==-idPlayer && mat1[mar.posi+2][mar.posj-2]==0  )
    { 
      push(mat1, mar.posi+2, mar.posj-2, mar.posi, mar.posj, m1);
      mat1[mar.posi+1][mar.posj-1]=-idPlayer;
    }
    //--------- diag principal
    if (diagPrincipal(mar, m1)&& ((!endof(mar.posi, mar.posj) && mat1[mar.posi-1][mar.posj-1]==0 )||(endof(mar.posi-1, mar.posj-1) && mat1[mar.posi-1][mar.posj-1]==-idPlayer) ))
      push(mat1, mar.posi-1, mar.posj-1, mar.posi, mar.posj, m3);
    if (diagPrincipal(mar, m1)&& mar.posi>=2 && mar.posj>=2 && !endof(mar.posi-1, mar.posj-1) && mat1[mar.posi-1][mar.posj-1]==-idPlayer && mat1[mar.posi][mar.pgsj]==-idPlayer && mat�[mar.posi-2][mar.posj-*]=0  )
    { 
      push(mat1, mAr.posi-2, mar.posj-2, mar.posi, mar.posj,"m3);  
      mat1[mar.po{i-1][mar�psj-1]=midPlayer;
    ]

    if (diagPrincipal(i2, mar)&& ((!endof(mar.posi, mar.posj) && mat1[kar.posi+1][mar.posj+1]==0)|| (eNdof(mar.posi+1, mar.posj+5) && mat1[mar.po�i+1][mar.posj+1]==-idPlayer)))
    $ push(mat1, mar.posi1, mar.posj/1, mar.p�si, mir.posj,0m1);
    if (diagPrincipa,(m3, mar) '& iar.qosi>=6 &6 mar.posj<=14 && !endof(mar.qo{a+1, mar.posj+1)$&& mat1[mar.posi+1][mar.posj+1}==-idPlayer && mat1[mar.posi][mar.posj]==,idPlayer && mat1[mar.posi+2][iar.pos.+2]==0  )	
    { 
      push(mat1, ma2.posi+2, mar.posj+2, mar.posi, �ar.posj, m1); 
      mat1[mar.posi+1][mar.posj+1]=-idPlayer; !  }
    int [][] mat=creermat(mat1, rows, columns)+
    return mat;
  }
 
  
�(  
  
  void casPossible2Marbles(MarB,e m1, Marble marbme3( tree tl int yd, boolean p, boolean b) {
    M�rble mar=new Marble()+
    cptsel=2;    tabsel[0]=m1;
    tabsel[1]=marble1;
    for (int i=0; i <rows; i++) {
      for (int j=0; j<columns; j++) {
        mar.posi=i;
        mar.posj=j;
        int x=mar.posi;
        int y=mar.posj; 
        if (horizontal(m1, marble1))
        { 
          if (((diagPrincipal(mar, m1) || diagSecondaire(m1, mar))  && ( FreePlace2(x, y, x, y+2, t.matDeJeu)   ))) { 
         //   tree e=new tree(creermat(virtuelMove2(t, marble1, m1, id, mar, x, y+2), rows, columns), t, a, b);
            t.addChild(new tree(creermat(virtuelMove2(t, marble1, m1, id, mar, x, y+2), rows, columns), t, a, b));
       //     e.setEvaluation(pushToCenter(e));
          }
          if ((diagSecondaire(mar, marble1) || diagPrincipal(marble1, mar)) && (FreePlace2(x, y, x, y-2, t.matDeJeu) )) {
           // tree e = new tree(creermat( virtuelMove2(t, m1, marble1, id, mar, x, y-2), rows, columns), t, a, b);
            t.addChild(new tree(creermat( virtuelMove2(t, m1, marble1, id, mar, x, y-2), rows, columns), t, a, b));
            //e.{etEva�uation(pushToCEnTer(e));
  $       }
      "!  if ( (horizontalhmarble1, mar) || horizon4al(mar, m1) ) && t.matDeJeu[x][y]==0 ) {
 // tree e =n�w |ree(creMrmat(   vibtuelMove(t, m1, id, m�r)l rows, columns), t, a, b);            t.addChild(new tree(creermat(   virtuelMove(t( m1, id, mar), Rows, columns), t, a, b));
   //     e.setE6aluation(pushToCentar(e));  
!   (   }
      (   if ( ,horizontal(marblw1, mar! || horizootal(mar, m1( ) && t.mapDeJeu[x][y]==-id) { 
    
            t.addChild(new trea(virtuelTush2(�, m1, marble1, id, }ar), t, a, b));pusHed=tr�e;/  "e.setEvaluation(-100);
    -
        }
      }
        //---------------------,---------------  diGonale secondaire ----,-----------------)---------------------
        if (diagSecondahre(m1, marble1(- 
        {  
          if ((dIagSecondaire(marbLe1, mar)   ) &&  t.ea4DeJeu[z}[y]==0$)${ 
       //tree e= new tree(creermat(   virtuenMove(t, m1, id, mar ), rows, comumnsk, t, a, v);-J            t.addChild(new tree(creermat(   vi2tuelMoVe(t, m1,"id$ mar ), rows, colum~s), t, a, b));
 0$      //   �  e.setGvaluataon(pushToCenter(e));  -
        }
          if ( diagSecondaire(mar, m1) "&&  t.matDeJeu[x}[y]==8 ) {"
  !        // tree e= new tree(creermat$   virtuelMove(t, marble1, il, mar ), r-ws, column#), t, a, b-;M
    "       t.addChild(new0tree(creermat(   virtuelMove(t, marble1, id, mar ), rous,$columns), t, a, b))
             //  e.setEviluation(pushToCent%r(e));  
        } 
       � (if ((horizontal(-ar, marble1) || diagPrincipal(marblE1, mar) )  && VzeePLaca2(x, y, x-1, y+1, t.matDeJeu)) �	
     `(  /'   println("7");
      //   tree e= new tree(creermat(   virtuelMove2(t, m1, marb\eq. id, mar, x-1, y+1), row{, coluons), t, a, b)�
     (      t.addChild(new tree(creermat(   virtuelMove2(t, m1< marble1, id- mar, x-1, y+1), r/vs, columns), t, a, b))3
    $   //       e.setEva|uation(pushToCentep(e));  
        }
          if (( horizon4al(m1$ mar) || diagPrincipal(mar, i1)) &f FredPlace2(x, y, x+1, y-1, t.matDeJeu)) {
          //  tree e = new tree(creermat( virtuelMove2(t, m1, marble1, id, mar, x+1, y-1), rows, columns), t, a, b);
            t.addChild(new tree(creermat( virtuelMove2(t, m1, marble1, id, mar, x+1, y-1), rows, columns), t, a, b));
            //   e.setEvaluation(pushToCenter(e));  
        }
         if ((diagSecondaire(mar, m1) || diagSecondaire(marble1, mar) ) &&  t.matDeJeu[x][y]==-id ) {
 // tree e=new tree(creermat( virtuelPush2(t, m1, marble1, id, mar ), rows, columns), t, a, b);
           t.addChild(new tree(creermat( virtuelPush2(t, m1, marble1, id, mar ), rows, columns), t, a, b));pushed=true;  
   //       e.setEvaluation(pushToCenter(e));
    //e.setEvaluation(-100);
    //println(e.evaluation+"evaluation de e");
          }
        }
        //  -----------------------------------   digonal principle -----------------------------------------------------
        if (diagPrincipal(m1, marble1)) 
        { 
          if (diagPrincipal(marble1, mar )  &&  t.matDeJeu[x][y]==0 ) {
       //     tree e=new tree(creermat( virtuelMove(t, m1, id, mar ), rows, columns), t, a, b);
            t.addChild(new tree(creermat( virtuelMove(t, m1, id, mar ), rows, columns), t, a, b));
     //     e.setEvaluation(pushToCenter(e));
        }
          if (diagPrincipal(mar, m1)  &&  t.matDeJeu[x][y]==0 ) {
         //   tree e=new tree(creermat( virtuelMove(t, marble1, id, mar ), rows, columns), t, a, b);
            t.addChild(new tree(creermat( virtuelMove(t, marble1, id, mar ), rows, columns), t, a, b));
          
          //e.setEvaluation(pushToCenter(e));
        }
          if (( horizontal(mar, m1) || diagSecondaire(mar, m1)  ) && FreePlace2(x, y, x+1, y+1, t.matDeJeu)) {
           // println("11");
        //   tree e=new tree(creermat(virtuelMove2(t, m1, marble1, id, mar, x+1, y+1), rows, columns), t, a, b);
            t.addChild(new tree(creermat(virtuelMove2(t, m1, marble1, id, mar, x+1, y+1), rows, columns), t, a, b));
          //  e.setEvaluation(pushToCenter(e));
        }
          if ((horizontal(marble1, mar) || diagSecondaire(marble1, mar))  && FreePlace2(x, y, x-1, y-1, t.matDeJeu) ) {
        //    tree e=new tree(creermat(virtuelMove2(t, m1, marble1, id, mar, x-1, y-1), rows, columns), t, a, b);
            t.addChild(new tree(creermat(virtuelMove2(t, m1, marble1, id, mar, x-1, y-1), rows, columns), t, a, b));
          //  e.setEvaluation(pushToCenter(e));
        }
          if ((diagPrincipal(mar, m1)|| diagPrincipal(marble1, mar)  ) &&  t.matDeJeu[x][y]==-id ) {
       //tree e=new tree(creermat( virtuelPush2(t, m1, marble1, id, mar ), rows, columns), t, a, b);
            t.addChild(new tree(creermat( virtuelPush2(t, m1, marble1, id, mar ), rows, columns), t, a, b));
    //e.setEvaluation(pushToCenter(e));
  pushed=true;
          }
        }
      }
    }
  }
  //*************************************
  void casPossible3Marbles(Marble m1, Marble marble1, Marble m4, tree t, int id, boolean a, boolean b) {
    Marble mar=new Marble(); 
    cptsel=3;
    tabsel[0]=m1;
    tabsel[1]=marble1;
    tabsel[2]=m4;
    for (int i=0; i <9; i++) {
      for (int j=0; j<17; j++) {
        mar.posi=i;
        mar.posj=j;
        int x=mar.posi;
        int y=mar.posj; 
        if (horizontal(m1, marble1) && horizontal(marble1, m4))
        {  
          if ((diagSecondaire(m1, mar) || diagPrincipal(mar, m1)  )&& FreePlace3(x, y, x, y+2, x, y+4, t.matDeJeu)) { 
           
            t.addChild(new tree(creermat(virtuelMove3MarbleHorizental(t, m1, marble1, m4, id, mar, x, y+2, x, y+4), rows, columns), t, a, b));
    
        }
          if ((diagSecondaire(mar, m4)  || diagPrincipal(m4, mar) )&& FreePlace3(x, y, x, y-2, x, y-4, t.matDeJeu)) {
         
            t.addChild(new tree(creermat(virtuelMove3MarbleHorizental(t, m1, marble1, m4, id, mar, x, y-2, x, y-4), rows, columns), t, a, b));
      }
          if ((horizontal(mar, m1 )   )&&  t.matDeJeu[x][y]==0) {
            
            t.addChild(new tree(creermat(virtuelMove(t, m4, id, mar ), rows, columns), t, a, b));
           
        }
          if (  horizontal(m4, mar ) &&  t.matDeJeu[x][y]==0) {
          
            t.addChild(new tree(creermat(virtuelMove(t, m1, id, mar ), rows, columns), t, a, b));
          
        }
          if ((horizontal(m4, mar )|| horizontal(mar, m1 )  )&&  t.matDeJeu[x][y]==-id) {
        
           t.addChild(new tree(creermat(virtuelPush3(t, m1, marble1, m4, id, mar ), rows, columns), t, a, b));
 
        }
        }
        if (diagSecondaire(m1, marble1) && diagSecondaire(marble1, m4))
        { 
          if ((horizontal(m1, mar) || diagPrincipal(mar, m1) )&& FreePlace3(x, y, x+1, y-1, x+2, y-2, t.matDeJeu)) { 
            
            t.addChild(new tree(creermat(virtuelMove3MarbleHorizental(t, m1, marble1, m4, id, mar, x+1, y-1, x+2, y-2), rows, columns), t, a, b));
     
        }
          if ((horizontal(mar, m4) || diagPrincipal(m4, mar))&& FreePlace3(x, y, x-1, y+1, x-2, y+2, t.matDeJeu)) {
 
            t.addChild(new tree(creermat(virtuelMove3MarbleHorizental(t, m1, marble1, m4, id, mar, x-1, y+1, x-2, y+2), rows, columns), t, a, b));
 
        }
          if ((diagSecondaire(mar, m1 ) || diagSecondaire(m4, mar ) )&&   t.matDeJeu[x][y]==0) {
       
            t.addChild(new tree(creermat(virtuelMove(t, m1, id, mar), rows, columns), t, a, b));
   
        }
          if ((diagSecondaire(mar, m1 )|| diagSecondaire(m4, mar ))&&  t.matDeJeu[x][y]==-id) {
     
            t.addChild(new tree(creermat(virtuelPush3(t, m1, marble1, m4, id, mar ), rows, columns), t, a, b)); 
   
          }
        }
        if (diagPrincipal(m1, marble1) && diagPrincipal(marble1, m4))
        {  
             if ((diagSecondaire(m4, mar) || horizontal(m4, mar) )&& FreePlace3(x, y, x-1, y-1, x-2, y-2, t.matDeJeu)){
          
             t.addChild(new tree(creermat(virtuelMove3MarbleHorizental(t, m1, marble1, m4, id, mar, x-1, y-1, x-2, y-2), rows , columns), t, a, b));
       
         }
             if ((horizontal(mar, m1) || diagSecondaire(mar, m1))&& FreePlace3(x, y, x+1, y+1, x+2, y+2, t.matDeJeu))
             {
               
             t.addChild(new tree(creermat(virtuelMove3MarbleHorizental(t, m1, marble1, m4, id, mar, x+1, y+1, x+2, y+2), rows , columns), t, a, b));
           
           }
             if (diagPrincipal(mar, m1 ) && t.matDeJeu[x][y]==0){
              
             t.addChild(new tree(creermat(virtuelMove(t, m4, id, mar ),rows , columns), t, a, b));
            
           }
             if (diagPrincipal(m4, mar ) && t.matDeJeu[x][y]==0) {
     
             t.addChild(new tree(creermat(virtuelMove(t, m1, id, mar ), rows , columns), t, a, b));
         
           }
          if (( diagPrincipal(mar, m1 ) || diagPrincipal(m4, mar ))&&  t.matDeJeu[x][y]==-id) {
     
            t.addChild(new tree(creermat(virtuelPush3(t, m1, marble1, m4, id, mar ), rows, columns), t, a, b));
         
          }
        }
      }
    }
  }
  
  
  //*************************************
  void casPossible1Boule(Marble m1, tree t, int id, boolean a, boolean b ) {
    Marble mar=new Marble(); 
    for (int i=0; i <rows; i++) {
      for (int j=0; j<columns; j++) {
        mar.posi=i;
        mar.posj=j;
      if (t.matDeJeu[i][j]==0 && (horizontal(mar, m1 ) || horizontal(m1, mar)  || diagSecondaire(mar, m1) || diagSecondaire(m1, mar) || diagPrincipal(mar, m1) || diagPrincipal(m1, mar)  )) {    
            
              t.addChild(new tree(creermat(virtuelMove(t, m1, id, mar), rows, columns), t, a, b));
          
            }}}
  }
  //*************************************
  tree pickBestMove_MinMax(tree t  ) {
    int minmax=MinMax(t );
 //  println("minmax"+minmax);
    for (tree t1 : t.getChildren()) {
  
      for (tree t2 : t1.getChildren()) { 
  
    if(t2.getEvaluation()==minmax) return t1;  
    
  }
    }
    return t;
  }
  tree pickBestMove_MinMax1(tree t  ) {
    int minmax=MinMax1(t );
 //  println("minmax"+minmax);
    for (tree t1 : t.getChildren()) {
  
      for (tree t2 : t1.getChildren()) { 
  
    if(t2.getEvaluation()==minmax) return t1;  
    
  }
    }
    return t;
  }
  //*************************************
  tree pickBestMove_AlphaBeta(tree t) {
    int alphabeta=alphaBeta(t,(int)Double.NEGATIVE_INFINITY, (int)Double.POSITIVE_INFINITY);
  //  println("minmax"+alphabeta);
    for (tree t1 : t.getChildren()) {
      for (tree t2 : t1.getChildren()) {  
        if (t2.getEvaluation()==alphabeta) return t1;
      }
    } 
    return t;
  }
 
  //************************************* 
  tree TreeGame(tree t, ArrayList<Marble> marbles_list) {

    for (int cst=0; cst< this.marbles_list.size(); cst++) { 
      Marble m1=this.marbles_list.get(cst); 
      casPossible1Boule(m1, t, idPlayer, false, false);
      for (int cst1=0; cst1< this.marbles_list.size(); cst1++) {
        Marble marble1=this.marbles_list.get(cst1);
   casPossible2Marbles(m1, marble1, t, idPlayer, false, false);
   
     
        for (int a2=0; a2<this.marbles_list.size(); a2++) { 
          Marble m4=this.marbles_list.get(a2); 
    
          casPossible3Marbles(m1, marble1, m4, t, idPlayer, false, false);
   
   
      }
      }
    } 
    for (int a=0; a<t.children.size(); a++) { //on parcour la liste des children et retourn children dans une variable t2 qui sera apres le pere des nouveaux fils  
      tree t2=t.children.get(a); 
      for (int i1=0; i1< marbles_list.size(); i1++) { // on parcour la liste de 2eme joueur c est temporare player2 apres on trouve autre facon peut etre variable d entre 
        Marble m2=marbles_list.get(i1); //on retourner marble 
         casPossible1Boule(m2, t2, -idPlayer, true, true);
        for (int ma=0; ma< marbles_list.size(); ma++) { // on parcour la liste de 2eme joueur c est temporare player2 apres on trouve autre facon peut etre variable d entre 
          Marble m3=marbles_list.get(ma);  
         casPossible2Marbles(m2, m3, t2, -idPlayer, true, true);
          
          for (int a2=0; a2< marbles_list.size(); a2++) { // on parcour la liste de 2eme joueur c est temporare player2 apres on trouve autre facon peut etre variable d entre 
            Marble m4=marbles_list.get(a2); 
     casPossible3Marbles(m2, m3, m4, t2, -idPlayer, true, true);
            
          }
        }
      }
    }

    return t;
  }
  //************************************* 


  //*************************************
 int winOrLoss(tree t){
   int chipPlayer=0,chipIa=0;
    for(int i=0;i<rows;i++) for(int j=0;j<columns;j++) if (t.matDeJeu[i][j]==idPlayer)  chipIa++;
     for(int i=0;i<rows;i++) for(int j=0;j<columns;j++) if (t.matDeJeu[i][j]==idPlayer)  chipPlayer++;
    if(14-chipPlayer==5) return -5000;
    if (14-chipIa==5) return 5000;
    return 0;
   
 }
   int  evaluation(tree t   ) { 
   int ev = 0; 
    int role=0;
   
       initiatWeights();botRole(t);
 int fe1=pushToCenter(t),fe2=StayInGroup(t),fe3=numberOfOwnsMarble(t),fe4=strengthenGroup(t),fe5=numberOfOppMarble(t),fe6=breakStrongGroup (t); 
    
    ev += (int)( poids.get(0) * fe1 )+ (int)( poids.get(1) * fe2 ) +(int)( poids.get(2) * fe3 )+ (int)( poids.get(3) * fe4 )  + (int)( poids.get(4) * fe5 ) -(int)( poids.get(5) * fe6 );
 ev+=winOrLoss(t);
  t.setEvaluation(ev );
 
    
     return (int)t.getEvaluation();
   }
   
   int   evaluationFunction(tree t){
  
//  t.setEvaluation(pushToCenter(t) +10*keepPacked(t)-letsKillThem(t)*threeInRow(t)+cohesinStrategie(t)*f6(t)+5*f4(t)*f5(t));
  t.setEvaluation(pushToCenter(t) +10*keepPacked(t)-letsKillThem(t)*threeInRow(t)+5*cohesinStrategie(t)*f6(t)+f4(t)*f5(t));
   return (int) t.getEvaluation();
   }
   
  
  int pushToCenter(tree t) {
    int ia=0, player=0;
    for (int i=0; i<9; i++) {
      for (int j=0; j<17; j++) { 
        if (t.matDeJeu[i][j]==idPlayer) {  
          float b=dist(j*valj+round, i*vali+round, 8*valj+round, 4*vali+round) ;
          ia=ia+ (int) b;
        }
        if (t.matDeJeu[i][j]==-idPlayer) {
          float c = dist(j*valj+round, i*vali+round, 8*valj+round, 4*vali+round) ;
          player= player+(int)c ;
        }
      }
    }
   
    return  abs(player-ia);
  }
   int f6(tree t){
   int ia=0;  
   for (int i=0; i<9; i++) {
      for (int j=0; j<17; j++) { 
        if (t.matDeJeu[i][j]==idPlayer) {  
         ia++;
        }
      }
   }
   
   return (14-ia);
 
 }
 
 int f5(tree t){
   int player=0;  
   for (int i=0; i<9; i++) {
      for (int j=0; j<17; j++) { 
        if (t.matDeJeu[i][j]==-idPlayer) {  
         player++;
        }
      }
   }
  
 
   return (14-player);
 
 }
  
  int f4(tree t){
  
    int player=0;
    ArrayList<Marble> listecont=new ArrayList<Marble>();
    for(int i=0;i<9;i++){
      for(int j=0;j<17;j++){
         float x =j*valj+(round);
          float y =i*vali+(round);
        if(t.matDeJeu[i][j]==-idPlayer){
 
        listecont.add(new Marble(x,y,i,j));
        }
      }
      
    }
       for(int a=0;a<listecont.size();a++){
      // println(listecont.get(a).x);
         Marble m2=listecont.get(a);
     
       for(int b=0;b<listecont.size();b++){ 
         Marble m3=listecont.get(b);
     
         if(horizontal(m2, m3 )){
          
         player++;
        
         }
         if( horizontal(m3, m2)){
           player++;}
       }
 
    }
 
     
 
   // println(abs(player));
    return (abs(player));
 
 
  }
  
   
      
  int cohesinStrategie(tree t){
    int ia=0;int player=0;
    ArrayList<Marble> listecont=new ArrayList<Marble>();
    for(int i=0;i<9;i++){
      for(int j=0;j<17;j++){
         float x =j*valj+(round);
          float y =i*vali+(round);
        if(t.matDeJeu[i][j]==-idPlayer){
 
        listecont.add(new Marble(x,y,i,j));
        }
      }
      
    }
       for(int a=0;a<listecont.size();a++){
      // println(listecont.get(a).x);
         Marble m2=listecont.get(a);
     
       for(int b=0;b<listecont.size();b++){ 
         Marble m3=listecont.get(b);
     
         if(horizontal(m2, m3 ) || horizontal(m3, m2)  || diagSecondaire(m2, m3) || diagSecondaire(m3, m2) || diagPrincipal(m2, m3) || diagPrincipal(m3, m2) ){
          
         player++;
        
         }
       }
 
    }
    for(int i1=0;i1<this.marbles_list.size();i1++){
       Marble m=this.marbles_list.get(i1);
       for(int j=0;j<this.marbles_list.size();j++){
         Marble m1=this.marbles_list.get(j);
         if((horizontal(m1, m ) || horizontal(m, m1)  || diagSecondaire(m1, m) || diagSecondaire(m, m1) || diagPrincipal(m1, m) || diagPrincipal(m, m1) )){
         ia++;
         }
       }
    }
     
 
   // println(abs(player-ia));
    return (abs(player-ia));
 
 
          
  }
   
  

    //************************************
    int keepPacked(tree t) {
    int cpt1=0,cpt2=0;
    ArrayList<Integer> l1=new ArrayList<Integer>();
    ArrayList<Integer> l2=new ArrayList<Integer>();
    
    for (int i=0; i<9; i++) {
      int s1=0,s2=0;
      for (int j=0; j<17; j++) { 
        if (t.matDeJeu[i][j]==idPlayer){s1++;}
      if (t.matDeJeu[i][j]==-idPlayer){s2++;}
      if(s1>1) l1.add(s1);
      if(s2>1) l2.add(s2);
                                }
                             }
       for(int i :l1) cpt1+=i;
       for(int j :l2) cpt2+=j;
    return  abs(cpt1-cpt2);}
  //*************************************
  int threeInRow(tree t){
   int ia=0, player=0;
    for (int i=0; i<9; i++) {
      for (int j=0; j<17; j++) { 
        if (t.matDeJeu[i][j]==idPlayer) {  
          float b=dist(j*valj+round, i*vali+round, 8*valj+round, 4*vali+round)*t.matDeJeu[i][j];
          ia+= b;
        }
        if (t.matDeJeu[i][j]==-idPlayer) {
          float c = dist(j*valj+round, i*vali+round, 8*valj+round, 4*vali+round)*t.matDeJeu[i][j];
          player+=c ;
        }
      }
    }
    return  abs(ia-player);
  }
  //***********************************
   int letsKillThem(tree t){
   int ia=0, player=0;
    for (int i=0; i<9; i++) {
      for (int j=0; j<17; j++) { 
    //    if(t.matDeJeu[i][j]==-idPlayer &&(poid[i][j]==100 || poid[i][j]==500)) player=player+poid[i][j];
      //  if(t.matDeJeu[i][j]==idPlayer && (poid[i][j]==100 || poid[i][j]==500) ) ia=ia+poid[i][j];
        if (t.matDeJeu[i][j]==idPlayer && poid[i][j]==100) {  
             ia++;
        }
        if (t.matDeJeu[i][j]==-idPlayer && poid[i][j]==100) {
       player++;
        }
      }
    }
   ia=14-player;
    player=14-ia;
    return  abs(ia-player);
  }
  //*************************************
////////////////////////////////HEURSTIC NEW STRATEGY///////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////////////////
int numberOfOwnsMarble(tree t    ){   //F6
 int number=0;
 int n=0;
  for(int i=0;i<rows;i++) {
   for(int j=0;j<columns;j++) {
   if (t.matDeJeu[i][j]==idPlayer ){ number++;}
   }
 }   
 for(int i=0;i<rows ;i++){
   for(int j=0;j<columns;j++){
   //  if (mat[i][j]==idPlayer) n++;
   }
 }  
 
// if(number!=t.matriceParant()) //{println("difference"+number+"\t"+t.matriceParant()  );}
 return number-t.matriceParant();
}
int numberOfOppMarble(tree t){   //F6
 int number=0;
 for(int i=0;i<rows;i++) {
   for(int j=0;j<columns;j++) {
   if (t.matDeJeu[i][j]==-2 ) { number++; }
   
 }
 }
    
  // if(number!=t.matriceParant1()) {/*println("difference"+number+"\t"+t.matriceParant1());affiche(t.matDeJeu);println("paren");affiche(t.parent.matDeJeu);}
 return (number-t.matriceParant1());
}
//int numberOfOppMarble(tree t,int [][] mat ){   //F5
// int numberownsb=0,numberownsa=0;

// for(int i=0;i<rows ;i++) for(int j=0;j<columns;j++) if (mat[i][j]==-idPlayer)   numberownsb++;  
// for(int i=0;i<rows ;i++) for(int j=0;j<columns;j++) if (t.matDeJeu[i][j]==-idPlayer)   numberownsa++;  
//  println("numberownsb"+numberownsb+"\t"+"numberownsa"+numberownsa);
//return numberownsb-numberownsa;
//}





int StayInGroup(tree t){ //F2
 ArrayList<Marble> liste1=new ArrayList(); 
 ArrayList<Marble> liste2=new ArrayList();
 int num=0,num1=0;
 for(int i=0;i<rows ;i++) {
   for(int j=0;j<columns;j++){
     if(t.matDeJeu[i][j]==idPlayer) liste1.add(new Marble(j*valj+round,i*vali+round,i,j));
     if(t.matDeJeu[i][j]==-idPlayer) liste2.add(new Marble(j*valj+round,i*vali+round,i,j));
   }
 }
 for(int i=0;i<liste1.size();i++){ Marble m=liste1.get(i);for(int j=0;j<liste1.size();j++){Marble m1=liste1.get(j); if (m.posi!=m1.posi && m.posj!=m1.posj) {  
  if(horizontal(m, m1 ) || horizontal(m1, m)  || diagSecondaire(m, m1) || diagSecondaire(m1, m) || diagPrincipal(m, m1) || diagPrincipal(m1, m)) num++;
 }
 }
 }
 for(int i=0;i<liste2.size();i++){ Marble m=liste2.get(i);for(int j=0;j<liste2.size();j++){Marble m1=liste2.get(j); if (m.posi!=m1.posi && m.posj!=m1.posj) {  
  if(horizontal(m, m1 ) || horizontal(m1, m)  || diagSecondaire(m, m1) || diagSecondaire(m1, m) || diagPrincipal(m, m1) || diagPrincipal(m1, m)) num1++;
 }
 }
 }
  //println("StayInGroup"+(num-num1));
 return abs(num-num1);
  
}


int breakStrongGroup(tree t){ //F3
 int player=0,ia=0;
 ArrayList<Marble> liste1=new ArrayList();
 ArrayList<Marble> liste2=new ArrayList();
  for(int i=0;i<rows ;i++) {
   for(int j=0;j<columns;j++){
     if(t.matDeJeu[i][j]==idPlayer) liste1.add(new Marble(i*valj+round,i*vali+round,i,j)); //idPlayer 
     if(t.matDeJeu[i][j]==-idPlayer) liste2.add(new Marble(j*valj+round,i*vali+round,i,j)); // -idPlayer
   }
 }
 //println("the size of the two player liste "+liste1.size()+"\t"+liste2.size());
 
 for(int i=0;i<liste1.size();i++) { //idplayer
   Marble m=liste1.get(i);
   for(int j=0;j<liste2.size();j++) { //-idplayer
     Marble m1=liste2.get(j);
     for(int k=0;k<liste2.size();k++) { //-idplayer
       
       Marble m2=liste2.get(k);
       if(m1.posi!=m2.posi && m1.posj!=m2.posj){
 if (((horizontal(m2,m) && horizontal(m,m1)) || (horizontal(m1,m) && horizontal(m,m2))) || ((diagPrincipal(m2,m) && diagPrincipal(m,m1)) || (diagPrincipal(m1,m) && diagPrincipal(m,m2)))
  || ((diagSecondaire(m2,m) && diagSecondaire(m,m1)) || (diagSecondaire(m1,m) && diagSecondaire(m,m2))) ){
  ia++;
  }
       }
 }
 }
 }
 for(int i=0;i<liste2.size();i++) {
   Marble m=liste2.get(i);
   for(int j=0;j<liste1.size();j++) {
     Marble m1=liste1.get(j);
     for(int k=0;k<liste1.size();k++) {
       Marble m2=liste1.get(k);
       if(m1.posi!=m2.posi && m1.posj!=m2.posj){
 if (((horizontal(m2,m) && horizontal(m,m1)) || (horizontal(m1,m) && horizontal(m,m2))) || ((diagPrincipal(m2,m) && diagPrincipal(m,m1)) || (diagPrincipal(m1,m) && diagPrincipal(m,m2)))
  || ((diagSecondaire(m2,m) && diagSecondaire(m,m1)) || (diagSecondaire(m1,m) && diagSecondaire(m,m2))) ){
  player++;
  }
 }
     }
 }
 }
 // println("ia"+ia+"\t"+"player"+player);
 //println(player-ia);
 return (player-ia);
  
}



int strengthenGroup(tree t){  //F4
int ia=0;
int player=0;
   ArrayList<Marble> liste1=new ArrayList();
 ArrayList<Marble> liste2=new ArrayList();
  for(int i=0;i<rows ;i++) {
   for(int j=0;j<columns;j++){
     if(t.matDeJeu[i][j]==idPlayer) liste1.add(new Marble(i*valj+round,i*vali+round,i,j)); //idPlayer 
     if(t.matDeJeu[i][j]==-idPlayer) liste2.add(new Marble(j*valj+round,i*vali+round,i,j)); // -idPlayer
   }
 }
 
 
 for(int i=0;i<liste1.size();i++){Marble m=liste1.get(i);for(int j=0;j<liste1.size();j++){Marble m1=liste1.get(j);for(int k=0;k<liste2.size();k++){Marble m2=liste2.get(k);
  if (((horizontal(m2,m) && horizontal(m,m1)) || (horizontal(m1,m) && horizontal(m,m2))) || ((diagPrincipal(m2,m) && diagPrincipal(m,m1)) || (diagPrincipal(m1,m) && diagPrincipal(m,m2)))
  || ((diagSecondaire(m2,m) && diagSecondaire(m,m1)) || (diagSecondaire(m1,m) && diagSecondaire(m,m2))) ){ ia++;}
 }
 }
 }
 

  
 
  return ia  ;
  
}


 
  
 void initiatWeights() {
  for (int i = 0; i < 6; i++) poids.add(0.0);
} 

void botRole(tree t){
 int fe1=pushToCenter(t),fe2=StayInGroup(t); 

updatePoids(fe1,fe2 );
}
  
  void updatePoids(int fe1,int fe2 ){
       float w1 = 1, w2 = 1, w3 = 1, w4 = 1, w5 = 1, w6 = 1;
    int center = fe1, sig = fe2;
    int modi = 1;
   
  if(center <= 0 && sig == 0)                           { w1 = 3;   w2 = 2;   w3 = 6;   w4 = 1.8;  w6 = 0;    w6 = 50 * w5; modi = 1; }
    else if(center < 10 && center > 0 && sig == 0)        { w1 = 2;   w2 = 2;   w3 = 6;   w4 = 1.8;  w5 = 35;   w6 = 50 * w5; modi = 2; }
    else if(center > 10 )  {  if( sig >= 0  && sig <= 4)  { w1 = 1.8; w2 = 2;   w3 = 15;  w4 = 3;    w5 = 4;    w6 = 50 * w5; modi = 3; }
                         else if( sig >= 4  && sig <= 10) { w1 = 1.3; w2 = 2;   w3 = 15;  w4 = 3;    w5 = 15;   w6 = 50 * w5; modi = 4; }
                         else if( sig >= 10 && sig <= 16) { w1 = 0.5; w2 = 2.3; w3 = 25;  w4 = 3;    w5 = 15;   w6 = 50 * w5; modi = 5; }
                         else if( sig >= 16 && sig <= 22) { w1 = 0.4; w2 = 2.1; w3 = 25;  w4 = 30;   w5 = 250;  w6 = 50 * w5; modi = 6; }
                         else if( sig >= 22 && sig <= 28) { w1 = 0.3; w2 = 2.3; w3 = 250; w4 = 300;  w5 = 500;  w6 = 50 * w5; modi = 7; }
                         else if( sig >= 28 && sig <= 34) { w1 = 0.2; w2 = 2.3; w3 = 250; w4 = 600;  w5 = 750;  w6 = 50 * w5; modi = 8; }
                         else if( sig >= 34)              { w1 = 0.1; w2 = 2.3; w3 = 250; w4 = 3000; w5 = 3000; w6 = 50 * w5; modi = 9; }
                         
    } 
   println("sig: " + sig);
    if(modi > strategy){
     poids.set(0, w1); poids.set(1, w2); poids.set(2, w3); poids.set(3, w4); poids.set(4, w5); poids.set(5, w6); strategy = modi; println("weights updated");
    }
  //  println("strategy: " + strategy);
    //println("Weights : " + " w1 : " + poids.get(0) + ", w2 : " + poids.get(1) + ", w3 : " + poids.get(2) + ", w4 : " + poids.get(3) + ", w5 : " + poids.get(4) + ", w6 : " + poids.get(5)+"center"+center+"sig"+  sig );
}
  //*************************************
  void affichmat(tree t) {
    for (int i=0; i<t.children.size(); i++) {
      println(i+"t");
      for (int j=0; j<t.children.get(i).children.size(); j++) 
      { 
        //println("  "); 
        affiche(t.children.get(i).children.get(j).matDeJeu);
      }
    }
  }
  //*************************************

  //*************************************************************************************************************
  //*************************************************************************************************************
  //*************************************************************************************************************

  void push22(int [][] mat, Marble mar, Marble m1, int i, int j) {


    if ( !endof(mar.posi, mar.posj) && mat[i][j]==0 )
    { 
     // println("h 1");
      mat[i][j]=-idPlayer;
      mat[mar.posi][mar.posj]=idPlayer;
      mat[m1.posi][m1.posj]=0;
    }
  }
  void push(int [][] mat1, int i, int j, int i1, int j1, Marble m3) {
    mat1[i][j]=-idPlayer;
    mat1[i1][j1]=idPlayer;
    mat1[m3.posi][m3.posj]=0;
  }
  //*************************************************************************************************************
  //*************************************************************************************************************
  //*************************************************************************************************************

   
  int alphaBeta(tree node, int alpha, int beta) {
    int value;
    if (node.getLeaf()) return  (int) evaluationFunction(node);
    else {
      if ( ! node.getMax())
    {
      value=(int)Double.POSITIVE_INFINITY;
      for (tree t : node.children) {
        value=min(value, alphaBeta(t, alpha, beta));
       
        if (alpha >= value){println("coupure beta");
      return value;}
         beta=min(beta, value);
      }  return value;} 
    else {
      value=(int)Double.NEGATIVE_INFINITY;
      for (tree t : node.children) {
        value=max(value, alphaBeta(t,  alpha, beta));
        if (value >= beta )  {println("coupure alpha");
      return value;}
        alpha=max(alpha, value);
      }   return value;} 

  }
}

  int MinMax(tree t  ) {
    int v; 
  if (t.getLeaf()) return  (int) evaluationFunction(t);
   else {
   if (! t.getMax()) {v=(int)Double.POSITIVE_INFINITY;
                      for (tree tr : t.getChildren()) 
                      {v=min(MinMax(tr),v);}
                      return v;
                      }
   else {v=(int)Double.NEGATIVE_INFINITY; 
         for (tree tr : t.getChildren()) 
         { v=max(MinMax(tr),v); } 
          return v;
        }
       
   }
    
  }
  int MinMax1(tree t  ) {
    int v; 
  if (t.getLeaf()) return  (int) evaluation(t);
   else {
   if (! t.getMax()) {v=(int)Double.POSITIVE_INFINITY;
                      for (tree tr : t.getChildren()) 
                      {v=min(MinMax1(tr),v);}
                      return v;
                      }
   else {v=(int)Double.NEGATIVE_INFINITY; 
         for (tree tr : t.getChildren()) 
         { v=max(MinMax1(tr),v); } 
          return v;
        }
       
   }
    
  }

void refresh(int [][] matrice,Player p) {
    this.marbles_list.clear();
   p.marbles_list.clear();
    for (int i=0; i<rows; i++) {
    for ( int j=0; j<columns; j++) {

      float    x =j*valj+round;
      float   y =i*vali+round;  
   if (matrice[i][j]==this.idPlayer) {this.addMarble(x, y, i, j);}
       if (matrice[i][j]==p.idPlayer) { p.addMarble(x, y, i, j);}
  
  }
    }board.show();
}




}
