class Crows extends GameObject {
    int speedY = 1;
    int size = 50;
    int imgCounter;
    PImage[] imgs = new PImage[13];

    Crows(float x, float y) {
        super(x, y);
        for (int i = 0; i < 13; i++) {
            imgs[i] = loadImage("cm" + (i + 1) + ".png");
        }
    }

    @Override
    void render() {
        image(imgs[imgCounter / 13 % imgs.length], x, y);
        imgCounter++;
    }

    @Override
    void update() {
        render();
        move();
    }

    void move() {
        y += speedY;
    }
}
