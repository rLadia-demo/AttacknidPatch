package org.anddev.andengine.extension.multiplayer.protocol.adt.message.client;

import java.io.*;

public abstract class EmptyClientMessage extends BaseClientMessage
{
    public EmptyClientMessage() {
        super();
    }
    
    public EmptyClientMessage(final DataInputStream dataInputStream) throws IOException {
        super();
    }
    
    @Override
    protected void onAppendTransmissionDataForToString(final StringBuilder sb) {
    }
    
    @Override
    protected void onWriteTransmissionData(final DataOutputStream dataOutputStream) throws IOException {
    }
}
