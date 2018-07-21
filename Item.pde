//アイテムを制御するクラス

/*
アイテムの表示
アイテムの表示場所

キノコアイテム
キノコの効果
キノコの表示判定
キノコの動き
キノコの速さ


カギアイテム
カギの効果
カギの表示判定
カギを取得した際の表示
*/


class Mush{
  void display(){
    rect(70,180,60,60);
    
    //To do
  }
  
  void move(){
  //To do
  }
  
}


class Key{
  int x = 100,y=190;
  boolean touch = false;
  
    void display(){
      
      stroke(250,250,0);
      ellipse(x,y,20,20);
      line(x,y+10,x,y+40);
      line(x,y+22,x+10,y+22);
      line(x,y+28,x+10,y+28);
      stroke(0);
      
  }
  void hit(int hx,int hy){
    if(dist(x,y+22,hx,hy) <= 20) touch = true;
  }
  
  void move(){
  //To do
  }
  
}
