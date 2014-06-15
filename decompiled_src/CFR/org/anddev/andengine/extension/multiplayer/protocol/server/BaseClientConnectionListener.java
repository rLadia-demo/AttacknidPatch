/*
 * Decompiled with CFR 0_79.
 */
package org.anddev.andengine.extension.multiplayer.protocol.server;

import java.net.Socket;
import java.net.SocketAddress;
import org.anddev.andengine.extension.multiplayer.protocol.adt.message.client.BaseClientMessage;
import org.anddev.andengine.extension.multiplayer.protocol.shared.BaseConnectionListener;
import org.anddev.andengine.extension.multiplayer.protocol.shared.BaseConnector;
import org.anddev.andengine.util.Debug;

public abstract class BaseClientConnectionListener
extends BaseConnectionListener<BaseClientMessage, BaseConnector<BaseClientMessage>> {

    public static class DefaultClientConnectionListener
    extends BaseClientConnectionListener {
        @Override
        protected void onConnectInner(BaseConnector<BaseClientMessage> baseConnector) {
            Debug.d("Accepted Client-Connection from: '" + baseConnector.getSocket().getRemoteSocketAddress() + "'");
        }

        @Override
        protected void onDisconnectInner(BaseConnector<BaseClientMessage> baseConnector) {
            Debug.d("Closed Client-Connection from: '" + baseConnector.getSocket().getRemoteSocketAddress() + "'");
        }
    }

}

