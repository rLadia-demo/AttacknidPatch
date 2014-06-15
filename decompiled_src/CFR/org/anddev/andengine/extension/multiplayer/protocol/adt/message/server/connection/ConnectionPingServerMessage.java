/*
 * Decompiled with CFR 0_79.
 */
package org.anddev.andengine.extension.multiplayer.protocol.adt.message.server.connection;

import java.io.DataInputStream;
import java.io.DataOutputStream;
import java.io.IOException;
import org.anddev.andengine.extension.multiplayer.protocol.adt.message.server.BaseServerMessage;

public class ConnectionPingServerMessage
extends BaseServerMessage {
    private final long mTimestamp;

    public ConnectionPingServerMessage() {
        this(System.currentTimeMillis());
    }

    public ConnectionPingServerMessage(long l) {
        this.mTimestamp = l;
    }

    public ConnectionPingServerMessage(DataInputStream dataInputStream) throws IOException {
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
        ConnectionPingServerMessage connectionPingServerMessage = (ConnectionPingServerMessage)object;
        if (this.getFlag() != connectionPingServerMessage.getFlag()) return false;
        if (this.getTimestamp() == connectionPingServerMessage.getTimestamp()) return true;
        return false;
    }

    @Override
    public short getFlag() {
        return -32764;
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

