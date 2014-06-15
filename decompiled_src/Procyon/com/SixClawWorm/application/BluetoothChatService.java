package com.SixClawWorm.application;

import java.util.*;
import android.content.*;
import com.SixClawWorm.utils.*;
import android.os.*;
import android.util.*;
import android.bluetooth.*;
import java.io.*;

public class BluetoothChatService
{
    public static boolean Bluetoothfail = false;
    private static final boolean D = true;
    private static final UUID MY_UUID_INSECURE;
    private static final UUID MY_UUID_SECURE;
    private static final String NAME_INSECURE = "BluetoothChatInsecure";
    private static final String NAME_SECURE = "BluetoothChatSecure";
    public static final int STATE_CONNECTED = 3;
    public static final int STATE_CONNECTING = 2;
    public static final int STATE_LISTEN = 1;
    public static final int STATE_NONE = 0;
    private static final String TAG = "BluetoothChatService";
    public static boolean firstUsed;
    private final BluetoothAdapter mAdapter;
    private ConnectThread mConnectThread;
    private ConnectedThread mConnectedThread;
    private final Handler mHandler;
    private AcceptThread mInsecureAcceptThread;
    private AcceptThread mSecureAcceptThread;
    private int mState;
    
    static {
        MY_UUID_SECURE = UUID.fromString("00001101-0000-1000-8000-00805F9B34FB");
        MY_UUID_INSECURE = UUID.fromString("00001101-0000-1000-8000-00805F9B34FB");
        BluetoothChatService.Bluetoothfail = true;
        BluetoothChatService.firstUsed = true;
    }
    
    public BluetoothChatService(final Context context, final Handler mHandler) {
        super();
        this.mAdapter = BluetoothAdapter.getDefaultAdapter();
        this.mState = 0;
        this.mHandler = mHandler;
    }
    
    private void connectionFailed() {
        final Message obtainMessage = this.mHandler.obtainMessage(5);
        final Bundle data = new Bundle();
        data.putString("toast", "The connection fails");
        obtainMessage.setData(data);
        this.mHandler.sendMessage(obtainMessage);
        this.start();
        Param.ConntectSucceed = false;
        Param.connecting = false;
        if (BluetoothChatService.firstUsed) {
            ProgressDialogHint.Dismiss();
        }
        BluetoothChatService.firstUsed = true;
    }
    
    private void connectionLost() {
        final Message obtainMessage = this.mHandler.obtainMessage(5);
        final Bundle data = new Bundle();
        data.putString("toast", "Device connection was lost");
        obtainMessage.setData(data);
        this.mHandler.sendMessage(obtainMessage);
        this.start();
        Param.ConntectSucceed = false;
        BluetoothChatService.Bluetoothfail = false;
        Param.connecting = false;
        BluetoothChat.mChatService = null;
    }
    
    private void setState(final int mState) {
        synchronized (this) {
            Log.d("BluetoothChatService", "setState() " + this.mState + " -> " + mState);
            this.mState = mState;
            this.mHandler.obtainMessage(1, mState, -1).sendToTarget();
        }
    }
    
    public void connect(final BluetoothDevice bluetoothDevice, final boolean b) {
        synchronized (this) {
            Log.d("BluetoothChatService", "connect to: " + bluetoothDevice);
            if (this.mState == 2 && this.mConnectThread != null) {
                this.mConnectThread.cancel();
                this.mConnectThread = null;
            }
            if (this.mConnectedThread != null) {
                this.mConnectedThread.cancel();
                this.mConnectedThread = null;
            }
            (this.mConnectThread = new ConnectThread(bluetoothDevice, b)).start();
            this.setState(2);
        }
    }
    
    public void connected(final BluetoothSocket bluetoothSocket, final BluetoothDevice bluetoothDevice, final String s) {
        synchronized (this) {
            Log.d("BluetoothChatService", "connected, Socket Type:" + s);
            if (this.mConnectThread != null) {
                this.mConnectThread.cancel();
                this.mConnectThread = null;
            }
            if (this.mConnectedThread != null) {
                this.mConnectedThread.cancel();
                this.mConnectedThread = null;
            }
            if (this.mSecureAcceptThread != null) {
                this.mSecureAcceptThread.cancel();
                this.mSecureAcceptThread = null;
            }
            if (this.mInsecureAcceptThread != null) {
                this.mInsecureAcceptThread.cancel();
                this.mInsecureAcceptThread = null;
            }
            (this.mConnectedThread = new ConnectedThread(bluetoothSocket, s)).start();
            final Message obtainMessage = this.mHandler.obtainMessage(4);
            final Bundle data = new Bundle();
            data.putString("device_name", bluetoothDevice.getName());
            obtainMessage.setData(data);
            this.mHandler.sendMessage(obtainMessage);
            this.setState(3);
        }
    }
    
    public int getState() {
        synchronized (this) {
            return this.mState;
        }
    }
    
    public void start() {
        synchronized (this) {
            Log.d("BluetoothChatService", "start");
            BluetoothChatService.Bluetoothfail = true;
            if (this.mConnectThread != null) {
                this.mConnectThread.cancel();
                this.mConnectThread = null;
            }
            if (this.mConnectedThread != null) {
                this.mConnectedThread.cancel();
                this.mConnectedThread = null;
            }
            this.setState(1);
            if (this.mSecureAcceptThread == null) {
                (this.mSecureAcceptThread = new AcceptThread(true)).start();
            }
            if (this.mInsecureAcceptThread == null) {
                (this.mInsecureAcceptThread = new AcceptThread(false)).start();
            }
        }
    }
    
    public void stop() {
        synchronized (this) {
            Log.d("BluetoothChatService", "stop");
            if (this.mConnectThread != null) {
                this.mConnectThread.cancel();
                this.mConnectThread = null;
            }
            if (this.mConnectedThread != null) {
                this.mConnectedThread.cancel();
                this.mConnectedThread = null;
            }
            if (this.mSecureAcceptThread != null) {
                this.mSecureAcceptThread.cancel();
                this.mSecureAcceptThread = null;
            }
            if (this.mInsecureAcceptThread != null) {
                this.mInsecureAcceptThread.cancel();
                this.mInsecureAcceptThread = null;
            }
            this.setState(0);
        }
    }
    
    public void write(final byte[] array) {
        synchronized (this) {
            if (this.mState != 3) {
                return;
            }
            final ConnectedThread mConnectedThread = this.mConnectedThread;
            // monitorexit(this)
            mConnectedThread.write(array);
        }
    }
    
    private class AcceptThread extends Thread
    {
        private String mSocketType;
        private final BluetoothServerSocket mmServerSocket;
        
        public AcceptThread(final boolean b) {
            super();
            while (true) {
                while (true) {
                    String mSocketType = null;
                    Label_0016: {
                        if (b) {
                            mSocketType = "Secure";
                            break Label_0016;
                        }
                        Label_0050: {
                            break Label_0050;
                            while (true) {
                                while (true) {
                                    try {
                                        BluetoothServerSocket mmServerSocket = BluetoothChatService.this.mAdapter.listenUsingRfcommWithServiceRecord("BluetoothChatSecure", BluetoothChatService.MY_UUID_SECURE);
                                        this.mmServerSocket = mmServerSocket;
                                        return;
                                        mSocketType = "Insecure";
                                        break;
                                        mmServerSocket = BluetoothChatService.this.mAdapter.listenUsingInsecureRfcommWithServiceRecord("BluetoothChatInsecure", BluetoothChatService.MY_UUID_INSECURE);
                                        continue;
                                    }
                                    catch (IOException ex) {
                                        Log.e("BluetoothChatService", "Socket Type: " + this.mSocketType + "listen() failed", (Throwable)ex);
                                        final BluetoothServerSocket mmServerSocket = null;
                                        continue;
                                    }
                                    continue;
                                }
                            }
                        }
                    }
                    this.mSocketType = mSocketType;
                    if (b) {
                        continue;
                    }
                    break;
                }
                continue;
            }
        }
        
        public void cancel() {
            Log.d("BluetoothChatService", "Socket Type" + this.mSocketType + "cancel " + this);
            try {
                this.mmServerSocket.close();
            }
            catch (IOException ex) {
                Log.e("BluetoothChatService", "Socket Type" + this.mSocketType + "close() of server failed", (Throwable)ex);
            }
        }
        
        @Override
        public void run() {
            Log.d("BluetoothChatService", "Socket Type: " + this.mSocketType + "BEGIN mAcceptThread" + this);
            this.setName("AcceptThread" + this.mSocketType);
            BluetoothSocket accept = null;
        Label_0059:
            while (true) {
                while (BluetoothChatService.this.mState != 3) {
                    while (true) {
                        while (true) {
                            Label_0232: {
                                try {
                                    if (this.mmServerSocket != null) {
                                        accept = this.mmServerSocket.accept();
                                    }
                                    if (accept == null) {
                                        break;
                                    }
                                    synchronized (BluetoothChatService.this) {
                                        switch (BluetoothChatService.this.mState) {
                                            default: {
                                                continue Label_0059;
                                            }
                                            case 1:
                                            case 2: {
                                                break;
                                            }
                                            case 0:
                                            case 3: {
                                                break Label_0232;
                                            }
                                        }
                                    }
                                }
                                catch (IOException ex) {
                                    Log.e("BluetoothChatService", "Socket Type: " + this.mSocketType + "accept() failed", (Throwable)ex);
                                    break Label_0059;
                                }
                                BluetoothChatService.this.connected(accept, accept.getRemoteDevice(), this.mSocketType);
                                continue;
                                try {
                                    accept.close();
                                    continue;
                                }
                                catch (IOException ex2) {
                                    Log.e("BluetoothChatService", "Could not close unwanted socket", (Throwable)ex2);
                                    continue;
                                }
                            }
                            continue;
                        }
                    }
                }
                break;
            }
            Log.i("BluetoothChatService", "END mAcceptThread, socket Type: " + this.mSocketType);
        }
    }
    
    private class ConnectThread extends Thread
    {
        private String mSocketType;
        private final BluetoothDevice mmDevice;
        private final BluetoothSocket mmSocket;
        
        public ConnectThread(final BluetoothDevice mmDevice, final boolean b) {
            super();
            this.mmDevice = mmDevice;
            while (true) {
                while (true) {
                    String mSocketType = null;
                    Label_0022: {
                        if (b) {
                            mSocketType = "Secure";
                            break Label_0022;
                        }
                        Label_0052: {
                            break Label_0052;
                            while (true) {
                                while (true) {
                                    try {
                                        BluetoothSocket mmSocket = mmDevice.createRfcommSocketToServiceRecord(BluetoothChatService.MY_UUID_SECURE);
                                        this.mmSocket = mmSocket;
                                        return;
                                        mSocketType = "Insecure";
                                        break;
                                        mmSocket = mmDevice.createInsecureRfcommSocketToServiceRecord(BluetoothChatService.MY_UUID_INSECURE);
                                        continue;
                                    }
                                    catch (IOException ex) {
                                        Log.e("BluetoothChatService", "Socket Type: " + this.mSocketType + "create() failed", (Throwable)ex);
                                        final BluetoothSocket mmSocket = null;
                                        continue;
                                    }
                                    continue;
                                }
                            }
                        }
                    }
                    this.mSocketType = mSocketType;
                    if (b) {
                        continue;
                    }
                    break;
                }
                continue;
            }
        }
        
        public void cancel() {
            try {
                if (this.mmSocket != null) {
                    this.mmSocket.close();
                }
            }
            catch (IOException ex) {
                Log.e("BluetoothChatService", "close() of connect " + this.mSocketType + " socket failed", (Throwable)ex);
            }
        }
        
        @Override
        public void run() {
            // 
            // This method could not be decompiled.
            // 
            // Original Bytecode:
            // 
            //     0: ldc             "BluetoothChatService"
            //     2: new             Ljava/lang/StringBuilder;
            //     5: dup            
            //     6: ldc             "BEGIN mConnectThread SocketType:"
            //     8: invokespecial   java/lang/StringBuilder.<init>:(Ljava/lang/String;)V
            //    11: aload_0        
            //    12: getfield        com/SixClawWorm/application/BluetoothChatService$ConnectThread.mSocketType:Ljava/lang/String;
            //    15: invokevirtual   java/lang/StringBuilder.append:(Ljava/lang/String;)Ljava/lang/StringBuilder;
            //    18: invokevirtual   java/lang/StringBuilder.toString:()Ljava/lang/String;
            //    21: invokestatic    android/util/Log.i:(Ljava/lang/String;Ljava/lang/String;)I
            //    24: pop            
            //    25: aload_0        
            //    26: new             Ljava/lang/StringBuilder;
            //    29: dup            
            //    30: ldc             "ConnectThread"
            //    32: invokespecial   java/lang/StringBuilder.<init>:(Ljava/lang/String;)V
            //    35: aload_0        
            //    36: getfield        com/SixClawWorm/application/BluetoothChatService$ConnectThread.mSocketType:Ljava/lang/String;
            //    39: invokevirtual   java/lang/StringBuilder.append:(Ljava/lang/String;)Ljava/lang/StringBuilder;
            //    42: invokevirtual   java/lang/StringBuilder.toString:()Ljava/lang/String;
            //    45: invokevirtual   com/SixClawWorm/application/BluetoothChatService$ConnectThread.setName:(Ljava/lang/String;)V
            //    48: aload_0        
            //    49: getfield        com/SixClawWorm/application/BluetoothChatService$ConnectThread.this$0:Lcom/SixClawWorm/application/BluetoothChatService;
            //    52: invokestatic    com/SixClawWorm/application/BluetoothChatService.access$0:(Lcom/SixClawWorm/application/BluetoothChatService;)Landroid/bluetooth/BluetoothAdapter;
            //    55: invokevirtual   android/bluetooth/BluetoothAdapter.cancelDiscovery:()Z
            //    58: pop            
            //    59: aload_0        
            //    60: getfield        com/SixClawWorm/application/BluetoothChatService$ConnectThread.mmSocket:Landroid/bluetooth/BluetoothSocket;
            //    63: invokevirtual   android/bluetooth/BluetoothSocket.connect:()V
            //    66: aload_0        
            //    67: getfield        com/SixClawWorm/application/BluetoothChatService$ConnectThread.this$0:Lcom/SixClawWorm/application/BluetoothChatService;
            //    70: astore          6
            //    72: aload           6
            //    74: monitorenter   
            //    75: aload_0        
            //    76: getfield        com/SixClawWorm/application/BluetoothChatService$ConnectThread.this$0:Lcom/SixClawWorm/application/BluetoothChatService;
            //    79: aconst_null    
            //    80: invokestatic    com/SixClawWorm/application/BluetoothChatService.access$5:(Lcom/SixClawWorm/application/BluetoothChatService;Lcom/SixClawWorm/application/BluetoothChatService$ConnectThread;)V
            //    83: aload           6
            //    85: monitorexit    
            //    86: aload_0        
            //    87: getfield        com/SixClawWorm/application/BluetoothChatService$ConnectThread.this$0:Lcom/SixClawWorm/application/BluetoothChatService;
            //    90: aload_0        
            //    91: getfield        com/SixClawWorm/application/BluetoothChatService$ConnectThread.mmSocket:Landroid/bluetooth/BluetoothSocket;
            //    94: aload_0        
            //    95: getfield        com/SixClawWorm/application/BluetoothChatService$ConnectThread.mmDevice:Landroid/bluetooth/BluetoothDevice;
            //    98: aload_0        
            //    99: getfield        com/SixClawWorm/application/BluetoothChatService$ConnectThread.mSocketType:Ljava/lang/String;
            //   102: invokevirtual   com/SixClawWorm/application/BluetoothChatService.connected:(Landroid/bluetooth/BluetoothSocket;Landroid/bluetooth/BluetoothDevice;Ljava/lang/String;)V
            //   105: return         
            //   106: astore_3       
            //   107: aload_0        
            //   108: getfield        com/SixClawWorm/application/BluetoothChatService$ConnectThread.mmSocket:Landroid/bluetooth/BluetoothSocket;
            //   111: invokevirtual   android/bluetooth/BluetoothSocket.close:()V
            //   114: aload_0        
            //   115: getfield        com/SixClawWorm/application/BluetoothChatService$ConnectThread.this$0:Lcom/SixClawWorm/application/BluetoothChatService;
            //   118: invokestatic    com/SixClawWorm/application/BluetoothChatService.access$4:(Lcom/SixClawWorm/application/BluetoothChatService;)V
            //   121: return         
            //   122: astore          4
            //   124: ldc             "BluetoothChatService"
            //   126: new             Ljava/lang/StringBuilder;
            //   129: dup            
            //   130: ldc             "unable to close() "
            //   132: invokespecial   java/lang/StringBuilder.<init>:(Ljava/lang/String;)V
            //   135: aload_0        
            //   136: getfield        com/SixClawWorm/application/BluetoothChatService$ConnectThread.mSocketType:Ljava/lang/String;
            //   139: invokevirtual   java/lang/StringBuilder.append:(Ljava/lang/String;)Ljava/lang/StringBuilder;
            //   142: ldc             " socket during connection failure"
            //   144: invokevirtual   java/lang/StringBuilder.append:(Ljava/lang/String;)Ljava/lang/StringBuilder;
            //   147: invokevirtual   java/lang/StringBuilder.toString:()Ljava/lang/String;
            //   150: aload           4
            //   152: invokestatic    android/util/Log.e:(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
            //   155: pop            
            //   156: goto            114
            //   159: astore          7
            //   161: aload           6
            //   163: monitorexit    
            //   164: aload           7
            //   166: athrow         
            //    Exceptions:
            //  Try           Handler
            //  Start  End    Start  End    Type                 
            //  -----  -----  -----  -----  ---------------------
            //  59     66     106    159    Ljava/io/IOException;
            //  75     86     159    167    Any
            //  107    114    122    159    Ljava/io/IOException;
            //  161    164    159    167    Any
            // 
            // The error that occurred was:
            // 
            // java.lang.IllegalStateException: Expression is linked from several locations: Label_0114:
            //     at com.strobel.decompiler.ast.Error.expressionLinkedFromMultipleLocations(Error.java:27)
            //     at com.strobel.decompiler.ast.AstOptimizer.mergeDisparateObjectInitializations(AstOptimizer.java:2592)
            //     at com.strobel.decompiler.ast.AstOptimizer.optimize(AstOptimizer.java:235)
            //     at com.strobel.decompiler.ast.AstOptimizer.optimize(AstOptimizer.java:42)
            //     at com.strobel.decompiler.languages.java.ast.AstMethodBodyBuilder.createMethodBody(AstMethodBodyBuilder.java:214)
            //     at com.strobel.decompiler.languages.java.ast.AstMethodBodyBuilder.createMethodBody(AstMethodBodyBuilder.java:99)
            //     at com.strobel.decompiler.languages.java.ast.AstBuilder.createMethodBody(AstBuilder.java:756)
            //     at com.strobel.decompiler.languages.java.ast.AstBuilder.createMethod(AstBuilder.java:654)
            //     at com.strobel.decompiler.languages.java.ast.AstBuilder.addTypeMembers(AstBuilder.java:531)
            //     at com.strobel.decompiler.languages.java.ast.AstBuilder.createTypeCore(AstBuilder.java:498)
            //     at com.strobel.decompiler.languages.java.ast.AstBuilder.createTypeNoCache(AstBuilder.java:140)
            //     at com.strobel.decompiler.languages.java.ast.AstBuilder.addTypeMembers(AstBuilder.java:555)
            //     at com.strobel.decompiler.languages.java.ast.AstBuilder.createTypeCore(AstBuilder.java:498)
            //     at com.strobel.decompiler.languages.java.ast.AstBuilder.createTypeNoCache(AstBuilder.java:140)
            //     at com.strobel.decompiler.languages.java.ast.AstBuilder.createType(AstBuilder.java:129)
            //     at com.strobel.decompiler.languages.java.ast.AstBuilder.addType(AstBuilder.java:104)
            //     at com.strobel.decompiler.languages.java.JavaLanguage.decompileType(JavaLanguage.java:59)
            //     at com.strobel.decompiler.DecompilerDriver.decompileType(DecompilerDriver.java:301)
            //     at com.strobel.decompiler.DecompilerDriver.decompileJar(DecompilerDriver.java:224)
            //     at com.strobel.decompiler.DecompilerDriver.main(DecompilerDriver.java:109)
            // 
            // 
            // This method could not be decompiled.
            // 
            // Original Bytecode:
            // 
            //     0: ldc             "BluetoothChatService"
            //     2: new             Ljava/lang/StringBuilder;
            //     5: dup            
            //     6: ldc             "BEGIN mConnectThread SocketType:"
            //     8: invokespecial   java/lang/StringBuilder.<init>:(Ljava/lang/String;)V
            //    11: aload_0        
            //    12: getfield        com/SixClawWorm/application/BluetoothChatService$ConnectThread.mSocketType:Ljava/lang/String;
            //    15: invokevirtual   java/lang/StringBuilder.append:(Ljava/lang/String;)Ljava/lang/StringBuilder;
            //    18: invokevirtual   java/lang/StringBuilder.toString:()Ljava/lang/String;
            //    21: invokestatic    android/util/Log.i:(Ljava/lang/String;Ljava/lang/String;)I
            //    24: pop            
            //    25: aload_0        
            //    26: new             Ljava/lang/StringBuilder;
            //    29: dup            
            //    30: ldc             "ConnectThread"
            //    32: invokespecial   java/lang/StringBuilder.<init>:(Ljava/lang/String;)V
            //    35: aload_0        
            //    36: getfield        com/SixClawWorm/application/BluetoothChatService$ConnectThread.mSocketType:Ljava/lang/String;
            //    39: invokevirtual   java/lang/StringBuilder.append:(Ljava/lang/String;)Ljava/lang/StringBuilder;
            //    42: invokevirtual   java/lang/StringBuilder.toString:()Ljava/lang/String;
            //    45: invokevirtual   com/SixClawWorm/application/BluetoothChatService$ConnectThread.setName:(Ljava/lang/String;)V
            //    48: aload_0        
            //    49: getfield        com/SixClawWorm/application/BluetoothChatService$ConnectThread.this$0:Lcom/SixClawWorm/application/BluetoothChatService;
            //    52: invokestatic    com/SixClawWorm/application/BluetoothChatService.access$0:(Lcom/SixClawWorm/application/BluetoothChatService;)Landroid/bluetooth/BluetoothAdapter;
            //    55: invokevirtual   android/bluetooth/BluetoothAdapter.cancelDiscovery:()Z
            //    58: pop            
            //    59: aload_0        
            //    60: getfield        com/SixClawWorm/application/BluetoothChatService$ConnectThread.mmSocket:Landroid/bluetooth/BluetoothSocket;
            //    63: invokevirtual   android/bluetooth/BluetoothSocket.connect:()V
            //    66: aload_0        
            //    67: getfield        com/SixClawWorm/application/BluetoothChatService$ConnectThread.this$0:Lcom/SixClawWorm/application/BluetoothChatService;
            //    70: astore          6
            //    72: aload           6
            //    74: monitorenter   
            //    75: aload_0        
            //    76: getfield        com/SixClawWorm/application/BluetoothChatService$ConnectThread.this$0:Lcom/SixClawWorm/application/BluetoothChatService;
            //    79: aconst_null    
            //    80: invokestatic    com/SixClawWorm/application/BluetoothChatService.access$5:(Lcom/SixClawWorm/application/BluetoothChatService;Lcom/SixClawWorm/application/BluetoothChatService$ConnectThread;)V
            //    83: aload           6
            //    85: monitorexit    
            //    86: aload_0        
            //    87: getfield        com/SixClawWorm/application/BluetoothChatService$ConnectThread.this$0:Lcom/SixClawWorm/application/BluetoothChatService;
            //    90: aload_0        
            //    91: getfield        com/SixClawWorm/application/BluetoothChatService$ConnectThread.mmSocket:Landroid/bluetooth/BluetoothSocket;
            //    94: aload_0        
            //    95: getfield        com/SixClawWorm/application/BluetoothChatService$ConnectThread.mmDevice:Landroid/bluetooth/BluetoothDevice;
            //    98: aload_0        
            //    99: getfield        com/SixClawWorm/application/BluetoothChatService$ConnectThread.mSocketType:Ljava/lang/String;
            //   102: invokevirtual   com/SixClawWorm/application/BluetoothChatService.connected:(Landroid/bluetooth/BluetoothSocket;Landroid/bluetooth/BluetoothDevice;Ljava/lang/String;)V
            //   105: return         
            //   106: astore_3       
            //   107: aload_0        
            //   108: getfield        com/SixClawWorm/application/BluetoothChatService$ConnectThread.mmSocket:Landroid/bluetooth/BluetoothSocket;
            //   111: invokevirtual   android/bluetooth/BluetoothSocket.close:()V
            //   114: aload_0        
            //   115: getfield        com/SixClawWorm/application/BluetoothChatService$ConnectThread.this$0:Lcom/SixClawWorm/application/BluetoothChatService;
            //   118: invokestatic    com/SixClawWorm/application/BluetoothChatService.access$4:(Lcom/SixClawWorm/application/BluetoothChatService;)V
            //   121: return         
            //   122: astore          4
            //   124: ldc             "BluetoothChatService"
            //   126: new             Ljava/lang/StringBuilder;
            //   129: dup            
            //   130: ldc             "unable to close() "
            //   132: invokespecial   java/lang/StringBuilder.<init>:(Ljava/lang/String;)V
            //   135: aload_0        
            //   136: getfield        com/SixClawWorm/application/BluetoothChatService$ConnectThread.mSocketType:Ljava/lang/String;
            //   139: invokevirtual   java/lang/StringBuilder.append:(Ljava/lang/String;)Ljava/lang/StringBuilder;
            //   142: ldc             " socket during connection failure"
            //   144: invokevirtual   java/lang/StringBuilder.append:(Ljava/lang/String;)Ljava/lang/StringBuilder;
            //   147: invokevirtual   java/lang/StringBuilder.toString:()Ljava/lang/String;
            //   150: aload           4
            //   152: invokestatic    android/util/Log.e:(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
            //   155: pop            
            //   156: goto            114
            //   159: astore          7
            //   161: aload           6
            //   163: monitorexit    
            //   164: aload           7
            //   166: athrow         
            //    Exceptions:
            //  Try           Handler
            //  Start  End    Start  End    Type                 
            //  -----  -----  -----  -----  ---------------------
            //  59     66     106    159    Ljava/io/IOException;
            //  75     86     159    167    Any
            //  107    114    122    159    Ljava/io/IOException;
            //  161    164    159    167    Any
            // 
            // The error that occurred was:
            // 
            // java.lang.IllegalStateException: Expression is linked from several locations: Label_0114:
            //     at com.strobel.decompiler.ast.Error.expressionLinkedFromMultipleLocations(Error.java:27)
            //     at com.strobel.decompiler.ast.AstOptimizer.mergeDisparateObjectInitializations(AstOptimizer.java:2592)
            //     at com.strobel.decompiler.ast.AstOptimizer.optimize(AstOptimizer.java:235)
            //     at com.strobel.decompiler.ast.AstOptimizer.optimize(AstOptimizer.java:42)
            //     at com.strobel.decompiler.languages.java.ast.AstMethodBodyBuilder.createMethodBody(AstMethodBodyBuilder.java:214)
            //     at com.strobel.decompiler.languages.java.ast.AstMethodBodyBuilder.createMethodBody(AstMethodBodyBuilder.java:99)
            //     at com.strobel.decompiler.languages.java.ast.AstBuilder.createMethodBody(AstBuilder.java:756)
            //     at com.strobel.decompiler.languages.java.ast.AstBuilder.createMethod(AstBuilder.java:654)
            //     at com.strobel.decompiler.languages.java.ast.AstBuilder.addTypeMembers(AstBuilder.java:531)
            //     at com.strobel.decompiler.languages.java.ast.AstBuilder.createTypeCore(AstBuilder.java:498)
            //     at com.strobel.decompiler.languages.java.ast.AstBuilder.createTypeNoCache(AstBuilder.java:140)
            //     at com.strobel.decompiler.languages.java.ast.AstBuilder.addTypeMembers(AstBuilder.java:555)
            //     at com.strobel.decompiler.languages.java.ast.AstBuilder.createTypeCore(AstBuilder.java:498)
            //     at com.strobel.decompiler.languages.java.ast.AstBuilder.createTypeNoCache(AstBuilder.java:140)
            //     at com.strobel.decompiler.languages.java.ast.AstBuilder.createType(AstBuilder.java:129)
            //     at com.strobel.decompiler.languages.java.ast.AstBuilder.addType(AstBuilder.java:104)
            //     at com.strobel.decompiler.languages.java.JavaLanguage.decompileType(JavaLanguage.java:59)
            //     at com.strobel.decompiler.DecompilerDriver.decompileType(DecompilerDriver.java:301)
            //     at com.strobel.decompiler.DecompilerDriver.decompileJar(DecompilerDriver.java:224)
            //     at com.strobel.decompiler.DecompilerDriver.main(DecompilerDriver.java:109)
            // 
            throw new IllegalStateException("An error occurred while decompiling this method.");
        }
    }
    
    private class ConnectedThread extends Thread
    {
        private final InputStream mmInStream;
        private final OutputStream mmOutStream;
        private final BluetoothSocket mmSocket;
        
        public ConnectedThread(final BluetoothSocket mmSocket, final String s) {
            super();
            Log.d("BluetoothChatService", "create ConnectedThread: " + s);
            this.mmSocket = mmSocket;
            InputStream inputStream = null;
            while (true) {
                try {
                    inputStream = mmSocket.getInputStream();
                    final OutputStream outputStream = mmSocket.getOutputStream();
                    this.mmInStream = inputStream;
                    this.mmOutStream = outputStream;
                }
                catch (IOException ex) {
                    Log.e("BluetoothChatService", "temp sockets not created", (Throwable)ex);
                    final OutputStream outputStream = null;
                    continue;
                }
                break;
            }
        }
        
        public void cancel() {
            try {
                this.mmSocket.close();
            }
            catch (IOException ex) {
                Log.e("BluetoothChatService", "close() of connect socket failed", (Throwable)ex);
            }
        }
        
        @Override
        public void run() {
            Log.i("BluetoothChatService", "BEGIN mConnectedThread");
            final byte[] array = new byte[1024];
            try {
                while (true) {
                    BluetoothChatService.this.mHandler.obtainMessage(2, this.mmInStream.read(array), -1, (Object)array).sendToTarget();
                }
            }
            catch (IOException ex) {
                Log.e("BluetoothChatService", "disconnected", (Throwable)ex);
                BluetoothChatService.this.connectionLost();
            }
        }
        
        public void write(final byte[] array) {
            try {
                this.mmOutStream.write(array);
                BluetoothChatService.this.mHandler.obtainMessage(3, -1, -1, (Object)array).sendToTarget();
            }
            catch (IOException ex) {
                Log.e("BluetoothChatService", "Exception during write", (Throwable)ex);
            }
        }
    }
}
