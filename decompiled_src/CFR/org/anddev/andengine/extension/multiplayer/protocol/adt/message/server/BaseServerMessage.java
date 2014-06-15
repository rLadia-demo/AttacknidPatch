/*
 * Decompiled with CFR 0_79.
 */
package org.anddev.andengine.extension.multiplayer.protocol.adt.message.server;

import org.anddev.andengine.extension.multiplayer.protocol.adt.message.BaseMessage;
import org.anddev.andengine.extension.multiplayer.protocol.util.constants.ServerMessageFlags;

public abstract class BaseServerMessage
extends BaseMessage
implements ServerMessageFlags {
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
        BaseServerMessage baseServerMessage = (BaseServerMessage)object;
        if (this.getFlag() == baseServerMessage.getFlag()) return true;
        return false;
    }
}

