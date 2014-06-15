package org.anddev.andengine.extension.multiplayer.protocol.server;

import org.anddev.andengine.extension.multiplayer.protocol.shared.*;
import org.anddev.andengine.extension.multiplayer.protocol.adt.message.client.*;
import org.anddev.andengine.extension.multiplayer.protocol.util.constants.*;
import org.anddev.andengine.extension.multiplayer.protocol.adt.message.*;
import java.io.*;
import org.anddev.andengine.extension.multiplayer.protocol.adt.message.client.connection.*;

public class ClientMessageExtractor extends BaseMessageExtractor<BaseClientMessage> implements ClientMessageFlags
{
    @Override
    public BaseClientMessage readMessage(final short n, final DataInputStream dataInputStream) throws IOException {
        switch (n) {
            default: {
                throw new IllegalArgumentException("Unknown flag: " + n);
            }
            case Short.MIN_VALUE: {
                return new ConnectionEstablishClientMessage(dataInputStream);
            }
            case -32767: {
                return new ConnectionCloseClientMessage(dataInputStream);
            }
            case -32766: {
                return new ConnectionPingClientMessage(dataInputStream);
            }
            case -32765: {
                return new ConnectionPongClientMessage(dataInputStream);
            }
        }
    }
}
