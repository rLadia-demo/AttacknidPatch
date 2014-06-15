/*
 * Decompiled with CFR 0_79.
 */
package org.anddev.andengine.extension.multiplayer.protocol.client;

import java.io.IOException;
import org.anddev.andengine.extension.multiplayer.protocol.adt.message.server.BaseServerMessage;
import org.anddev.andengine.extension.multiplayer.protocol.client.ServerConnector;
import org.anddev.andengine.extension.multiplayer.protocol.shared.IMessageSwitch;

public interface IServerMessageSwitch
extends IMessageSwitch<BaseServerMessage> {
    public void doSwitch(ServerConnector var1, BaseServerMessage var2) throws IOException;
}

