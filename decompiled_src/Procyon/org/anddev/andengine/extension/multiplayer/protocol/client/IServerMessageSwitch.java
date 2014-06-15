package org.anddev.andengine.extension.multiplayer.protocol.client;

import org.anddev.andengine.extension.multiplayer.protocol.shared.*;
import org.anddev.andengine.extension.multiplayer.protocol.adt.message.server.*;
import java.io.*;

public interface IServerMessageSwitch extends IMessageSwitch<BaseServerMessage>
{
    void doSwitch(ServerConnector p0, BaseServerMessage p1) throws IOException;
}
