package org.anddev.andengine.entity.scene.background;

public class AutoParallaxBackground extends ParallaxBackground
{
    private final float mParallaxChangePerSecond;
    
    public AutoParallaxBackground(final float n, final float n2, final float n3, final float mParallaxChangePerSecond) {
        super(n, n2, n3);
        this.mParallaxChangePerSecond = mParallaxChangePerSecond;
    }
    
    @Override
    public void onUpdate(final float n) {
        super.onUpdate(n);
        this.mParallaxValue += n * this.mParallaxChangePerSecond;
    }
}
