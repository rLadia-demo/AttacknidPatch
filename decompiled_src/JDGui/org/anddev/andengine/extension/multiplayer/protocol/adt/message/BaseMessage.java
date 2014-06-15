package org.anddev.andengine.extension.multiplayer.protocol.adt.message;

import java.io.DataOutputStream;
import java.io.IOException;

public abstract class BaseMessage
  implements IMessage
{
  public boolean equals(Object paramObject)
  {
    if (this == paramObject) {}
    BaseMessage localBaseMessage;
    do
    {
      return true;
      if (paramObject == null) {
        return false;
      }
      if (getClass() != paramObject.getClass()) {
        return false;
      }
      localBaseMessage = (BaseMessage)paramObject;
    } while (getFlag() == localBaseMessage.getFlag());
    return false;
  }
  
  public abstract short getFlag();
  
  protected abstract void onAppendTransmissionDataForToString(StringBuilder paramStringBuilder);
  
  protected abstract void onWriteTransmissionData(DataOutputStream paramDataOutputStream)
    throws IOException;
  
  public String toString()
  {
    StringBuilder localStringBuilder = new StringBuilder();
    localStringBuilder.append(getClass().getSimpleName()).append("[getFlag()=").append(getFlag());
    onAppendTransmissionDataForToString(localStringBuilder);
    localStringBuilder.append("]");
    return localStringBuilder.toString();
  }
  
  public void transmit(DataOutputStream paramDataOutputStream)
    throws IOException
  {
    paramDataOutputStream.writeShort(getFlag());
    onWriteTransmissionData(paramDataOutputStream);
  }
}


/* Location:           C:\Users\Rodelle\Desktop\Attacknid\Tools\Attacknids-dex2jar.jar
 * Qualified Name:     org.anddev.andengine.extension.multiplayer.protocol.adt.message.BaseMessage
 * JD-Core Version:    0.7.0.1
 */