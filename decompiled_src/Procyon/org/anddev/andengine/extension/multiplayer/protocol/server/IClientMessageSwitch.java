package org.anddev.andengine.extension.multiplayer.protocol.server;

import org.anddev.andengine.extension.multiplayer.protocol.shared.*;
import org.anddev.andengine.extension.multiplayer.protocol.adt.message.client.*;
import java.io.*;

public interface IClientMessageSwitch extends IMessageSwitch<BaseClientMessage>
{
    void doSwitch(ClientConnector p0, BaseClientMessage p1) throws IOException;
}
