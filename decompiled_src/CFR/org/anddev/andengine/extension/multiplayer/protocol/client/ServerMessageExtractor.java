/*
 * Decompiled with CFR 0_79.
 */
package org.anddev.andengine.extension.multiplayer.protocol.client;

import java.io.DataInputStream;
import java.io.IOException;
import org.anddev.andengine.extension.multiplayer.protocol.adt.message.IMessage;
import org.anddev.andengine.extension.multiplayer.protocol.adt.message.server.BaseServerMessage;
import org.anddev.andengine.extension.multiplayer.protocol.adt.message.server.connection.ConnectionAcceptedServerMessage;
import org.anddev.andengine.extension.multiplayer.protocol.adt.message.server.connection.ConnectionCloseServerMessage;
import org.anddev.andengine.extension.multiplayer.protocol.adt.message.server.connection.ConnectionPingServerMessage;
import org.anddev.andengine.extension.multiplayer.protocol.adt.message.server.connection.ConnectionPongServerMessage;
import org.anddev.andengine.extension.multiplayer.protocol.adt.message.server.connection.ConnectionRefusedServerMessage;
import org.anddev.andengine.extension.multiplayer.protocol.shared.BaseMessageExtractor;
import org.anddev.andengine.extension.multiplayer.protocol.util.constants.ServerMessageFlags;

public class ServerMessageExtractor
extends BaseMessageExtractor<BaseServerMessage>
implements ServerMessageFlags {
    @Override
    public BaseServerMessage readMessage(short s, DataInputStream dataInputStream) throws IOException {
        switch (s) {
            default: {
                throw new IllegalArgumentException("Unknown flag: " + s);
            }
            case -32768: {
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
            case -32764: 
        }
        return new ConnectionPongServerMessage(dataInputStream);
    }
}

