package org.anddev.andengine.entity.scene.background.modifier;

import org.anddev.andengine.entity.scene.background.*;
import org.anddev.andengine.util.modifier.ease.*;
import org.anddev.andengine.util.modifier.*;

public class ColorModifier extends BaseTripleValueSpanModifier<IBackground> implements IBackgroundModifier
{
    public ColorModifier(final float n, final float n2, final float n3, final float n4, final float n5, final float n6, final float n7) {
        this(n, n2, n3, n4, n5, n6, n7, null, IEaseFunction.DEFAULT);
    }
    
    public ColorModifier(final float n, final float n2, final float n3, final float n4, final float n5, final float n6, final float n7, final IBackgroundModifierListener backgroundModifierListener) {
        super(n, n2, n3, n4, n5, n6, n7, backgroundModifierListener, IEaseFunction.DEFAULT);
    }
    
    public ColorModifier(final float n, final float n2, final float n3, final float n4, final float n5, final float n6, final float n7, final IBackgroundModifierListener backgroundModifierListener, final IEaseFunction easeFunction) {
        super(n, n2, n3, n4, n5, n6, n7, backgroundModifierListener, easeFunction);
    }
    
    public ColorModifier(final float n, final float n2, final float n3, final float n4, final float n5, final float n6, final float n7, final IEaseFunction easeFunction) {
        this(n, n2, n3, n4, n5, n6, n7, null, easeFunction);
    }
    
    protected ColorModifier(final ColorModifier colorModifier) {
        super(colorModifier);
    }
    
    @Override
    public ColorModifier clone() {
        return new ColorModifier(this);
    }
    
    @Override
    protected void onSetInitialValues(final IBackground background, final float n, final float n2, final float n3) {
        background.setColor(n, n2, n3);
    }
    
    @Override
    protected void onSetValues(final IBackground background, final float n, final float n2, final float n3, final float n4) {
        background.setColor(n2, n3, n4);
    }
}
