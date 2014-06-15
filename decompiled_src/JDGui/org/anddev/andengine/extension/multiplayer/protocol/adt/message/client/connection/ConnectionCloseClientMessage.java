package org.anddev.andengine.extension.multiplayer.protocol.adt.message.client.connection;

import java.io.DataInputStream;
import java.io.DataOutputStream;
import java.io.IOException;
import org.anddev.andengine.extension.multiplayer.protocol.adt.message.client.BaseClientMessage;

public class ConnectionCloseClientMessage
  extends BaseClientMessage
{
  public ConnectionCloseClientMessage() {}
  
  public ConnectionCloseClientMessage(DataInputStream paramDataInputStream)
    throws IOException
  {}
  
  public short getFlag()
  {
    return -32767;
  }
  
  protected void onAppendTransmissionDataForToString(StringBuilder paramStringBuilder) {}
  
  public void onWriteTransmissionData(DataOutputStream paramDataOutputStream)
    throws IOException
  {}
}


/* Location:           C:\Users\Rodelle\Desktop\Attacknid\Tools\Attacknids-dex2jar.jar
 * Qualified Name:     org.anddev.andengine.extension.multiplayer.protocol.adt.message.client.connection.ConnectionCloseClientMessage
 * JD-Core Version:    0.7.0.1
 */