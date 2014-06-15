package org.anddev.andengine.entity.scene.background.modifier;

import org.anddev.andengine.entity.scene.background.*;
import org.anddev.andengine.util.modifier.*;

public class ParallelBackgroundModifier extends ParallelModifier<IBackground> implements IBackgroundModifier
{
    public ParallelBackgroundModifier(final IBackgroundModifierListener backgroundModifierListener, final IBackgroundModifier... array) throws IllegalArgumentException {
        super(backgroundModifierListener, (IModifier[])array);
    }
    
    protected ParallelBackgroundModifier(final ParallelBackgroundModifier parallelBackgroundModifier) {
        super(parallelBackgroundModifier);
    }
    
    public ParallelBackgroundModifier(final IBackgroundModifier... array) throws IllegalArgumentException {
        super((IModifier[])array);
    }
    
    @Override
    public ParallelBackgroundModifier clone() {
        return new ParallelBackgroundModifier(this);
    }
}
