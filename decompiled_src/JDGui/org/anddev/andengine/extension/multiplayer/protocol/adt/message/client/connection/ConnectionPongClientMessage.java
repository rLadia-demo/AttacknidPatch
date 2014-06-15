package org.anddev.andengine.extension.multiplayer.protocol.adt.message.client.connection;

import java.io.DataInputStream;
import java.io.DataOutputStream;
import java.io.IOException;
import org.anddev.andengine.extension.multiplayer.protocol.adt.message.client.BaseClientMessage;
import org.anddev.andengine.extension.multiplayer.protocol.adt.message.server.connection.ConnectionPingServerMessage;

public class ConnectionPongClientMessage
  extends BaseClientMessage
{
  private final long mOriginalPingTimestamp;
  
  public ConnectionPongClientMessage(long paramLong)
  {
    this.mOriginalPingTimestamp = paramLong;
  }
  
  public ConnectionPongClientMessage(DataInputStream paramDataInputStream)
    throws IOException
  {
    this.mOriginalPingTimestamp = paramDataInputStream.readLong();
  }
  
  public ConnectionPongClientMessage(ConnectionPingServerMessage paramConnectionPingServerMessage)
  {
    this(paramConnectionPingServerMessage.getTimestamp());
  }
  
  public boolean equals(Object paramObject)
  {
    if (this == paramObject) {}
    ConnectionPongClientMessage localConnectionPongClientMessage;
    do
    {
      return true;
      if (paramObject == null) {
        return false;
      }
      if (getClass() != paramObject.getClass()) {
        return false;
      }
      localConnectionPongClientMessage = (ConnectionPongClientMessage)paramObject;
    } while ((getFlag() == localConnectionPongClientMessage.getFlag()) && (getOriginalPingTimestamp() == localConnectionPongClientMessage.getOriginalPingTimestamp()));
    return false;
  }
  
  public short getFlag()
  {
    return -32765;
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
 * Qualified Name:     org.anddev.andengine.extension.multiplayer.protocol.adt.message.client.connection.ConnectionPongClientMessage
 * JD-Core Version:    0.7.0.1
 */