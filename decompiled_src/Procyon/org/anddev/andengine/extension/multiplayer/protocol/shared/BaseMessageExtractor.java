package org.anddev.andengine.extension.multiplayer.protocol.shared;

import org.anddev.andengine.extension.multiplayer.protocol.adt.message.*;
import java.io.*;

public abstract class BaseMessageExtractor<M extends IMessage>
{
    public abstract M readMessage(final short p0, final DataInputStream p1) throws IOException;
    
    public short readMessageFlag(final DataInputStream dataInputStream) throws IOException {
        return dataInputStream.readShort();
    }
}
