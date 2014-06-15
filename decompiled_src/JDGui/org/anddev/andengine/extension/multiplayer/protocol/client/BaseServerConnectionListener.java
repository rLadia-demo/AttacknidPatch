package org.anddev.andengine.extension.multiplayer.protocol.client;

import java.net.Socket;
import org.anddev.andengine.extension.multiplayer.protocol.adt.message.server.BaseServerMessage;
import org.anddev.andengine.extension.multiplayer.protocol.shared.BaseConnectionListener;
import org.anddev.andengine.extension.multiplayer.protocol.shared.BaseConnector;
import org.anddev.andengine.util.Debug;

public abstract class BaseServerConnectionListener
  extends BaseConnectionListener<BaseServerMessage, BaseConnector<BaseServerMessage>>
{
  public static class DefaultServerConnectionListener
    extends BaseServerConnectionListener
  {
    protected void onConnectInner(BaseConnector<BaseServerMessage> paramBaseConnector)
    {
      Debug.d("Accepted Server-Connection from: '" + paramBaseConnector.getSocket().getRemoteSocketAddress() + "'");
    }
    
    protected void onDisconnectInner(BaseConnector<BaseServerMessage> paramBaseConnector)
    {
      Debug.d("Closed Server-Connection from: '" + paramBaseConnector.getSocket().getRemoteSocketAddress() + "'");
    }
  }
}


/* Location:           C:\Users\Rodelle\Desktop\Attacknid\Tools\Attacknids-dex2jar.jar
 * Qualified Name:     org.anddev.andengine.extension.multiplayer.protocol.client.BaseServerConnectionListener
 * JD-Core Version:    0.7.0.1
 */