//ステージクラス :スタート、ゴール、障害物をステージ毎に生成するクラス

/*
大まかなステージのレイアウトのクラス
 スタート、ゴール、障害物のクラス
 
 */

class Stage {
  boolean open = false;

  //直線の床
  void display() {
    background(255);
    line(0, height-20, width, height-20);

    rect(width-100,height-100,80,80);
    if(open == false){
    line(width-60,height-100,width-60,height-20);
    ellipse(width-70,height-50,10,10);
    ellipse(width-50,height-50,10,10);
    }

    }
  
  void hit(int hx,int hy){
    if(dist(width-60,height-30,hx,hy) <= 20) {
      open = true;

    }
  }
  
  

}
