/*
 * Decompiled with CFR 0_79.
 */
package org.anddev.andengine.extension.multiplayer.protocol.adt.message.client.connection;

import java.io.DataInputStream;
import java.io.DataOutputStream;
import java.io.IOException;
import org.anddev.andengine.extension.multiplayer.protocol.adt.message.client.BaseClientMessage;
import org.anddev.andengine.extension.multiplayer.protocol.adt.message.server.connection.ConnectionPingServerMessage;

public class ConnectionPongClientMessage
extends BaseClientMessage {
    private final long mOriginalPingTimestamp;

    public ConnectionPongClientMessage(long l) {
        this.mOriginalPingTimestamp = l;
    }

    public ConnectionPongClientMessage(DataInputStream dataInputStream) throws IOException {
        this.mOriginalPingTimestamp = dataInputStream.readLong();
    }

    public ConnectionPongClientMessage(ConnectionPingServerMessage connectionPingServerMessage) {
        this(connectionPingServerMessage.getTimestamp());
    }

    /*
     * Enabled aggressive block sorting
     */
    @Override
    public boolean equals(Object object) {
        if (this == object) {
            return true;
        }
        if (object == null) {
            return false;
        }
        if (this.getClass() != object.getClass()) {
            return false;
        }
        ConnectionPongClientMessage connectionPongClientMessage = (ConnectionPongClientMessage)object;
        if (this.getFlag() != connectionPongClientMessage.getFlag()) return false;
        if (this.getOriginalPingTimestamp() == connectionPongClientMessage.getOriginalPingTimestamp()) return true;
        return false;
    }

    @Override
    public short getFlag() {
        return -32765;
    }

    public long getOriginalPingTimestamp() {
        return this.mOriginalPingTimestamp;
    }

    @Override
    protected void onAppendTransmissionDataForToString(StringBuilder stringBuilder) {
        stringBuilder.append(", getOriginalPingTimestamp()=").append(this.mOriginalPingTimestamp);
    }

    @Override
    public void onWriteTransmissionData(DataOutputStream dataOutputStream) throws IOException {
        dataOutputStream.writeLong(this.mOriginalPingTimestamp);
    }
}

