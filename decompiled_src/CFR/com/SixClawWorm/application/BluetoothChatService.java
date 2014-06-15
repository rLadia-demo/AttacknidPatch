/*
 * Decompiled with CFR 0_79.
 * 
 * Could not load the following classes:
 *  android.bluetooth.BluetoothAdapter
 *  android.bluetooth.BluetoothDevice
 *  android.bluetooth.BluetoothServerSocket
 *  android.bluetooth.BluetoothSocket
 *  android.content.Context
 *  android.os.Bundle
 *  android.os.Handler
 *  android.os.Message
 *  android.util.Log
 */
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
import com.SixClawWorm.application.BluetoothChat;
import com.SixClawWorm.utils.Param;
import com.SixClawWorm.utils.ProgressDialogHint;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.UUID;

public class BluetoothChatService {
    public static boolean Bluetoothfail = 0;
    private static final boolean D = 1;
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
    private final BluetoothAdapter mAdapter = BluetoothAdapter.getDefaultAdapter();
    private ConnectThread mConnectThread;
    private ConnectedThread mConnectedThread;
    private final Handler mHandler;
    private AcceptThread mInsecureAcceptThread;
    private AcceptThread mSecureAcceptThread;
    private int mState = 0;

    static {
        BluetoothChatService.MY_UUID_SECURE = UUID.fromString("00001101-0000-1000-8000-00805F9B34FB");
        BluetoothChatService.MY_UUID_INSECURE = UUID.fromString("00001101-0000-1000-8000-00805F9B34FB");
        BluetoothChatService.Bluetoothfail = true;
        BluetoothChatService.firstUsed = true;
    }

    public BluetoothChatService(Context context, Handler handler) {
        this.mHandler = handler;
    }

    static /* synthetic */ BluetoothAdapter access$0(BluetoothChatService bluetoothChatService) {
        return bluetoothChatService.mAdapter;
    }

    static /* synthetic */ UUID access$1() {
        return BluetoothChatService.MY_UUID_SECURE;
    }

    static /* synthetic */ UUID access$2() {
        return BluetoothChatService.MY_UUID_INSECURE;
    }

    static /* synthetic */ int access$3(BluetoothChatService bluetoothChatService) {
        return bluetoothChatService.mState;
    }

    static /* synthetic */ void access$4(BluetoothChatService bluetoothChatService) {
        bluetoothChatService.connectionFailed();
    }

    static /* synthetic */ void access$5(BluetoothChatService bluetoothChatService, ConnectThread connectThread) {
        bluetoothChatService.mConnectThread = connectThread;
    }

    private void connectionFailed() {
        Message message = this.mHandler.obtainMessage(5);
        Bundle bundle = new Bundle();
        bundle.putString("toast", "The connection fails");
        message.setData(bundle);
        this.mHandler.sendMessage(message);
        this.start();
        Param.ConntectSucceed = false;
        Param.connecting = false;
        if (BluetoothChatService.firstUsed) {
            ProgressDialogHint.Dismiss();
        }
        BluetoothChatService.firstUsed = true;
    }

    private void connectionLost() {
        Message message = this.mHandler.obtainMessage(5);
        Bundle bundle = new Bundle();
        bundle.putString("toast", "Device connection was lost");
        message.setData(bundle);
        this.mHandler.sendMessage(message);
        this.start();
        Param.ConntectSucceed = false;
        BluetoothChatService.Bluetoothfail = false;
        Param.connecting = false;
        BluetoothChat.mChatService = null;
    }

    private void setState(int n) {
        synchronized (this) {
            Log.d((String)"BluetoothChatService", (String)("setState() " + this.mState + " -> " + n));
            this.mState = n;
            this.mHandler.obtainMessage(1, n, -1).sendToTarget();
            return;
        }
    }

    public void connect(BluetoothDevice bluetoothDevice, boolean bl) {
        synchronized (this) {
            Log.d((String)"BluetoothChatService", (String)("connect to: " + (Object)bluetoothDevice));
            if (this.mState == 2 && this.mConnectThread != null) {
                this.mConnectThread.cancel();
                this.mConnectThread = null;
            }
            if (this.mConnectedThread != null) {
                this.mConnectedThread.cancel();
                this.mConnectedThread = null;
            }
            this.mConnectThread = new ConnectThread(bluetoothDevice, bl);
            this.mConnectThread.start();
            this.setState(2);
            return;
        }
    }

    public void connected(BluetoothSocket bluetoothSocket, BluetoothDevice bluetoothDevice, String string) {
        synchronized (this) {
            Log.d((String)"BluetoothChatService", (String)("connected, Socket Type:" + string));
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
            this.mConnectedThread = new ConnectedThread(bluetoothSocket, string);
            this.mConnectedThread.start();
            Message message = this.mHandler.obtainMessage(4);
            Bundle bundle = new Bundle();
            bundle.putString("device_name", bluetoothDevice.getName());
            message.setData(bundle);
            this.mHandler.sendMessage(message);
            this.setState(3);
            return;
        }
    }

    public int getState() {
        synchronized (this) {
            int n = this.mState;
            return n;
        }
    }

    public void start() {
        synchronized (this) {
            Log.d((String)"BluetoothChatService", (String)"start");
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
                this.mSecureAcceptThread = new AcceptThread(true);
                this.mSecureAcceptThread.start();
            }
            if (this.mInsecureAcceptThread == null) {
                this.mInsecureAcceptThread = new AcceptThread(false);
                this.mInsecureAcceptThread.start();
            }
            return;
        }
    }

    public void stop() {
        synchronized (this) {
            Log.d((String)"BluetoothChatService", (String)"stop");
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
            return;
        }
    }

    /*
     * Enabled aggressive block sorting
     * Enabled unnecessary exception pruning
     */
    public void write(byte[] arrby) {
        ConnectedThread connectedThread;
        synchronized (this) {
            if (this.mState != 3) {
                return;
            }
            connectedThread = this.mConnectedThread;
        }
        connectedThread.write(arrby);
    }

    class AcceptThread
    extends Thread {
        private String mSocketType;
        private final BluetoothServerSocket mmServerSocket;
        final /* synthetic */ BluetoothChatService this$0;

        /*
         * Unable to fully structure code
         * Enabled aggressive block sorting
         * Enabled unnecessary exception pruning
         */
        public AcceptThread(BluetoothChatService var1_1, boolean var2_2) {
            block3 : {
                this.this$0 = var1_1;
                super();
                var3_3 = var2_2 ? "Secure" : "Insecure";
                this.mSocketType = var3_3;
                ** if (!var2_2) goto lbl9
lbl6: // 1 sources:
                try {
                    var6_5 = var8_4 = BluetoothChatService.access$0(var1_1).listenUsingRfcommWithServiceRecord("BluetoothChatSecure", BluetoothChatService.access$1());
                    break block3;
lbl9: // 1 sources:
                    var6_5 = var7_6 = BluetoothChatService.access$0(var1_1).listenUsingInsecureRfcommWithServiceRecord("BluetoothChatInsecure", BluetoothChatService.access$2());
                }
                catch (IOException var4_7) {
                    Log.e((String)"BluetoothChatService", (String)("Socket Type: " + this.mSocketType + "listen() failed"), (Throwable)var4_7);
                    var6_5 = null;
                }
            }
            this.mmServerSocket = var6_5;
        }

        public void cancel() {
            Log.d((String)"BluetoothChatService", (String)("Socket Type" + this.mSocketType + "cancel " + this));
            try {
                this.mmServerSocket.close();
                return;
            }
            catch (IOException var2_1) {
                Log.e((String)"BluetoothChatService", (String)("Socket Type" + this.mSocketType + "close() of server failed"), (Throwable)var2_1);
                return;
            }
        }

        /*
         * Exception decompiling
         */
        @Override
        public void run() {
            // This method has failed to decompile.  When submitting a bug report, please provide this stack trace, and (if you hold appropriate legal rights) the relevant class file.
            // org.benf.cfr.reader.util.CannotPerformDecode: reachable test BLOCK was exited and re-entered.
            // org.benf.cfr.reader.bytecode.analysis.opgraph.Op03SimpleStatement.getFarthestReachableInRange(Op03SimpleStatement.java:3537)
            // org.benf.cfr.reader.bytecode.analysis.opgraph.Op03SimpleStatement.examineSwitchContiguity(Op03SimpleStatement.java:5335)
            // org.benf.cfr.reader.bytecode.analysis.opgraph.Op03SimpleStatement.replaceRawSwitches(Op03SimpleStatement.java:5483)
            // org.benf.cfr.reader.bytecode.CodeAnalyser.getAnalysisInner(CodeAnalyser.java:362)
            // org.benf.cfr.reader.bytecode.CodeAnalyser.getAnalysisOrWrapFail(CodeAnalyser.java:185)
            // org.benf.cfr.reader.bytecode.CodeAnalyser.getAnalysis(CodeAnalyser.java:143)
            // org.benf.cfr.reader.entities.attributes.AttributeCode.analyse(AttributeCode.java:78)
            // org.benf.cfr.reader.entities.Method.analyse(Method.java:364)
            // org.benf.cfr.reader.entities.ClassFile.analyseMid(ClassFile.java:683)
            // org.benf.cfr.reader.entities.ClassFile.analyseInnerClassesPass1(ClassFile.java:597)
            // org.benf.cfr.reader.entities.ClassFile.analyseMid(ClassFile.java:679)
            // org.benf.cfr.reader.entities.ClassFile.analyseTop(ClassFile.java:616)
            // org.benf.cfr.reader.Main.doJar(Main.java:116)
            // org.benf.cfr.reader.Main.main(Main.java:167)
            throw new IllegalStateException("Decompilation failed");
        }
    }

    class ConnectThread
    extends Thread {
        private String mSocketType;
        private final BluetoothDevice mmDevice;
        private final BluetoothSocket mmSocket;
        final /* synthetic */ BluetoothChatService this$0;

        /*
         * Unable to fully structure code
         * Enabled aggressive block sorting
         * Enabled unnecessary exception pruning
         */
        public ConnectThread(BluetoothChatService var1_1, BluetoothDevice var2_2, boolean var3_3) {
            block3 : {
                this.this$0 = var1_1;
                super();
                this.mmDevice = var2_2;
                var4_4 = var3_3 ? "Secure" : "Insecure";
                this.mSocketType = var4_4;
                ** if (!var3_3) goto lbl10
lbl7: // 1 sources:
                try {
                    var7_6 = var9_5 = var2_2.createRfcommSocketToServiceRecord(BluetoothChatService.access$1());
                    break block3;
lbl10: // 1 sources:
                    var7_6 = var8_7 = var2_2.createInsecureRfcommSocketToServiceRecord(BluetoothChatService.access$2());
                }
                catch (IOException var5_8) {
                    Log.e((String)"BluetoothChatService", (String)("Socket Type: " + this.mSocketType + "create() failed"), (Throwable)var5_8);
                    var7_6 = null;
                }
            }
            this.mmSocket = var7_6;
        }

        public void cancel() {
            try {
                if (this.mmSocket == null) return;
                this.mmSocket.close();
                return;
            }
            catch (IOException var1_1) {
                Log.e((String)"BluetoothChatService", (String)("close() of connect " + this.mSocketType + " socket failed"), (Throwable)var1_1);
                return;
            }
        }

        /*
         * Enabled aggressive block sorting
         * Enabled unnecessary exception pruning
         */
        @Override
        public void run() {
            BluetoothChatService bluetoothChatService;
            Log.i((String)"BluetoothChatService", (String)("BEGIN mConnectThread SocketType:" + this.mSocketType));
            this.setName("ConnectThread" + this.mSocketType);
            BluetoothChatService.access$0(this.this$0).cancelDiscovery();
            try {
                this.mmSocket.connect();
                bluetoothChatService = this.this$0;
            }
            catch (IOException var3_2) {
                try {
                    this.mmSocket.close();
                }
                catch (IOException var4_3) {
                    Log.e((String)"BluetoothChatService", (String)("unable to close() " + this.mSocketType + " socket during connection failure"), (Throwable)var4_3);
                }
                BluetoothChatService.access$4(this.this$0);
                return;
            }
            synchronized (bluetoothChatService) {
                BluetoothChatService.access$5(this.this$0, null);
            }
            this.this$0.connected(this.mmSocket, this.mmDevice, this.mSocketType);
            return;
        }
    }

    class ConnectedThread
    extends Thread {
        private final InputStream mmInStream;
        private final OutputStream mmOutStream;
        private final BluetoothSocket mmSocket;

        /*
         * Enabled aggressive block sorting
         * Enabled unnecessary exception pruning
         */
        public ConnectedThread(BluetoothSocket bluetoothSocket, String string) {
            OutputStream outputStream;
            Log.d((String)"BluetoothChatService", (String)("create ConnectedThread: " + string));
            this.mmSocket = bluetoothSocket;
            InputStream inputStream = null;
            try {
                OutputStream outputStream2;
                inputStream = bluetoothSocket.getInputStream();
                outputStream = outputStream2 = bluetoothSocket.getOutputStream();
            }
            catch (IOException var6_7) {
                Log.e((String)"BluetoothChatService", (String)"temp sockets not created", (Throwable)var6_7);
                outputStream = null;
            }
            this.mmInStream = inputStream;
            this.mmOutStream = outputStream;
        }

        public void cancel() {
            try {
                this.mmSocket.close();
                return;
            }
            catch (IOException var1_1) {
                Log.e((String)"BluetoothChatService", (String)"close() of connect socket failed", (Throwable)var1_1);
                return;
            }
        }

        @Override
        public void run() {
            Log.i((String)"BluetoothChatService", (String)"BEGIN mConnectedThread");
            byte[] arrby = new byte[1024];
            try {
                do {
                    int n = this.mmInStream.read(arrby);
                    BluetoothChatService.this.mHandler.obtainMessage(2, n, -1, (Object)arrby).sendToTarget();
                } while (true);
            }
            catch (IOException var3_3) {
                Log.e((String)"BluetoothChatService", (String)"disconnected", (Throwable)var3_3);
                BluetoothChatService.this.connectionLost();
                return;
            }
        }

        public void write(byte[] arrby) {
            try {
                this.mmOutStream.write(arrby);
                BluetoothChatService.this.mHandler.obtainMessage(3, -1, -1, (Object)arrby).sendToTarget();
                return;
            }
            catch (IOException var2_2) {
                Log.e((String)"BluetoothChatService", (String)"Exception during write", (Throwable)var2_2);
                return;
            }
        }
    }

}

