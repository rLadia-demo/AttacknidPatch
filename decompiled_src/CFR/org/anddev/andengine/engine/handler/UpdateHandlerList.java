/*
 * Decompiled with CFR 0_79.
 */
package org.anddev.andengine.engine.handler;

import java.util.ArrayList;
import org.anddev.andengine.engine.handler.IUpdateHandler;

public class UpdateHandlerList
extends ArrayList<IUpdateHandler>
implements IUpdateHandler {
    private static final long serialVersionUID = -8842562717687229277L;

    @Override
    public void onUpdate(float f) {
        int n = -1 + this.size();
        while (n >= 0) {
            ((IUpdateHandler)this.get(n)).onUpdate(f);
            --n;
        }
        return;
    }

    @Override
    public void reset() {
        int n = -1 + this.size();
        while (n >= 0) {
            ((IUpdateHandler)this.get(n)).reset();
            --n;
        }
        return;
    }
}

