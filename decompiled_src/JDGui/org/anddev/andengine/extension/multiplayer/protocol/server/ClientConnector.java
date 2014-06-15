package org.anddev.andengine.extension.multiplayer.protocol.server;

import java.io.DataOutputStream;
import java.io.IOException;
import java.net.Socket;
import org.anddev.andengine.extension.multiplayer.protocol.adt.message.client.BaseClientMessage;
import org.anddev.andengine.extension.multiplayer.protocol.adt.message.server.BaseServerMessage;
import org.anddev.andengine.extension.multiplayer.protocol.adt.message.server.connection.ConnectionCloseServerMessage;
import org.anddev.andengine.extension.multiplayer.protocol.shared.BaseConnector;
import org.anddev.andengine.util.Debug;

public class ClientConnector
  extends BaseConnector<BaseClientMessage>
{
  public ClientConnector(Socket paramSocket, BaseClientConnectionListener paramBaseClientConnectionListener, ClientMessageExtractor paramClientMessageExtractor, IClientMessageSwitch paramIClientMessageSwitch)
    throws IOException
  {
    super(paramSocket, paramBaseClientConnectionListener, paramClientMessageExtractor, paramIClientMessageSwitch);
  }
  
  public IClientMessageSwitch getMessageSwitch()
  {
    return (IClientMessageSwitch)super.getMessageSwitch();
  }
  
  protected void handleMessage(BaseClientMessage paramBaseClientMessage)
    throws IOException
  {
    getMessageSwitch().doSwitch(this, paramBaseClientMessage);
  }
  
  protected void onSendConnectionClose()
  {
    try
    {
      sendServerMessage(new ConnectionCloseServerMessage());
      return;
    }
    catch (Throwable localThrowable)
    {
      Debug.e(localThrowable);
    }
  }
  
  public void sendServerMessage(BaseServerMessage paramBaseServerMessage)
    throws IOException
  {
    DataOutputStream localDataOutputStream = getDataOutputStream();
    paramBaseServerMessage.transmit(localDataOutputStream);
    localDataOutputStream.flush();
  }
}


/* Location:           C:\Users\Rodelle\Desktop\Attacknid\Tools\Attacknids-dex2jar.jar
 * Qualified Name:     org.anddev.andengine.extension.multiplayer.protocol.server.ClientConnector
 * JD-Core Version:    0.7.0.1
 */