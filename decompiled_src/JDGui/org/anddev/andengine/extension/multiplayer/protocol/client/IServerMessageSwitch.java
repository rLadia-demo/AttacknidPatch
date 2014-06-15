package org.anddev.andengine.extension.multiplayer.protocol.client;

import java.io.IOException;
import org.anddev.andengine.extension.multiplayer.protocol.adt.message.server.BaseServerMessage;
import org.anddev.andengine.extension.multiplayer.protocol.shared.IMessageSwitch;

public abstract interface IServerMessageSwitch
  extends IMessageSwitch<BaseServerMessage>
{
  public abstract void doSwitch(ServerConnector paramServerConnector, BaseServerMessage paramBaseServerMessage)
    throws IOException;
}


/* Location:           C:\Users\Rodelle\Desktop\Attacknid\Tools\Attacknids-dex2jar.jar
 * Qualified Name:     org.anddev.andengine.extension.multiplayer.protocol.client.IServerMessageSwitch
 * JD-Core Version:    0.7.0.1
 */