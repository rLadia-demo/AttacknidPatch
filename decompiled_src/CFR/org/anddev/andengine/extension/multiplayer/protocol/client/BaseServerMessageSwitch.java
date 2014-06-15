/*
 * Decompiled with CFR 0_79.
 */
package org.anddev.andengine.extension.multiplayer.protocol.client;

import java.io.IOException;
import org.anddev.andengine.extension.multiplayer.protocol.adt.message.client.BaseClientMessage;
import org.anddev.andengine.extension.multiplayer.protocol.adt.message.client.connection.ConnectionPongClientMessage;
import org.anddev.andengine.extension.multiplayer.protocol.adt.message.server.BaseServerMessage;
import org.anddev.andengine.extension.multiplayer.protocol.adt.message.server.connection.ConnectionAcceptedServerMessage;
import org.anddev.andengine.extension.multiplayer.protocol.adt.message.server.connection.ConnectionCloseServerMessage;
import org.anddev.andengine.extension.multiplayer.protocol.adt.message.server.connection.ConnectionPingServerMessage;
import org.anddev.andengine.extension.multiplayer.protocol.adt.message.server.connection.ConnectionPongServerMessage;
import org.anddev.andengine.extension.multiplayer.protocol.adt.message.server.connection.ConnectionRefusedServerMessage;
import org.anddev.andengine.extension.multiplayer.protocol.client.IServerMessageSwitch;
import org.anddev.andengine.extension.multiplayer.protocol.client.ServerConnector;
import org.anddev.andengine.extension.multiplayer.protocol.shared.BaseConnectionListener;
import org.anddev.andengine.extension.multiplayer.protocol.util.constants.ServerMessageFlags;

public abstract class BaseServerMessageSwitch
implements ServerMessageFlags,
IServerMessageSwitch {
    @Override
    public void doSwitch(ServerConnector serverConnector, BaseServerMessage baseServerMessage) throws IOException {
        switch (baseServerMessage.getFlag()) {
            default: {
                return;
            }
            case -32768: {
                this.onHandleConnectionAcceptedServerMessage(serverConnector, (ConnectionAcceptedServerMessage)baseServerMessage);
                return;
            }
            case -32767: {
                this.onHandleConnectionRefusedServerMessage(serverConnector, (ConnectionRefusedServerMessage)baseServerMessage);
                return;
            }
            case -32766: {
                this.onHandleConnectionCloseServerMessage(serverConnector, (ConnectionCloseServerMessage)baseServerMessage);
                return;
            }
            case -32765: {
                this.onHandleConnectionPingServerMessage(serverConnector, (ConnectionPingServerMessage)baseServerMessage);
                return;
            }
            case -32764: 
        }
        this.onHandleConnectionPongServerMessage(serverConnector, (ConnectionPongServerMessage)baseServerMessage);
    }

    protected abstract void onHandleConnectionAcceptedServerMessage(ServerConnector var1, ConnectionAcceptedServerMessage var2);

    protected void onHandleConnectionCloseServerMessage(ServerConnector serverConnector, ConnectionCloseServerMessage connectionCloseServerMessage) {
        if (!serverConnector.hasConnectionListener()) return;
        serverConnector.getConnectionListener().onDisconnect(serverConnector);
    }

    protected void onHandleConnectionPingServerMessage(ServerConnector serverConnector, ConnectionPingServerMessage connectionPingServerMessage) throws IOException {
        serverConnector.sendClientMessage(new ConnectionPongClientMessage(connectionPingServerMessage));
    }

    protected void onHandleConnectionPongServerMessage(ServerConnector serverConnector2, ConnectionPongServerMessage serverConnector2) {
    }

    protected abstract void onHandleConnectionRefusedServerMessage(ServerConnector var1, ConnectionRefusedServerMessage var2);
}

