typedef struct {
    int row;
    int col;
    int rdel;
    int cdel;
    int width;
    int height;
    int aniCounter;
    int aniState;
    int prevAniState;
    int curFrame;
    int numFrames;
    int invincibleTimer;
    int flash;
} ANISPRITE;

typedef struct {
    int startRow;
    int startCol;
    int active;
    int row;
    int col;
    int rdel;
    int cdel;
    int width;
    int height;
    int state; // only relevant if active; 0 means "shot", 1 means "dragging player to wall"
} HOOK;

typedef struct {
    int row;
    int col;
    int active;
    int width;
    int height;
    int aniCounter;
    int curFrame;
    int numFrames;
    int type;
    int palRow;
} COIN;

typedef struct {
    int row;
    int col;
    int active;
    int width;
    int height;
    int aniCounter;
    int curFrame;
    int numFrames;
} DUST;

typedef struct {
    int row;
    int col;
    int active;
    int width;
    int height;
    float realRow;
    float realCol;
    float rMomentum;
    float cMomentum;
    float rdel;
    float cdel;
    int curFrame;
    int aniCounter;
    int enemyType;
} ENEMY;

// enums refer to the type of sprite
enum {WALKDOWN, WALKUP, WALKRIGHT, WALKLEFT, HOOKUP, HOOKDOWN, HOOKLEFT, HOOKRIGHT, IDLE};

// TYPES OF COINS
enum {GREENCOIN, BLUECOIN, REDCOIN, GOLDCOIN};

// Types of enemies
enum {DIAGONAL, ZOMBIE};

// Prototypes
void initGame();
void updateGame();
void drawGame();
void initPlayer();
void updatePlayer();
void drawPlayer();
void initHook();
void shootHook();
void updateHook();
void drawHook();
void initCoins();
void spawnCoins(int num);
void spawnCoin();
void updateCoins();
void drawCoins();
void cameraShake();
void drawChain();
void hideChain();
void initDust();
void updateDust();
void drawDust();
void initEnemies();
void updateEnemies();
void drawEnemies();
void drawScore();
void drawLives();