package org.anddev.andengine.extension.multiplayer.protocol.client;

import java.io.DataInputStream;
import java.io.IOException;
import org.anddev.andengine.extension.multiplayer.protocol.adt.message.server.BaseServerMessage;
import org.anddev.andengine.extension.multiplayer.protocol.adt.message.server.connection.ConnectionAcceptedServerMessage;
import org.anddev.andengine.extension.multiplayer.protocol.adt.message.server.connection.ConnectionCloseServerMessage;
import org.anddev.andengine.extension.multiplayer.protocol.adt.message.server.connection.ConnectionPingServerMessage;
import org.anddev.andengine.extension.multiplayer.protocol.adt.message.server.connection.ConnectionPongServerMessage;
import org.anddev.andengine.extension.multiplayer.protocol.adt.message.server.connection.ConnectionRefusedServerMessage;
import org.anddev.andengine.extension.multiplayer.protocol.shared.BaseMessageExtractor;
import org.anddev.andengine.extension.multiplayer.protocol.util.constants.ServerMessageFlags;

public class ServerMessageExtractor
  extends BaseMessageExtractor<BaseServerMessage>
  implements ServerMessageFlags
{
  public BaseServerMessage readMessage(short paramShort, DataInputStream paramDataInputStream)
    throws IOException
  {
    switch (paramShort)
    {
    default: 
      throw new IllegalArgumentException("Unknown flag: " + paramShort);
    case -32768: 
      return new ConnectionAcceptedServerMessage(paramDataInputStream);
    case -32767: 
      return new ConnectionRefusedServerMessage(paramDataInputStream);
    case -32766: 
      return new ConnectionCloseServerMessage(paramDataInputStream);
    case -32765: 
      return new ConnectionPingServerMessage(paramDataInputStream);
    }
    return new ConnectionPongServerMessage(paramDataInputStream);
  }
}


/* Location:           C:\Users\Rodelle\Desktop\Attacknid\Tools\Attacknids-dex2jar.jar
 * Qualified Name:     org.anddev.andengine.extension.multiplayer.protocol.client.ServerMessageExtractor
 * JD-Core Version:    0.7.0.1
 */