/*
 * Decompiled with CFR 0_79.
 */
package org.anddev.andengine.extension.multiplayer.protocol.adt.message;

import java.io.DataOutputStream;
import java.io.IOException;

public interface IMessage {
    public void transmit(DataOutputStream var1) throws IOException;
}

