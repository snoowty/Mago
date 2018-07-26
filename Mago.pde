//クラスの生成

//ステージクラスの生成
Stage stage;

//道クラスの生成
Road road;

//プレイヤークラスの生成
Player player;

//敵、隕石クラスの生成
nomalMeteo meteo;
nomalMeteo[] x;

//敵、歩く敵クラスの生成
Walk_En enemy;

//アイテム、キノコの生成
Box box;

//アイテム、カギの生成
Key a_key;

//スタートステージ画面の生成
Start g_start;

//クリアーステージ画面の生成
Clear g_clear;



void setup() {
  size(1000, 350);


  //fullScreen();

  //インスタンスの生成
  stage       = new Stage();
  road         = new Road();
  player      = new Player(0, height-100, 0);

  x = new nomalMeteo[4];
  for (int i = 0; i < x.length; i++) {
    x[ i ] = new nomalMeteo();
  }

  enemy     = new Walk_En();
  box           = new Box();
  a_key       = new Key();
  g_start     =new Start();

  g_clear = new Clear();
}

//
int cnt = 0;

void draw() {

  //ゲームのスタート画面の表示
  if (g_start.start == false) {
    g_start.display();
  } 
  //ゲームスタート後のプログラム
  else {

    //ステージクリア判定
    boolean stageclear = false;

    //
    if (stage.dooropen == true) {
    }

    /*
    fill(0);
     stroke(0);
     rect(30,30,60,60);
     */

    //ステージクリアしていない時
    if (stageclear == false) {
      cnt++;
      //println(cnt);

      //meteo[cnt      = new nomalMeteo();
      fill(255);

      stage.stagedisplay();

      //三面に入った時
      if (stage.stage3_judge == true) stage.doordisplay();

      //ドアが開いてるかつ
      if (stage.dooropen == true && width - 20 < player.x) stroke(140, 140, 140);
      //
      else stroke(0);

      player.display();

      //ドアが開いている時
      if (stage.dooropen == true) {

        g_clear.cleardisplay();

        /*
        noLoop();
         background(255);
         textAlign(CENTER);
         
         PFont  font = createFont("Yu Gothic", 64, true);
         textFont(font);
         
         textSize(64);
         fill(100);
         text("クリアー", width/2, height/2);
         */
      }
      
      fill(255);

      stage.stageMove(player.dx);

      //
      for (int i = 0; i < x.length; i++) {

        //ステージ３にいる時に隕石が箱に当たった時
        if (stage.stage3_judge == true) x[i].hitbox(box.box_x, box.box_y, box.box_w, box.box_h);
        
        //
        if (x[0].judge_rect == false && x[1].judge_rect == false && x[2].judge_rect == false && x[3].judge_rect == false) {
          //
          if (stage.stage3_judge == true) {
            box.display();
            //
            if (player.x > 395 && player.x < 455) {
              //
              if (player.y > 90 && player.y < 150) {
                player.x = 100;
                player.y = 250;
                player.dx = width * 2 + 100;
              }
            }
          }
        }
      }

      /*
      text(x[0].judge_rectt, 349, 100);
       text(x[1].judge_rectt, 349, 110);
       text(x[2].judge_rectt, 349, 120);
       text(x[3].judge_rectt, 349, 130);
       text(x[4].judge_rectt, 349, 140);
       */


      a_key.hit(player.x, player.y);

      //鍵を獲得していない時
      if (a_key.touch == false) {
        //三面にいる時
        if (stage.stage3_judge == true) a_key.display();
      }
      // if (a_key.touch == true) {

      //鍵を獲得している時
      else {
        if(stage.dooropen == false)
        a_key.get_key_display();
   
        stage.hit(player.x, player.y);
      }

      //
      int hx = player.x;
      int hy = player.y;

      x[0].display();
      x[0].move_1();
      x[0].hit(hx+5, hy);
      x[0].sheeld_hit();

      if (cnt >50) {
        x[1].display();
        x[1].move_1();
        x[1].hit(hx+5, hy);
        x[1].sheeld_hit();
      }


      if (cnt >100) {
        x[2].display();
        x[2].move_2();
        x[2].hit(hx+5, hy);
        x[2].sheeld_hit();
      }

      if (cnt > 150) {
        x[3].display();
        x[3].move_2();
        x[3].hit(hx+5, hy);
        x[3].sheeld_hit();
      }

      for (int i = 0; i < x.length; i++) {

        if ((x[i].judge == true) || (hy > height)) {
          player.isdead();
          background(255);
          textAlign(CENTER);
          textSize(64);
          fill(100);
          text("GAME OVER", width/2, height/2);
        }
      }



      /*
      if (road.drawroad == true) {
       fill(0);
       text("drawroad = true", 200, 10);
       } else {
       fill(0);
       text("drawroad = false", 200, 10);
       }
       */

      player.jamp_move(3, 50);
      road.drawline();

      player.Landing(road.drawroad, player.x, int(player.p_stop(road.x0, road.y0, mouseX, mouseY) ), road.x0, mouseX, stage.stage1_y(player.dx, player.y) );
      /*
      if (player.landingLine == true) {
       fill(0);
       text("landingLine = true", 200, 30);
       } else {
       fill(0);
       text("landingLine = false", 200, 30);
       }
       */

      player.stage_move(road.drawroad, player.p_stop(road.x0, road.y0, mouseX, mouseY));

      
      if (player.pjump == true) {
       fill(0);
       text("pjump = true", 200, 50);
       } else {
       fill(0);
       text("pjump= false", 200, 50);
       }
       

      player.jamp_start();
    }


  }
}


void keyPressed() {
  player.keyPressed();
}

void mouseReleased() {
  g_start.mouseReleased();
}

void keyReleased() {

  player.keyReleased();

  //プレイヤーを初期位置に戻す
  if (key == 'q') {
    player.x = 2001;
    player.y = height - 100;
    player.dx = 2001;
    player.pjump = false;
    player.landingLine = false;
  }
  
  //リトライボタン
  if (key == 'r') {
    player.x = 1;
    player.y = height - 100;
    player.dx = 1;
    player.pjump = false;
    player.landingLine = false;
    
    for(int i = 0; i < 4; i++){
      x[i].judge = false;
  }
 }
}
