/*
 * Decompiled with CFR 0_79.
 */
package org.anddev.andengine.extension.multiplayer.protocol.adt.message.client.connection;

import java.io.DataInputStream;
import java.io.DataOutputStream;
import java.io.IOException;
import org.anddev.andengine.extension.multiplayer.protocol.adt.message.client.BaseClientMessage;

public class ConnectionCloseClientMessage
extends BaseClientMessage {
    public ConnectionCloseClientMessage() {
    }

    public ConnectionCloseClientMessage(DataInputStream dataInputStream) throws IOException {
    }

    @Override
    public short getFlag() {
        return -32767;
    }

    @Override
    protected void onAppendTransmissionDataForToString(StringBuilder stringBuilder) {
    }

    @Override
    public void onWriteTransmissionData(DataOutputStream dataOutputStream) throws IOException {
    }
}

