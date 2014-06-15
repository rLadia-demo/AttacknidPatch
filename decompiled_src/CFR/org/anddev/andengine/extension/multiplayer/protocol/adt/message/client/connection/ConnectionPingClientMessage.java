/*
 * Decompiled with CFR 0_79.
 */
package org.anddev.andengine.extension.multiplayer.protocol.adt.message.client.connection;

import java.io.DataInputStream;
import java.io.DataOutputStream;
import java.io.IOException;
import org.anddev.andengine.extension.multiplayer.protocol.adt.message.client.BaseClientMessage;

public class ConnectionPingClientMessage
extends BaseClientMessage {
    private final long mTimestamp;

    public ConnectionPingClientMessage() {
        this(System.currentTimeMillis());
    }

    public ConnectionPingClientMessage(long l) {
        this.mTimestamp = l;
    }

    public ConnectionPingClientMessage(DataInputStream dataInputStream) throws IOException {
        this.mTimestamp = dataInputStream.readLong();
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
        ConnectionPingClientMessage connectionPingClientMessage = (ConnectionPingClientMessage)object;
        if (this.getFlag() != connectionPingClientMessage.getFlag()) return false;
        if (this.getTimestamp() == connectionPingClientMessage.getTimestamp()) return true;
        return false;
    }

    @Override
    public short getFlag() {
        return -32766;
    }

    public long getTimestamp() {
        return this.mTimestamp;
    }

    @Override
    protected void onAppendTransmissionDataForToString(StringBuilder stringBuilder) {
        stringBuilder.append(", getTimestamp()=").append(this.mTimestamp);
    }

    @Override
    public void onWriteTransmissionData(DataOutputStream dataOutputStream) throws IOException {
        dataOutputStream.writeLong(this.mTimestamp);
    }
}

