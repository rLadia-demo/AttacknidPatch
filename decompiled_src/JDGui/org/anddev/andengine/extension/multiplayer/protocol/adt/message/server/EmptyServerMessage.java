package org.anddev.andengine.extension.multiplayer.protocol.adt.message.server;

import java.io.DataInputStream;
import java.io.DataOutputStream;
import java.io.IOException;

public abstract class EmptyServerMessage
  extends BaseServerMessage
{
  public EmptyServerMessage() {}
  
  public EmptyServerMessage(DataInputStream paramDataInputStream)
    throws IOException
  {}
  
  protected void onAppendTransmissionDataForToString(StringBuilder paramStringBuilder) {}
  
  protected void onWriteTransmissionData(DataOutputStream paramDataOutputStream)
    throws IOException
  {}
}


/* Location:           C:\Users\Rodelle\Desktop\Attacknid\Tools\Attacknids-dex2jar.jar
 * Qualified Name:     org.anddev.andengine.extension.multiplayer.protocol.adt.message.server.EmptyServerMessage
 * JD-Core Version:    0.7.0.1
 */