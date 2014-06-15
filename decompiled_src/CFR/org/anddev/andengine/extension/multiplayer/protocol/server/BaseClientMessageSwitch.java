/*
 * Decompiled with CFR 0_79.
 */
package org.anddev.andengine.extension.multiplayer.protocol.server;

import java.io.IOException;
import org.anddev.andengine.extension.multiplayer.protocol.adt.message.client.BaseClientMessage;
import org.anddev.andengine.extension.multiplayer.protocol.adt.message.client.connection.ConnectionCloseClientMessage;
import org.anddev.andengine.extension.multiplayer.protocol.adt.message.client.connection.ConnectionEstablishClientMessage;
import org.anddev.andengine.extension.multiplayer.protocol.adt.message.client.connection.ConnectionPingClientMessage;
import org.anddev.andengine.extension.multiplayer.protocol.adt.message.client.connection.ConnectionPongClientMessage;
import org.anddev.andengine.extension.multiplayer.protocol.adt.message.server.BaseServerMessage;
import org.anddev.andengine.extension.multiplayer.protocol.adt.message.server.connection.ConnectionAcceptedServerMessage;
import org.anddev.andengine.extension.multiplayer.protocol.adt.message.server.connection.ConnectionPongServerMessage;
import org.anddev.andengine.extension.multiplayer.protocol.adt.message.server.connection.ConnectionRefusedServerMessage;
import org.anddev.andengine.extension.multiplayer.protocol.server.ClientConnector;
import org.anddev.andengine.extension.multiplayer.protocol.server.IClientMessageSwitch;
import org.anddev.andengine.extension.multiplayer.protocol.shared.BaseConnectionListener;
import org.anddev.andengine.extension.multiplayer.protocol.util.constants.ClientMessageFlags;

public abstract class BaseClientMessageSwitch
implements ClientMessageFlags,
IClientMessageSwitch {
    @Override
    public void doSwitch(ClientConnector clientConnector, BaseClientMessage baseClientMessage) throws IOException {
        switch (baseClientMessage.getFlag()) {
            default: {
                return;
            }
            case -32768: {
                this.onHandleConnectionEstablishClientMessage(clientConnector, (ConnectionEstablishClientMessage)baseClientMessage);
                return;
            }
            case -32767: {
                this.onHandleConnectionCloseClientMessage(clientConnector, (ConnectionCloseClientMessage)baseClientMessage);
                return;
            }
            case -32766: {
                this.onHandleConnectionPingClientMessage(clientConnector, (ConnectionPingClientMessage)baseClientMessage);
                return;
            }
            case -32765: 
        }
        this.onHandleConnectionPongClientMessage(clientConnector, (ConnectionPongClientMessage)baseClientMessage);
    }

    protected void onHandleConnectionCloseClientMessage(ClientConnector clientConnector, ConnectionCloseClientMessage connectionCloseClientMessage) throws IOException {
        if (!clientConnector.hasConnectionListener()) return;
        clientConnector.getConnectionListener().onDisconnect(clientConnector);
    }

    protected void onHandleConnectionEstablishClientMessage(ClientConnector clientConnector, ConnectionEstablishClientMessage connectionEstablishClientMessage) throws IOException {
        if (connectionEstablishClientMessage.getProtocolVersion() == 1) {
            clientConnector.sendServerMessage(new ConnectionAcceptedServerMessage());
            return;
        }
        clientConnector.sendServerMessage(new ConnectionRefusedServerMessage());
    }

    protected void onHandleConnectionPingClientMessage(ClientConnector clientConnector, ConnectionPingClientMessage connectionPingClientMessage) throws IOException {
        clientConnector.sendServerMessage(new ConnectionPongServerMessage(connectionPingClientMessage));
    }

    protected void onHandleConnectionPongClientMessage(ClientConnector clientConnector2, ConnectionPongClientMessage clientConnector2) {
    }
}

