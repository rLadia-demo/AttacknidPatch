/*
 * Decompiled with CFR 0_79.
 */
package org.anddev.andengine.extension.multiplayer.protocol.adt.message.server;

import java.io.DataInputStream;
import java.io.DataOutputStream;
import java.io.IOException;
import org.anddev.andengine.extension.multiplayer.protocol.adt.message.server.BaseServerMessage;

public abstract class EmptyServerMessage
extends BaseServerMessage {
    public EmptyServerMessage() {
    }

    public EmptyServerMessage(DataInputStream dataInputStream) throws IOException {
    }

    @Override
    protected void onAppendTransmissionDataForToString(StringBuilder stringBuilder) {
    }

    @Override
    protected void onWriteTransmissionData(DataOutputStream dataOutputStream) throws IOException {
    }
}

