package org.anddev.andengine.extension.multiplayer.protocol.adt.message.client.connection;

import org.anddev.andengine.extension.multiplayer.protocol.adt.message.client.*;
import java.io.*;

public class ConnectionEstablishClientMessage extends BaseClientMessage
{
    private final int mProtocolVersion;
    
    public ConnectionEstablishClientMessage() {
        this(1);
    }
    
    public ConnectionEstablishClientMessage(final int mProtocolVersion) {
        super();
        this.mProtocolVersion = mProtocolVersion;
    }
    
    public ConnectionEstablishClientMessage(final DataInputStream dataInputStream) throws IOException {
        super();
        this.mProtocolVersion = dataInputStream.readInt();
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
            final ConnectionEstablishClientMessage connectionEstablishClientMessage = (ConnectionEstablishClientMessage)o;
            if (this.getFlag() != connectionEstablishClientMessage.getFlag() || this.getProtocolVersion() != connectionEstablishClientMessage.getProtocolVersion()) {
                return false;
            }
        }
        return true;
    }
    
    @Override
    public short getFlag() {
        return -32768;
    }
    
    public int getProtocolVersion() {
        return this.mProtocolVersion;
    }
    
    @Override
    protected void onAppendTransmissionDataForToString(final StringBuilder sb) {
        sb.append(", getProtocolVersion()=").append(this.mProtocolVersion);
    }
    
    public void onWriteTransmissionData(final DataOutputStream dataOutputStream) throws IOException {
        dataOutputStream.writeInt(this.mProtocolVersion);
    }
}
