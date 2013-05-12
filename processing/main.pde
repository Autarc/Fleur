/* @pjs globalKeyEvents="true"; */
/* @pjs pauseOnBlur="true"; */

/* @pjs preload="assets/images/15378_wpm_lowres.resized.resized.png"; */
/* @pjs preload="assets/images/rgtaylor_csc_net_wan_cloud.resized.png"; */

PImage IMAGE_PLANT = loadImage("assets/images/15378_wpm_lowres.resized.resized.png");
PImage IMAGE_CLOUD = loadImage("assets/images/rgtaylor_csc_net_wan_cloud.resized.png");


Game game;

void setup() {

	game = new Game();
}

void draw(){

	game.render();
}
