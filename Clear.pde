//ステージクリア画面クラス

class Clear{
  
  void cleardisplay(){

        background(255);
                //noLoop();
        textAlign(CENTER);

        PFont  font = createFont("Yu Gothic", 64, true);
        textFont(font);

        textSize(64);
        fill(100);
        text("クリアー", width/2, height/2);
  }
        
}
