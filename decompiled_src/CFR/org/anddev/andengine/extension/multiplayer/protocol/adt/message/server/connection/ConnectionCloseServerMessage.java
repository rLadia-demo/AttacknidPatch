/*
 * Decompiled with CFR 0_79.
 */
package org.anddev.andengine.extension.multiplayer.protocol.adt.message.server.connection;

import java.io.DataInputStream;
import java.io.DataOutputStream;
import java.io.IOException;
import org.anddev.andengine.extension.multiplayer.protocol.adt.message.server.BaseServerMessage;

public class ConnectionCloseServerMessage
extends BaseServerMessage {
    public ConnectionCloseServerMessage() {
    }

    public ConnectionCloseServerMessage(DataInputStream dataInputStream) throws IOException {
    }

    @Override
    public short getFlag() {
        return -32766;
    }

    @Override
    protected void onAppendTransmissionDataForToString(StringBuilder stringBuilder) {
    }

    @Override
    protected void onWriteTransmissionData(DataOutputStream dataOutputStream) throws IOException {
    }
}

