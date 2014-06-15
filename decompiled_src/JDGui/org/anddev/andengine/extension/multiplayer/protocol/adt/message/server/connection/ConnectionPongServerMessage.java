package org.anddev.andengine.extension.multiplayer.protocol.adt.message.server.connection;

import java.io.DataInputStream;
import java.io.DataOutputStream;
import java.io.IOException;
import org.anddev.andengine.extension.multiplayer.protocol.adt.message.client.connection.ConnectionPingClientMessage;
import org.anddev.andengine.extension.multiplayer.protocol.adt.message.server.BaseServerMessage;

public class ConnectionPongServerMessage
  extends BaseServerMessage
{
  private final long mOriginalPingTimestamp;
  
  public ConnectionPongServerMessage(long paramLong)
  {
    this.mOriginalPingTimestamp = paramLong;
  }
  
  public ConnectionPongServerMessage(DataInputStream paramDataInputStream)
    throws IOException
  {
    this.mOriginalPingTimestamp = paramDataInputStream.readLong();
  }
  
  public ConnectionPongServerMessage(ConnectionPingClientMessage paramConnectionPingClientMessage)
  {
    this(paramConnectionPingClientMessage.getTimestamp());
  }
  
  public boolean equals(Object paramObject)
  {
    if (this == paramObject) {}
    ConnectionPongServerMessage localConnectionPongServerMessage;
    do
    {
      return true;
      if (paramObject == null) {
        return false;
      }
      if (getClass() != paramObject.getClass()) {
        return false;
      }
      localConnectionPongServerMessage = (ConnectionPongServerMessage)paramObject;
    } while ((getFlag() == localConnectionPongServerMessage.getFlag()) && (getOriginalPingTimestamp() == localConnectionPongServerMessage.getOriginalPingTimestamp()));
    return false;
  }
  
  public short getFlag()
  {
    return -32764;
  }
  
  public long getOriginalPingTimestamp()
  {
    return this.mOriginalPingTimestamp;
  }
  
  protected void onAppendTransmissionDataForToString(StringBuilder paramStringBuilder)
  {
    paramStringBuilder.append(", getOriginalPingTimestamp()=").append(this.mOriginalPingTimestamp);
  }
  
  public void onWriteTransmissionData(DataOutputStream paramDataOutputStream)
    throws IOException
  {
    paramDataOutputStream.writeLong(this.mOriginalPingTimestamp);
  }
}


/* Location:           C:\Users\Rodelle\Desktop\Attacknid\Tools\Attacknids-dex2jar.jar
 * Qualified Name:     org.anddev.andengine.extension.multiplayer.protocol.adt.message.server.connection.ConnectionPongServerMessage
 * JD-Core Version:    0.7.0.1
 */