/*
 * Decompiled with CFR 0_79.
 */
package org.anddev.andengine.extension.multiplayer.protocol.adt.message.client;

import org.anddev.andengine.extension.multiplayer.protocol.adt.message.BaseMessage;
import org.anddev.andengine.extension.multiplayer.protocol.util.constants.ClientMessageFlags;

public abstract class BaseClientMessage
extends BaseMessage
implements ClientMessageFlags {
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
        BaseClientMessage baseClientMessage = (BaseClientMessage)object;
        if (this.getFlag() == baseClientMessage.getFlag()) return true;
        return false;
    }
}

