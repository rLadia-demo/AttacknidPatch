package org.anddev.andengine.extension.multiplayer.protocol.adt.message;

import java.io.DataOutputStream;
import java.io.IOException;

public abstract interface IMessage
{
  public abstract void transmit(DataOutputStream paramDataOutputStream)
    throws IOException;
}


/* Location:           C:\Users\Rodelle\Desktop\Attacknid\Tools\Attacknids-dex2jar.jar
 * Qualified Name:     org.anddev.andengine.extension.multiplayer.protocol.adt.message.IMessage
 * JD-Core Version:    0.7.0.1
 */