package org.anddev.andengine.extension.multiplayer.protocol.client;

import org.anddev.andengine.extension.multiplayer.protocol.adt.message.server.*;
import java.net.*;
import org.anddev.andengine.extension.multiplayer.protocol.shared.*;
import org.anddev.andengine.extension.multiplayer.protocol.adt.message.client.*;
import org.anddev.andengine.extension.multiplayer.protocol.adt.message.*;
import org.anddev.andengine.extension.multiplayer.protocol.adt.message.client.connection.*;
import org.anddev.andengine.util.*;
import java.io.*;

public class ServerConnector extends BaseConnector<BaseServerMessage>
{
    public ServerConnector(final Socket socket, final BaseServerConnectionListener baseServerConnectionListener, final ServerMessageExtractor serverMessageExtractor, final IServerMessageSwitch serverMessageSwitch) throws IOException {
        super(socket, baseServerConnectionListener, serverMessageExtractor, serverMessageSwitch);
        this.sendClientMessage(new ConnectionEstablishClientMessage());
    }
    
    @Override
    public IServerMessageSwitch getMessageSwitch() {
        return (IServerMessageSwitch)super.getMessageSwitch();
    }
    
    @Override
    protected void handleMessage(final BaseServerMessage baseServerMessage) throws IOException {
        this.getMessageSwitch().doSwitch(this, baseServerMessage);
    }
    
    @Override
    protected void onSendConnectionClose() {
        try {
            this.sendClientMessage(new ConnectionCloseClientMessage());
        }
        catch (Throwable t) {
            Debug.e(t);
        }
    }
    
    public void sendClientMessage(final BaseClientMessage baseClientMessage) throws IOException {
        final DataOutputStream dataOutputStream = this.getDataOutputStream();
        baseClientMessage.transmit(dataOutputStream);
        dataOutputStream.flush();
    }
}
