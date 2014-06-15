package org.anddev.andengine.extension.multiplayer.protocol.adt.message.client;

import java.io.DataInputStream;
import java.io.DataOutputStream;
import java.io.IOException;

public abstract class BaseIntegerClientMessage
  extends BaseClientMessage
{
  protected int mInteger;
  
  public BaseIntegerClientMessage(int paramInt)
  {
    this.mInteger = paramInt;
  }
  
  public BaseIntegerClientMessage(DataInputStream paramDataInputStream)
    throws IOException
  {
    this.mInteger = paramDataInputStream.readInt();
  }
  
  public boolean equals(Object paramObject)
  {
    if (this == paramObject) {}
    BaseIntegerClientMessage localBaseIntegerClientMessage;
    do
    {
      return true;
      if (paramObject == null) {
        return false;
      }
      if (getClass() != paramObject.getClass()) {
        return false;
      }
      localBaseIntegerClientMessage = (BaseIntegerClientMessage)paramObject;
    } while ((getFlag() == localBaseIntegerClientMessage.getFlag()) && (getInteger() == localBaseIntegerClientMessage.getInteger()));
    return false;
  }
  
  public int getInteger()
  {
    return this.mInteger;
  }
  
  protected void onAppendTransmissionDataForToString(StringBuilder paramStringBuilder)
  {
    paramStringBuilder.append(", getInteger()=").append(getInteger());
  }
  
  public void onWriteTransmissionData(DataOutputStream paramDataOutputStream)
    throws IOException
  {
    paramDataOutputStream.writeInt(getInteger());
  }
}


/* Location:           C:\Users\Rodelle\Desktop\Attacknid\Tools\Attacknids-dex2jar.jar
 * Qualified Name:     org.anddev.andengine.extension.multiplayer.protocol.adt.message.client.BaseIntegerClientMessage
 * JD-Core Version:    0.7.0.1
 */