package org.anddev.andengine.extension.multiplayer.protocol.client;

import org.anddev.andengine.extension.multiplayer.protocol.util.constants.*;
import org.anddev.andengine.extension.multiplayer.protocol.adt.message.server.*;
import org.anddev.andengine.extension.multiplayer.protocol.adt.message.server.connection.*;
import java.io.*;
import org.anddev.andengine.extension.multiplayer.protocol.adt.message.client.connection.*;
import org.anddev.andengine.extension.multiplayer.protocol.adt.message.client.*;

public abstract class BaseServerMessageSwitch implements ServerMessageFlags, IServerMessageSwitch
{
    @Override
    public void doSwitch(final ServerConnector serverConnector, final BaseServerMessage baseServerMessage) throws IOException {
        switch (baseServerMessage.getFlag()) {
            default: {}
            case Short.MIN_VALUE: {
                this.onHandleConnectionAcceptedServerMessage(serverConnector, (ConnectionAcceptedServerMessage)baseServerMessage);
            }
            case -32767: {
                this.onHandleConnectionRefusedServerMessage(serverConnector, (ConnectionRefusedServerMessage)baseServerMessage);
            }
            case -32766: {
                this.onHandleConnectionCloseServerMessage(serverConnector, (ConnectionCloseServerMessage)baseServerMessage);
            }
            case -32765: {
                this.onHandleConnectionPingServerMessage(serverConnector, (ConnectionPingServerMessage)baseServerMessage);
            }
            case -32764: {
                this.onHandleConnectionPongServerMessage(serverConnector, (ConnectionPongServerMessage)baseServerMessage);
            }
        }
    }
    
    protected abstract void onHandleConnectionAcceptedServerMessage(final ServerConnector p0, final ConnectionAcceptedServerMessage p1);
    
    protected void onHandleConnectionCloseServerMessage(final ServerConnector serverConnector, final ConnectionCloseServerMessage connectionCloseServerMessage) {
        if (serverConnector.hasConnectionListener()) {
            serverConnector.getConnectionListener().onDisconnect(serverConnector);
        }
    }
    
    protected void onHandleConnectionPingServerMessage(final ServerConnector serverConnector, final ConnectionPingServerMessage connectionPingServerMessage) throws IOException {
        serverConnector.sendClientMessage(new ConnectionPongClientMessage(connectionPingServerMessage));
    }
    
    protected void onHandleConnectionPongServerMessage(final ServerConnector serverConnector, final ConnectionPongServerMessage connectionPongServerMessage) {
    }
    
    protected abstract void onHandleConnectionRefusedServerMessage(final ServerConnector p0, final ConnectionRefusedServerMessage p1);
}
