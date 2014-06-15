/*
 * Decompiled with CFR 0_79.
 */
package org.anddev.andengine.extension.multiplayer.protocol.adt.message.client;

import java.io.DataInputStream;
import java.io.DataOutputStream;
import java.io.IOException;
import org.anddev.andengine.extension.multiplayer.protocol.adt.message.client.BaseClientMessage;

public abstract class BaseIntegerClientMessage
extends BaseClientMessage {
    protected int mInteger;

    public BaseIntegerClientMessage(int n) {
        this.mInteger = n;
    }

    public BaseIntegerClientMessage(DataInputStream dataInputStream) throws IOException {
        this.mInteger = dataInputStream.readInt();
    }

    /*
     * Enabled aggressive block sorting
     */
    @Override
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
        BaseIntegerClientMessage baseIntegerClientMessage = (BaseIntegerClientMessage)object;
        if (this.getFlag() != baseIntegerClientMessage.getFlag()) return false;
        if (this.getInteger() == baseIntegerClientMessage.getInteger()) return true;
        return false;
    }

    public int getInteger() {
        return this.mInteger;
    }

    @Override
    protected void onAppendTransmissionDataForToString(StringBuilder stringBuilder) {
        stringBuilder.append(", getInteger()=").append(this.getInteger());
    }

    @Override
    public void onWriteTransmissionData(DataOutputStream dataOutputStream) throws IOException {
        dataOutputStream.writeInt(this.getInteger());
    }
}

