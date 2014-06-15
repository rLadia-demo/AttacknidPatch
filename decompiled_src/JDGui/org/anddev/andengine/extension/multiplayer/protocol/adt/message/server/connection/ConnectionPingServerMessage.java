package org.anddev.andengine.extension.multiplayer.protocol.adt.message.server.connection;

import java.io.DataInputStream;
import java.io.DataOutputStream;
import java.io.IOException;
import org.anddev.andengine.extension.multiplayer.protocol.adt.message.server.BaseServerMessage;

public class ConnectionPingServerMessage
  extends BaseServerMessage
{
  private final long mTimestamp;
  
  public ConnectionPingServerMessage()
  {
    this(System.currentTimeMillis());
  }
  
  public ConnectionPingServerMessage(long paramLong)
  {
    this.mTimestamp = paramLong;
  }
  
  public ConnectionPingServerMessage(DataInputStream paramDataInputStream)
    throws IOException
  {
    this.mTimestamp = paramDataInputStream.readLong();
  }
  
  public boolean equals(Object paramObject)
  {
    if (this == paramObject) {}
    ConnectionPingServerMessage localConnectionPingServerMessage;
    do
    {
      return true;
      if (paramObject == null) {
        return false;
      }
      if (getClass() != paramObject.getClass()) {
        return false;
      }
      localConnectionPingServerMessage = (ConnectionPingServerMessage)paramObject;
    } while ((getFlag() == localConnectionPingServerMessage.getFlag()) && (getTimestamp() == localConnectionPingServerMessage.getTimestamp()));
    return false;
  }
  
  public short getFlag()
  {
    return -32764;
  }
  
  public long getTimestamp()
  {
    return this.mTimestamp;
  }
  
  protected void onAppendTransmissionDataForToString(StringBuilder paramStringBuilder)
  {
    paramStringBuilder.append(", getTimestamp()=").append(this.mTimestamp);
  }
  
  public void onWriteTransmissionData(DataOutputStream paramDataOutputStream)
    throws IOException
  {
    paramDataOutputStream.writeLong(this.mTimestamp);
  }
}


/* Location:           C:\Users\Rodelle\Desktop\Attacknid\Tools\Attacknids-dex2jar.jar
 * Qualified Name:     org.anddev.andengine.extension.multiplayer.protocol.adt.message.server.connection.ConnectionPingServerMessage
 * JD-Core Version:    0.7.0.1
 */