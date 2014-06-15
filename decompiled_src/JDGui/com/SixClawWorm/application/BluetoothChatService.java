package com.SixClawWorm.application;

import android.bluetooth.BluetoothAdapter;
import android.bluetooth.BluetoothDevice;
import android.bluetooth.BluetoothServerSocket;
import android.bluetooth.BluetoothSocket;
import android.content.Context;
import android.os.Bundle;
import android.os.Handler;
import android.os.Message;
import android.util.Log;
import com.SixClawWorm.utils.ProgressDialogHint;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.UUID;

public class BluetoothChatService
{
  public static boolean Bluetoothfail = true;
  private static final boolean D = true;
  private static final UUID MY_UUID_INSECURE;
  private static final UUID MY_UUID_SECURE = UUID.fromString("00001101-0000-1000-8000-00805F9B34FB");
  private static final String NAME_INSECURE = "BluetoothChatInsecure";
  private static final String NAME_SECURE = "BluetoothChatSecure";
  public static final int STATE_CONNECTED = 3;
  public static final int STATE_CONNECTING = 2;
  public static final int STATE_LISTEN = 1;
  public static final int STATE_NONE = 0;
  private static final String TAG = "BluetoothChatService";
  public static boolean firstUsed = true;
  private final BluetoothAdapter mAdapter = BluetoothAdapter.getDefaultAdapter();
  private ConnectThread mConnectThread;
  private ConnectedThread mConnectedThread;
  private final Handler mHandler;
  private AcceptThread mInsecureAcceptThread;
  private AcceptThread mSecureAcceptThread;
  private int mState = 0;
  
  static
  {
    MY_UUID_INSECURE = UUID.fromString("00001101-0000-1000-8000-00805F9B34FB");
  }
  
  public BluetoothChatService(Context paramContext, Handler paramHandler)
  {
    this.mHandler = paramHandler;
  }
  
  private void connectionFailed()
  {
    Message localMessage = this.mHandler.obtainMessage(5);
    Bundle localBundle = new Bundle();
    localBundle.putString("toast", "The connection fails");
    localMessage.setData(localBundle);
    this.mHandler.sendMessage(localMessage);
    start();
    com.SixClawWorm.utils.Param.ConntectSucceed = false;
    com.SixClawWorm.utils.Param.connecting = false;
    if (firstUsed) {
      ProgressDialogHint.Dismiss();
    }
    firstUsed = true;
  }
  
  private void connectionLost()
  {
    Message localMessage = this.mHandler.obtainMessage(5);
    Bundle localBundle = new Bundle();
    localBundle.putString("toast", "Device connection was lost");
    localMessage.setData(localBundle);
    this.mHandler.sendMessage(localMessage);
    start();
    com.SixClawWorm.utils.Param.ConntectSucceed = false;
    Bluetoothfail = false;
    com.SixClawWorm.utils.Param.connecting = false;
    BluetoothChat.mChatService = null;
  }
  
  private void setState(int paramInt)
  {
    try
    {
      Log.d("BluetoothChatService", "setState() " + this.mState + " -> " + paramInt);
      this.mState = paramInt;
      this.mHandler.obtainMessage(1, paramInt, -1).sendToTarget();
      return;
    }
    finally
    {
      localObject = finally;
      throw localObject;
    }
  }
  
  public void connect(BluetoothDevice paramBluetoothDevice, boolean paramBoolean)
  {
    try
    {
      Log.d("BluetoothChatService", "connect to: " + paramBluetoothDevice);
      if ((this.mState == 2) && (this.mConnectThread != null))
      {
        this.mConnectThread.cancel();
        this.mConnectThread = null;
      }
      if (this.mConnectedThread != null)
      {
        this.mConnectedThread.cancel();
        this.mConnectedThread = null;
      }
      this.mConnectThread = new ConnectThread(paramBluetoothDevice, paramBoolean);
      this.mConnectThread.start();
      setState(2);
      return;
    }
    finally {}
  }
  
  public void connected(BluetoothSocket paramBluetoothSocket, BluetoothDevice paramBluetoothDevice, String paramString)
  {
    try
    {
      Log.d("BluetoothChatService", "connected, Socket Type:" + paramString);
      if (this.mConnectThread != null)
      {
        this.mConnectThread.cancel();
        this.mConnectThread = null;
      }
      if (this.mConnectedThread != null)
      {
        this.mConnectedThread.cancel();
        this.mConnectedThread = null;
      }
      if (this.mSecureAcceptThread != null)
      {
        this.mSecureAcceptThread.cancel();
        this.mSecureAcceptThread = null;
      }
      if (this.mInsecureAcceptThread != null)
      {
        this.mInsecureAcceptThread.cancel();
        this.mInsecureAcceptThread = null;
      }
      this.mConnectedThread = new ConnectedThread(paramBluetoothSocket, paramString);
      this.mConnectedThread.start();
      Message localMessage = this.mHandler.obtainMessage(4);
      Bundle localBundle = new Bundle();
      localBundle.putString("device_name", paramBluetoothDevice.getName());
      localMessage.setData(localBundle);
      this.mHandler.sendMessage(localMessage);
      setState(3);
      return;
    }
    finally {}
  }
  
  public int getState()
  {
    try
    {
      int i = this.mState;
      return i;
    }
    finally
    {
      localObject = finally;
      throw localObject;
    }
  }
  
  public void start()
  {
    try
    {
      Log.d("BluetoothChatService", "start");
      Bluetoothfail = true;
      if (this.mConnectThread != null)
      {
        this.mConnectThread.cancel();
        this.mConnectThread = null;
      }
      if (this.mConnectedThread != null)
      {
        this.mConnectedThread.cancel();
        this.mConnectedThread = null;
      }
      setState(1);
      if (this.mSecureAcceptThread == null)
      {
        this.mSecureAcceptThread = new AcceptThread(true);
        this.mSecureAcceptThread.start();
      }
      if (this.mInsecureAcceptThread == null)
      {
        this.mInsecureAcceptThread = new AcceptThread(false);
        this.mInsecureAcceptThread.start();
      }
      return;
    }
    finally {}
  }
  
  public void stop()
  {
    try
    {
      Log.d("BluetoothChatService", "stop");
      if (this.mConnectThread != null)
      {
        this.mConnectThread.cancel();
        this.mConnectThread = null;
      }
      if (this.mConnectedThread != null)
      {
        this.mConnectedThread.cancel();
        this.mConnectedThread = null;
      }
      if (this.mSecureAcceptThread != null)
      {
        this.mSecureAcceptThread.cancel();
        this.mSecureAcceptThread = null;
      }
      if (this.mInsecureAcceptThread != null)
      {
        this.mInsecureAcceptThread.cancel();
        this.mInsecureAcceptThread = null;
      }
      setState(0);
      return;
    }
    finally {}
  }
  
  public void write(byte[] paramArrayOfByte)
  {
    try
    {
      if (this.mState != 3) {
        return;
      }
      ConnectedThread localConnectedThread = this.mConnectedThread;
      localConnectedThread.write(paramArrayOfByte);
      return;
    }
    finally {}
  }
  
  private class AcceptThread
    extends Thread
  {
    private String mSocketType;
    private final BluetoothServerSocket mmServerSocket;
    
    public AcceptThread(boolean paramBoolean)
    {
      String str;
      if (paramBoolean)
      {
        str = "Secure";
        this.mSocketType = str;
        if (!paramBoolean) {
          break label56;
        }
      }
      for (;;)
      {
        try
        {
          BluetoothServerSocket localBluetoothServerSocket2 = BluetoothChatService.this.mAdapter.listenUsingRfcommWithServiceRecord("BluetoothChatSecure", BluetoothChatService.MY_UUID_SECURE);
          localObject = localBluetoothServerSocket2;
        }
        catch (IOException localIOException)
        {
          label56:
          BluetoothServerSocket localBluetoothServerSocket1;
          Log.e("BluetoothChatService", "Socket Type: " + this.mSocketType + "listen() failed", localIOException);
          Object localObject = null;
          continue;
        }
        this.mmServerSocket = ((BluetoothServerSocket)localObject);
        return;
        str = "Insecure";
        break;
        localBluetoothServerSocket1 = BluetoothChatService.this.mAdapter.listenUsingInsecureRfcommWithServiceRecord("BluetoothChatInsecure", BluetoothChatService.MY_UUID_INSECURE);
        localObject = localBluetoothServerSocket1;
      }
    }
    
    public void cancel()
    {
      Log.d("BluetoothChatService", "Socket Type" + this.mSocketType + "cancel " + this);
      try
      {
        this.mmServerSocket.close();
        return;
      }
      catch (IOException localIOException)
      {
        Log.e("BluetoothChatService", "Socket Type" + this.mSocketType + "close() of server failed", localIOException);
      }
    }
    
    public void run()
    {
      Log.d("BluetoothChatService", "Socket Type: " + this.mSocketType + "BEGIN mAcceptThread" + this);
      setName("AcceptThread" + this.mSocketType);
      Object localObject1 = null;
      if (BluetoothChatService.this.mState == 3)
      {
        Log.i("BluetoothChatService", "END mAcceptThread, socket Type: " + this.mSocketType);
        return;
      }
      for (;;)
      {
        try
        {
          for (;;)
          {
            if (this.mmServerSocket != null)
            {
              BluetoothSocket localBluetoothSocket = this.mmServerSocket.accept();
              localObject1 = localBluetoothSocket;
            }
            if (localObject1 == null) {
              break;
            }
            synchronized (BluetoothChatService.this)
            {
              switch (BluetoothChatService.this.mState)
              {
              }
            }
          }
        }
        catch (IOException localIOException1)
        {
          Log.e("BluetoothChatService", "Socket Type: " + this.mSocketType + "accept() failed", localIOException1);
        }
        BluetoothChatService.this.connected(localObject1, localObject1.getRemoteDevice(), this.mSocketType);
        continue;
        try
        {
          localObject1.close();
        }
        catch (IOException localIOException2)
        {
          Log.e("BluetoothChatService", "Could not close unwanted socket", localIOException2);
        }
      }
    }
  }
  
  private class ConnectThread
    extends Thread
  {
    private String mSocketType;
    private final BluetoothDevice mmDevice;
    private final BluetoothSocket mmSocket;
    
    public ConnectThread(BluetoothDevice paramBluetoothDevice, boolean paramBoolean)
    {
      this.mmDevice = paramBluetoothDevice;
      String str;
      if (paramBoolean)
      {
        str = "Secure";
        this.mSocketType = str;
        if (!paramBoolean) {
          break label59;
        }
      }
      for (;;)
      {
        try
        {
          BluetoothSocket localBluetoothSocket2 = paramBluetoothDevice.createRfcommSocketToServiceRecord(BluetoothChatService.MY_UUID_SECURE);
          localObject = localBluetoothSocket2;
        }
        catch (IOException localIOException)
        {
          label59:
          BluetoothSocket localBluetoothSocket1;
          Log.e("BluetoothChatService", "Socket Type: " + this.mSocketType + "create() failed", localIOException);
          Object localObject = null;
          continue;
        }
        this.mmSocket = ((BluetoothSocket)localObject);
        return;
        str = "Insecure";
        break;
        localBluetoothSocket1 = paramBluetoothDevice.createInsecureRfcommSocketToServiceRecord(BluetoothChatService.MY_UUID_INSECURE);
        localObject = localBluetoothSocket1;
      }
    }
    
    public void cancel()
    {
      try
      {
        if (this.mmSocket != null) {
          this.mmSocket.close();
        }
        return;
      }
      catch (IOException localIOException)
      {
        Log.e("BluetoothChatService", "close() of connect " + this.mSocketType + " socket failed", localIOException);
      }
    }
    
    /* Error */
    public void run()
    {
      // Byte code:
      //   0: ldc 51
      //   2: new 53	java/lang/StringBuilder
      //   5: dup
      //   6: ldc 87
      //   8: invokespecial 58	java/lang/StringBuilder:<init>	(Ljava/lang/String;)V
      //   11: aload_0
      //   12: getfield 27	com/SixClawWorm/application/BluetoothChatService$ConnectThread:mSocketType	Ljava/lang/String;
      //   15: invokevirtual 62	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
      //   18: invokevirtual 68	java/lang/StringBuilder:toString	()Ljava/lang/String;
      //   21: invokestatic 91	android/util/Log:i	(Ljava/lang/String;Ljava/lang/String;)I
      //   24: pop
      //   25: aload_0
      //   26: new 53	java/lang/StringBuilder
      //   29: dup
      //   30: ldc 93
      //   32: invokespecial 58	java/lang/StringBuilder:<init>	(Ljava/lang/String;)V
      //   35: aload_0
      //   36: getfield 27	com/SixClawWorm/application/BluetoothChatService$ConnectThread:mSocketType	Ljava/lang/String;
      //   39: invokevirtual 62	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
      //   42: invokevirtual 68	java/lang/StringBuilder:toString	()Ljava/lang/String;
      //   45: invokevirtual 96	com/SixClawWorm/application/BluetoothChatService$ConnectThread:setName	(Ljava/lang/String;)V
      //   48: aload_0
      //   49: getfield 18	com/SixClawWorm/application/BluetoothChatService$ConnectThread:this$0	Lcom/SixClawWorm/application/BluetoothChatService;
      //   52: invokestatic 100	com/SixClawWorm/application/BluetoothChatService:access$0	(Lcom/SixClawWorm/application/BluetoothChatService;)Landroid/bluetooth/BluetoothAdapter;
      //   55: invokevirtual 106	android/bluetooth/BluetoothAdapter:cancelDiscovery	()Z
      //   58: pop
      //   59: aload_0
      //   60: getfield 41	com/SixClawWorm/application/BluetoothChatService$ConnectThread:mmSocket	Landroid/bluetooth/BluetoothSocket;
      //   63: invokevirtual 109	android/bluetooth/BluetoothSocket:connect	()V
      //   66: aload_0
      //   67: getfield 18	com/SixClawWorm/application/BluetoothChatService$ConnectThread:this$0	Lcom/SixClawWorm/application/BluetoothChatService;
      //   70: astore 6
      //   72: aload 6
      //   74: monitorenter
      //   75: aload_0
      //   76: getfield 18	com/SixClawWorm/application/BluetoothChatService$ConnectThread:this$0	Lcom/SixClawWorm/application/BluetoothChatService;
      //   79: aconst_null
      //   80: invokestatic 113	com/SixClawWorm/application/BluetoothChatService:access$5	(Lcom/SixClawWorm/application/BluetoothChatService;Lcom/SixClawWorm/application/BluetoothChatService$ConnectThread;)V
      //   83: aload 6
      //   85: monitorexit
      //   86: aload_0
      //   87: getfield 18	com/SixClawWorm/application/BluetoothChatService$ConnectThread:this$0	Lcom/SixClawWorm/application/BluetoothChatService;
      //   90: aload_0
      //   91: getfield 41	com/SixClawWorm/application/BluetoothChatService$ConnectThread:mmSocket	Landroid/bluetooth/BluetoothSocket;
      //   94: aload_0
      //   95: getfield 23	com/SixClawWorm/application/BluetoothChatService$ConnectThread:mmDevice	Landroid/bluetooth/BluetoothDevice;
      //   98: aload_0
      //   99: getfield 27	com/SixClawWorm/application/BluetoothChatService$ConnectThread:mSocketType	Ljava/lang/String;
      //   102: invokevirtual 117	com/SixClawWorm/application/BluetoothChatService:connected	(Landroid/bluetooth/BluetoothSocket;Landroid/bluetooth/BluetoothDevice;Ljava/lang/String;)V
      //   105: return
      //   106: astore_3
      //   107: aload_0
      //   108: getfield 41	com/SixClawWorm/application/BluetoothChatService$ConnectThread:mmSocket	Landroid/bluetooth/BluetoothSocket;
      //   111: invokevirtual 80	android/bluetooth/BluetoothSocket:close	()V
      //   114: aload_0
      //   115: getfield 18	com/SixClawWorm/application/BluetoothChatService$ConnectThread:this$0	Lcom/SixClawWorm/application/BluetoothChatService;
      //   118: invokestatic 121	com/SixClawWorm/application/BluetoothChatService:access$4	(Lcom/SixClawWorm/application/BluetoothChatService;)V
      //   121: return
      //   122: astore 4
      //   124: ldc 51
      //   126: new 53	java/lang/StringBuilder
      //   129: dup
      //   130: ldc 123
      //   132: invokespecial 58	java/lang/StringBuilder:<init>	(Ljava/lang/String;)V
      //   135: aload_0
      //   136: getfield 27	com/SixClawWorm/application/BluetoothChatService$ConnectThread:mSocketType	Ljava/lang/String;
      //   139: invokevirtual 62	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
      //   142: ldc 125
      //   144: invokevirtual 62	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
      //   147: invokevirtual 68	java/lang/StringBuilder:toString	()Ljava/lang/String;
      //   150: aload 4
      //   152: invokestatic 74	android/util/Log:e	(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
      //   155: pop
      //   156: goto -42 -> 114
      //   159: astore 7
      //   161: aload 6
      //   163: monitorexit
      //   164: aload 7
      //   166: athrow
      // Local variable table:
      //   start	length	slot	name	signature
      //   0	167	0	this	ConnectThread
      //   106	1	3	localIOException1	IOException
      //   122	29	4	localIOException2	IOException
      //   159	6	7	localObject	Object
      // Exception table:
      //   from	to	target	type
      //   59	66	106	java/io/IOException
      //   107	114	122	java/io/IOException
      //   75	86	159	finally
      //   161	164	159	finally
    }
  }
  
  private class ConnectedThread
    extends Thread
  {
    private final InputStream mmInStream;
    private final OutputStream mmOutStream;
    private final BluetoothSocket mmSocket;
    
    public ConnectedThread(BluetoothSocket paramBluetoothSocket, String paramString)
    {
      Log.d("BluetoothChatService", "create ConnectedThread: " + paramString);
      this.mmSocket = paramBluetoothSocket;
      InputStream localInputStream = null;
      try
      {
        localInputStream = paramBluetoothSocket.getInputStream();
        OutputStream localOutputStream2 = paramBluetoothSocket.getOutputStream();
        localOutputStream1 = localOutputStream2;
      }
      catch (IOException localIOException)
      {
        for (;;)
        {
          Log.e("BluetoothChatService", "temp sockets not created", localIOException);
          OutputStream localOutputStream1 = null;
        }
      }
      this.mmInStream = localInputStream;
      this.mmOutStream = localOutputStream1;
    }
    
    public void cancel()
    {
      try
      {
        this.mmSocket.close();
        return;
      }
      catch (IOException localIOException)
      {
        Log.e("BluetoothChatService", "close() of connect socket failed", localIOException);
      }
    }
    
    public void run()
    {
      Log.i("BluetoothChatService", "BEGIN mConnectedThread");
      byte[] arrayOfByte = new byte[1024];
      try
      {
        for (;;)
        {
          int i = this.mmInStream.read(arrayOfByte);
          BluetoothChatService.this.mHandler.obtainMessage(2, i, -1, arrayOfByte).sendToTarget();
        }
        return;
      }
      catch (IOException localIOException)
      {
        Log.e("BluetoothChatService", "disconnected", localIOException);
        BluetoothChatService.this.connectionLost();
      }
    }
    
    public void write(byte[] paramArrayOfByte)
    {
      try
      {
        this.mmOutStream.write(paramArrayOfByte);
        BluetoothChatService.this.mHandler.obtainMessage(3, -1, -1, paramArrayOfByte).sendToTarget();
        return;
      }
      catch (IOException localIOException)
      {
        Log.e("BluetoothChatService", "Exception during write", localIOException);
      }
    }
  }
}


/* Location:           C:\Users\Rodelle\Desktop\Attacknid\Tools\Attacknids-dex2jar.jar
 * Qualified Name:     com.SixClawWorm.application.BluetoothChatService
 * JD-Core Version:    0.7.0.1
 */