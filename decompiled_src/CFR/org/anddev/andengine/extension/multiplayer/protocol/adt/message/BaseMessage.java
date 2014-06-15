/*
 * Decompiled with CFR 0_79.
 */
package org.anddev.andengine.extension.multiplayer.protocol.adt.message;

import java.io.DataOutputStream;
import java.io.IOException;
import org.anddev.andengine.extension.multiplayer.protocol.adt.message.IMessage;

public abstract class BaseMessage
implements IMessage {
    /*
     * Enabled aggressive block sorting
     */
    public boolean equals(Object object) {
        if (this == object) {
            return true;
        }
        if (object == null) {
            return false;
        }
        if (this.getClass() != object.getClass()) {
            return false;
        }
        BaseMessage baseMessage = (BaseMessage)object;
        if (this.getFlag() == baseMessage.getFlag()) return true;
        return false;
    }

    public abstract short getFlag();

    protected abstract void onAppendTransmissionDataForToString(StringBuilder var1);

    protected abstract void onWriteTransmissionData(DataOutputStream var1) throws IOException;

    public String toString() {
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append(this.getClass().getSimpleName()).append("[getFlag()=").append(this.getFlag());
        this.onAppendTransmissionDataForToString(stringBuilder);
        stringBuilder.append("]");
        return stringBuilder.toString();
    }

    @Override
    public void transmit(DataOutputStream dataOutputStream) throws IOException {
        dataOutputStream.writeShort(this.getFlag());
        this.onWriteTransmissionData(dataOutputStream);
    }
}

