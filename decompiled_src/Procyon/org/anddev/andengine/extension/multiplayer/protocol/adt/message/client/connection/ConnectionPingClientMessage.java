package org.anddev.andengine.extension.multiplayer.protocol.adt.message.client.connection;

import org.anddev.andengine.extension.multiplayer.protocol.adt.message.client.*;
import java.io.*;

public class ConnectionPingClientMessage extends BaseClientMessage
{
    private final long mTimestamp;
    
    public ConnectionPingClientMessage() {
        this(System.currentTimeMillis());
    }
    
    public ConnectionPingClientMessage(final long mTimestamp) {
        super();
        this.mTimestamp = mTimestamp;
    }
    
    public ConnectionPingClientMessage(final DataInputStream dataInputStream) throws IOException {
        super();
        this.mTimestamp = dataInputStream.readLong();
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
            final ConnectionPingClientMessage connectionPingClientMessage = (ConnectionPingClientMessage)o;
            if (this.getFlag() != connectionPingClientMessage.getFlag() || this.getTimestamp() != connectionPingClientMessage.getTimestamp()) {
                return false;
            }
        }
        return true;
    }
    
    @Override
    public short getFlag() {
        return -32766;
    }
    
    public long getTimestamp() {
        return this.mTimestamp;
    }
    
    @Override
    protected void onAppendTransmissionDataForToString(final StringBuilder sb) {
        sb.append(", getTimestamp()=").append(this.mTimestamp);
    }
    
    public void onWriteTransmissionData(final DataOutputStream dataOutputStream) throws IOException {
        dataOutputStream.writeLong(this.mTimestamp);
    }
}
