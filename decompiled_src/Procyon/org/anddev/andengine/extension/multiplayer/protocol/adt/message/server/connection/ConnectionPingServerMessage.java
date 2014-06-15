package org.anddev.andengine.extension.multiplayer.protocol.adt.message.server.connection;

import org.anddev.andengine.extension.multiplayer.protocol.adt.message.server.*;
import java.io.*;

public class ConnectionPingServerMessage extends BaseServerMessage
{
    private final long mTimestamp;
    
    public ConnectionPingServerMessage() {
        this(System.currentTimeMillis());
    }
    
    public ConnectionPingServerMessage(final long mTimestamp) {
        super();
        this.mTimestamp = mTimestamp;
    }
    
    public ConnectionPingServerMessage(final DataInputStream dataInputStream) throws IOException {
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
            final ConnectionPingServerMessage connectionPingServerMessage = (ConnectionPingServerMessage)o;
            if (this.getFlag() != connectionPingServerMessage.getFlag() || this.getTimestamp() != connectionPingServerMessage.getTimestamp()) {
                return false;
            }
        }
        return true;
    }
    
    @Override
    public short getFlag() {
        return -32764;
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
