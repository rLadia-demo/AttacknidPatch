package org.anddev.andengine.entity.scene.background.modifier;

import org.anddev.andengine.entity.scene.background.*;
import org.anddev.andengine.util.modifier.*;

public class LoopBackgroundModifier extends LoopModifier<IBackground> implements IBackgroundModifier
{
    public LoopBackgroundModifier(final int n, final IBackgroundModifier backgroundModifier) {
        super(n, backgroundModifier);
    }
    
    public LoopBackgroundModifier(final IBackgroundModifierListener backgroundModifierListener, final int n, final IBackgroundModifier backgroundModifier) {
        super(backgroundModifierListener, n, backgroundModifier);
    }
    
    public LoopBackgroundModifier(final IBackgroundModifierListener backgroundModifierListener, final int n, final ILoopBackgroundModifierListener loopBackgroundModifierListener, final IBackgroundModifier backgroundModifier) {
        super(backgroundModifierListener, n, (ILoopModifierListener)loopBackgroundModifierListener, backgroundModifier);
    }
    
    public LoopBackgroundModifier(final IBackgroundModifier backgroundModifier) {
        super(backgroundModifier);
    }
    
    protected LoopBackgroundModifier(final LoopBackgroundModifier loopBackgroundModifier) {
        super(loopBackgroundModifier);
    }
    
    @Override
    public LoopBackgroundModifier clone() {
        return new LoopBackgroundModifier(this);
    }
    
    public interface ILoopBackgroundModifierListener extends ILoopModifierListener<IBackground>
    {
    }
}
