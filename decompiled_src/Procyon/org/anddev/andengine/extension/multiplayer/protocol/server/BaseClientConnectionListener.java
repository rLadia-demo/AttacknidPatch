package org.anddev.andengine.extension.multiplayer.protocol.server;

import org.anddev.andengine.extension.multiplayer.protocol.adt.message.client.*;
import org.anddev.andengine.extension.multiplayer.protocol.shared.*;
import org.anddev.andengine.util.*;

public abstract class BaseClientConnectionListener extends BaseConnectionListener<BaseClientMessage, BaseConnector<BaseClientMessage>>
{
    public static class DefaultClientConnectionListener extends BaseClientConnectionListener
    {
        @Override
        protected void onConnectInner(final BaseConnector<BaseClientMessage> baseConnector) {
            Debug.d("Accepted Client-Connection from: '" + baseConnector.getSocket().getRemoteSocketAddress() + "'");
        }
        
        @Override
        protected void onDisconnectInner(final BaseConnector<BaseClientMessage> baseConnector) {
            Debug.d("Closed Client-Connection from: '" + baseConnector.getSocket().getRemoteSocketAddress() + "'");
        }
    }
}
