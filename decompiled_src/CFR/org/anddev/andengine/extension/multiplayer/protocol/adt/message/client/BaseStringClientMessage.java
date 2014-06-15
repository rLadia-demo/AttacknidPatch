/*
 * Decompiled with CFR 0_79.
 */
package org.anddev.andengine.extension.multiplayer.protocol.adt.message.client;

import java.io.DataInputStream;
import java.io.DataOutputStream;
import java.io.IOException;
import org.anddev.andengine.extension.multiplayer.protocol.adt.message.client.BaseClientMessage;

public abstract class BaseStringClientMessage
extends BaseClientMessage {
    protected String mString;

    public BaseStringClientMessage(DataInputStream dataInputStream) throws IOException {
        this.mString = dataInputStream.readUTF();
    }

    public BaseStringClientMessage(String string) {
        this.mString = string;
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
        BaseStringClientMessage baseStringClientMessage = (BaseStringClientMessage)object;
        if (this.getFlag() != baseStringClientMessage.getFlag()) return false;
        if (this.getString() == baseStringClientMessage.getString()) return true;
        return false;
    }

    public String getString() {
        return this.mString;
    }

    @Override
    protected void onAppendTransmissionDataForToString(StringBuilder stringBuilder) {
        stringBuilder.append(", getString()=").append('\"').append(this.getString()).append('\"');
    }

    @Override
    public void onWriteTransmissionData(DataOutputStream dataOutputStream) throws IOException {
        dataOutputStream.writeUTF(this.getString());
    }
}

