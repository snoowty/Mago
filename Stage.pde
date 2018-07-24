//ステージクラス :スタート、ゴール、障害物をステージ毎に生成するクラス

/*
大まかなステージのレイアウトのクラス
 スタート、ゴール、障害物のクラス
 
 */

class Stage {
  boolean open = false;
 

  //直線の床
  void display() {
    background(67,135,233);
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
  
  
  //プレイヤーの移動距離に応じた画面の移動の変数
  int sm = 0;

  class stage1 {
    //ステージ床の二次元配列（x1,y1,x2,y2）
    int[][] stage1_1 = { {0, height- 20, width, height - 20} };
    //ステージの床の数（配列の要素）
    int len = stage1_1.length;
  }

  //ステージ1

  //1ステージの始点
  int s1sx = 0 ;
  int s1sy = height- 20 ;
  //1ステージの終点
  int s1gx = width;
  int s1gy = height - 20 ;

  //ステージ2

  //2ステージの始点(1)
  int s2sx = width + 0;
  int s2sy = height - 20;

  //2ステージの終点(1)
  int s2gx = 200+ width;
  int s2gy = height - 20;

  int s2sx_2 = 600 + width;
  int s2sy_2 = height -20;

  int s2gx_2 = width + width;
  int s2gy_2 = height -20;

  int s2sx_3 = 220 + width;
  int s2sy_3 = height - 100;

  int s2gx_3 = 550 + width;
  int s2gy_3 = height - 100;

  int s2sx_4 = width + 50;
  int s2sy_4 = height - 250;

  int s2gx_4 = 100 + width;
  int s2gy_4 = height -250;

  //ステージ３

  int s3sx = width * 2 + 0;
  int s3sy = height - 20;

  int s3gx = width * 2 + 200;
  int s3gy = height -20;

  int s3sx_2 = width * 2 + 400;
  int s3sy_2 = height - 200;

  int s3gx_2 = width * 2 + 450;
  int s3gy_2 = height - 200;

  int s3sx_3 = 800 + width * 2;
  int s3sy_3 = height - 20;

  int s3gx_3 = width * 2 + width;
  int s3gy_3 = height  - 20;


  //ステージ表示
  void stagedisplay() {
    background(67,135,233);

    line(s1sx - sm, s1sy, s1gx - sm, s1gy);

    line(s2sx - sm, s2sy, s2gx - sm, s2gy);
    line(s2sx_2 - sm, s2sy_2, s2gx_2 -sm, s2gy_2);
    line(s2sx_3 - sm, s2sy_3, s2gx_3 -sm, s2gy_3);
    line(s2sx_4 - sm, s2sy_4, s2gx_4 -sm, s2gy_4);

    line(s3sx - sm, s3sy, s3gx - sm, s3gy);
    line(s3sx_2 - sm, s3sy_2, s3gx_2 -sm, s3gy_2);
    line(s3sx_3 - sm, s3sy_3, s3gx_3 -sm, s3gy_3);

    /*
    if (p_x >= 0 && p_x <= 500) {
     line(sL_x, sL_y, gL_x-dx, gL_y);
     }
     */
    /*
    //line(p,sL_y,p + 300,sL_y);
     fill(0);
     text(dx, 100, 120);
     text(sL_x, 100, 150);
     text(sL_y, 100, 180);
     text(gL_x, 100, 210);
     text(gL_y, 100, 240);
     
     if (ggg == true)  text("ggg = true", 50, 100);//dx = 50; //
     else {
     fill(0);
     text("ggg = false", 50, 100);
     }
     */
  }

  //プレイヤーのx座標を受け取ってステージに対応するy座標を返す
  int stage1_y(int pdx, int py) {

    text("s1sx = ", 30, 50);
    text(s1sx, 80, 50);
    text("s1gx = ", 30, 80);
    text(s1gx, 80, 80);
    text("s2sx = ", 30, 110);
    text(s2sx, 80, 110);
    text("s2sx = ", 30, 140);
    text(s2sx, 80, 140);
    text("s2sx_2 = ", 30, 170);
    text(s2sx_2, 80, 170);




    if (s1sx  <= pdx && pdx <= s1gx) {
      //if (py <= s1sy)
      return s1sy;
    } else if (s2sx  <= pdx && pdx <= s2gx ) {

      if ( dist(pdx, py, pdx, s2sy_4) <= 1) {
        if (s2sx_4 <= pdx && pdx <= s2gx_4) {
          return s2gy_4;
        }
      }
      //if (py <= s2sy) 
      return s2gy;
    } else if (s2sx_2  <= pdx && pdx<=s2gx_2 ) {
      //if (py <= s2sy_2) 
      return s2gy_2;
    } else if (s2sx_3 <= pdx && pdx <= s2gx_3 ) {
      //if (py <= s2sy_3) 
      return s2gy_3 ;
    }
    else if (s3sx  <= pdx && pdx<=s3gx ) {
      //if (py <= s2sy_2) 
      return s3gy;
    } else if (s3sx_2 <= pdx && pdx <= s3gx_2 ) {
      //if (py <= s2sy_3) 
      return s3gy_2 ;
    }else if (s3sx_3  <= pdx && pdx<=s3gx_3 ) {
      //if (py <= s2sy_2) 
      return s3gy_3;
    }
    return 400;
  }

  //ステージの移り変わり関数(引数はプレイヤーの移動距離)
  boolean stage3_judge = false;
  void stageMove(int px) {
    if (px >= 0 && px < width) {
      sm = 0;
    } else if (px <=  width * 2) {
      sm = width;
    } else if (px <= width * 3) {
      sm = width * 2;
      stage3_judge = true;
    }
  }


  void stage2() {

    int startLine_x = 0;
    int startLine_y = height - 20;

    int goalLine_x = width;
    int goalLine_y = height - 20 - 20;


    line(startLine_x, startLine_y, goalLine_x, goalLine_y);
  }


  /*
  //プレイヤーのx座標に対応した床検索
   int floor_num(int px, int len) {//lenは床の要素数
   
   //プレイヤーのx座標に対応した床を探す
   for(int i = 0; i < len; i++){
   //床の範囲内だった場合
   if(px >= stage[i][0] && px <= stage[i+1][0]){
   //その床の上空に別の床があるかどうか
   
   return i;
   }
   }
   return i;
   }
   */





  //ステージ内で使う関数
  /*
  int abc(int player_x, Stage_a aaa) {
   
   
   return 0;
   
   //To do
   }
   */

}
