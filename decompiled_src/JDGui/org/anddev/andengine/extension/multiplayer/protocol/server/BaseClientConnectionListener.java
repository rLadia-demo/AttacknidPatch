package org.anddev.andengine.extension.multiplayer.protocol.server;

import java.net.Socket;
import org.anddev.andengine.extension.multiplayer.protocol.adt.message.client.BaseClientMessage;
import org.anddev.andengine.extension.multiplayer.protocol.shared.BaseConnectionListener;
import org.anddev.andengine.extension.multiplayer.protocol.shared.BaseConnector;
import org.anddev.andengine.util.Debug;

public abstract class BaseClientConnectionListener
  extends BaseConnectionListener<BaseClientMessage, BaseConnector<BaseClientMessage>>
{
  public static class DefaultClientConnectionListener
    extends BaseClientConnectionListener
  {
    protected void onConnectInner(BaseConnector<BaseClientMessage> paramBaseConnector)
    {
      Debug.d("Accepted Client-Connection from: '" + paramBaseConnector.getSocket().getRemoteSocketAddress() + "'");
    }
    
    protected void onDisconnectInner(BaseConnector<BaseClientMessage> paramBaseConnector)
    {
      Debug.d("Closed Client-Connection from: '" + paramBaseConnector.getSocket().getRemoteSocketAddress() + "'");
    }
  }
}


/* Location:           C:\Users\Rodelle\Desktop\Attacknid\Tools\Attacknids-dex2jar.jar
 * Qualified Name:     org.anddev.andengine.extension.multiplayer.protocol.server.BaseClientConnectionListener
 * JD-Core Version:    0.7.0.1
 */