/*
 * Decompiled with CFR 0_79.
 */
package org.anddev.andengine.extension.multiplayer.protocol.adt.message.client.connection;

import java.io.DataInputStream;
import java.io.DataOutputStream;
import java.io.IOException;
import org.anddev.andengine.extension.multiplayer.protocol.adt.message.client.BaseClientMessage;

public class ConnectionEstablishClientMessage
extends BaseClientMessage {
    private final int mProtocolVersion;

    public ConnectionEstablishClientMessage() {
        this(1);
    }

    public ConnectionEstablishClientMessage(int n) {
        this.mProtocolVersion = n;
    }

    public ConnectionEstablishClientMessage(DataInputStream dataInputStream) throws IOException {
        this.mProtocolVersion = dataInputStream.readInt();
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
        ConnectionEstablishClientMessage connectionEstablishClientMessage = (ConnectionEstablishClientMessage)object;
        if (this.getFlag() != connectionEstablishClientMessage.getFlag()) return false;
        if (this.getProtocolVersion() == connectionEstablishClientMessage.getProtocolVersion()) return true;
        return false;
    }

    @Override
    public short getFlag() {
        return -32768;
    }

    public int getProtocolVersion() {
        return this.mProtocolVersion;
    }

    @Override
    protected void onAppendTransmissionDataForToString(StringBuilder stringBuilder) {
        stringBuilder.append(", getProtocolVersion()=").append(this.mProtocolVersion);
    }

    @Override
    public void onWriteTransmissionData(DataOutputStream dataOutputStream) throws IOException {
        dataOutputStream.writeInt(this.mProtocolVersion);
    }
}

