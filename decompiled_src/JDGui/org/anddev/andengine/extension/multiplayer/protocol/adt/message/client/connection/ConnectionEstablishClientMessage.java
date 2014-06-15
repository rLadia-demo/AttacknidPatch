package org.anddev.andengine.extension.multiplayer.protocol.adt.message.client.connection;

import java.io.DataInputStream;
import java.io.DataOutputStream;
import java.io.IOException;
import org.anddev.andengine.extension.multiplayer.protocol.adt.message.client.BaseClientMessage;

public class ConnectionEstablishClientMessage
  extends BaseClientMessage
{
  private final int mProtocolVersion;
  
  public ConnectionEstablishClientMessage()
  {
    this(1);
  }
  
  public ConnectionEstablishClientMessage(int paramInt)
  {
    this.mProtocolVersion = paramInt;
  }
  
  public ConnectionEstablishClientMessage(DataInputStream paramDataInputStream)
    throws IOException
  {
    this.mProtocolVersion = paramDataInputStream.readInt();
  }
  
  public boolean equals(Object paramObject)
  {
    if (this == paramObject) {}
    ConnectionEstablishClientMessage localConnectionEstablishClientMessage;
    do
    {
      return true;
      if (paramObject == null) {
        return false;
      }
      if (getClass() != paramObject.getClass()) {
        return false;
      }
      localConnectionEstablishClientMessage = (ConnectionEstablishClientMessage)paramObject;
    } while ((getFlag() == localConnectionEstablishClientMessage.getFlag()) && (getProtocolVersion() == localConnectionEstablishClientMessage.getProtocolVersion()));
    return false;
  }
  
  public short getFlag()
  {
    return -32768;
  }
  
  public int getProtocolVersion()
  {
    return this.mProtocolVersion;
  }
  
  protected void onAppendTransmissionDataForToString(StringBuilder paramStringBuilder)
  {
    paramStringBuilder.append(", getProtocolVersion()=").append(this.mProtocolVersion);
  }
  
  public void onWriteTransmissionData(DataOutputStream paramDataOutputStream)
    throws IOException
  {
    paramDataOutputStream.writeInt(this.mProtocolVersion);
  }
}


/* Location:           C:\Users\Rodelle\Desktop\Attacknid\Tools\Attacknids-dex2jar.jar
 * Qualified Name:     org.anddev.andengine.extension.multiplayer.protocol.adt.message.client.connection.ConnectionEstablishClientMessage
 * JD-Core Version:    0.7.0.1
 */