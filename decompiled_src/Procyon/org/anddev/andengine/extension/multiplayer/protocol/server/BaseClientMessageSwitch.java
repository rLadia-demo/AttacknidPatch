package org.anddev.andengine.extension.multiplayer.protocol.server;

import org.anddev.andengine.extension.multiplayer.protocol.util.constants.*;
import org.anddev.andengine.extension.multiplayer.protocol.adt.message.client.*;
import org.anddev.andengine.extension.multiplayer.protocol.adt.message.client.connection.*;
import java.io.*;
import org.anddev.andengine.extension.multiplayer.protocol.adt.message.server.*;
import org.anddev.andengine.extension.multiplayer.protocol.adt.message.server.connection.*;

public abstract class BaseClientMessageSwitch implements ClientMessageFlags, IClientMessageSwitch
{
    @Override
    public void doSwitch(final ClientConnector clientConnector, final BaseClientMessage baseClientMessage) throws IOException {
        switch (baseClientMessage.getFlag()) {
            default: {}
            case Short.MIN_VALUE: {
                this.onHandleConnectionEstablishClientMessage(clientConnector, (ConnectionEstablishClientMessage)baseClientMessage);
            }
            case -32767: {
                this.onHandleConnectionCloseClientMessage(clientConnector, (ConnectionCloseClientMessage)baseClientMessage);
            }
            case -32766: {
                this.onHandleConnectionPingClientMessage(clientConnector, (ConnectionPingClientMessage)baseClientMessage);
            }
            case -32765: {
                this.onHandleConnectionPongClientMessage(clientConnector, (ConnectionPongClientMessage)baseClientMessage);
            }
        }
    }
    
    protected void onHandleConnectionCloseClientMessage(final ClientConnector clientConnector, final ConnectionCloseClientMessage connectionCloseClientMessage) throws IOException {
        if (clientConnector.hasConnectionListener()) {
            clientConnector.getConnectionListener().onDisconnect(clientConnector);
        }
    }
    
    protected void onHandleConnectionEstablishClientMessage(final ClientConnector clientConnector, final ConnectionEstablishClientMessage connectionEstablishClientMessage) throws IOException {
        if (connectionEstablishClientMessage.getProtocolVersion() == 1) {
            clientConnector.sendServerMessage(new ConnectionAcceptedServerMessage());
            return;
        }
        clientConnector.sendServerMessage(new ConnectionRefusedServerMessage());
    }
    
    protected void onHandleConnectionPingClientMessage(final ClientConnector clientConnector, final ConnectionPingClientMessage connectionPingClientMessage) throws IOException {
        clientConnector.sendServerMessage(new ConnectionPongServerMessage(connectionPingClientMessage));
    }
    
    protected void onHandleConnectionPongClientMessage(final ClientConnector clientConnector, final ConnectionPongClientMessage connectionPongClientMessage) {
    }
}
