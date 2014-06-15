/*
 * Decompiled with CFR 0_79.
 */
package org.anddev.andengine.extension.multiplayer.protocol.server;

import java.io.IOException;
import org.anddev.andengine.extension.multiplayer.protocol.adt.message.client.BaseClientMessage;
import org.anddev.andengine.extension.multiplayer.protocol.server.ClientConnector;
import org.anddev.andengine.extension.multiplayer.protocol.shared.IMessageSwitch;

public interface IClientMessageSwitch
extends IMessageSwitch<BaseClientMessage> {
    public void doSwitch(ClientConnector var1, BaseClientMessage var2) throws IOException;
}

