/* HOOKSLIDE: FINAL
To play, just follow the instructions and avoid the enemies. You can restore one heart by 
gathering 200 rupees!

CHEAT: the cheat is to press B to stop enemies and make yourself invincible. Press B to turn it on/off.
*/


#include <stdlib.h>
#include <stdio.h>
#include "myLib.h"
#include "game.h"
#include "spritesheet.h"
#include "foreground.h"
#include "background.h"
#include "instructions.h"
#include "start.h"
#include "pause.h"
#include "gameover.h"
#include "sound.h"
#include "gameSong.h"
#include "title.h"
#include "end.h"
#include "chainSFX.h"

// Prototypes
void initialize();

// State Prototypes
void goToStart();
void start();
void goToInstructions();
void instructions();
void goToGame();
void game();
void goToPause();
void pause();
void goToLose();
void lose();
void drawFinalScore();

// States
int state;
enum {START, INSTRUCTIONS, GAME, PAUSE, LOSE};
extern int score;

// Button Variables
unsigned short buttons;
unsigned short oldButtons;

int hOff = 8;
int vOff = 8;
OBJ_ATTR shadowOAM[128];
extern int lives;

// Random Seed
int seed;

// Text Buffer
char buffer[41];

int main() {

    initialize();

    while(1) {

        // Update button variables
        oldButtons = buttons;
        buttons = BUTTONS;
                
        // State Machine
        switch(state) {

            case START:
                start();
                break;
            case INSTRUCTIONS:
                instructions();
                break;
            case GAME:
                game();
                break;
            case PAUSE:
                pause();
                break;
            case LOSE:
                lose();
                break;
        }

        //DMANow(3, shadowOAM, OAM, 128*4);
        DMANow(3, shadowOAM, OAM, 128*4);

        REG_BG1HOFF = hOff;
        REG_BG1VOFF = vOff;
    }
}

void initialize() {
	//set up mode 0
    buttons = BUTTONS;
    hOff = 8;
    vOff = 8;

    setupSounds();
    setupInterrupts();


    //Higher priorities are drawn first (and therefore can be covered by later sprites and backgrounds)
    REG_BG0CNT = BG_CHARBLOCK(0) | BG_SCREENBLOCK(18) | BG_SIZE_SMALL; // MENUS
    REG_BG1CNT = BG_CHARBLOCK(1) | BG_SCREENBLOCK(20) | BG_SIZE_SMALL; // FOREGROUND
    REG_BG3CNT = BG_CHARBLOCK(2) | BG_SCREENBLOCK(22) | BG_PRIORITY2 | BG_SIZE_SMALL; // BACKGROUND

    DMANow(3, startTiles, &CHARBLOCK[0], startTilesLen/2);
    DMANow(3, startMap, &SCREENBLOCK[18], startMapLen/2);

    DMANow(3, foregroundPal, PALETTE, foregroundPalLen/2);
    DMANow(3, foregroundTiles, &CHARBLOCK[1], foregroundTilesLen/2);
    DMANow(3, foregroundMap, &SCREENBLOCK[20], foregroundMapLen/2);
    
    DMANow(3, backgroundTiles, &CHARBLOCK[2], backgroundTilesLen/2);
    DMANow(3, backgroundMap, &SCREENBLOCK[22], backgroundMapLen/2);

    DMANow(3, spritesheetPal, SPRITEPALETTE, 256);
    DMANow(3, spritesheetTiles, &CHARBLOCK[4], spritesheetTilesLen/2);

    goToStart();

}

void goToStart() {
	// DMA Start screen
    REG_BG0HOFF = 0;
    DMANow(3, startTiles, &CHARBLOCK[0], startTilesLen/2);
    DMANow(3, startMap, &SCREENBLOCK[18], startMapLen/2);
    REG_DISPCTL = MODE0 | BG0_ENABLE | BG3_ENABLE | BG1_ENABLE | SPRITE_ENABLE;

    stopSoundA();
    playSoundA(title,TITLELEN,TITLEFREQ, 1);

    waitForVBlank();

    hideSprites();

    DMANow(3, shadowOAM, OAM, 120*4);

    hOff = 8;
    vOff = 8;

    seed = 0;
	state = START;
}

void start() {
	seed++;
	waitForVBlank();

	if (BUTTON_PRESSED(BUTTON_START)) {
	    srand(seed);
        goToInstructions();
	}
}

void goToInstructions() {
    REG_BG0HOFF = 7;

    DMANow(3, instructionsTiles, &CHARBLOCK[0], instructionsTilesLen/2);
    DMANow(3, instructionsMap, &SCREENBLOCK[18], instructionsMapLen);

    state = INSTRUCTIONS;
}

void instructions() {

    waitForVBlank();

    if (BUTTON_PRESSED(BUTTON_START)) {
        goToGame();
        initGame();
    }
}

void goToGame() {
    REG_BG0HOFF = 0;
	// DMA background screen in
    REG_DISPCTL = MODE0 |  BG3_ENABLE |  BG1_ENABLE | SPRITE_ENABLE;
    stopSoundA();
    playSoundA(gameSong,GAMESONGLEN,GAMESONGFREQ, 1);

    waitForVBlank();

    hideSprites();

    DMANow(3, shadowOAM, OAM, 120*4);
	state = GAME;
}

void game() {

	drawGame();
	waitForVBlank();
	updateGame();

    if (BUTTON_PRESSED(BUTTON_START)) {
        hOff = 8;
        vOff = 8;
        goToPause();
    }
    if (lives <= 0) {
        goToLose();
    }
}

void goToPause() {
    REG_BG0HOFF = 8;
    stopSoundA();
    playSoundA(end,ENDLEN,ENDFREQ, 1);

    REG_DISPCTL = MODE0 | BG0_ENABLE | BG3_ENABLE |  BG1_ENABLE | SPRITE_ENABLE;
    hideSprites();
    DMANow(3, pauseTiles, &CHARBLOCK[0], pauseTilesLen/2);
    DMANow(3, pauseMap, &SCREENBLOCK[18], pauseMapLen/2);

    hOff = 8;
    vOff = 8;
    waitForVBlank();

    //DMA Pause screen in

    state = PAUSE;
}

void pause() {
    waitForVBlank();

	if (BUTTON_PRESSED(BUTTON_START))
	    goToGame();
	else if (BUTTON_PRESSED(BUTTON_SELECT))
	    goToStart();
}

void goToLose() {
    REG_BG0HOFF = 8;
    REG_DISPCTL = MODE0 | BG0_ENABLE | BG3_ENABLE |  BG1_ENABLE | SPRITE_ENABLE;
    stopSoundA();
    playSoundA(end,ENDLEN,ENDFREQ, 1);

    hideSprites();
    DMANow(3, gameoverTiles, &CHARBLOCK[0], gameoverTilesLen/2);
    DMANow(3, gameoverMap, &SCREENBLOCK[18], gameoverMapLen/2);

    hOff = 8;
    vOff = 8;
    waitForVBlank();

    //DMA Pause screen in

    state = LOSE;
    drawFinalScore();
}

void lose() {

	if (BUTTON_PRESSED(BUTTON_START)) 
	    goToStart();
}

void drawFinalScore() {

    int firstDigit = score % 10;
    int secondDigit = (score / 10) % 10;
    int thirdDigit = (score / 100) % 10;
    int fourthDigit = (score / 1000) % 10;
    int fifthDigit = (score / 10000) % 10;
    // offset = 8 * (number of digits - number of the digit)
    shadowOAM[80].attr0 = 80 | ATTR0_REGULAR | ATTR0_4BPP | ATTR0_SQUARE;
    shadowOAM[80].attr1 = 132 | ATTR1_TINY;
    shadowOAM[80].attr2 = ATTR2_PRIORITY(0) | ATTR2_TILEID(30, firstDigit);

    shadowOAM[81].attr0 = 80 | ATTR0_REGULAR | ATTR0_4BPP | ATTR0_SQUARE;
    shadowOAM[81].attr1 = 124 | ATTR1_TINY;
    shadowOAM[81].attr2 = ATTR2_PRIORITY(0) | ATTR2_TILEID(30, secondDigit);

    shadowOAM[82].attr0 = 80 | ATTR0_REGULAR | ATTR0_4BPP | ATTR0_SQUARE;
    shadowOAM[82].attr1 = 116 | ATTR1_TINY;
    shadowOAM[82].attr2 = ATTR2_PRIORITY(0) | ATTR2_TILEID(30, thirdDigit);

    shadowOAM[83].attr0 = 80 | ATTR0_REGULAR | ATTR0_4BPP | ATTR0_SQUARE;
    shadowOAM[83].attr1 = 108 | ATTR1_TINY;
    shadowOAM[83].attr2 = ATTR2_PRIORITY(0) | ATTR2_TILEID(30, fourthDigit);

    shadowOAM[84].attr0 = 80 | ATTR0_REGULAR | ATTR0_4BPP | ATTR0_SQUARE;
    shadowOAM[84].attr1 = 100 | ATTR1_TINY;
    shadowOAM[84].attr2 = ATTR2_PRIORITY(0) | ATTR2_TILEID(30, fifthDigit);
}