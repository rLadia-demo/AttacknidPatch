/*
 * Decompiled with CFR 0_79.
 */
package org.anddev.andengine.extension.multiplayer.protocol.server;

import java.io.DataOutputStream;
import java.io.IOException;
import java.net.Socket;
import org.anddev.andengine.extension.multiplayer.protocol.adt.message.IMessage;
import org.anddev.andengine.extension.multiplayer.protocol.adt.message.client.BaseClientMessage;
import org.anddev.andengine.extension.multiplayer.protocol.adt.message.server.BaseServerMessage;
import org.anddev.andengine.extension.multiplayer.protocol.adt.message.server.connection.ConnectionCloseServerMessage;
import org.anddev.andengine.extension.multiplayer.protocol.server.BaseClientConnectionListener;
import org.anddev.andengine.extension.multiplayer.protocol.server.ClientMessageExtractor;
import org.anddev.andengine.extension.multiplayer.protocol.server.IClientMessageSwitch;
import org.anddev.andengine.extension.multiplayer.protocol.shared.BaseConnectionListener;
import org.anddev.andengine.extension.multiplayer.protocol.shared.BaseConnector;
import org.anddev.andengine.extension.multiplayer.protocol.shared.BaseMessageExtractor;
import org.anddev.andengine.extension.multiplayer.protocol.shared.IMessageSwitch;
import org.anddev.andengine.util.Debug;

public class ClientConnector
extends BaseConnector<BaseClientMessage> {
    public ClientConnector(Socket socket, BaseClientConnectionListener baseClientConnectionListener, ClientMessageExtractor clientMessageExtractor, IClientMessageSwitch iClientMessageSwitch) throws IOException {
        super(socket, baseClientConnectionListener, clientMessageExtractor, iClientMessageSwitch);
    }

    @Override
    public IClientMessageSwitch getMessageSwitch() {
        return (IClientMessageSwitch)super.getMessageSwitch();
    }

    @Override
    protected void handleMessage(BaseClientMessage baseClientMessage) throws IOException {
        this.getMessageSwitch().doSwitch(this, baseClientMessage);
    }

    @Override
    protected void onSendConnectionClose() {
        try {
            this.sendServerMessage(new ConnectionCloseServerMessage());
            return;
        }
        catch (Throwable var1_1) {
            Debug.e(var1_1);
            return;
        }
    }

    public void sendServerMessage(BaseServerMessage baseServerMessage) throws IOException {
        DataOutputStream dataOutputStream = this.getDataOutputStream();
        baseServerMessage.transmit(dataOutputStream);
        dataOutputStream.flush();
    }
}

