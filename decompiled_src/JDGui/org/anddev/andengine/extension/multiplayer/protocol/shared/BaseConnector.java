package org.anddev.andengine.extension.multiplayer.protocol.shared;

import java.io.DataInputStream;
import java.io.DataOutputStream;
import java.io.IOException;
import java.net.Socket;
import org.anddev.andengine.extension.multiplayer.protocol.adt.message.IMessage;
import org.anddev.andengine.util.SocketUtils;

public abstract class BaseConnector<M extends IMessage>
  extends Thread
{
  private boolean mConnectionCloseSent = false;
  private final BaseConnectionListener<M, BaseConnector<M>> mConnectionListener;
  private final DataInputStream mDataInputStream;
  private final DataOutputStream mDataOutputStream;
  private final BaseMessageExtractor<M> mMessageExtractor;
  private final IMessageSwitch<M> mMessageSwitch;
  private final Socket mSocket;
  
  public BaseConnector(Socket paramSocket, BaseConnectionListener<M, BaseConnector<M>> paramBaseConnectionListener, BaseMessageExtractor<M> paramBaseMessageExtractor, IMessageSwitch<M> paramIMessageSwitch)
    throws IOException
  {
    this.mSocket = paramSocket;
    this.mConnectionListener = paramBaseConnectionListener;
    this.mMessageExtractor = paramBaseMessageExtractor;
    this.mMessageSwitch = paramIMessageSwitch;
    this.mDataInputStream = new DataInputStream(paramSocket.getInputStream());
    this.mDataOutputStream = new DataOutputStream(paramSocket.getOutputStream());
  }
  
  private void closeConnection()
  {
    if ((!this.mConnectionCloseSent) && (this.mSocket != null) && (!this.mSocket.isClosed()))
    {
      this.mConnectionCloseSent = true;
      onSendConnectionClose();
    }
    SocketUtils.closeSocket(this.mSocket);
    if (this.mConnectionListener != null) {
      this.mConnectionListener.onDisconnect(this);
    }
  }
  
  public BaseConnectionListener<M, BaseConnector<M>> getConnectionListener()
  {
    return this.mConnectionListener;
  }
  
  protected DataInputStream getDataInputStream()
  {
    return this.mDataInputStream;
  }
  
  protected DataOutputStream getDataOutputStream()
  {
    return this.mDataOutputStream;
  }
  
  public IMessageSwitch<M> getMessageSwitch()
  {
    return this.mMessageSwitch;
  }
  
  public Socket getSocket()
  {
    return this.mSocket;
  }
  
  protected abstract void handleMessage(M paramM)
    throws IOException;
  
  public boolean hasConnectionListener()
  {
    return this.mConnectionListener != null;
  }
  
  public void interrupt()
  {
    closeConnection();
    super.interrupt();
  }
  
  protected abstract void onSendConnectionClose();
  
  /* Error */
  public void run()
  {
    // Byte code:
    //   0: aload_0
    //   1: getfield 35	org/anddev/andengine/extension/multiplayer/protocol/shared/BaseConnector:mConnectionListener	Lorg/anddev/andengine/extension/multiplayer/protocol/shared/BaseConnectionListener;
    //   4: ifnull +11 -> 15
    //   7: aload_0
    //   8: getfield 35	org/anddev/andengine/extension/multiplayer/protocol/shared/BaseConnector:mConnectionListener	Lorg/anddev/andengine/extension/multiplayer/protocol/shared/BaseConnectionListener;
    //   11: aload_0
    //   12: invokevirtual 111	org/anddev/andengine/extension/multiplayer/protocol/shared/BaseConnectionListener:onConnect	(Lorg/anddev/andengine/extension/multiplayer/protocol/shared/BaseConnector;)V
    //   15: invokestatic 115	java/lang/Thread:currentThread	()Ljava/lang/Thread;
    //   18: iconst_1
    //   19: invokevirtual 119	java/lang/Thread:setPriority	(I)V
    //   22: aload_0
    //   23: invokevirtual 122	org/anddev/andengine/extension/multiplayer/protocol/shared/BaseConnector:isInterrupted	()Z
    //   26: istore_3
    //   27: iload_3
    //   28: ifeq +8 -> 36
    //   31: aload_0
    //   32: invokespecial 99	org/anddev/andengine/extension/multiplayer/protocol/shared/BaseConnector:closeConnection	()V
    //   35: return
    //   36: aload_0
    //   37: getfield 37	org/anddev/andengine/extension/multiplayer/protocol/shared/BaseConnector:mMessageExtractor	Lorg/anddev/andengine/extension/multiplayer/protocol/shared/BaseMessageExtractor;
    //   40: aload_0
    //   41: getfield 52	org/anddev/andengine/extension/multiplayer/protocol/shared/BaseConnector:mDataInputStream	Ljava/io/DataInputStream;
    //   44: invokevirtual 128	org/anddev/andengine/extension/multiplayer/protocol/shared/BaseMessageExtractor:readMessageFlag	(Ljava/io/DataInputStream;)S
    //   47: istore 7
    //   49: aload_0
    //   50: aload_0
    //   51: getfield 37	org/anddev/andengine/extension/multiplayer/protocol/shared/BaseConnector:mMessageExtractor	Lorg/anddev/andengine/extension/multiplayer/protocol/shared/BaseMessageExtractor;
    //   54: iload 7
    //   56: aload_0
    //   57: getfield 52	org/anddev/andengine/extension/multiplayer/protocol/shared/BaseConnector:mDataInputStream	Ljava/io/DataInputStream;
    //   60: invokevirtual 132	org/anddev/andengine/extension/multiplayer/protocol/shared/BaseMessageExtractor:readMessage	(SLjava/io/DataInputStream;)Lorg/anddev/andengine/extension/multiplayer/protocol/adt/message/IMessage;
    //   63: invokevirtual 134	org/anddev/andengine/extension/multiplayer/protocol/shared/BaseConnector:handleMessage	(Lorg/anddev/andengine/extension/multiplayer/protocol/adt/message/IMessage;)V
    //   66: goto -44 -> 22
    //   69: astore 6
    //   71: aload_0
    //   72: invokevirtual 135	org/anddev/andengine/extension/multiplayer/protocol/shared/BaseConnector:interrupt	()V
    //   75: goto -53 -> 22
    //   78: astore_2
    //   79: aload_2
    //   80: invokestatic 141	org/anddev/andengine/util/Debug:e	(Ljava/lang/Throwable;)V
    //   83: aload_0
    //   84: invokespecial 99	org/anddev/andengine/extension/multiplayer/protocol/shared/BaseConnector:closeConnection	()V
    //   87: return
    //   88: astore 5
    //   90: aload_0
    //   91: invokevirtual 135	org/anddev/andengine/extension/multiplayer/protocol/shared/BaseConnector:interrupt	()V
    //   94: goto -72 -> 22
    //   97: astore_1
    //   98: aload_0
    //   99: invokespecial 99	org/anddev/andengine/extension/multiplayer/protocol/shared/BaseConnector:closeConnection	()V
    //   102: aload_1
    //   103: athrow
    //   104: astore 4
    //   106: aload 4
    //   108: invokestatic 141	org/anddev/andengine/util/Debug:e	(Ljava/lang/Throwable;)V
    //   111: goto -89 -> 22
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	114	0	this	BaseConnector
    //   97	6	1	localObject	java.lang.Object
    //   78	2	2	localThrowable1	java.lang.Throwable
    //   26	2	3	bool	boolean
    //   104	3	4	localThrowable2	java.lang.Throwable
    //   88	1	5	localEOFException	java.io.EOFException
    //   69	1	6	localSocketException	java.net.SocketException
    //   47	8	7	s	short
    // Exception table:
    //   from	to	target	type
    //   36	66	69	java/net/SocketException
    //   22	27	78	java/lang/Throwable
    //   71	75	78	java/lang/Throwable
    //   90	94	78	java/lang/Throwable
    //   106	111	78	java/lang/Throwable
    //   36	66	88	java/io/EOFException
    //   22	27	97	finally
    //   36	66	97	finally
    //   71	75	97	finally
    //   79	83	97	finally
    //   90	94	97	finally
    //   106	111	97	finally
    //   36	66	104	java/lang/Throwable
  }
}


/* Location:           C:\Users\Rodelle\Desktop\Attacknid\Tools\Attacknids-dex2jar.jar
 * Qualified Name:     org.anddev.andengine.extension.multiplayer.protocol.shared.BaseConnector
 * JD-Core Version:    0.7.0.1
 */