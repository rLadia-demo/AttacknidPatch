package org.anddev.andengine.extension.multiplayer.protocol.shared;

import java.io.DataInputStream;
import java.io.IOException;
import org.anddev.andengine.extension.multiplayer.protocol.adt.message.IMessage;

public abstract class BaseMessageExtractor<M extends IMessage>
{
  public abstract M readMessage(short paramShort, DataInputStream paramDataInputStream)
    throws IOException;
  
  public short readMessageFlag(DataInputStream paramDataInputStream)
    throws IOException
  {
    return paramDataInputStream.readShort();
  }
}


/* Location:           C:\Users\Rodelle\Desktop\Attacknid\Tools\Attacknids-dex2jar.jar
 * Qualified Name:     org.anddev.andengine.extension.multiplayer.protocol.shared.BaseMessageExtractor
 * JD-Core Version:    0.7.0.1
 */