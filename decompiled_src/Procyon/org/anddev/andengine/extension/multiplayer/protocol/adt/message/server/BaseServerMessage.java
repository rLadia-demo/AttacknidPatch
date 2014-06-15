package org.anddev.andengine.extension.multiplayer.protocol.adt.message.server;

import org.anddev.andengine.extension.multiplayer.protocol.adt.message.*;
import org.anddev.andengine.extension.multiplayer.protocol.util.constants.*;

public abstract class BaseServerMessage extends BaseMessage implements ServerMessageFlags
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
            if (this.getFlag() != ((BaseServerMessage)o).getFlag()) {
                return false;
            }
        }
        return true;
    }
}
