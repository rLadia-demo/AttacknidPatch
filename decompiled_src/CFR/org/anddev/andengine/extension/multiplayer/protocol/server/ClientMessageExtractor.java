/*
 * Decompiled with CFR 0_79.
 */
package org.anddev.andengine.extension.multiplayer.protocol.server;

import java.io.DataInputStream;
import java.io.IOException;
import org.anddev.andengine.extension.multiplayer.protocol.adt.message.IMessage;
import org.anddev.andengine.extension.multiplayer.protocol.adt.message.client.BaseClientMessage;
import org.anddev.andengine.extension.multiplayer.protocol.adt.message.client.connection.ConnectionCloseClientMessage;
import org.anddev.andengine.extension.multiplayer.protocol.adt.message.client.connection.ConnectionEstablishClientMessage;
import org.anddev.andengine.extension.multiplayer.protocol.adt.message.client.connection.ConnectionPingClientMessage;
import org.anddev.andengine.extension.multiplayer.protocol.adt.message.client.connection.ConnectionPongClientMessage;
import org.anddev.andengine.extension.multiplayer.protocol.shared.BaseMessageExtractor;
import org.anddev.andengine.extension.multiplayer.protocol.util.constants.ClientMessageFlags;

public class ClientMessageExtractor
extends BaseMessageExtractor<BaseClientMessage>
implements ClientMessageFlags {
    @Override
    public BaseClientMessage readMessage(short s, DataInputStream dataInputStream) throws IOException {
        switch (s) {
            default: {
                throw new IllegalArgumentException("Unknown flag: " + s);
            }
            case -32768: {
                return new ConnectionEstablishClientMessage(dataInputStream);
            }
            case -32767: {
                return new ConnectionCloseClientMessage(dataInputStream);
            }
            case -32766: {
                return new ConnectionPingClientMessage(dataInputStream);
            }
            case -32765: 
        }
        return new ConnectionPongClientMessage(dataInputStream);
    }
}

