package org.anddev.andengine.extension.multiplayer.protocol.adt.message.client;

import org.anddev.andengine.extension.multiplayer.protocol.adt.message.BaseMessage;
import org.anddev.andengine.extension.multiplayer.protocol.util.constants.ClientMessageFlags;

public abstract class BaseClientMessage
  extends BaseMessage
  implements ClientMessageFlags
{
  public boolean equals(Object paramObject)
  {
    if (this == paramObject) {}
    BaseClientMessage localBaseClientMessage;
    do
    {
      return true;
      if (paramObject == null) {
        return false;
      }
      if (getClass() != paramObject.getClass()) {
        return false;
      }
      localBaseClientMessage = (BaseClientMessage)paramObject;
    } while (getFlag() == localBaseClientMessage.getFlag());
    return false;
  }
}


/* Location:           C:\Users\Rodelle\Desktop\Attacknid\Tools\Attacknids-dex2jar.jar
 * Qualified Name:     org.anddev.andengine.extension.multiplayer.protocol.adt.message.client.BaseClientMessage
 * JD-Core Version:    0.7.0.1
 */