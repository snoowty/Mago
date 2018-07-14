//プレイヤークラス：キーボードで操作してスタートからゴールまで行くプレイヤークラス

/* 
 プレイヤーのキャラ表示
 プレイヤーの動き
 プレイヤーの速さ
 プレイヤーの当たり判定
 プレイヤーの落下判定
 
 */

class Player {

  //キーの状態を格納する変数
  boolean keyUp;
  boolean keyLeft;
  boolean keyRight;



  //プレイヤーがジャンプ中の上昇時にtrue、下降時にfalse
  boolean jumpheight = false;
  //プレイヤーがいくつジャンプしているか
  int jumpdistance = 0;

  //プレイヤーの初期位置の変数
  int x;
  int y;

  //プレイヤーの空中判定
  boolean pjump = false;

  //プレイヤーが描かれた道の上にいるかどうか。いない時にfalse
  boolean landingLine = false;

  //プレイヤーの初期位置のコンストラクタ
  Player(int x0, int y0) {
    x = x0;
    y = y0;
  }


  //キャラの表示
  void display() {
    line(x, y, x, y-30);
    //To do
  }

  //キャラの動き、速さ

  //プレイヤーのステージ上での移動
  void stage_move(boolean drawroad, float  y0) {

    //道が描かれているとき
    if (drawroad == true) {

      //道の上にいるとき
      if (landingLine == true) {
        move();
        y =  int(y0);
        pjump = false;

        if (y == height - 20) {
          landingLine = false;
          move();
        }
      }
      //道の上にいないとき
      else {
        move();

        if (int(y0) == height - 20) {
          landingLine = true;
          move();
          y = int(y0);
          pjump = false;
        }
      }
    } 
    //道がないとき
    else {
      move();
    }
  }

  //プレイヤーの移動
  void move() {

    if ((keyLeft)!=false) {
      x -= 2;
      if (x<0)x=0;
    }

    if ((keyRight)!=false) {
      x += 2;
      if (x>width)x=width;
    }
  }



  //プレイヤーのジャンプ動作初動
  void jamp_start() {

    if ((keyUp)!= false) {
      if (pjump == false) {
        pjump = true;
        landingLine = false;
        jumpheight = true;
      }
    }

    /*
    if (keyCode == UP) {
     if (pjump == false) {
     pjump = true;
     landingLine = false;
     
     jumpheight = true;
     }
     }
     */
  }


  //プレイヤーのジャンプ動作
  void jamp_move(int dy) {
    if (pjump == true) {
      if ( jumpheight == true) {
        y -= dy;
        jumpdistance += dy;
      }
      if (jumpdistance >= 50) {
        jumpheight = false;
        jumpdistance = 0;
      }
      // /*     
      if (keyUp == false) {
        jumpheight = false;
        jumpdistance = 0;
      }
      // */   

      if (jumpheight == false ) {
        y += dy;
      }
    }
  }




  //プレイヤーの着地判定(道生成の有無、キャラのいる位置での道の止まるy座標、道の始点、道の終点)
  void Landing( boolean drawroad, int x0, int y0, float sx, float mx) {

    text(y0, 600, 220);

    float smallx;
    float largex;
    if (sx >= mx) {
      largex = sx;
      smallx = mx;
    } else {
      largex = mx;
      smallx = sx;
    }
    text("largex = ", 400, 50);
    text(largex, 450, 50);
    text("smallx = ", 560, 50);
    text(smallx, 610, 50);


    //道が引かれている時
    if (drawroad == true) {

      //キャラが道の範囲内にいる時
      if (x >= smallx && x <= largex) {
        text("y = ", 400, 200);
        text(y, 430, 200);
        text("y0 = ", 560, 200);
        text(y0, 590, 200);
        //y座標に重なった時 かつ　ジャンプで下降中の時        
        if ( dist(x, y, x0, y0)  <= 4 && pjump == true  && jumpheight == false) {

          //background(0);
          pjump = false;


          landingLine = true;

          //y = int(y0);
        } else if (pjump == true && landingLine == true) {
          pjump = true;
          landingLine = false;
        }
      }
      //キャラが範囲内にいない時
      else if (x < smallx || x > largex) {
        pjump = true;
        landingLine = false;
      }
    }

    //道が引かれていない場合
    else {
      pjump = true;
      landingLine = false;
      text("道が引かれていません", 600, 100);

      if (y >= height-20) {
        pjump = false;
      }
    }

    if (y >= height-20) {
      pjump = false;
      text("zaesxrdctfvygbuhnijm", 600, 80);
    }
  }


  //線を引かれた時のキャラの着地位置
  float p_stop(float x0, float y0, float x1, float y1) {

    float a; 
    if (x0 - x1 == 0) a = 0;
    else              a =  ( y0  -  y1 ) / (x0 - x1);
    float b = y0 - x0 * a;
    float y = (x * a + b);

    text(a, 700, 160);
    text(x0, 700, 180);
    text(y0, 700, 200);
    text(x1, 700, 220);
    text(y1, 700, 240);

    return int(y);
  }

  float p_stop2(float x0, float y0, float x1, float y1) {

    float a; 
    if (x0 - x1 == 0) a = 0;
    else              a =  ( y0  -  y1 ) / (x0 - x1);
    float b = y0 - x0 * a;
    float y = (x * a + b);
    float x = (y-b)/a;

    text(a, 700, 160);
    text(x0, 700, 180);
    text(y0, 700, 200);
    text(x1, 700, 220);
    text(y1, 700, 240);

    return int(x);
  }


  //キャラのあたり判定
  void hit() {
    //To do
  }

  //キャラの落下判定
  void isdead() {
    //To do
  }



  void keyPressed() {
    if (key == CODED) {
      switch(keyCode) {
      case UP:
        keyUp =true;
        //ellipse(100, 100, 30, 30);
        break;
      case LEFT:
        keyLeft=true;
        //ellipse(100, 200, 30, 30);
        break;
      case RIGHT:
        keyRight=true;
        //ellipse(100, 250, 30, 30);
        break;
      }
    }
  }

  void keyReleased() {
    if (key == CODED) {
      switch(keyCode) {

      case UP:
        keyUp=false;
        break;

      case LEFT:
        keyLeft=false;
        break;

      case RIGHT:
        keyRight=false;
        break;
      }
    }
  }
}
