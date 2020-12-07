 class tree{

private boolean leaf, max;
   float evaluation;
  tree parent = null;
  int[][] matDeJeu=null;
    
  private ArrayList<tree> children = null;                              // all childs of this tree
tree(){}
  public tree(int[][] mat, tree parent, boolean leaf, boolean max){
       
    
    this.matDeJeu=mat;
    this.parent = parent;  this.leaf = leaf; this.max = max;
   this.children = new ArrayList<tree>();
  }

    public void addChild(tree confChild){
      this.children.add(confChild);
    }
    
    public int  matriceParant( ) {
      int cpt=0;
      if (this.parent!=null) {   for(int i=0;i<rows;i++){ for(int j=0;j<columns;j++){ if (this.parent.matDeJeu[i][j]==2){  cpt++;}
    }
  }
      }
return cpt;
  }
  
      public int  matriceParant1( ) {
      int cpt=0;
      if (this.parent!=null) {   for(int i=0;i<rows;i++){ for(int j=0;j<columns;j++){ if (this.parent.matDeJeu[i][j]==-2){  cpt++; }
    }
  }
      }
return cpt;
  }
  
    public ArrayList<tree> getChildren(){ return this.children; }
    public boolean getLeaf(){ return this.leaf; }
    public boolean getMax(){ return this.max; }
    public void setEvaluation(float evaluation) { this.evaluation = evaluation; }
    public float getEvaluation() { return this.evaluation; }
    public tree getParent() { return this.parent; }
    public void setParent(tree parent) {this.parent=parent;}
public int[][] getMatrice(){return this.matDeJeu;}
    
    
 }
