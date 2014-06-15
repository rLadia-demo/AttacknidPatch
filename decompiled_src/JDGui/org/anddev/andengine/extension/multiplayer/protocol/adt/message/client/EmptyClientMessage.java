package org.anddev.andengine.extension.multiplayer.protocol.adt.message.client;

import java.io.DataInputStream;
import java.io.DataOutputStream;
import java.io.IOException;

public abstract class EmptyClientMessage
  extends BaseClientMessage
{
  public EmptyClientMessage() {}
  
  public EmptyClientMessage(DataInputStream paramDataInputStream)
    throws IOException
  {}
  
  protected void onAppendTransmissionDataForToString(StringBuilder paramStringBuilder) {}
  
  protected void onWriteTransmissionData(DataOutputStream paramDataOutputStream)
    throws IOException
  {}
}


/* Location:           C:\Users\Rodelle\Desktop\Attacknid\Tools\Attacknids-dex2jar.jar
 * Qualified Name:     org.anddev.andengine.extension.multiplayer.protocol.adt.message.client.EmptyClientMessage
 * JD-Core Version:    0.7.0.1
 */