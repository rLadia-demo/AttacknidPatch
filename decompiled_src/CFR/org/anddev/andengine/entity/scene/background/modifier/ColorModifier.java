/*
 * Decompiled with CFR 0_79.
 */
package org.anddev.andengine.entity.scene.background.modifier;

import org.anddev.andengine.entity.scene.background.IBackground;
import org.anddev.andengine.entity.scene.background.modifier.IBackgroundModifier;
import org.anddev.andengine.util.modifier.BaseTripleValueSpanModifier;
import org.anddev.andengine.util.modifier.IModifier;
import org.anddev.andengine.util.modifier.ease.IEaseFunction;

public class ColorModifier
extends BaseTripleValueSpanModifier<IBackground>
implements IBackgroundModifier {
    public ColorModifier(float f, float f2, float f3, float f4, float f5, float f6, float f7) {
        this(f, f2, f3, f4, f5, f6, f7, null, IEaseFunction.DEFAULT);
    }

    public ColorModifier(float f, float f2, float f3, float f4, float f5, float f6, float f7, IBackgroundModifier.IBackgroundModifierListener iBackgroundModifierListener) {
        super(f, f2, f3, f4, f5, f6, f7, iBackgroundModifierListener, IEaseFunction.DEFAULT);
    }

    public ColorModifier(float f, float f2, float f3, float f4, float f5, float f6, float f7, IBackgroundModifier.IBackgroundModifierListener iBackgroundModifierListener, IEaseFunction iEaseFunction) {
        super(f, f2, f3, f4, f5, f6, f7, iBackgroundModifierListener, iEaseFunction);
    }

    public ColorModifier(float f, float f2, float f3, float f4, float f5, float f6, float f7, IEaseFunction iEaseFunction) {
        this(f, f2, f3, f4, f5, f6, f7, null, iEaseFunction);
    }

    protected ColorModifier(ColorModifier colorModifier) {
        super(colorModifier);
    }

    @Override
    public ColorModifier clone() {
        return new ColorModifier(this);
    }

    @Override
    protected void onSetInitialValues(IBackground iBackground, float f, float f2, float f3) {
        iBackground.setColor(f, f2, f3);
    }

    @Override
    protected void onSetValues(IBackground iBackground, float f, float f2, float f3, float f4) {
        iBackground.setColor(f2, f3, f4);
    }
}

