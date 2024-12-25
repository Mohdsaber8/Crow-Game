abstract class GameObject {
    float x, y;
    PImage sprite;

    GameObject(float x, float y) {
        this.x = x;
        this.y = y;
    }

    void render() {
        if (sprite != null) {
            image(sprite, x, y);
        }
    }

    abstract void update();
}
