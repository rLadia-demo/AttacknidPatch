package org.anddev.andengine.extension.multiplayer.protocol.adt.message.server.connection;

import org.anddev.andengine.extension.multiplayer.protocol.adt.message.server.*;
import java.io.*;

public class ConnectionAcceptedServerMessage extends BaseServerMessage
{
    public ConnectionAcceptedServerMessage() {
        super();
    }
    
    public ConnectionAcceptedServerMessage(final DataInputStream dataInputStream) throws IOException {
        super();
    }
    
    @Override
    public short getFlag() {
        return -32768;
    }
    
    @Override
    protected void onAppendTransmissionDataForToString(final StringBuilder sb) {
    }
    
    @Override
    protected void onWriteTransmissionData(final DataOutputStream dataOutputStream) throws IOException {
    }
}
