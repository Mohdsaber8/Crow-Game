PImage grass, Corn;
Player scareCrow;
ArrayList<GameObject> crowList = new ArrayList<>();
int mode = 1; // 1: intro, 2: game, 3: game over
int score, lives;

void setup() {
    size(500, 600);
    score = 0;
    lives = 3;
    grass = loadImage("Grass.png");
    Corn = loadImage("CornField.jpg");
    Corn.resize(500, 180);

    scareCrow = new Player(220, 350);

    for (int i = 0; i < 10; i++) {
        crowList.add(new Crows(i * 50, 5));
    }
}

void draw() {
    if (mode == 1) {
        intro();
    } else if (mode == 2) {
        playGame();
    } else if (mode == 3) {
        gameOver();
    }
}

void playGame() {
    image(grass, 0, 0);
    scareCrow.update();
    image(Corn, 0, 420);

    for (GameObject crow : crowList) {
        crow.update();
    }

    checkCollisions();
    displayScoreAndLives();

    if (lives <= 0) {
        mode = 3;
    }

    if (score >= 10) {
        background(10, 220, 200);
        text("Congratulations! You won! Total score: " + score, 130, 300);
    }
}

void checkCollisions() {
    for (int i = 0; i < crowList.size(); i++) {
        Crows crow = (Crows) crowList.get(i);
        if (crow.y >= 400) {
            crowList.remove(i);
            lives--;
            break;
        }
    }
}

void displayScoreAndLives() {
    text("Score: " + score, 10, 20);
    text("Lives: " + lives, 10, 40);
}

void gameOver() {
    background(255, 0, 0);
    text("GAME OVER", 200, 300);
}

void intro() {
    background(150, 70, 50);
    text("Click anywhere to start", 190, 300);
}

void mousePressed() {
    if (mode == 1) {
        mode = 2;
    } else if (mode == 2) {
        for (int i = 0; i < crowList.size(); i++) {
            Crows crow = (Crows) crowList.get(i);
            if (dist(mouseX, mouseY, crow.x, crow.y) < crow.size / 1.5) {
                crowList.remove(i);
                score++;
                break;
            }
        }
    } else if (mode == 3) {
        mode = 1;
    }
}
