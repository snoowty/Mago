//スタート画面クラス

class Start {

  //画像の読み込み
  PImage img = loadImage("utyu.jpg");

  //ゲームスタートの判定（falseでゲーム画面表示、trueでゲームプレイ画面表示）
  boolean start = false;

  //画面表示
  void display() {

    //画像の挿入
    image(img, 0, 0, width, height);

    //四角い枠の表示
    fill(255, 128);
    rect(width/2-180, height/2+50, 400, 70);

    //テキストを表示
    PFont  font = createFont("Yu Gothic", 64, true);
    textFont(font);
    textSize(45);
    text("クリックスタート !", width/2-170, height/2+100);
    textSize(15);
  }

  //スタートボタンクリック時の動作
  void mouseReleased() {

    //クリック時のマウスの場所が白い枠内だった時
    if (mouseX >= width/2-170 && mouseX <= width/2 -170 + 400) {
      if (mouseY >= height/2 + 50 && mouseY <= height/2 + 120 ) {
        start = true;
      }
    }
  }
}
