package org.anddev.andengine.engine.handler.runnable;

import org.anddev.andengine.engine.handler.*;
import java.util.*;

public class RunnableHandler implements IUpdateHandler
{
    private final ArrayList<Runnable> mRunnables;
    
    public RunnableHandler() {
        super();
        this.mRunnables = new ArrayList<Runnable>();
    }
    
    @Override
    public void onUpdate(final float n) {
        synchronized (this) {
            final ArrayList<Runnable> mRunnables = this.mRunnables;
            for (int i = -1 + mRunnables.size(); i >= 0; --i) {
                mRunnables.get(i).run();
            }
            mRunnables.clear();
        }
    }
    
    public void postRunnable(final Runnable runnable) {
        synchronized (this) {
            this.mRunnables.add(runnable);
        }
    }
    
    @Override
    public void reset() {
        this.mRunnables.clear();
    }
}
