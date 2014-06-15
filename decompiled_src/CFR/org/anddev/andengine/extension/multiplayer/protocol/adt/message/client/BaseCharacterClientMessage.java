/*
 * Decompiled with CFR 0_79.
 */
package org.anddev.andengine.extension.multiplayer.protocol.adt.message.client;

import java.io.DataInputStream;
import java.io.DataOutputStream;
import java.io.IOException;
import org.anddev.andengine.extension.multiplayer.protocol.adt.message.client.BaseClientMessage;

public abstract class BaseCharacterClientMessage
extends BaseClientMessage {
    protected char mCharacter;

    public BaseCharacterClientMessage(char c) {
        this.mCharacter = c;
    }

    public BaseCharacterClientMessage(DataInputStream dataInputStream) throws IOException {
        this.mCharacter = dataInputStream.readChar();
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
        BaseCharacterClientMessage baseCharacterClientMessage = (BaseCharacterClientMessage)object;
        if (this.getFlag() != baseCharacterClientMessage.getFlag()) return false;
        if (this.getCharacter() == baseCharacterClientMessage.getCharacter()) return true;
        return false;
    }

    public char getCharacter() {
        return this.mCharacter;
    }

    @Override
    protected void onAppendTransmissionDataForToString(StringBuilder stringBuilder) {
        stringBuilder.append(", getCharacter()=").append('\'').append(this.getCharacter()).append('\'');
    }

    @Override
    public void onWriteTransmissionData(DataOutputStream dataOutputStream) throws IOException {
        dataOutputStream.writeChar(this.getCharacter());
    }
}

