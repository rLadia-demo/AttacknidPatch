package org.anddev.andengine.extension.multiplayer.protocol.adt.message.client.connection;

import org.anddev.andengine.extension.multiplayer.protocol.adt.message.client.*;
import java.io.*;

public class ConnectionCloseClientMessage extends BaseClientMessage
{
    public ConnectionCloseClientMessage() {
        super();
    }
    
    public ConnectionCloseClientMessage(final DataInputStream dataInputStream) throws IOException {
        super();
    }
    
    @Override
    public short getFlag() {
        return -32767;
    }
    
    @Override
    protected void onAppendTransmissionDataForToString(final StringBuilder sb) {
    }
    
    public void onWriteTransmissionData(final DataOutputStream dataOutputStream) throws IOException {
    }
}
