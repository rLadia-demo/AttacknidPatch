package org.anddev.andengine.extension.multiplayer.protocol.adt.message.server.connection;

import org.anddev.andengine.extension.multiplayer.protocol.adt.message.server.*;
import org.anddev.andengine.extension.multiplayer.protocol.adt.message.client.connection.*;
import java.io.*;

public class ConnectionPongServerMessage extends BaseServerMessage
{
    private final long mOriginalPingTimestamp;
    
    public ConnectionPongServerMessage(final long mOriginalPingTimestamp) {
        super();
        this.mOriginalPingTimestamp = mOriginalPingTimestamp;
    }
    
    public ConnectionPongServerMessage(final DataInputStream dataInputStream) throws IOException {
        super();
        this.mOriginalPingTimestamp = dataInputStream.readLong();
    }
    
    public ConnectionPongServerMessage(final ConnectionPingClientMessage connectionPingClientMessage) {
        this(connectionPingClientMessage.getTimestamp());
    }
    
    @Override
    public boolean equals(final Object o) {
        if (this != o) {
            if (o == null) {
                return false;
            }
            if (this.getClass() != o.getClass()) {
                return false;
            }
            final ConnectionPongServerMessage connectionPongServerMessage = (ConnectionPongServerMessage)o;
            if (this.getFlag() != connectionPongServerMessage.getFlag() || this.getOriginalPingTimestamp() != connectionPongServerMessage.getOriginalPingTimestamp()) {
                return false;
            }
        }
        return true;
    }
    
    @Override
    public short getFlag() {
        return -32764;
    }
    
    public long getOriginalPingTimestamp() {
        return this.mOriginalPingTimestamp;
    }
    
    @Override
    protected void onAppendTransmissionDataForToString(final StringBuilder sb) {
        sb.append(", getOriginalPingTimestamp()=").append(this.mOriginalPingTimestamp);
    }
    
    public void onWriteTransmissionData(final DataOutputStream dataOutputStream) throws IOException {
        dataOutputStream.writeLong(this.mOriginalPingTimestamp);
    }
}
