/*
 * Decompiled with CFR 0_79.
 */
package org.anddev.andengine.extension.multiplayer.protocol.shared;

import org.anddev.andengine.extension.multiplayer.protocol.adt.message.IMessage;
import org.anddev.andengine.extension.multiplayer.protocol.shared.BaseConnector;

public abstract class BaseConnectionListener<M extends IMessage, C extends BaseConnector<M>> {
    private boolean mDisconnectCalled = false;

    public void onConnect(C C) {
        this.onConnectInner(C);
    }

    protected abstract void onConnectInner(C var1);

    public void onDisconnect(C C) {
        if (this.mDisconnectCalled) {
            return;
        }
        this.mDisconnectCalled = true;
        this.onDisconnectInner(C);
    }

    protected abstract void onDisconnectInner(C var1);
}

