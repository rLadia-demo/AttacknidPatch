package org.anddev.andengine.extension.multiplayer.protocol.server;

import org.anddev.andengine.extension.multiplayer.protocol.adt.message.client.*;
import java.net.*;
import org.anddev.andengine.extension.multiplayer.protocol.shared.*;
import org.anddev.andengine.extension.multiplayer.protocol.adt.message.*;
import org.anddev.andengine.extension.multiplayer.protocol.adt.message.server.connection.*;
import org.anddev.andengine.extension.multiplayer.protocol.adt.message.server.*;
import org.anddev.andengine.util.*;
import java.io.*;

public class ClientConnector extends BaseConnector<BaseClientMessage>
{
    public ClientConnector(final Socket socket, final BaseClientConnectionListener baseClientConnectionListener, final ClientMessageExtractor clientMessageExtractor, final IClientMessageSwitch clientMessageSwitch) throws IOException {
        super(socket, baseClientConnectionListener, clientMessageExtractor, clientMessageSwitch);
    }
    
    @Override
    public IClientMessageSwitch getMessageSwitch() {
        return (IClientMessageSwitch)super.getMessageSwitch();
    }
    
    @Override
    protected void handleMessage(final BaseClientMessage baseClientMessage) throws IOException {
        this.getMessageSwitch().doSwitch(this, baseClientMessage);
    }
    
    @Override
    protected void onSendConnectionClose() {
        try {
            this.sendServerMessage(new ConnectionCloseServerMessage());
        }
        catch (Throwable t) {
            Debug.e(t);
        }
    }
    
    public void sendServerMessage(final BaseServerMessage baseServerMessage) throws IOException {
        final DataOutputStream dataOutputStream = this.getDataOutputStream();
        baseServerMessage.transmit(dataOutputStream);
        dataOutputStream.flush();
    }
}
