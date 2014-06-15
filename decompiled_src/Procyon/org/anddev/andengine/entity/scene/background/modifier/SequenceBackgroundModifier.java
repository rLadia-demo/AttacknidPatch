package org.anddev.andengine.entity.scene.background.modifier;

import org.anddev.andengine.entity.scene.background.*;
import org.anddev.andengine.util.modifier.*;

public class SequenceBackgroundModifier extends SequenceModifier<IBackground> implements IBackgroundModifier
{
    public SequenceBackgroundModifier(final IBackgroundModifierListener backgroundModifierListener, final ISubSequenceBackgroundModifierListener subSequenceBackgroundModifierListener, final IBackgroundModifier... array) throws IllegalArgumentException {
        super(backgroundModifierListener, (ISubSequenceModifierListener)subSequenceBackgroundModifierListener, (IModifier[])array);
    }
    
    public SequenceBackgroundModifier(final IBackgroundModifierListener backgroundModifierListener, final IBackgroundModifier... array) throws IllegalArgumentException {
        super(backgroundModifierListener, (IModifier[])array);
    }
    
    protected SequenceBackgroundModifier(final SequenceBackgroundModifier sequenceBackgroundModifier) {
        super(sequenceBackgroundModifier);
    }
    
    public SequenceBackgroundModifier(final IBackgroundModifier... array) throws IllegalArgumentException {
        super((IModifier[])array);
    }
    
    @Override
    public SequenceBackgroundModifier clone() {
        return new SequenceBackgroundModifier(this);
    }
    
    public interface ISubSequenceBackgroundModifierListener extends ISubSequenceModifierListener<IBackground>
    {
    }
}
