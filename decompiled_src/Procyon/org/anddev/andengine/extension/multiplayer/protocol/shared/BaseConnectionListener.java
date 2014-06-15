package org.anddev.andengine.extension.multiplayer.protocol.shared;

import org.anddev.andengine.extension.multiplayer.protocol.adt.message.*;

public abstract class BaseConnectionListener<M extends IMessage, C extends BaseConnector<M>>
{
    private boolean mDisconnectCalled;
    
    public BaseConnectionListener() {
        super();
        this.mDisconnectCalled = false;
    }
    
    public void onConnect(final C c) {
        this.onConnectInner(c);
    }
    
    protected abstract void onConnectInner(final C p0);
    
    public void onDisconnect(final C c) {
        if (this.mDisconnectCalled) {
            return;
        }
        this.mDisconnectCalled = true;
        this.onDisconnectInner(c);
    }
    
    protected abstract void onDisconnectInner(final C p0);
}
