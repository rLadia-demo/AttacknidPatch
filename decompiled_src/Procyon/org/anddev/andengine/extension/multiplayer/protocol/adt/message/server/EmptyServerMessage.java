package org.anddev.andengine.extension.multiplayer.protocol.adt.message.server;

import java.io.*;

public abstract class EmptyServerMessage extends BaseServerMessage
{
    public EmptyServerMessage() {
        super();
    }
    
    public EmptyServerMessage(final DataInputStream dataInputStream) throws IOException {
        super();
    }
    
    @Override
    protected void onAppendTransmissionDataForToString(final StringBuilder sb) {
    }
    
    @Override
    protected void onWriteTransmissionData(final DataOutputStream dataOutputStream) throws IOException {
    }
}
