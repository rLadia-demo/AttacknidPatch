package org.anddev.andengine.extension.multiplayer.protocol.shared;

import org.anddev.andengine.extension.multiplayer.protocol.adt.message.IMessage;

public abstract class BaseConnectionListener<M extends IMessage, C extends BaseConnector<M>>
{
  private boolean mDisconnectCalled = false;
  
  public void onConnect(C paramC)
  {
    onConnectInner(paramC);
  }
  
  protected abstract void onConnectInner(C paramC);
  
  public void onDisconnect(C paramC)
  {
    if (this.mDisconnectCalled) {
      return;
    }
    this.mDisconnectCalled = true;
    onDisconnectInner(paramC);
  }
  
  protected abstract void onDisconnectInner(C paramC);
}


/* Location:           C:\Users\Rodelle\Desktop\Attacknid\Tools\Attacknids-dex2jar.jar
 * Qualified Name:     org.anddev.andengine.extension.multiplayer.protocol.shared.BaseConnectionListener
 * JD-Core Version:    0.7.0.1
 */