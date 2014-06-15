package org.anddev.andengine.extension.multiplayer.protocol.client;

import java.io.IOException;
import org.anddev.andengine.extension.multiplayer.protocol.adt.message.client.connection.ConnectionPongClientMessage;
import org.anddev.andengine.extension.multiplayer.protocol.adt.message.server.BaseServerMessage;
import org.anddev.andengine.extension.multiplayer.protocol.adt.message.server.connection.ConnectionAcceptedServerMessage;
import org.anddev.andengine.extension.multiplayer.protocol.adt.message.server.connection.ConnectionCloseServerMessage;
import org.anddev.andengine.extension.multiplayer.protocol.adt.message.server.connection.ConnectionPingServerMessage;
import org.anddev.andengine.extension.multiplayer.protocol.adt.message.server.connection.ConnectionPongServerMessage;
import org.anddev.andengine.extension.multiplayer.protocol.adt.message.server.connection.ConnectionRefusedServerMessage;
import org.anddev.andengine.extension.multiplayer.protocol.shared.BaseConnectionListener;
import org.anddev.andengine.extension.multiplayer.protocol.util.constants.ServerMessageFlags;

public abstract class BaseServerMessageSwitch
  implements ServerMessageFlags, IServerMessageSwitch
{
  public void doSwitch(ServerConnector paramServerConnector, BaseServerMessage paramBaseServerMessage)
    throws IOException
  {
    switch (paramBaseServerMessage.getFlag())
    {
    default: 
      return;
    case -32768: 
      onHandleConnectionAcceptedServerMessage(paramServerConnector, (ConnectionAcceptedServerMessage)paramBaseServerMessage);
      return;
    case -32767: 
      onHandleConnectionRefusedServerMessage(paramServerConnector, (ConnectionRefusedServerMessage)paramBaseServerMessage);
      return;
    case -32766: 
      onHandleConnectionCloseServerMessage(paramServerConnector, (ConnectionCloseServerMessage)paramBaseServerMessage);
      return;
    case -32765: 
      onHandleConnectionPingServerMessage(paramServerConnector, (ConnectionPingServerMessage)paramBaseServerMessage);
      return;
    }
    onHandleConnectionPongServerMessage(paramServerConnector, (ConnectionPongServerMessage)paramBaseServerMessage);
  }
  
  protected abstract void onHandleConnectionAcceptedServerMessage(ServerConnector paramServerConnector, ConnectionAcceptedServerMessage paramConnectionAcceptedServerMessage);
  
  protected void onHandleConnectionCloseServerMessage(ServerConnector paramServerConnector, ConnectionCloseServerMessage paramConnectionCloseServerMessage)
  {
    if (paramServerConnector.hasConnectionListener()) {
      paramServerConnector.getConnectionListener().onDisconnect(paramServerConnector);
    }
  }
  
  protected void onHandleConnectionPingServerMessage(ServerConnector paramServerConnector, ConnectionPingServerMessage paramConnectionPingServerMessage)
    throws IOException
  {
    paramServerConnector.sendClientMessage(new ConnectionPongClientMessage(paramConnectionPingServerMessage));
  }
  
  protected void onHandleConnectionPongServerMessage(ServerConnector paramServerConnector, ConnectionPongServerMessage paramConnectionPongServerMessage) {}
  
  protected abstract void onHandleConnectionRefusedServerMessage(ServerConnector paramServerConnector, ConnectionRefusedServerMessage paramConnectionRefusedServerMessage);
}


/* Location:           C:\Users\Rodelle\Desktop\Attacknid\Tools\Attacknids-dex2jar.jar
 * Qualified Name:     org.anddev.andengine.extension.multiplayer.protocol.client.BaseServerMessageSwitch
 * JD-Core Version:    0.7.0.1
 */