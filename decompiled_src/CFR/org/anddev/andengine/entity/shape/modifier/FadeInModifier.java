/*
 * Decompiled with CFR 0_79.
 */
package org.anddev.andengine.entity.shape.modifier;

import org.anddev.andengine.entity.shape.modifier.AlphaModifier;
import org.anddev.andengine.entity.shape.modifier.IShapeModifier;
import org.anddev.andengine.util.modifier.IModifier;
import org.anddev.andengine.util.modifier.ease.IEaseFunction;

public class FadeInModifier
extends AlphaModifier {
    public FadeInModifier(float f) {
        super(f, 0.0f, 1.0f, IEaseFunction.DEFAULT);
    }

    public FadeInModifier(float f, IShapeModifier.IShapeModifierListener iShapeModifierListener) {
        super(f, 0.0f, 1.0f, iShapeModifierListener, IEaseFunction.DEFAULT);
    }

    public FadeInModifier(float f, IShapeModifier.IShapeModifierListener iShapeModifierListener, IEaseFunction iEaseFunction) {
        super(f, 0.0f, 1.0f, iShapeModifierListener, iEaseFunction);
    }

    public FadeInModifier(float f, IEaseFunction iEaseFunction) {
        super(f, 0.0f, 1.0f, iEaseFunction);
    }

    protected FadeInModifier(FadeInModifier fadeInModifier) {
        super(fadeInModifier);
    }

    @Override
    public FadeInModifier clone() {
        return new FadeInModifier(this);
    }
}

