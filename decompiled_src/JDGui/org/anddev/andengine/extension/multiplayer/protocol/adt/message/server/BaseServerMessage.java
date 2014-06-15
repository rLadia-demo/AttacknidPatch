package org.anddev.andengine.extension.multiplayer.protocol.adt.message.server;

import org.anddev.andengine.extension.multiplayer.protocol.adt.message.BaseMessage;
import org.anddev.andengine.extension.multiplayer.protocol.util.constants.ServerMessageFlags;

public abstract class BaseServerMessage
  extends BaseMessage
  implements ServerMessageFlags
{
  public boolean equals(Object paramObject)
  {
    if (this == paramObject) {}
    BaseServerMessage localBaseServerMessage;
    do
    {
      return true;
      if (paramObject == null) {
        return false;
      }
      if (getClass() != paramObject.getClass()) {
        return false;
      }
      localBaseServerMessage = (BaseServerMessage)paramObject;
    } while (getFlag() == localBaseServerMessage.getFlag());
    return false;
  }
}


/* Location:           C:\Users\Rodelle\Desktop\Attacknid\Tools\Attacknids-dex2jar.jar
 * Qualified Name:     org.anddev.andengine.extension.multiplayer.protocol.adt.message.server.BaseServerMessage
 * JD-Core Version:    0.7.0.1
 */