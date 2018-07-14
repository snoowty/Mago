//クラスの生成

//ステージクラスの生成
Stage stage;
//道クラスの生成
Road road;
//プレイヤークラスの生成
Player player;
//敵、隕石クラスの生成
nomalMeteo meteo;
//敵、歩く敵クラスの生成
Walk_En enemy;
//アイテム、キノコの生成
Mush mush;
//アイテム、カギの生成
Key a_key;

nomalMeteo[] x;


void setup() {
  size(800, 250);
  
  
  //fullScreen();

  //インスタンスの生成
  stage       = new Stage();
  road         = new Road();
  player      = new Player(200, height-20);
  
  
  x = new nomalMeteo[10];
  for (int i = 0; i < x.length; i++) {
   x[i]= new nomalMeteo();
  }
  
  enemy     = new Walk_En();
  mush        = new Mush();
  a_key       = new Key();
  
}

int cnt = 0;
void draw() {
  
  cnt++;
  println(cnt);

  //meteo[cnt      = new nomalMeteo();

  stage.display();
  player.display();
  
  int hx = player.x;
  int hy = player.y;
  
  
  x[0].display();
  x[0].move();
  x[0].hit(hx,hy);
  
  if(cnt >50 && x[1].sheeld_judge == false){
  x[1].display();
  x[1].move();
  x[1].hit(hx,hy);
  x[1].sheeld_hit();
  }
  
  if(cnt >100 && x[1].sheeld_judge == false){
  x[2].display();
  x[2].move();
  x[2].hit(hx,hy);
  }
  
  if(cnt > 150){
  x[3].display();
  x[3].move();
  x[3].hit(hx,hy);
  }
  
  if(x[0].judge == true) {
  player.isdead();
  noLoop();
  }
  
  if(x[1].judge == true) {
  player.isdead();
  noLoop();
  }
  
  if(x[2].judge == true) {
  player.isdead();
  noLoop();
  }
  
  if(x[3].judge == true) {
  player.isdead();
  noLoop();
  }
 
 if (road.drawroad == true) {
    fill(0);
    text("drawroad = true", 200, 10);
  } else {
    fill(0);
    text("drawroad = false", 200, 10);
  }
  
   player.jamp_move(3);
  road.drawline();

  player.Landing(road.drawroad, int(player.p_stop2(road.x0, road.y0, mouseX, mouseY) ), int(player.p_stop(road.x0, road.y0, mouseX, mouseY) ), road.x0, mouseX );
  if (player.landingLine == true) {
    fill(0);
    text("landingLine = true", 200, 30);
  } else {
    fill(0);
    text("landingLine = false", 200, 30);
  }

  player.stage_move(road.drawroad, player.p_stop(road.x0, road.y0, mouseX, mouseY));


  if (player.pjump == true) {
    fill(0);
    text("pjump = true", 200, 50);
  } else {
    fill(0);
    text("pjump= false", 200, 50);
  }

  //player.jamp_jgd();
  
  player.jamp_start();

/*
player.Landing(road.drawroad, player.p_stop(road.x0, road.y0, mouseX, mouseY), road.x0, mouseX );

player.stage_move(road.drawroad, player.p_stop(road.x0, road.y0, mouseX, mouseY));
player.jamp();


road.drawline();
player.jamp_jgd();

//player.Landing(road.drawroad, player.p_stop(road.x0, road.y0, mouseX, mouseY), road.x0, mouseX );
//road.drawline();

  //player.jamp();
  //player.stage_move(road.drawroad, player.p_stop(road.x0, road.y0, mouseX, mouseY));
//player.jamp();

  //player.Landing(road.drawroad, player.p_stop(road.x0, road.y0, mouseX, mouseY), road.x0, mouseX );

  //player.jamp_jgd();
  //road.drawline();
  */
}

void keyPressed(){
  player.keyPressed();
}

void keyReleased() {
  //player.jamp();
  
  player.keyReleased();

  //プレイヤーを初期位置に戻す
  if (key == 'q') {
    player.x = 200;
    player.y = height - 20;
    player.pjump = false;
    player.landingLine = false;
  }
}
