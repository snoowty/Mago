//敵クラス：上から降って来る隕石、歩行する敵を制御するクラス

/*
隕石の表示（大きさなど）
 隕石の種類
 隕石の動き（真下に落下、プレイヤーに向かって落下など）
 隕石のあたり判定
 隕石の表示判定
 隕石の落下速度

 歩行する敵の表示（大きさなど）
 敵の種類
 歩行する敵の動き（直進、プレイヤーに向かってくるなど）
 敵のあたり判定
 敵の表示判定
 敵のHP
 敵の動く速さ


 */

//隕石クラス
abstract class Meteo {
  float x = int(random(0,width));
  float y = 50;
  boolean judge = false;
  boolean sheeld_judge = false;
  float rx = random(0,width);
  boolean vertical = false;
  float x2;
  float y2;
  float mm2, bb2;

  //プレイヤーが描かれた道の上にいるかどうか。いない時にfalse
  boolean landingLine = false;

  void display() {
      ellipse(x,y,25,25);

  }

  void hit(int hx, int hy) {
    if(dist(x, y+13, hx, hy) <= 13) judge = true;
  }

  void sheeld_hit() {
    if((x>=mouseX && x<=road.x0) || (x>=road.x0 && x<=mouseX)){
      //切片
      float b = -(road.y0 - mouseY)/(road.x0 - mouseX)*road.x0 + road.y0;
      float h = (road.y0 - mouseY)/(road.x0 - mouseX)*x + b;
      if(y+12.5>=h-1&&y+12.5<=h+1){
        y = 0;
        x = int(random(0,width));
       // float m2 = -1/(road.y0 - mouseY)/(road.x0 - mouseX)*road.x0;
       // x2 = x;
       // vertical = true;
       // float b2 = -m2*x+h;
       // bb2 = b2;
       // mm2 = m2;

      }
      //デバック
      text("b=",100,200);
      text(b,130,200);
      text("h=",200,200);
      text(h,230,200);
    }

  }


  abstract void move () ;

  void land(boolean drawroad, int x0, int y0, float sx, float mx){
    float smallx;
    float largex;
    if (sx >= mx) {
      largex = sx;
      smallx = mx;
    } else {
      largex = mx;
      smallx = sx;
    }

    if (drawroad == true){
       //キャラが道の範囲内にいる時
      if (x >= smallx && x <= largex) {

        //y座標に重なった時 かつ　ジャンプで下降中の時
        if ( dist(x, y, x0, y0)  <= 4 ) {

          //background(0);
         // pjump = false;


          landingLine = true;

          //y = int(y0);
        } else if (landingLine == true) {
        //  pjump = true;
          landingLine = false;
        }
      }
      //キャラが範囲内にいない時
      else if (x < smallx || x > largex) {
       // pjump = true;
        landingLine = false;

    }
  }else {
   // pjump = true;
      landingLine = false;
     // text("道が引かれていません", 600, 100);

      if (y >= height-20) {
       // pjump = false;
      }
    }
  }
}


class nomalMeteo extends Meteo{

  void move(){
  //To do

  if(y>=height){
    y=0;
    x = int(random(0,width));
  }
  /*
  if(vertical == true) {
    if(mm2>0) x++;
    else if(mm2<0) x2--;
    y = mm2*x2 + bb2;

  }else
  */y++;
  }
}


//歩く敵クラス
class Walk_En {

  void disply() {
    //To do
  }

  void move() {
    //To do
  }
}
