#include <stdlib.h>
#include <stdio.h>
#include <math.h>
#include "myLib.h"
#include "game.h"
#include "spritesheet.h"
#include "foreground.h"
#include "background.h"
#include "sound.h"
#include "chainSFX.h"
#include "thud.h"
#include "rupee.h"
#include "rupeeSpecial.h"
#include "heart.h"


extern int seed;
int getLifeGoal;
int moneyMult;
ANISPRITE player;
DUST dust;
int numCoins;
COIN coins[15];
HOOK hook;
int timer;
int cameraShakeFrame;
int chainLength;
int numEnemies;
unsigned int lives;
unsigned int score;
ENEMY enemies[2];

extern int vOff;
extern int hOff;

int sVOff;
int sHOff;

void initGame() {
	getLifeGoal = 200;
	hOff = 8;
	vOff = 8;
	numCoins = 15;
	score = 0;
	cameraShakeFrame = 0;
	numEnemies = 2;
	lives = 5;
	srand(seed);
	initPlayer();
	initHook();
	initCoins();
	spawnCoins(10);
	initEnemies();
	timer = 0;
	chainLength = 0;
	sVOff = 0;
	sHOff = 0;
}

void updateGame() {
	updateHook();
	updatePlayer();
	updateCoins();
	updateDust();
	updateEnemies();
	DMANow(3, shadowOAM, OAM, 128*4);


	REG_BG1HOFF = hOff;
	REG_BG1VOFF = vOff;
	timer++;
	sVOff = (hOff / 2) - 4;
	sHOff = (vOff / 2) - 4;
	cameraShake();
}

void drawGame() {
	drawPlayer();
	drawHook();
	drawCoins();
	drawChain();
	drawDust();
	drawEnemies();
	drawScore();
	drawLives();
}


void initPlayer() {
	player.row = 140;
	player.col = 120;
	player.rdel = 0;
	player.cdel = 0;
	player.width = 16;
	player.height = 16;
	player.aniCounter = 0;
	player.aniState = WALKDOWN;
	player.curFrame = 0;
	player.numFrames = 2;
	player.invincibleTimer = 0;
	player.flash = 0;
}

void updatePlayer() {
	if (player.aniState != IDLE) {
		player.prevAniState = player.aniState;
	}
	player.aniState = IDLE;

	if (BUTTON_HELD(BUTTON_LEFT) && !hook.active) {
		player.aniState = WALKLEFT;
		player.cdel = -1;
	} else if (BUTTON_HELD(BUTTON_RIGHT) && !hook.active) {
		player.aniState = WALKRIGHT;
		player.cdel = 1;
	} else if (!hook.active) {
		player.cdel = 0;
	}

	if (BUTTON_HELD(BUTTON_UP) && !hook.active) {
		player.aniState = WALKDOWN;
		player.rdel = -1;
	} else if (BUTTON_HELD(BUTTON_DOWN) && !hook.active) {
		player.aniState = WALKUP;
		player.rdel = 1;
	} else if (!hook.active) {
		player.rdel = 0;
	}

	if (BUTTON_PRESSED(BUTTON_A) && !hook.active) {
		if(!hook.active) {
			shootHook();
		}
	}

	if (BUTTON_PRESSED(BUTTON_B)) {
		for(int i = 0; i < numEnemies; i++) {
			enemies[i].active = !enemies[i].active;
			shadowOAM[80 + i].attr0 = ATTR0_HIDE;
		}
	}

	if (hook.active && !hook.state) {
		player.rdel = 0;
		player.cdel = 0;
	}

	player.col = player.col + player.cdel;
	player.row = player.row + player.rdel;

	if (player.col <= 16) {
		player.col = 16;
	} else if (player.col + 16 - 1 >= SCREENWIDTH - 16) {
		player.col = SCREENWIDTH - 17 - 16;
	}

	if (player.row <= 16) {
		player.row = 16;
	} else if (player.row + 16 - 1 >= SCREENHEIGHT - 16) {
		player.row = SCREENHEIGHT - 17 - 16;
	}


	if (player.aniState == IDLE) {
		player.curFrame = 0;
		player.aniState = player.prevAniState;
	} else if(player.aniCounter % 20 == 0) {
		player.curFrame++;
		if (player.curFrame >= player.numFrames) {
			player.curFrame = 0;
		}
	}

	player.invincibleTimer--;

	if (player.invincibleTimer <= 0) {
		player.invincibleTimer = 0;
		player.flash = 0;
	} else if (player.invincibleTimer%5) {
		player.flash = !player.flash;
	}
	player.aniCounter++;
	if (score >= getLifeGoal) {
		if (lives < 5) {
			lives++;
			playSoundB(heart, HEARTLEN, HEARTFREQ, 0);
		}
		getLifeGoal += 200;
	}

	moneyMult = (timer / 1000);
	if (moneyMult >= 5) {
		moneyMult = 5;
	}

}

void drawPlayer() {
	if (player.aniState == WALKDOWN) {
		shadowOAM[0].attr0 = (player.row + vOff - 8) | ATTR0_REGULAR | ATTR0_4BPP | ATTR0_SQUARE; //set attribute 0
		shadowOAM[0].attr1 = (player.col + hOff - 8) | ATTR1_SMALL; //set attribute 1
		shadowOAM[0].attr2 = ATTR2_PRIORITY(1) | ATTR2_TILEID(player.curFrame*2, player.aniState + 2); //set attribute 2
	} else if (player.aniState == WALKUP) {
		shadowOAM[0].attr0 = (player.row + vOff - 8) | ATTR0_REGULAR | ATTR0_4BPP | ATTR0_SQUARE;
		shadowOAM[0].attr1 = (player.col + hOff - 8) | ATTR1_SMALL;
		shadowOAM[0].attr2 = ATTR2_PRIORITY(1) | ATTR2_TILEID(player.curFrame*2, player.aniState - 1);	
	} else if (player.aniState == WALKRIGHT) {
		shadowOAM[0].attr0 = (player.row + vOff - 8) | ATTR0_REGULAR | ATTR0_4BPP | ATTR0_SQUARE;
		shadowOAM[0].attr1 = (player.col + hOff - 8) | ATTR1_SMALL;
		shadowOAM[0].attr2 = ATTR2_PRIORITY(1) | ATTR2_TILEID(player.curFrame*2, player.aniState*2);
	} else if (player.aniState == WALKLEFT) {
		shadowOAM[0].attr0 = (player.row + vOff - 8) | ATTR0_REGULAR | ATTR0_4BPP | ATTR0_SQUARE;
		shadowOAM[0].attr1 = (player.col + hOff - 8) | ATTR1_SMALL;
		shadowOAM[0].attr2 = ATTR2_PRIORITY(1) | ATTR2_TILEID(player.curFrame*2, player.aniState*2);
	} else if (player.aniState == HOOKUP) {
		shadowOAM[0].attr0 = (player.row + vOff - 8) | ATTR0_REGULAR | ATTR0_4BPP | ATTR0_SQUARE;
		shadowOAM[0].attr1 = (player.col + hOff - 8) | ATTR1_SMALL;
		shadowOAM[0].attr2 = ATTR2_PRIORITY(1) | ATTR2_TILEID(0, 10);	
	} else if (player.aniState == HOOKDOWN) {
		shadowOAM[0].attr0 = (player.row + vOff - 8) | ATTR0_REGULAR | ATTR0_4BPP | ATTR0_SQUARE;
		shadowOAM[0].attr1 = (player.col + hOff - 8) | ATTR1_SMALL;
		shadowOAM[0].attr2 = ATTR2_PRIORITY(1) | ATTR2_TILEID(0, 14);	
	} else if (player.aniState == HOOKLEFT) {
		shadowOAM[0].attr0 = (player.row + vOff - 8) | ATTR0_REGULAR | ATTR0_4BPP | ATTR0_SQUARE;
		shadowOAM[0].attr1 = (player.col + hOff - 8) | ATTR1_SMALL;
		shadowOAM[0].attr2 = ATTR2_PRIORITY(1) | ATTR2_TILEID(0, 12);		
	} else if (player.aniState == HOOKRIGHT) {
		shadowOAM[0].attr0 = (player.row + vOff - 8) | ATTR0_REGULAR | ATTR0_4BPP | ATTR0_SQUARE;
		shadowOAM[0].attr1 = (player.col + hOff - 8) | ATTR1_SMALL;
		shadowOAM[0].attr2 = ATTR2_PRIORITY(1) | ATTR2_TILEID(0, 8);		
	}

	if (player.flash) {
		shadowOAM[0].attr0 |= ATTR0_HIDE;
	}
}

void initHook() {
    hook.startRow = 0;
    hook.startCol = 0;
    hook.active = 0;
    hook.row = 0;
    hook.col = 0;
    hook.rdel = 0;
    hook.cdel = 0;
    hook.width = 7;
    hook.height = 7;
    hook.state = 0;
}

void shootHook() {
    hook.state = 0;
    hook.active = 1;
    hook.startRow = player.row;
    hook.row = hook.startRow;
    hook.startCol = player.col;
    hook.col = hook.startCol;
    playSoundB(chainSFX,CHAINSFXLEN,CHAINSFXFREQ, 1);

    if (BUTTON_HELD(BUTTON_UP) || BUTTON_HELD(BUTTON_DOWN) || BUTTON_HELD(BUTTON_RIGHT) || BUTTON_HELD(BUTTON_LEFT)) {
    	if (BUTTON_HELD(BUTTON_UP)) {
    		hook.rdel = -16;
    		player.aniState = HOOKUP;
    	} else if (BUTTON_HELD(BUTTON_DOWN)) {
    		hook.rdel = 16;
    		player.aniState = HOOKDOWN;
    	} else {
    		hook.rdel = 0;
    	}

    	if (BUTTON_HELD(BUTTON_LEFT)) {
    		player.aniState = HOOKLEFT;
    		hook.cdel = -16;
    	} else if (BUTTON_HELD(BUTTON_RIGHT)) {
    		player.aniState = HOOKRIGHT;
    		hook.cdel = 16;
    	} else {
    		hook.cdel = 0;
    	}
    } else { // no directional button is currently pressed, so we fire in the anistate direction
    	if (player.prevAniState == WALKDOWN) {
    		player.aniState = HOOKUP;
    		hook.rdel = -16;
    		hook.cdel = 0;
    	} else if (player.prevAniState == WALKUP) {
    		player.aniState = HOOKDOWN;
    		hook.rdel = 16;
    		hook.cdel = 0;
    	} else if (player.prevAniState == WALKRIGHT) {
    		hook.rdel = 0;
    		hook.cdel = 16;
    	} else if (player.prevAniState == WALKLEFT) {
    		player.aniState = HOOKLEFT;
    		hook.rdel = 0;
    		hook.cdel = -16;
    	}
    }
    if (hook.rdel < 0 && hook.cdel > 0) {
    	hook.startCol = player.col + 12;
    	hook.col = hook.startCol;
    } else if (hook.rdel > 0 && hook.cdel < 0) {
    	hook.startRow = player.row + 12;
    	hook.row = hook.startRow;
    	hook.startCol = player.col - 6;
    	hook.col = hook.startCol;
    } else if (hook.rdel > 0 && hook.cdel > 0) {
    	hook.startRow = player.row + 12;
    	hook.row = hook.startRow;
    	hook.startCol = player.col + 8;
    	hook.col = hook.startCol;
    }
}

void updateHook() {
	if (hook.active && !hook.state) { //hook is shot but hasn't hit the wall
		hook.row += hook.rdel;
		hook.col += hook.cdel;
		if (hook.col < 16 || hook.col > SCREENWIDTH - 16 - hook.width ||
			hook.row < 16 || hook.row > SCREENHEIGHT - 16 - hook.height) { // has hit the wall	
				stopSoundB();
				if (hook.col < 16)
					hook.col = 16;
				if (hook.col > SCREENWIDTH - 16 - hook.width)
					hook.col = SCREENWIDTH - 16 - hook.width;
				if (hook.row < 16)
					hook.row = 16;
				if (hook.row > SCREENHEIGHT - 16 - hook.height)
					hook.row = SCREENHEIGHT - 16 - hook.height;


				int shakeFactor = (sqrt(pow(abs(hook.startRow - hook.row), 2) + pow(abs(hook.startCol - hook.col), 2))) / 2;
				initDust();
				shakeFactor = 1 + (shakeFactor / 50);

				cameraShakeFrame = shakeFactor;
				hook.state = 1;
		}
		chainLength++;
	} else if (hook.active && hook.state) { //hook is in the wall and dragging the player
		int rdif = hook.row - player.row;
		int cdif = hook.col - player.col;
		if (player.rdel < 0) {
			rdif -= 16;
		}
		if (player.cdel < 0) {
			cdif -= 16;
		}

		int off = 0; // off is the absolute value of the difference between player and hook
		if (rdif < 0)
			off = rdif * -1;
		else if (rdif != 0) 
			off = rdif;

		if (cdif < 0)
			off = cdif * -1;
		else if (cdif != 0)
			off = cdif;

		if(off > 17) {
			player.cdel = cdif/4;
			player.rdel = rdif/4;
		} else {
			hook.active = 0;
			hideChain();
			chainLength = 0;
			hook.state = 0;
			player.rdel = 0;
			player.cdel = 0;
		}
	}

}

void drawHook() {
	if (hook.active) {
		if (hook.rdel < 0 && hook.cdel == 0) { // STRAIGHT UP
			shadowOAM[1].attr0 = (hook.row + vOff - 8) | ATTR0_REGULAR | ATTR0_4BPP | ATTR0_SQUARE;
			shadowOAM[1].attr1 = (hook.col + hOff - 8) | ATTR1_TINY;
			shadowOAM[1].attr2 = ATTR2_TILEID(0, 16);
		} else if (hook.rdel > 0 && hook.cdel == 0) { // STRAIGHT DOWN
			shadowOAM[1].attr0 = (hook.row + vOff - 8) | ATTR0_REGULAR | ATTR0_4BPP | ATTR0_SQUARE;
			shadowOAM[1].attr1 = (hook.col + 10 + hOff - 8) | ATTR1_TINY | ATTR1_VFLIP;
			shadowOAM[1].attr2 = ATTR2_TILEID(0, 16);
		} else if (hook.cdel < 0 && hook.rdel == 0) { // STRAIGHT LEFT
			shadowOAM[1].attr0 = (hook.row + 9 + vOff - 8) | ATTR0_REGULAR | ATTR0_4BPP | ATTR0_SQUARE;
			shadowOAM[1].attr1 = (hook.col + hOff - 8) | ATTR1_TINY | ATTR1_HFLIP;
			shadowOAM[1].attr2 = ATTR2_TILEID(1, 16);
		} else if (hook.cdel > 0 && hook.rdel == 0) { // STRAIGHT RIGHT
			shadowOAM[1].attr0 = (hook.row + 9 + vOff - 8) | ATTR0_REGULAR | ATTR0_4BPP | ATTR0_SQUARE;
			shadowOAM[1].attr1 = (hook.col + hOff - 8) | ATTR1_TINY;
			shadowOAM[1].attr2 = ATTR2_TILEID(1, 16);
		} else if (hook.cdel < 0 && hook.rdel < 0)  { // UPPER LEFT
			shadowOAM[1].attr0 = (hook.row - 3 + vOff - 8) | ATTR0_REGULAR | ATTR0_4BPP | ATTR0_SQUARE;
			shadowOAM[1].attr1 = (hook.col - 5 + hOff - 8) | ATTR1_TINY | ATTR1_HFLIP;
			shadowOAM[1].attr2 = ATTR2_TILEID(2, 16);
		} else if (hook.cdel > 0 && hook.rdel < 0) { // UPPER RIGHT
			shadowOAM[1].attr0 = (hook.row + vOff - 8) | ATTR0_REGULAR | ATTR0_4BPP | ATTR0_SQUARE;
			shadowOAM[1].attr1 = (hook.col + hOff - 8) | ATTR1_TINY;
			shadowOAM[1].attr2 = ATTR2_TILEID(2, 16);
		} else if (hook.cdel < 0 && hook.rdel > 0) { // LOWER LEFT
			shadowOAM[1].attr0 = (hook.row + vOff - 8) | ATTR0_REGULAR | ATTR0_4BPP | ATTR0_SQUARE;
			shadowOAM[1].attr1 = (hook.col + hOff - 8) | ATTR1_TINY | ATTR1_VFLIP | ATTR1_HFLIP;
			shadowOAM[1].attr2 = ATTR2_TILEID(2, 16);
		} else if (hook.cdel > 0 && hook.rdel > 0) { // LOWER RIGHT
			shadowOAM[1].attr0 = (hook.row + vOff - 8) | ATTR0_REGULAR | ATTR0_4BPP | ATTR0_SQUARE;
			shadowOAM[1].attr1 = (hook.col + hOff - 8) | ATTR1_TINY | ATTR1_VFLIP;
			shadowOAM[1].attr2 = ATTR2_TILEID(2, 16);
		}
	} else {
		shadowOAM[1].attr0 = ATTR0_HIDE;
	}
}

void initCoins() {
	for (int i = 0; i < numCoins; i++) {
		coins[i].row = 20;
		coins[i].col = 20;
		coins[i].active = 0;
		coins[i].width = 10;
		coins[i].height = 16;
		coins[i].aniCounter = 0;
		coins[i].curFrame = 0;
		coins[i].numFrames = 6;
		coins[i].type = GREEN;
		coins[i].palRow = 0;
	}
}

void spawnCoins(int num) {
	for (int i = 0; i < num; i++) {
		spawnCoin();
	}
}

void spawnCoin() {
	for (int i = 0; i < numCoins; i++) {
		if (!coins[i].active) {
			coins[i].row = (rand() % 110) + 16;
			coins[i].col = (rand() % 200) + 16;
			coins[i].active = 1;
			coins[i].curFrame = 0;
			coins[i].aniCounter = 0;
			int type = (rand() % 20) + moneyMult;
			if (type < 10) {
				coins[i].type = GREENCOIN;
				coins[i].palRow = 0;
			} else if (type < 15) {
				coins[i].type = BLUECOIN;
				coins[i].palRow = 1;
			} else if (type < 18) {
				coins[i].type = REDCOIN;
				coins[i].palRow = 2;
			} else {
				coins[i].type = GOLDCOIN;
				coins[i].palRow = 3;
			}
			break;
		}
	}
}

void updateCoins() {
	for (int i = 0; i < numCoins; i++) {
		if (coins[i].active) {
			coins[i].aniCounter++;
			if (collision(coins[i].row, coins[i].col, coins[i].height, coins[i].width, 
						  player.row, player.col, player.height, player.width)) {
				if (coins[i].palRow == 0) {
					score += 1;
					stopSoundB();
					playSoundB(rupee,RUPEELEN,RUPEEFREQ, 0);
				} else if (coins[i].palRow == 1) {
					stopSoundB();
					playSoundB(rupee,RUPEELEN,RUPEEFREQ, 0);
					score += 5;
				} else if (coins[i].palRow == 2) {
					stopSoundB();
					playSoundB(rupeeSpecial,RUPEESPECIALLEN,RUPEESPECIALFREQ, 0);
					score += 20;
				} else if (coins[i].palRow == 3) {
					stopSoundB();
					playSoundB(rupeeSpecial,RUPEESPECIALLEN,RUPEESPECIALFREQ, 0);
					score += 50;
				}
				coins[i].active = 0;
				spawnCoin();

			} else if (collision(coins[i].row, coins[i].col, coins[i].height, coins[i].width,
					player.row - (player.rdel / 2), player.col - (player.cdel/2), player.height, player.width)) {
				// added to add check for collision in between current and previous position
				if (coins[i].palRow == 0) {
					stopSoundB();
					playSoundB(rupee,RUPEELEN,RUPEEFREQ, 0);
					score += 1;
				} else if (coins[i].palRow == 1) {
					stopSoundB();
					playSoundB(rupee,RUPEELEN,RUPEEFREQ, 0);
					score += 5;
				} else if (coins[i].palRow == 2) {
					stopSoundB();
					playSoundB(rupeeSpecial,RUPEESPECIALLEN,RUPEESPECIALFREQ, 0);
					score += 20;
				} else if (coins[i].palRow == 3) {
					stopSoundB();
					playSoundB(rupeeSpecial,RUPEESPECIALLEN,RUPEESPECIALFREQ, 0);
					score += 50;
				}
				coins[i].active = 0;
				spawnCoin();
			}
			if(coins[i].aniCounter % 20 == 0) {
					coins[i].curFrame++;
					if (coins[i].curFrame >= coins[i].numFrames) {
						coins[i].curFrame = 0;
					}
			}
		}
	}
}

void drawCoins() {
	for (int i = 0; i < numCoins; i++) {
		if (coins[i].active) {
			// TODO: add cases for different coin types and spinning animation
			shadowOAM[i + 2].attr0 = (coins[i].row + vOff - 8)| ATTR0_REGULAR | ATTR0_4BPP | ATTR0_SQUARE;
			shadowOAM[i + 2].attr1 = (coins[i].col + hOff - 8) | ATTR1_SMALL;
			shadowOAM[i + 2].attr2 = ATTR2_PALROW(coins[i].palRow) | ATTR2_PRIORITY(1) | ATTR2_TILEID(coins[i].curFrame*2, 18);
		}
	}
}

void cameraShake() {
	if (cameraShakeFrame > 0) {
		if (timer % 10) {
			cameraShakeFrame--;
			int shake = cameraShakeFrame;
			if (cameraShakeFrame % 2) {
				shake = -1 * shake;
			}
			int mult = rand()%2;
			if (mult == 1) {
				mult = -1;
			} else {
				mult = 1;
			}
			hOff = 8 + (shake * mult);
			vOff = 8 + (shake * mult);
		}
	}
}

void drawChain() {
	// TODO: finish drawchain cases
	// chain OAM starts at 100

	if (hook.rdel == -16 && hook.cdel == 0) { // STRAIGHT UP
		for (int i = 0; i < chainLength; i++) {
			shadowOAM[i + 100].attr0 = (player.row - (16 * (i + 1)) + vOff - 8) | ATTR0_REGULAR | ATTR0_4BPP | ATTR0_TALL;
			shadowOAM[i + 100].attr1 = (player.col + hOff - 8) | ATTR1_SMALL;
			shadowOAM[i + 100].attr2 = ATTR2_PRIORITY(1) | ATTR2_TILEID(0, 24);
		}
	} else if (hook.rdel == 0 && hook.cdel == -16) { // STRAIGHT LEFT
		for (int i = 0; i < chainLength; i++) {
			int col = (player.col - (16 * (i + 1)) + hOff - 8);
				if (col < 0) {
				col = 0;
			}
			shadowOAM[i + 100].attr0 = (player.row + 9 + vOff - 8) | ATTR0_REGULAR | ATTR0_4BPP | ATTR0_WIDE;
			shadowOAM[i + 100].attr1 = col | ATTR1_TINY;
			shadowOAM[i + 100].attr2 = ATTR2_PRIORITY(1) | ATTR2_TILEID(0, 25);
		}
	} else if (hook.rdel == 16 && hook.cdel == 0) { // STRAIGHT DOWN
		for (int i = 0; i < chainLength; i++) {
			shadowOAM[i + 100].attr0 = (player.row + (16 * (i + 1)) + vOff - 8) | ATTR0_REGULAR | ATTR0_4BPP | ATTR0_TALL;
			shadowOAM[i + 100].attr1 = (player.col + 10 + hOff - 8) | ATTR1_SMALL;
			shadowOAM[i + 100].attr2 = ATTR2_PRIORITY(1) | ATTR2_TILEID(0, 24 );
		}
	} else if (hook.rdel == 0 && hook.cdel == 16) { // STRAIGHT RIGHT
		for (int i = 0; i < chainLength; i++) {
			shadowOAM[i + 100].attr0 = (player.row + 9 + vOff - 8) | ATTR0_REGULAR | ATTR0_4BPP | ATTR0_WIDE;
			shadowOAM[i + 100].attr1 = (player.col + (16 * (i + 1)) + hOff - 8) | ATTR1_TINY;
			shadowOAM[i + 100].attr2 = ATTR2_PRIORITY(1) | ATTR2_TILEID(0, 25);
		}
	} else if (hook.rdel == -16 && hook.cdel == -16) { // UPPER LEFT
		for (int i = 0; i < chainLength; i++) {
			int col = (player.col - (16 * (i + 1)) + hOff - 8);
				if (col < 0) {
				col = 0;
			}
			shadowOAM[i + 100].attr0 = (player.row - (16 * (i + 1)) + vOff - 8) | ATTR0_REGULAR | ATTR0_4BPP | ATTR0_SQUARE;
			shadowOAM[i + 100].attr1 = col | ATTR1_SMALL | ATTR1_HFLIP;
			shadowOAM[i + 100].attr2 = ATTR2_PRIORITY(1) | ATTR2_TILEID(1, 25);
		}
	} else if (hook.rdel == -16 && hook.cdel == 16) { // UPPER RIGHT
		for (int i = 0; i < chainLength; i++) {
			shadowOAM[i + 100].attr0 = (player.row - (16 * (i + 1)) + vOff - 8) | ATTR0_REGULAR | ATTR0_4BPP | ATTR0_SQUARE;
			shadowOAM[i + 100].attr1 = (player.col + (16 * (i + 1)) + hOff - 8) | ATTR1_SMALL;
			shadowOAM[i + 100].attr2 = ATTR2_PRIORITY(1) | ATTR2_TILEID(1, 25);
		}
	} else if (hook.rdel == 16 && hook.cdel == 16) { // LOWER RIGHT
		for (int i = 0; i < chainLength; i++) {
			shadowOAM[i + 100].attr0 = (player.row + (16 * (i + 1)) + vOff - 8) | ATTR0_REGULAR | ATTR0_4BPP | ATTR0_SQUARE;
			shadowOAM[i + 100].attr1 = (player.col +(16 * (i + 1)) + hOff - 8) | ATTR1_SMALL | ATTR1_VFLIP;
			shadowOAM[i + 100].attr2 = ATTR2_PRIORITY(1) | ATTR2_TILEID(1, 25);
		}
	} else if (hook.rdel == 16 && hook.cdel == -16) { // LOWER LEFT
		for (int i = 0; i < chainLength; i++) {
			int col = (player.col - (16 * (i + 1)) + hOff - 8);
				if (col < 0) {
				col = 0;
			}
			shadowOAM[i + 100].attr0 = (player.row + (16 * (i + 1)) + vOff - 8) | ATTR0_REGULAR | ATTR0_4BPP | ATTR0_SQUARE;
			shadowOAM[i + 100].attr1 = col | ATTR1_SMALL | ATTR1_HFLIP | ATTR1_VFLIP;
			shadowOAM[i + 100].attr2 = ATTR2_PRIORITY(1) | ATTR2_TILEID(1, 25);
		}
	} 
}

void hideChain() { //hides all chain parts after player hits wall
	for (int i = 0; i < 20; i++) {
		shadowOAM[i + 100].attr0 = ATTR0_HIDE;
	}
}

void initDust() {
	dust.row = hook.row;
	dust.col = hook.col;
	dust.active = 1;
	dust.width = 16;
	dust.height = 16;
	dust.aniCounter = 0;
	dust.curFrame = 0;
	dust.numFrames = 5;
}

void updateDust() {
	if (dust.active) {
		if (dust.curFrame >= 5) {
			dust.active = 0;
		}
		if(dust.aniCounter % 5 == 0) {
			dust.curFrame++;
		}
	}
	dust.aniCounter++;

}

void drawDust() {
	if (dust.active) {
		if (hook.rdel == -16) { // STRAIGHT UP
			shadowOAM[99].attr0 = (dust.row + vOff - 8) | ATTR0_REGULAR | ATTR0_4BPP | ATTR0_SQUARE;
			shadowOAM[99].attr1 = (dust.col - 4 + hOff - 8) | ATTR1_SMALL | ATTR1_VFLIP;
			shadowOAM[99].attr2 = ATTR2_PRIORITY(1) | ATTR2_TILEID(dust.curFrame * 2, 20);
		} else if (hook.rdel == 16) { // STRAIGHT DOWN
			shadowOAM[99].attr0 = (dust.row - 4 + vOff - 8) | ATTR0_REGULAR | ATTR0_4BPP | ATTR0_SQUARE;
			shadowOAM[99].attr1 = (dust.col + 4 + hOff - 8) | ATTR1_SMALL;
			shadowOAM[99].attr2 = ATTR2_PRIORITY(1) | ATTR2_TILEID(dust.curFrame * 2, 20);
		} else if (hook.cdel == -16) { // STRAIGHT LEFT
			shadowOAM[99].attr0 = (dust.row + 2 + vOff - 8) | ATTR0_REGULAR | ATTR0_4BPP | ATTR0_SQUARE;
			shadowOAM[99].attr1 = (dust.col + hOff - 8) | ATTR1_SMALL;
			shadowOAM[99].attr2 = ATTR2_PRIORITY(1) | ATTR2_TILEID(dust.curFrame * 2, 28);
		} else if (hook.cdel == 16) { // STRAIGHT RIGHT
			shadowOAM[99].attr0 = (dust.row + 2 + vOff - 8) | ATTR0_REGULAR | ATTR0_4BPP | ATTR0_SQUARE;
			shadowOAM[99].attr1 = (dust.col - 8 + hOff - 8) | ATTR1_SMALL | ATTR1_HFLIP;
			shadowOAM[99].attr2 = ATTR2_PRIORITY(1) | ATTR2_TILEID(dust.curFrame * 2, 28);
		}
	}
}

void initEnemies() {
	for (int i = 0; i < numEnemies; i++) {
		enemies[i].row = 30 * (i + 1);
		enemies[i].col = 30 * (i + 1);
		enemies[i].active = 1;
		enemies[i].width = 16;
		enemies[i].height = 16;
		enemies[i].rdel = 1;
		enemies[i].cdel = 1; 
		enemies[i].curFrame = 0;
		enemies[i].aniCounter = 0;
		enemies[i].enemyType = ZOMBIE;
		if (i % 2) {
			enemies[i].enemyType = DIAGONAL;
		}
	}
}

void updateEnemies() {
	for (int i = 0; i < numEnemies; i++) {
		if (enemies[i].active) {

			if (enemies[i].enemyType == ZOMBIE) {
				if (timer % (2 + (moneyMult)) && (rand() % 2)) {
					enemies[i].row += enemies[i].rdel;
					enemies[i].col += enemies[i].cdel;
				}
				int rDif = player.row - enemies[i].row;
				int cDif = player.col - enemies[i].col;
				if (rDif < 0) {
					enemies[i].rdel = -1;
				} else {
					enemies[i].rdel = 1;
				}

				if (cDif < 0) {
					enemies[i].cdel = -1;
				} else {
					enemies[i].cdel = 1;
				}
			} else if (enemies[i].enemyType == DIAGONAL) {
				if (timer % (2 + (moneyMult))) {
					enemies[i].row += enemies[i].rdel;
					enemies[i].col += enemies[i].cdel;
				}
				if (enemies[i].col + 16 - 1 >= SCREENWIDTH - 16 || enemies[i].col <= 16) {
					enemies[i].cdel *= -1;
				}
				if (enemies[i].row <= 16 || enemies[i].row + 15 >= SCREENHEIGHT - 16) {
					enemies[i].rdel *= -1;
				}
			}

			if (enemies[i].col <= 16) {
				enemies[i].col = 17;
			} else if (enemies[i].col + 16 - 1 >= SCREENWIDTH - 16) {
				enemies[i].col = SCREENWIDTH - 17 - 16;
			}

			if (enemies[i].row <= 16) {
				enemies[i].row = 17;
			} else if (enemies[i].row + 16 - 1 >= SCREENHEIGHT - 16) {
				enemies[i].row = SCREENHEIGHT - 17 - 16;
			}





			if (collision(enemies[i].row, enemies[i].col, enemies[i].width, enemies[i].height, 
				player.row, player.col, player.width, player.height) && !player.invincibleTimer) {
				playSoundB(thud,THUDLEN,THUDFREQ, 0);
				lives--;
				player.invincibleTimer = 130;
			}	

			if(enemies[i].aniCounter % 20 == 0) {
					enemies[i].curFrame++;
					if (enemies[i].curFrame >= 2) {
						enemies[i].curFrame = 0;
					}
			}

			enemies[i].aniCounter++;
		}
	}
}

void drawEnemies() {
	for (int i = 0; i < numEnemies; i++) {
		if (enemies[i].active && enemies[i].rdel < 0) { // WALK STRAIGHT UP
			shadowOAM[90 + i].attr0 = (enemies[i].row + vOff - 8) | ATTR0_REGULAR | ATTR0_4BPP | ATTR0_SQUARE;
			shadowOAM[90 + i].attr1 = (enemies[i].col + hOff - 8)| ATTR1_SMALL;
			shadowOAM[90 + i].attr2 = ATTR2_PALROW(6) | ATTR2_PRIORITY(1) | ATTR2_TILEID(enemies[i].curFrame * 2, 2);
		}
		if (enemies[i].active && enemies[i].rdel > 0) { // WALK STRAIGHT DOWN
			shadowOAM[90 + i].attr0 = (enemies[i].row + vOff - 8) | ATTR0_REGULAR | ATTR0_4BPP | ATTR0_SQUARE;
			shadowOAM[90 + i].attr1 = (enemies[i].col + hOff - 8)| ATTR1_SMALL;
			shadowOAM[90 + i].attr2 = ATTR2_PALROW(6) | ATTR2_PRIORITY(1) | ATTR2_TILEID(enemies[i].curFrame * 2, 0);
		}
		if (enemies[i].active && enemies[i].cdel < 0) { //STRAIGHT LEFT
			shadowOAM[90 + i].attr0 = (enemies[i].row + vOff - 8) | ATTR0_REGULAR | ATTR0_4BPP | ATTR0_SQUARE;
			shadowOAM[90 + i].attr1 = (enemies[i].col + hOff - 8)| ATTR1_SMALL;
			shadowOAM[90 + i].attr2 = ATTR2_PALROW(6) | ATTR2_PRIORITY(1) | ATTR2_TILEID(enemies[i].curFrame * 2, 6);
		}
		if (enemies[i].active && enemies[i].cdel > 0) { //STRAIGHT RIGHT
			shadowOAM[90 + i].attr0 = (enemies[i].row + vOff - 8) | ATTR0_REGULAR | ATTR0_4BPP | ATTR0_SQUARE;
			shadowOAM[90 + i].attr1 = (enemies[i].col + hOff - 8)| ATTR1_SMALL;
			shadowOAM[90 + i].attr2 = ATTR2_PALROW(6) | ATTR2_PRIORITY(1) | ATTR2_TILEID(enemies[i].curFrame * 2, 4);
		}
	}
}


void drawScore() {
	// first digit
	int numDigits = 1;
	if (score > 9)
		numDigits = 2;
	if (score > 99)
		numDigits = 3;
	if (score > 999)
		numDigits = 4;
	if (score > 9999)
		numDigits = 5;

	int firstDigit = score % 10;
	int secondDigit = (score / 10) % 10;
	int thirdDigit = (score / 100) % 10;
	int fourthDigit = (score / 1000) % 10;
	int fifthDigit = (score / 10000) % 10;
	// offset = 8 * (number of digits - number of the digit)
	shadowOAM[80].attr0 = 2 | ATTR0_REGULAR | ATTR0_4BPP | ATTR0_SQUARE;
	shadowOAM[80].attr1 = (2 + ((numDigits - 1) * 8)) | ATTR1_TINY;
	shadowOAM[80].attr2 = ATTR2_PRIORITY(0) | ATTR2_TILEID(30, firstDigit);

	if (numDigits >= 2) {
		shadowOAM[81].attr0 = 2 | ATTR0_REGULAR | ATTR0_4BPP | ATTR0_SQUARE;
		shadowOAM[81].attr1 = (2 + ((numDigits - 2) * 8)) | ATTR1_TINY;
		shadowOAM[81].attr2 = ATTR2_PRIORITY(0) | ATTR2_TILEID(30, secondDigit);
	}
	if (numDigits >= 3) {
		shadowOAM[82].attr0 = 2 | ATTR0_REGULAR | ATTR0_4BPP | ATTR0_SQUARE;
		shadowOAM[82].attr1 = (2 + ((numDigits - 3) * 8)) | ATTR1_TINY;
		shadowOAM[82].attr2 = ATTR2_PRIORITY(0) | ATTR2_TILEID(30, thirdDigit);
	}
	if (numDigits >= 4) {
		shadowOAM[83].attr0 = 2 | ATTR0_REGULAR | ATTR0_4BPP | ATTR0_SQUARE;
		shadowOAM[83].attr1 = (2 + ((numDigits - 4) * 8)) | ATTR1_TINY;
		shadowOAM[83].attr2 = ATTR2_PRIORITY(0) | ATTR2_TILEID(30, fourthDigit);
	}
	if (numDigits >= 5) {
		shadowOAM[84].attr0 = 2 | ATTR0_REGULAR | ATTR0_4BPP | ATTR0_SQUARE;
		shadowOAM[84].attr1 = (2 + ((numDigits - 5) * 8)) | ATTR1_TINY;
		shadowOAM[84].attr2 = ATTR2_PRIORITY(0) | ATTR2_TILEID(30, fifthDigit);
	}
}

void drawLives() {

	shadowOAM[40].attr0 = 2 | ATTR0_REGULAR | ATTR0_4BPP | ATTR0_SQUARE;
	shadowOAM[40].attr1 = (SCREENWIDTH - 42) | ATTR1_TINY | ATTR1_VFLIP;
	shadowOAM[40].attr2 = ATTR2_PRIORITY(0) | ATTR2_TILEID(0, 16);

	shadowOAM[41].attr0 = 2 | ATTR0_REGULAR | ATTR0_4BPP | ATTR0_SQUARE;
	shadowOAM[41].attr1 = (SCREENWIDTH - 34) | ATTR1_TINY | ATTR1_VFLIP;
	shadowOAM[41].attr2 = ATTR2_PRIORITY(0) | ATTR2_TILEID(0, 16);

	shadowOAM[42].attr0 = 2 | ATTR0_REGULAR | ATTR0_4BPP | ATTR0_SQUARE;
	shadowOAM[42].attr1 = (SCREENWIDTH - 26) | ATTR1_TINY | ATTR1_VFLIP;
	shadowOAM[42].attr2 = ATTR2_PRIORITY(0) | ATTR2_TILEID(0, 16);

	shadowOAM[43].attr0 = 2 | ATTR0_REGULAR | ATTR0_4BPP | ATTR0_SQUARE;
	shadowOAM[43].attr1 = (SCREENWIDTH - 18) | ATTR1_TINY | ATTR1_VFLIP;
	shadowOAM[43].attr2 = ATTR2_PRIORITY(0) | ATTR2_TILEID(0, 16);

	shadowOAM[44].attr0 = 2 | ATTR0_REGULAR | ATTR0_4BPP | ATTR0_SQUARE;
	shadowOAM[44].attr1 = (SCREENWIDTH - 10) | ATTR1_TINY | ATTR1_VFLIP;
	shadowOAM[44].attr2 = ATTR2_PRIORITY(0) | ATTR2_TILEID(0, 16);

	for (int i = 0; i < 5; i++) {
		if (i < lives) {
			shadowOAM[40 + i].attr2 |= ATTR2_PALROW(0);
		} else {
			shadowOAM[40 + i].attr2 |= ATTR2_PALROW(6);
		}
	}
}