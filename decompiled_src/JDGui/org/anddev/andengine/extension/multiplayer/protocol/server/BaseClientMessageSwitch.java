package org.anddev.andengine.extension.multiplayer.protocol.server;

import java.io.IOException;
import org.anddev.andengine.extension.multiplayer.protocol.adt.message.client.BaseClientMessage;
import org.anddev.andengine.extension.multiplayer.protocol.adt.message.client.connection.ConnectionCloseClientMessage;
import org.anddev.andengine.extension.multiplayer.protocol.adt.message.client.connection.ConnectionEstablishClientMessage;
import org.anddev.andengine.extension.multiplayer.protocol.adt.message.client.connection.ConnectionPingClientMessage;
import org.anddev.andengine.extension.multiplayer.protocol.adt.message.client.connection.ConnectionPongClientMessage;
import org.anddev.andengine.extension.multiplayer.protocol.adt.message.server.connection.ConnectionAcceptedServerMessage;
import org.anddev.andengine.extension.multiplayer.protocol.adt.message.server.connection.ConnectionPongServerMessage;
import org.anddev.andengine.extension.multiplayer.protocol.adt.message.server.connection.ConnectionRefusedServerMessage;
import org.anddev.andengine.extension.multiplayer.protocol.shared.BaseConnectionListener;
import org.anddev.andengine.extension.multiplayer.protocol.util.constants.ClientMessageFlags;

public abstract class BaseClientMessageSwitch
  implements ClientMessageFlags, IClientMessageSwitch
{
  public void doSwitch(ClientConnector paramClientConnector, BaseClientMessage paramBaseClientMessage)
    throws IOException
  {
    switch (paramBaseClientMessage.getFlag())
    {
    default: 
      return;
    case -32768: 
      onHandleConnectionEstablishClientMessage(paramClientConnector, (ConnectionEstablishClientMessage)paramBaseClientMessage);
      return;
    case -32767: 
      onHandleConnectionCloseClientMessage(paramClientConnector, (ConnectionCloseClientMessage)paramBaseClientMessage);
      return;
    case -32766: 
      onHandleConnectionPingClientMessage(paramClientConnector, (ConnectionPingClientMessage)paramBaseClientMessage);
      return;
    }
    onHandleConnectionPongClientMessage(paramClientConnector, (ConnectionPongClientMessage)paramBaseClientMessage);
  }
  
  protected void onHandleConnectionCloseClientMessage(ClientConnector paramClientConnector, ConnectionCloseClientMessage paramConnectionCloseClientMessage)
    throws IOException
  {
    if (paramClientConnector.hasConnectionListener()) {
      paramClientConnector.getConnectionListener().onDisconnect(paramClientConnector);
    }
  }
  
  protected void onHandleConnectionEstablishClientMessage(ClientConnector paramClientConnector, ConnectionEstablishClientMessage paramConnectionEstablishClientMessage)
    throws IOException
  {
    if (paramConnectionEstablishClientMessage.getProtocolVersion() == 1)
    {
      paramClientConnector.sendServerMessage(new ConnectionAcceptedServerMessage());
      return;
    }
    paramClientConnector.sendServerMessage(new ConnectionRefusedServerMessage());
  }
  
  protected void onHandleConnectionPingClientMessage(ClientConnector paramClientConnector, ConnectionPingClientMessage paramConnectionPingClientMessage)
    throws IOException
  {
    paramClientConnector.sendServerMessage(new ConnectionPongServerMessage(paramConnectionPingClientMessage));
  }
  
  protected void onHandleConnectionPongClientMessage(ClientConnector paramClientConnector, ConnectionPongClientMessage paramConnectionPongClientMessage) {}
}


/* Location:           C:\Users\Rodelle\Desktop\Attacknid\Tools\Attacknids-dex2jar.jar
 * Qualified Name:     org.anddev.andengine.extension.multiplayer.protocol.server.BaseClientMessageSwitch
 * JD-Core Version:    0.7.0.1
 */