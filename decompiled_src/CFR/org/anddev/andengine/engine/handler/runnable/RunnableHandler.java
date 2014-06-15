/*
 * Decompiled with CFR 0_79.
 */
package org.anddev.andengine.engine.handler.runnable;

import java.util.ArrayList;
import org.anddev.andengine.engine.handler.IUpdateHandler;

public class RunnableHandler
implements IUpdateHandler {
    private final ArrayList<Runnable> mRunnables = new ArrayList<Runnable>();

    /*
     * Enabled aggressive block sorting
     * Enabled unnecessary exception pruning
     */
    @Override
    public void onUpdate(float f) {
        synchronized (this) {
            ArrayList<Runnable> arrayList = this.mRunnables;
            for (int i = -1 + arrayList.size(); i >= 0; --i) {
                arrayList.get(i).run();
            }
            arrayList.clear();
            return;
        }
    }

    public void postRunnable(Runnable runnable) {
        synchronized (this) {
            this.mRunnables.add(runnable);
            return;
        }
    }

    @Override
    public void reset() {
        this.mRunnables.clear();
    }
}

