package org.anddev.andengine.extension.multiplayer.protocol.adt.message.client;

import java.io.*;

public abstract class BaseIntegerClientMessage extends BaseClientMessage
{
    protected int mInteger;
    
    public BaseIntegerClientMessage(final int mInteger) {
        super();
        this.mInteger = mInteger;
    }
    
    public BaseIntegerClientMessage(final DataInputStream dataInputStream) throws IOException {
        super();
        this.mInteger = dataInputStream.readInt();
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
            final BaseIntegerClientMessage baseIntegerClientMessage = (BaseIntegerClientMessage)o;
            if (this.getFlag() != baseIntegerClientMessage.getFlag() || this.getInteger() != baseIntegerClientMessage.getInteger()) {
                return false;
            }
        }
        return true;
    }
    
    public int getInteger() {
        return this.mInteger;
    }
    
    @Override
    protected void onAppendTransmissionDataForToString(final StringBuilder sb) {
        sb.append(", getInteger()=").append(this.getInteger());
    }
    
    public void onWriteTransmissionData(final DataOutputStream dataOutputStream) throws IOException {
        dataOutputStream.writeInt(this.getInteger());
    }
}
