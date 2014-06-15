/*
 * Decompiled with CFR 0_79.
 */
package org.anddev.andengine.extension.multiplayer.protocol.shared;

import java.io.DataInputStream;
import java.io.IOException;
import org.anddev.andengine.extension.multiplayer.protocol.adt.message.IMessage;

public abstract class BaseMessageExtractor<M extends IMessage> {
    public abstract M readMessage(short var1, DataInputStream var2) throws IOException;

    public short readMessageFlag(DataInputStream dataInputStream) throws IOException {
        return dataInputStream.readShort();
    }
}

