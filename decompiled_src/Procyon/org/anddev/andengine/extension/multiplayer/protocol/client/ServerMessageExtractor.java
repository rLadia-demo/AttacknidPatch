package org.anddev.andengine.extension.multiplayer.protocol.client;

import org.anddev.andengine.extension.multiplayer.protocol.shared.*;
import org.anddev.andengine.extension.multiplayer.protocol.adt.message.server.*;
import org.anddev.andengine.extension.multiplayer.protocol.util.constants.*;
import org.anddev.andengine.extension.multiplayer.protocol.adt.message.*;
import java.io.*;
import org.anddev.andengine.extension.multiplayer.protocol.adt.message.server.connection.*;

public class ServerMessageExtractor extends BaseMessageExtractor<BaseServerMessage> implements ServerMessageFlags
{
    @Override
    public BaseServerMessage readMessage(final short n, final DataInputStream dataInputStream) throws IOException {
        switch (n) {
            default: {
                throw new IllegalArgumentException("Unknown flag: " + n);
            }
            case Short.MIN_VALUE: {
                return new ConnectionAcceptedServerMessage(dataInputStream);
            }
            case -32767: {
                return new ConnectionRefusedServerMessage(dataInputStream);
            }
            case -32766: {
                return new ConnectionCloseServerMessage(dataInputStream);
            }
            case -32765: {
                return new ConnectionPingServerMessage(dataInputStream);
            }
            case -32764: {
                return new ConnectionPongServerMessage(dataInputStream);
            }
        }
    }
}
