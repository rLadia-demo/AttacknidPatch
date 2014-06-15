package org.anddev.andengine.extension.multiplayer.protocol.client;

import org.anddev.andengine.extension.multiplayer.protocol.adt.message.server.*;
import org.anddev.andengine.extension.multiplayer.protocol.shared.*;
import org.anddev.andengine.util.*;

public abstract class BaseServerConnectionListener extends BaseConnectionListener<BaseServerMessage, BaseConnector<BaseServerMessage>>
{
    public static class DefaultServerConnectionListener extends BaseServerConnectionListener
    {
        @Override
        protected void onConnectInner(final BaseConnector<BaseServerMessage> baseConnector) {
            Debug.d("Accepted Server-Connection from: '" + baseConnector.getSocket().getRemoteSocketAddress() + "'");
        }
        
        @Override
        protected void onDisconnectInner(final BaseConnector<BaseServerMessage> baseConnector) {
            Debug.d("Closed Server-Connection from: '" + baseConnector.getSocket().getRemoteSocketAddress() + "'");
        }
    }
}
