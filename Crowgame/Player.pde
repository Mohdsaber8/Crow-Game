class Player extends GameObject {
    Player(float x, float y) {
        super(x, y);
        sprite = loadImage("ScareCrow.png");
    }

    @Override
    void update() {
        render();
    }
}
