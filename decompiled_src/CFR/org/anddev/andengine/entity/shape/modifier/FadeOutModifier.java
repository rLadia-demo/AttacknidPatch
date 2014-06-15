/*
 * Decompiled with CFR 0_79.
 */
package org.anddev.andengine.entity.shape.modifier;

import org.anddev.andengine.entity.shape.modifier.AlphaModifier;
import org.anddev.andengine.entity.shape.modifier.IShapeModifier;
import org.anddev.andengine.util.modifier.IModifier;
import org.anddev.andengine.util.modifier.ease.IEaseFunction;

public class FadeOutModifier
extends AlphaModifier {
    public FadeOutModifier(float f) {
        super(f, 1.0f, 0.0f, IEaseFunction.DEFAULT);
    }

    public FadeOutModifier(float f, IShapeModifier.IShapeModifierListener iShapeModifierListener) {
        super(f, 1.0f, 0.0f, iShapeModifierListener, IEaseFunction.DEFAULT);
    }

    public FadeOutModifier(float f, IShapeModifier.IShapeModifierListener iShapeModifierListener, IEaseFunction iEaseFunction) {
        super(f, 1.0f, 0.0f, iShapeModifierListener, iEaseFunction);
    }

    public FadeOutModifier(float f, IEaseFunction iEaseFunction) {
        super(f, 1.0f, 0.0f, iEaseFunction);
    }

    protected FadeOutModifier(FadeOutModifier fadeOutModifier) {
        super(fadeOutModifier);
    }

    @Override
    public FadeOutModifier clone() {
        return new FadeOutModifier(this);
    }
}

