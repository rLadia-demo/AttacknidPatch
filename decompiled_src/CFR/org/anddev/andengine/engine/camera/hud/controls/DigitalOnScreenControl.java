/*
 * Decompiled with CFR 0_79.
 */
package org.anddev.andengine.engine.camera.hud.controls;

import org.anddev.andengine.engine.camera.Camera;
import org.anddev.andengine.engine.camera.hud.controls.BaseOnScreenControl;
import org.anddev.andengine.opengl.texture.region.TextureRegion;

public class DigitalOnScreenControl
extends BaseOnScreenControl {
    public DigitalOnScreenControl(int n, int n2, Camera camera, TextureRegion textureRegion, TextureRegion textureRegion2, float f, BaseOnScreenControl.IOnScreenControlListener iOnScreenControlListener) {
        super(n, n2, camera, textureRegion, textureRegion2, f, iOnScreenControlListener);
    }

    /*
     * Enabled aggressive block sorting
     */
    @Override
    protected void onUpdateControlKnob(float f, float f2) {
        if (f == 0.0f && f2 == 0.0f) {
            super.onUpdateControlKnob(0.0f, 0.0f);
        }
        if (Math.abs(f) > Math.abs(f2)) {
            if (f > 0.0f) {
                super.onUpdateControlKnob(0.5f, 0.0f);
                return;
            }
            if (f < 0.0f) {
                super.onUpdateControlKnob(-0.5f, 0.0f);
                return;
            }
            if (f != 0.0f) return;
            super.onUpdateControlKnob(0.0f, 0.0f);
            return;
        }
        if (f2 > 0.0f) {
            super.onUpdateControlKnob(0.0f, 0.5f);
            return;
        }
        if (f2 < 0.0f) {
            super.onUpdateControlKnob(0.0f, -0.5f);
            return;
        }
        if (f2 != 0.0f) return;
        super.onUpdateControlKnob(0.0f, 0.0f);
    }
}

