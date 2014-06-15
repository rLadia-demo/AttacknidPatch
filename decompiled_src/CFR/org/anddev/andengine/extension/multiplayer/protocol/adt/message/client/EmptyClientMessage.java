/*
 * Decompiled with CFR 0_79.
 */
package org.anddev.andengine.extension.multiplayer.protocol.adt.message.client;

import java.io.DataInputStream;
import java.io.DataOutputStream;
import java.io.IOException;
import org.anddev.andengine.extension.multiplayer.protocol.adt.message.client.BaseClientMessage;

public abstract class EmptyClientMessage
extends BaseClientMessage {
    public EmptyClientMessage() {
    }

    public EmptyClientMessage(DataInputStream dataInputStream) throws IOException {
    }

    @Override
    protected void onAppendTransmissionDataForToString(StringBuilder stringBuilder) {
    }

    @Override
    protected void onWriteTransmissionData(DataOutputStream dataOutputStream) throws IOException {
    }
}

