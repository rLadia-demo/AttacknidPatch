/*
 * Decompiled with CFR 0_79.
 */
package org.anddev.andengine.extension.multiplayer.protocol.client;

import java.io.DataOutputStream;
import java.io.IOException;
import java.net.Socket;
import org.anddev.andengine.extension.multiplayer.protocol.adt.message.IMessage;
import org.anddev.andengine.extension.multiplayer.protocol.adt.message.client.BaseClientMessage;
import org.anddev.andengine.extension.multiplayer.protocol.adt.message.client.connection.ConnectionCloseClientMessage;
import org.anddev.andengine.extension.multiplayer.protocol.adt.message.client.connection.ConnectionEstablishClientMessage;
import org.anddev.andengine.extension.multiplayer.protocol.adt.message.server.BaseServerMessage;
import org.anddev.andengine.extension.multiplayer.protocol.client.BaseServerConnectionListener;
import org.anddev.andengine.extension.multiplayer.protocol.client.IServerMessageSwitch;
import org.anddev.andengine.extension.multiplayer.protocol.client.ServerMessageExtractor;
import org.anddev.andengine.extension.multiplayer.protocol.shared.BaseConnectionListener;
import org.anddev.andengine.extension.multiplayer.protocol.shared.BaseConnector;
import org.anddev.andengine.extension.multiplayer.protocol.shared.BaseMessageExtractor;
import org.anddev.andengine.extension.multiplayer.protocol.shared.IMessageSwitch;
import org.anddev.andengine.util.Debug;

public class ServerConnector
extends BaseConnector<BaseServerMessage> {
    public ServerConnector(Socket socket, BaseServerConnectionListener baseServerConnectionListener, ServerMessageExtractor serverMessageExtractor, IServerMessageSwitch iServerMessageSwitch) throws IOException {
        super(socket, baseServerConnectionListener, serverMessageExtractor, iServerMessageSwitch);
        this.sendClientMessage(new ConnectionEstablishClientMessage());
    }

    @Override
    public IServerMessageSwitch getMessageSwitch() {
        return (IServerMessageSwitch)super.getMessageSwitch();
    }

    @Override
    protected void handleMessage(BaseServerMessage baseServerMessage) throws IOException {
        this.getMessageSwitch().doSwitch(this, baseServerMessage);
    }

    @Override
    protected void onSendConnectionClose() {
        try {
            this.sendClientMessage(new ConnectionCloseClientMessage());
            return;
        }
        catch (Throwable var1_1) {
            Debug.e(var1_1);
            return;
        }
    }

    public void sendClientMessage(BaseClientMessage baseClientMessage) throws IOException {
        DataOutputStream dataOutputStream = this.getDataOutputStream();
        baseClientMessage.transmit(dataOutputStream);
        dataOutputStream.flush();
    }
}

