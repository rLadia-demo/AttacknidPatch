package org.anddev.andengine.extension.multiplayer.protocol.adt.message.client.connection;

import org.anddev.andengine.extension.multiplayer.protocol.adt.message.client.*;
import org.anddev.andengine.extension.multiplayer.protocol.adt.message.server.connection.*;
import java.io.*;

public class ConnectionPongClientMessage extends BaseClientMessage
{
    private final long mOriginalPingTimestamp;
    
    public ConnectionPongClientMessage(final long mOriginalPingTimestamp) {
        super();
        this.mOriginalPingTimestamp = mOriginalPingTimestamp;
    }
    
    public ConnectionPongClientMessage(final DataInputStream dataInputStream) throws IOException {
        super();
        this.mOriginalPingTimestamp = dataInputStream.readLong();
    }
    
    public ConnectionPongClientMessage(final ConnectionPingServerMessage connectionPingServerMessage) {
        this(connectionPingServerMessage.getTimestamp());
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
            final ConnectionPongClientMessage connectionPongClientMessage = (ConnectionPongClientMessage)o;
            if (this.getFlag() != connectionPongClientMessage.getFlag() || this.getOriginalPingTimestamp() != connectionPongClientMessage.getOriginalPingTimestamp()) {
                return false;
            }
        }
        return true;
    }
    
    @Override
    public short getFlag() {
        return -32765;
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
