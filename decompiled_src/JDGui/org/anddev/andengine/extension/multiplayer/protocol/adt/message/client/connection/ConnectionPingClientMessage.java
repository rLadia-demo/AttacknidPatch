package org.anddev.andengine.extension.multiplayer.protocol.adt.message.client.connection;

import java.io.DataInputStream;
import java.io.DataOutputStream;
import java.io.IOException;
import org.anddev.andengine.extension.multiplayer.protocol.adt.message.client.BaseClientMessage;

public class ConnectionPingClientMessage
  extends BaseClientMessage
{
  private final long mTimestamp;
  
  public ConnectionPingClientMessage()
  {
    this(System.currentTimeMillis());
  }
  
  public ConnectionPingClientMessage(long paramLong)
  {
    this.mTimestamp = paramLong;
  }
  
  public ConnectionPingClientMessage(DataInputStream paramDataInputStream)
    throws IOException
  {
    this.mTimestamp = paramDataInputStream.readLong();
  }
  
  public boolean equals(Object paramObject)
  {
    if (this == paramObject) {}
    ConnectionPingClientMessage localConnectionPingClientMessage;
    do
    {
      return true;
      if (paramObject == null) {
        return false;
      }
      if (getClass() != paramObject.getClass()) {
        return false;
      }
      localConnectionPingClientMessage = (ConnectionPingClientMessage)paramObject;
    } while ((getFlag() == localConnectionPingClientMessage.getFlag()) && (getTimestamp() == localConnectionPingClientMessage.getTimestamp()));
    return false;
  }
  
  public short getFlag()
  {
    return -32766;
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
 * Qualified Name:     org.anddev.andengine.extension.multiplayer.protocol.adt.message.client.connection.ConnectionPingClientMessage
 * JD-Core Version:    0.7.0.1
 */