package org.anddev.andengine.extension.multiplayer.protocol.adt.message;

import java.io.*;

public abstract class BaseMessage implements IMessage
{
    @Override
    public boolean equals(final Object o) {
        if (this != o) {
            if (o == null) {
                return false;
            }
            if (this.getClass() != o.getClass()) {
                return false;
            }
            if (this.getFlag() != ((BaseMessage)o).getFlag()) {
                return false;
            }
        }
        return true;
    }
    
    public abstract short getFlag();
    
    protected abstract void onAppendTransmissionDataForToString(final StringBuilder p0);
    
    protected abstract void onWriteTransmissionData(final DataOutputStream p0) throws IOException;
    
    @Override
    public String toString() {
        final StringBuilder sb = new StringBuilder();
        sb.append(this.getClass().getSimpleName()).append("[getFlag()=").append(this.getFlag());
        this.onAppendTransmissionDataForToString(sb);
        sb.append("]");
        return sb.toString();
    }
    
    @Override
    public void transmit(final DataOutputStream dataOutputStream) throws IOException {
        dataOutputStream.writeShort(this.getFlag());
        this.onWriteTransmissionData(dataOutputStream);
    }
}
