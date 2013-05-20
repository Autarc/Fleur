// basic constant and global definitions

int   WORLD_WIDTH     =  21,              //   m
      WORLD_HEIGHT    =  11,              //   m
      RANGE           = WORLD_WIDTH/2,    // 10m

      SCREEN_WIDTH    = 800,
      SCREEN_HEIGHT   = 400,

      SCALE_M         =  SCREEN_WIDTH/WORLD_WIDTH,    // scale factor: 40px = 1m    = cannon: 2-3m || ~ 38
      SCALE_T         =  4,                           // bsp 800 m/s ||     = 10m pro sec //10

      FRAME_RATE      =  30,
      FRAME_COUNTER   =   0,              // define passed frames

      TIME_COUNTER    =   0,              // used for the clock
      CHARGE_COUNTER  =   0;              // dt



// Difficulty
int   DIFFICULTY_PLANTS       =  3,
      DIFFICULTY_TIME         = DIFFICULTY_PLANTS * 60,

      DIFFICULTY_FILL_BASE    = 50,       // 50% per shoot  || should later
                                          //                   be variable and depend on the power
      DIFFICULTY_FILL_LOSS    =  5;       // fills/5 -> -1  ||



int   ANGLE_MIN               =  10,      // min. range (see Theory: Calulcation - #4 )
      ANGLE_MAX               =  45,      // max. range (see Theory: Calculation - #2 )
      DEFAULT_ANGLE           =  45,      // 30.0

      INCREMENT_POWER         =  10,
      DEFAULT_POWER           =   0,
      MAX_POWER               = 600;      // prev: 93

// const
float DENSITY_WATER           =  1.0,      // rho
      WEIGHT_BULLET           =   10,      // kg
      WEIGHT_CANNON           = 1000,      // kg

      FRICTION_SLIDING        =  0.3,     // Gleitreibung
      FRICTION_ADHESION       =  0.7;     // Haftreibung


float GRAVITY                 = 9.81;    // ms / s²

