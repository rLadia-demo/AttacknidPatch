package org.anddev.andengine.extension.multiplayer.protocol.adt.message.client;

import java.io.*;

public abstract class BaseCharacterClientMessage extends BaseClientMessage
{
    protected char mCharacter;
    
    public BaseCharacterClientMessage(final char mCharacter) {
        super();
        this.mCharacter = mCharacter;
    }
    
    public BaseCharacterClientMessage(final DataInputStream dataInputStream) throws IOException {
        super();
        this.mCharacter = dataInputStream.readChar();
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
            final BaseCharacterClientMessage baseCharacterClientMessage = (BaseCharacterClientMessage)o;
            if (this.getFlag() != baseCharacterClientMessage.getFlag() || this.getCharacter() != baseCharacterClientMessage.getCharacter()) {
                return false;
            }
        }
        return true;
    }
    
    public char getCharacter() {
        return this.mCharacter;
    }
    
    @Override
    protected void onAppendTransmissionDataForToString(final StringBuilder sb) {
        sb.append(", getCharacter()=").append('\'').append(this.getCharacter()).append('\'');
    }
    
    public void onWriteTransmissionData(final DataOutputStream dataOutputStream) throws IOException {
        dataOutputStream.writeChar(this.getCharacter());
    }
}
