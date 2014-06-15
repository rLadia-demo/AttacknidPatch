package org.anddev.andengine.extension.multiplayer.protocol.server;

import java.io.DataInputStream;
import java.io.IOException;
import org.anddev.andengine.extension.multiplayer.protocol.adt.message.client.BaseClientMessage;
import org.anddev.andengine.extension.multiplayer.protocol.adt.message.client.connection.ConnectionCloseClientMessage;
import org.anddev.andengine.extension.multiplayer.protocol.adt.message.client.connection.ConnectionEstablishClientMessage;
import org.anddev.andengine.extension.multiplayer.protocol.adt.message.client.connection.ConnectionPingClientMessage;
import org.anddev.andengine.extension.multiplayer.protocol.adt.message.client.connection.ConnectionPongClientMessage;
import org.anddev.andengine.extension.multiplayer.protocol.shared.BaseMessageExtractor;
import org.anddev.andengine.extension.multiplayer.protocol.util.constants.ClientMessageFlags;

public class ClientMessageExtractor
  extends BaseMessageExtractor<BaseClientMessage>
  implements ClientMessageFlags
{
  public BaseClientMessage readMessage(short paramShort, DataInputStream paramDataInputStream)
    throws IOException
  {
    switch (paramShort)
    {
    default: 
      throw new IllegalArgumentException("Unknown flag: " + paramShort);
    case -32768: 
      return new ConnectionEstablishClientMessage(paramDataInputStream);
    case -32767: 
      return new ConnectionCloseClientMessage(paramDataInputStream);
    case -32766: 
      return new ConnectionPingClientMessage(paramDataInputStream);
    }
    return new ConnectionPongClientMessage(paramDataInputStream);
  }
}


/* Location:           C:\Users\Rodelle\Desktop\Attacknid\Tools\Attacknids-dex2jar.jar
 * Qualified Name:     org.anddev.andengine.extension.multiplayer.protocol.server.ClientMessageExtractor
 * JD-Core Version:    0.7.0.1
 */