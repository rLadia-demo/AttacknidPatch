package org.anddev.andengine.extension.multiplayer.protocol.adt.message.client;

import org.anddev.andengine.extension.multiplayer.protocol.adt.message.*;
import org.anddev.andengine.extension.multiplayer.protocol.util.constants.*;

public abstract class BaseClientMessage extends BaseMessage implements ClientMessageFlags
{
    @Override
    public boolean equals(final Object o) {
        if (this != o) {
            if (o == null) {
                return false;
            }
            if (this.getClass() != o.getClass()) {
                return false;
            }
            if (this.getFlag() != ((BaseClientMessage)o).getFlag()) {
                return false;
            }
        }
        return true;
    }
}
