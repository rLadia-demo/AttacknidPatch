package org.anddev.andengine.extension.multiplayer.protocol.client;

import java.io.DataOutputStream;
import java.io.IOException;
import java.net.Socket;
import org.anddev.andengine.extension.multiplayer.protocol.adt.message.client.BaseClientMessage;
import org.anddev.andengine.extension.multiplayer.protocol.adt.message.client.connection.ConnectionCloseClientMessage;
import org.anddev.andengine.extension.multiplayer.protocol.adt.message.client.connection.ConnectionEstablishClientMessage;
import org.anddev.andengine.extension.multiplayer.protocol.adt.message.server.BaseServerMessage;
import org.anddev.andengine.extension.multiplayer.protocol.shared.BaseConnector;
import org.anddev.andengine.util.Debug;

public class ServerConnector
  extends BaseConnector<BaseServerMessage>
{
  public ServerConnector(Socket paramSocket, BaseServerConnectionListener paramBaseServerConnectionListener, ServerMessageExtractor paramServerMessageExtractor, IServerMessageSwitch paramIServerMessageSwitch)
    throws IOException
  {
    super(paramSocket, paramBaseServerConnectionListener, paramServerMessageExtractor, paramIServerMessageSwitch);
    sendClientMessage(new ConnectionEstablishClientMessage());
  }
  
  public IServerMessageSwitch getMessageSwitch()
  {
    return (IServerMessageSwitch)super.getMessageSwitch();
  }
  
  protected void handleMessage(BaseServerMessage paramBaseServerMessage)
    throws IOException
  {
    getMessageSwitch().doSwitch(this, paramBaseServerMessage);
  }
  
  protected void onSendConnectionClose()
  {
    try
    {
      sendClientMessage(new ConnectionCloseClientMessage());
      return;
    }
    catch (Throwable localThrowable)
    {
      Debug.e(localThrowable);
    }
  }
  
  public void sendClientMessage(BaseClientMessage paramBaseClientMessage)
    throws IOException
  {
    DataOutputStream localDataOutputStream = getDataOutputStream();
    paramBaseClientMessage.transmit(localDataOutputStream);
    localDataOutputStream.flush();
  }
}


/* Location:           C:\Users\Rodelle\Desktop\Attacknid\Tools\Attacknids-dex2jar.jar
 * Qualified Name:     org.anddev.andengine.extension.multiplayer.protocol.client.ServerConnector
 * JD-Core Version:    0.7.0.1
 */