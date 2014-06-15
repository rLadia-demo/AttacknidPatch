package org.anddev.andengine.extension.multiplayer.protocol.adt.message.client;

import java.io.DataInputStream;
import java.io.DataOutputStream;
import java.io.IOException;

public abstract class BaseCharacterClientMessage
  extends BaseClientMessage
{
  protected char mCharacter;
  
  public BaseCharacterClientMessage(char paramChar)
  {
    this.mCharacter = paramChar;
  }
  
  public BaseCharacterClientMessage(DataInputStream paramDataInputStream)
    throws IOException
  {
    this.mCharacter = paramDataInputStream.readChar();
  }
  
  public boolean equals(Object paramObject)
  {
    if (this == paramObject) {}
    BaseCharacterClientMessage localBaseCharacterClientMessage;
    do
    {
      return true;
      if (paramObject == null) {
        return false;
      }
      if (getClass() != paramObject.getClass()) {
        return false;
      }
      localBaseCharacterClientMessage = (BaseCharacterClientMessage)paramObject;
    } while ((getFlag() == localBaseCharacterClientMessage.getFlag()) && (getCharacter() == localBaseCharacterClientMessage.getCharacter()));
    return false;
  }
  
  public char getCharacter()
  {
    return this.mCharacter;
  }
  
  protected void onAppendTransmissionDataForToString(StringBuilder paramStringBuilder)
  {
    paramStringBuilder.append(", getCharacter()=").append('\'').append(getCharacter()).append('\'');
  }
  
  public void onWriteTransmissionData(DataOutputStream paramDataOutputStream)
    throws IOException
  {
    paramDataOutputStream.writeChar(getCharacter());
  }
}


/* Location:           C:\Users\Rodelle\Desktop\Attacknid\Tools\Attacknids-dex2jar.jar
 * Qualified Name:     org.anddev.andengine.extension.multiplayer.protocol.adt.message.client.BaseCharacterClientMessage
 * JD-Core Version:    0.7.0.1
 */