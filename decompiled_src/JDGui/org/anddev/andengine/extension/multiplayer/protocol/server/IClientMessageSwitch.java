package org.anddev.andengine.extension.multiplayer.protocol.server;

import java.io.IOException;
import org.anddev.andengine.extension.multiplayer.protocol.adt.message.client.BaseClientMessage;
import org.anddev.andengine.extension.multiplayer.protocol.shared.IMessageSwitch;

public abstract interface IClientMessageSwitch
  extends IMessageSwitch<BaseClientMessage>
{
  public abstract void doSwitch(ClientConnector paramClientConnector, BaseClientMessage paramBaseClientMessage)
    throws IOException;
}


/* Location:           C:\Users\Rodelle\Desktop\Attacknid\Tools\Attacknids-dex2jar.jar
 * Qualified Name:     org.anddev.andengine.extension.multiplayer.protocol.server.IClientMessageSwitch
 * JD-Core Version:    0.7.0.1
 */