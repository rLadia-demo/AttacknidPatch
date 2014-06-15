/*
 * Decompiled with CFR 0_79.
 */
package org.anddev.andengine.extension.multiplayer.protocol.adt.message.server.connection;

import java.io.DataInputStream;
import java.io.DataOutputStream;
import java.io.IOException;
import org.anddev.andengine.extension.multiplayer.protocol.adt.message.client.connection.ConnectionPingClientMessage;
import org.anddev.andengine.extension.multiplayer.protocol.adt.message.server.BaseServerMessage;

public class ConnectionPongServerMessage
extends BaseServerMessage {
    private final long mOriginalPingTimestamp;

    public ConnectionPongServerMessage(long l) {
        this.mOriginalPingTimestamp = l;
    }

    public ConnectionPongServerMessage(DataInputStream dataInputStream) throws IOException {
        this.mOriginalPingTimestamp = dataInputStream.readLong();
    }

    public ConnectionPongServerMessage(ConnectionPingClientMessage connectionPingClientMessage) {
        this(connectionPingClientMessage.getTimestamp());
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
        ConnectionPongServerMessage connectionPongServerMessage = (ConnectionPongServerMessage)object;
        if (this.getFlag() != connectionPongServerMessage.getFlag()) return false;
        if (this.getOriginalPingTimestamp() == connectionPongServerMessage.getOriginalPingTimestamp()) return true;
        return false;
    }

    @Override
    public short getFlag() {
        return -32764;
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

