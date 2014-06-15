package org.anddev.andengine.extension.multiplayer.protocol.adt.message.client;

import java.io.*;

public abstract class BaseStringClientMessage extends BaseClientMessage
{
    protected String mString;
    
    public BaseStringClientMessage(final DataInputStream dataInputStream) throws IOException {
        super();
        this.mString = dataInputStream.readUTF();
    }
    
    public BaseStringClientMessage(final String mString) {
        super();
        this.mString = mString;
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
            final BaseStringClientMessage baseStringClientMessage = (BaseStringClientMessage)o;
            if (this.getFlag() != baseStringClientMessage.getFlag() || this.getString() != baseStringClientMessage.getString()) {
                return false;
            }
        }
        return true;
    }
    
    public String getString() {
        return this.mString;
    }
    
    @Override
    protected void onAppendTransmissionDataForToString(final StringBuilder sb) {
        sb.append(", getString()=").append('\"').append(this.getString()).append('\"');
    }
    
    public void onWriteTransmissionData(final DataOutputStream dataOutputStream) throws IOException {
        dataOutputStream.writeUTF(this.getString());
    }
}
