package org.anddev.andengine.engine.camera.hud.controls;

import org.anddev.andengine.engine.camera.*;
import org.anddev.andengine.opengl.texture.region.*;

public class DigitalOnScreenControl extends BaseOnScreenControl
{
    public DigitalOnScreenControl(final int n, final int n2, final Camera camera, final TextureRegion textureRegion, final TextureRegion textureRegion2, final float n3, final IOnScreenControlListener onScreenControlListener) {
        super(n, n2, camera, textureRegion, textureRegion2, n3, onScreenControlListener);
    }
    
    @Override
    protected void onUpdateControlKnob(final float n, final float n2) {
        if (n == 0.0f && n2 == 0.0f) {
            super.onUpdateControlKnob(0.0f, 0.0f);
        }
        if (Math.abs(n) > Math.abs(n2)) {
            if (n > 0.0f) {
                super.onUpdateControlKnob(0.5f, 0.0f);
            }
            else {
                if (n < 0.0f) {
                    super.onUpdateControlKnob(-0.5f, 0.0f);
                    return;
                }
                if (n == 0.0f) {
                    super.onUpdateControlKnob(0.0f, 0.0f);
                }
            }
        }
        else {
            if (n2 > 0.0f) {
                super.onUpdateControlKnob(0.0f, 0.5f);
                return;
            }
            if (n2 < 0.0f) {
                super.onUpdateControlKnob(0.0f, -0.5f);
                return;
            }
            if (n2 == 0.0f) {
                super.onUpdateControlKnob(0.0f, 0.0f);
            }
        }
    }
}
