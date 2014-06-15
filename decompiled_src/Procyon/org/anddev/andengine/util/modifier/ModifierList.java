package org.anddev.andengine.util.modifier;

import java.util.*;
import org.anddev.andengine.engine.handler.*;

public class ModifierList<T> extends ArrayList<IModifier<T>> implements IUpdateHandler
{
    private static final long serialVersionUID = 1610345592534873475L;
    private final T mTarget;
    
    public ModifierList(final T mTarget) {
        super();
        this.mTarget = mTarget;
    }
    
    public T getTarget() {
        return this.mTarget;
    }
    
    @Override
    public void onUpdate(final float n) {
        final int size = this.size();
        if (size > 0) {
            for (int i = size - 1; i >= 0; --i) {
                final IModifier<T> modifier = this.get(i);
                modifier.onUpdate(n, this.mTarget);
                if (modifier.isFinished() && modifier.isRemoveWhenFinished()) {
                    this.remove(i);
                }
            }
        }
    }
    
    @Override
    public void reset() {
        for (int i = -1 + this.size(); i >= 0; --i) {
            this.get(i).reset();
        }
    }
}
