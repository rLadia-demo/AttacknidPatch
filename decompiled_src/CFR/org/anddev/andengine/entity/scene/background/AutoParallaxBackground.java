/*
 * Decompiled with CFR 0_79.
 */
package org.anddev.andengine.entity.scene.background;

import org.anddev.andengine.entity.scene.background.ParallaxBackground;

public class AutoParallaxBackground
extends ParallaxBackground {
    private final float mParallaxChangePerSecond;

    public AutoParallaxBackground(float f, float f2, float f3, float f4) {
        super(f, f2, f3);
        this.mParallaxChangePerSecond = f4;
    }

    @Override
    public void onUpdate(float f) {
        super.onUpdate(f);
        this.mParallaxValue+=f * this.mParallaxChangePerSecond;
    }
}

