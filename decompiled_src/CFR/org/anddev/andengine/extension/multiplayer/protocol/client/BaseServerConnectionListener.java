/*
 * Decompiled with CFR 0_79.
 */
package org.anddev.andengine.extension.multiplayer.protocol.client;

import java.net.Socket;
import java.net.SocketAddress;
import org.anddev.andengine.extension.multiplayer.protocol.adt.message.server.BaseServerMessage;
import org.anddev.andengine.extension.multiplayer.protocol.shared.BaseConnectionListener;
import org.anddev.andengine.extension.multiplayer.protocol.shared.BaseConnector;
import org.anddev.andengine.util.Debug;

public abstract class BaseServerConnectionListener
extends BaseConnectionListener<BaseServerMessage, BaseConnector<BaseServerMessage>> {

    public static class DefaultServerConnectionListener
    extends BaseServerConnectionListener {
        @Override
        protected void onConnectInner(BaseConnector<BaseServerMessage> baseConnector) {
            Debug.d("Accepted Server-Connection from: '" + baseConnector.getSocket().getRemoteSocketAddress() + "'");
        }

        @Override
        protected void onDisconnectInner(BaseConnector<BaseServerMessage> baseConnector) {
            Debug.d("Closed Server-Connection from: '" + baseConnector.getSocket().getRemoteSocketAddress() + "'");
        }
    }

}

