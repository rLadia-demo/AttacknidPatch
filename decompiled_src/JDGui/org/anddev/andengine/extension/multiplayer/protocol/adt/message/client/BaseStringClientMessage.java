package org.anddev.andengine.extension.multiplayer.protocol.adt.message.client;

import java.io.DataInputStream;
import java.io.DataOutputStream;
import java.io.IOException;

public abstract class BaseStringClientMessage
  extends BaseClientMessage
{
  protected String mString;
  
  public BaseStringClientMessage(DataInputStream paramDataInputStream)
    throws IOException
  {
    this.mString = paramDataInputStream.readUTF();
  }
  
  public BaseStringClientMessage(String paramString)
  {
    this.mString = paramString;
  }
  
  public boolean equals(Object paramObject)
  {
    if (this == paramObject) {}
    BaseStringClientMessage localBaseStringClientMessage;
    do
    {
      return true;
      if (paramObject == null) {
        return false;
      }
      if (getClass() != paramObject.getClass()) {
        return false;
      }
      localBaseStringClientMessage = (BaseStringClientMessage)paramObject;
    } while ((getFlag() == localBaseStringClientMessage.getFlag()) && (getString() == localBaseStringClientMessage.getString()));
    return false;
  }
  
  public String getString()
  {
    return this.mString;
  }
  
  protected void onAppendTransmissionDataForToString(StringBuilder paramStringBuilder)
  {
    paramStringBuilder.append(", getString()=").append('"').append(getString()).append('"');
  }
  
  public void onWriteTransmissionData(DataOutputStream paramDataOutputStream)
    throws IOException
  {
    paramDataOutputStream.writeUTF(getString());
  }
}


/* Location:           C:\Users\Rodelle\Desktop\Attacknid\Tools\Attacknids-dex2jar.jar
 * Qualified Name:     org.anddev.andengine.extension.multiplayer.protocol.adt.message.client.BaseStringClientMessage
 * JD-Core Version:    0.7.0.1
 */