package org.anddev.andengine.extension.multiplayer.protocol.server;

import java.io.IOException;
import java.net.ServerSocket;
import java.net.Socket;
import java.net.SocketException;
import java.util.ArrayList;
import java.util.Iterator;
import javax.net.ServerSocketFactory;
import org.anddev.andengine.extension.multiplayer.protocol.adt.message.server.BaseServerMessage;
import org.anddev.andengine.extension.multiplayer.protocol.util.constants.ProtocolConstants;
import org.anddev.andengine.util.Debug;
import org.anddev.andengine.util.SocketUtils;

public abstract class BaseServer<CC extends ClientConnector>
  extends Thread
  implements ProtocolConstants
{
  private final BaseClientConnectionListener mClientConnectionListener;
  protected final ArrayList<CC> mClientConnectors = new ArrayList();
  private boolean mRunning = false;
  private final int mServerPort;
  private ServerSocket mServerSocket;
  private final IServerStateListener mServerStateListener;
  private boolean mTerminated = false;
  
  public BaseServer()
  {
    this(4444);
  }
  
  public BaseServer(int paramInt)
  {
    this(paramInt, new BaseClientConnectionListener.DefaultClientConnectionListener());
  }
  
  public BaseServer(int paramInt, BaseClientConnectionListener paramBaseClientConnectionListener)
  {
    this(paramInt, paramBaseClientConnectionListener, new BaseServer.IServerStateListener.DefaultServerStateListener());
  }
  
  public BaseServer(int paramInt, BaseClientConnectionListener paramBaseClientConnectionListener, IServerStateListener paramIServerStateListener)
  {
    this.mServerStateListener = paramIServerStateListener;
    if (paramInt < 0)
    {
      this.mServerStateListener.onException(new IllegalArgumentException("Illegal port '< 0'."));
      throw new IllegalArgumentException();
    }
    this.mServerPort = paramInt;
    this.mClientConnectionListener = paramBaseClientConnectionListener;
    initName();
  }
  
  public BaseServer(int paramInt, IServerStateListener paramIServerStateListener)
  {
    this(paramInt, new BaseClientConnectionListener.DefaultClientConnectionListener(), paramIServerStateListener);
  }
  
  public BaseServer(BaseClientConnectionListener paramBaseClientConnectionListener)
  {
    this(4444, paramBaseClientConnectionListener);
  }
  
  public BaseServer(BaseClientConnectionListener paramBaseClientConnectionListener, IServerStateListener paramIServerStateListener)
  {
    this(4444, paramBaseClientConnectionListener, paramIServerStateListener);
  }
  
  public BaseServer(IServerStateListener paramIServerStateListener)
  {
    this(4444, paramIServerStateListener);
  }
  
  private void initName()
  {
    setName(getClass().getName());
  }
  
  protected void finalize()
    throws Throwable
  {
    interrupt();
    super.finalize();
  }
  
  public void interrupt()
  {
    try
    {
      this.mTerminated = true;
      super.interrupt();
      Iterator localIterator = this.mClientConnectors.iterator();
      for (;;)
      {
        if (!localIterator.hasNext())
        {
          this.mClientConnectors.clear();
          Thread.sleep(1000L);
          SocketUtils.closeSocket(this.mServerSocket);
          this.mRunning = false;
          return;
        }
        ((ClientConnector)localIterator.next()).interrupt();
      }
      return;
    }
    catch (Exception localException)
    {
      this.mServerStateListener.onException(localException);
    }
  }
  
  public boolean isRunning()
  {
    return this.mRunning;
  }
  
  public boolean isTerminated()
  {
    return this.mTerminated;
  }
  
  protected abstract CC newClientConnector(Socket paramSocket, BaseClientConnectionListener paramBaseClientConnectionListener)
    throws Exception;
  
  public void run()
  {
    this.mRunning = true;
    this.mTerminated = false;
    this.mServerStateListener.onStarted(this.mServerPort);
    try
    {
      Thread.currentThread().setPriority(1);
      this.mServerSocket = ServerSocketFactory.getDefault().createServerSocket(this.mServerPort);
      label44:
      boolean bool = Thread.interrupted();
      if (bool) {
        return;
      }
    }
    catch (Throwable localThrowable1)
    {
      ClientConnector localClientConnector;
      break label44;
    }
    finally
    {
      this.mRunning = false;
      this.mTerminated = true;
      SocketUtils.closeSocket(this.mServerSocket);
      this.mServerStateListener.onTerminated(this.mServerPort);
    }
  }
  
  public void sendBroadcastServerMessage(BaseServerMessage paramBaseServerMessage)
    throws IOException
  {
    Iterator localIterator;
    if ((this.mRunning) && (!this.mTerminated)) {
      localIterator = this.mClientConnectors.iterator();
    }
    for (;;)
    {
      if (!localIterator.hasNext()) {
        return;
      }
      ClientConnector localClientConnector = (ClientConnector)localIterator.next();
      try
      {
        localClientConnector.sendServerMessage(paramBaseServerMessage);
      }
      catch (IOException localIOException)
      {
        this.mServerStateListener.onException(localIOException);
      }
    }
  }
  
  public static abstract interface IServerStateListener
  {
    public abstract void onException(Throwable paramThrowable);
    
    public abstract void onStarted(int paramInt);
    
    public abstract void onTerminated(int paramInt);
    
    public static class DefaultServerStateListener
      implements BaseServer.IServerStateListener
    {
      public void onException(Throwable paramThrowable)
      {
        Debug.e(paramThrowable);
      }
      
      public void onStarted(int paramInt)
      {
        Debug.d("AndRemote-Server is listening on Port: " + paramInt);
      }
      
      public void onTerminated(int paramInt)
      {
        Debug.d("AndRemote-Server terminated on Port: " + paramInt);
      }
    }
  }
}


/* Location:           C:\Users\Rodelle\Desktop\Attacknid\Tools\Attacknids-dex2jar.jar
 * Qualified Name:     org.anddev.andengine.extension.multiplayer.protocol.server.BaseServer
 * JD-Core Version:    0.7.0.1
 */