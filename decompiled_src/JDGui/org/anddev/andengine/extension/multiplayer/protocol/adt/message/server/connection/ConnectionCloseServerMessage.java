package org.anddev.andengine.extension.multiplayer.protocol.adt.message.server.connection;

import java.io.DataInputStream;
import java.io.DataOutputStream;
import java.io.IOException;
import org.anddev.andengine.extension.multiplayer.protocol.adt.message.server.BaseServerMessage;

public class ConnectionCloseServerMessage
  extends BaseServerMessage
{
  public ConnectionCloseServerMessage() {}
  
  public ConnectionCloseServerMessage(DataInputStream paramDataInputStream)
    throws IOException
  {}
  
  public short getFlag()
  {
    return -32766;
  }
  
  protected void onAppendTransmissionDataForToString(StringBuilder paramStringBuilder) {}
  
  protected void onWriteTransmissionData(DataOutputStream paramDataOutputStream)
    throws IOException
  {}
}


/* Location:           C:\Users\Rodelle\Desktop\Attacknid\Tools\Attacknids-dex2jar.jar
 * Qualified Name:     org.anddev.andengine.extension.multiplayer.protocol.adt.message.server.connection.ConnectionCloseServerMessage
 * JD-Core Version:    0.7.0.1
 */