/*
 * Decompiled with CFR 0_79.
 * 
 * Could not load the following classes:
 *  android.app.Activity
 *  android.bluetooth.BluetoothAdapter
 *  android.bluetooth.BluetoothDevice
 *  android.content.Context
 *  android.content.Intent
 *  android.os.Bundle
 *  android.os.Handler
 *  android.os.Message
 *  android.util.Log
 *  android.view.KeyEvent
 *  android.view.Menu
 *  android.view.MenuInflater
 *  android.view.MenuItem
 *  android.view.View
 *  android.view.View$OnClickListener
 *  android.widget.ArrayAdapter
 *  android.widget.Button
 *  android.widget.EditText
 *  android.widget.ListView
 *  android.widget.TextView
 *  android.widget.TextView$OnEditorActionListener
 *  android.widget.Toast
 */
package com.SixClawWorm.application;

import android.app.Activity;
import android.bluetooth.BluetoothAdapter;
import android.bluetooth.BluetoothDevice;
import android.content.Context;
import android.content.Intent;
import android.os.Bundle;
import android.os.Handler;
import android.os.Message;
import android.util.Log;
import android.view.KeyEvent;
import android.view.Menu;
import android.view.MenuInflater;
import android.view.MenuItem;
import android.view.View;
import android.widget.ArrayAdapter;
import android.widget.Button;
import android.widget.EditText;
import android.widget.ListView;
import android.widget.TextView;
import android.widget.Toast;
import com.SixClawWorm.application.BluetoothChatService;
import com.SixClawWorm.application.DeviceListActivity;
import com.SixClawWorm.application.MenuActivity;
import com.SixClawWorm.application.inTrodutionActivity;
import com.SixClawWorm.utils.ExitApplication;
import com.SixClawWorm.utils.Param;

public class BluetoothChat
extends Activity {
    private static final boolean D = 1;
    public static final String DEVICE_NAME = "device_name";
    public static final int MESSAGE_DEVICE_NAME = 4;
    public static final int MESSAGE_READ = 2;
    public static final int MESSAGE_STATE_CHANGE = 1;
    public static final int MESSAGE_TOAST = 5;
    public static final int MESSAGE_WRITE = 3;
    private static final int REQUEST_CONNECT_DEVICE_INSECURE = 2;
    private static final int REQUEST_CONNECT_DEVICE_SECURE = 1;
    private static final int REQUEST_ENABLE_BT = 3;
    private static final String TAG = "BluetoothChat";
    public static final String TOAST = "toast";
    private static BluetoothAdapter mBluetoothAdapter = null;
    public static BluetoothChatService mChatService = null;
    private Button Mlayer;
    private Button StartBtn;
    private String mConnectedDeviceName = null;
    private ArrayAdapter<String> mConversationArrayAdapter;
    private ListView mConversationView;
    private final Handler mHandler;
    private EditText mOutEditText;
    private StringBuffer mOutStringBuffer;
    private Button mSendButton;
    private TextView mTitle;
    private TextView.OnEditorActionListener mWriteListener;
    private long maxMemory;
    private Button rssiNum;

    public BluetoothChat() {
        this.mWriteListener = new TextView.OnEditorActionListener(){

            public boolean onEditorAction(TextView textView, int n, KeyEvent keyEvent) {
                if (n == 0 && keyEvent.getAction() == 1) {
                    textView.getText().toString();
                }
                Log.i((String)"BluetoothChat", (String)"END onEditorAction");
                return true;
            }
        };
        this.mHandler = new Handler(){

            /*
             * Exception decompiling
             */
            public void handleMessage(Message var1_1) {
                // This method has failed to decompile.  When submitting a bug report, please provide this stack trace, and (if you hold appropriate legal rights) the relevant class file.
                // java.lang.ClassCastException: org.benf.cfr.reader.bytecode.analysis.parse.statement.ReturnNothingStatement cannot be cast to org.benf.cfr.reader.bytecode.analysis.parse.statement.CaseStatement
                // org.benf.cfr.reader.bytecode.analysis.opgraph.Op03SimpleStatement.buildSwitchCases(Op03SimpleStatement.java:5135)
                // org.benf.cfr.reader.bytecode.analysis.opgraph.Op03SimpleStatement.replaceRawSwitch(Op03SimpleStatement.java:5081)
                // org.benf.cfr.reader.bytecode.analysis.opgraph.Op03SimpleStatement.replaceRawSwitches(Op03SimpleStatement.java:5452)
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
        };
    }

    static /* synthetic */ void access$0(BluetoothChat bluetoothChat, String string) {
        bluetoothChat.mConnectedDeviceName = string;
    }

    static /* synthetic */ String access$1(BluetoothChat bluetoothChat) {
        return bluetoothChat.mConnectedDeviceName;
    }

    public static void connectDevice(Intent intent, boolean bl) {
        String string = intent.getExtras().getString(DeviceListActivity.EXTRA_DEVICE_ADDRESS);
        BluetoothDevice bluetoothDevice = BluetoothChat.mBluetoothAdapter.getRemoteDevice(string);
        if (bluetoothDevice == null || BluetoothChat.mChatService == null) return;
        BluetoothChat.mChatService.connect(bluetoothDevice, bl);
    }

    private void ensureDiscoverable() {
        Log.d((String)"BluetoothChat", (String)"ensure discoverable");
        if (BluetoothChat.mBluetoothAdapter.getScanMode() == 23) return;
        Intent intent = new Intent("android.bluetooth.adapter.action.REQUEST_DISCOVERABLE");
        intent.putExtra("android.bluetooth.adapter.extra.DISCOVERABLE_DURATION", 300);
        this.startActivity(intent);
    }

    /*
     * Enabled aggressive block sorting
     */
    private void sendMessage(byte[] arrby) {
        if (BluetoothChat.mChatService.getState() != 3) {
            Toast.makeText((Context)this, (int)2130968578, (int)0).show();
            return;
        }
        if (arrby.length <= 0) return;
        BluetoothChat.mChatService.write(arrby);
        this.mOutStringBuffer.setLength(0);
    }

    private void setupChat() {
        Log.d((String)"BluetoothChat", (String)"setupChat()");
        BluetoothChat.mChatService = new BluetoothChatService((Context)this, this.mHandler);
        this.mOutStringBuffer = new StringBuffer("");
    }

    private byte[] toStringHex(String string) {
        byte[] arrby = new byte[string.length() / 2];
        int n = 0;
        while (n < arrby.length) {
            int n2 = n * 2;
            int n3 = 2 + n * 2;
            try {
                arrby[n] = (byte)(255 & Integer.parseInt(string.substring(n2, n3), 16));
                return arrby;
            }
            catch (Exception var6_6) {
                var6_6.printStackTrace();
                ++n;
                continue;
            }
            break;
        }
        return arrby;
    }

    /*
     * Enabled aggressive block sorting
     */
    public void onActivityResult(int n, int n2, Intent intent) {
        Log.d((String)"BluetoothChat", (String)("onActivityResult " + n2));
        switch (n) {
            default: {
                return;
            }
            case 1: {
                if (n2 != -1) return;
                BluetoothChat.connectDevice(intent, true);
                return;
            }
            case 2: {
                if (n2 != -1) return;
                BluetoothChat.connectDevice(intent, false);
                return;
            }
            case 3: 
        }
        if (n2 == -1) {
            this.setupChat();
            return;
        }
        Log.d((String)"BluetoothChat", (String)"BT not enabled");
        Toast.makeText((Context)this, (int)2130968579, (int)0).show();
        this.finish();
    }

    public void onCreate(Bundle bundle) {
        super.onCreate(bundle);
        this.setContentView(2130903041);
        ExitApplication.getInstance().addActivity((Activity)this);
        this.Mlayer = (Button)this.findViewById(2131099649);
        this.Mlayer.setOnClickListener((View.OnClickListener)new View.OnClickListener(){

            public void onClick(View view) {
                Intent intent = new Intent((Context)BluetoothChat.this, (Class)inTrodutionActivity.class);
                BluetoothChat.this.startActivity(intent);
            }
        });
        BluetoothChat.mBluetoothAdapter = BluetoothAdapter.getDefaultAdapter();
        if (BluetoothChat.mBluetoothAdapter == null) {
            Toast.makeText((Context)this, (CharSequence)"Bluetooth is not available", (int)1).show();
            this.finish();
            return;
        }
        this.StartBtn = (Button)this.findViewById(2131099655);
        this.StartBtn.setOnClickListener((View.OnClickListener)new View.OnClickListener(){

            public void onClick(View view) {
                Intent intent = new Intent((Context)BluetoothChat.this, (Class)MenuActivity.class);
                BluetoothChat.this.startActivity(intent);
            }
        });
    }

    public boolean onCreateOptionsMenu(Menu menu) {
        this.getMenuInflater().inflate(2131034112, menu);
        return true;
    }

    public void onDestroy() {
        super.onDestroy();
        if (BluetoothChat.mChatService != null) {
            BluetoothChat.mChatService.stop();
        }
        Log.e((String)"BluetoothChat", (String)"--- ON DESTROY ---");
    }

    public boolean onKeyDown(int n, KeyEvent keyEvent) {
        if (n != 4) return super.onKeyDown(n, keyEvent);
        ExitApplication.getInstance().exit((Context)this);
        return super.onKeyDown(n, keyEvent);
    }

    public boolean onOptionsItemSelected(MenuItem menuItem) {
        switch (menuItem.getItemId()) {
            default: {
                return false;
            }
            case 2131099672: {
                this.startActivityForResult(new Intent((Context)this, (Class)DeviceListActivity.class), 2);
                return true;
            }
            case 2131099673: 
        }
        this.ensureDiscoverable();
        return true;
    }

    public void onPause() {
        synchronized (this) {
            super.onPause();
            Log.e((String)"BluetoothChat", (String)"- ON PAUSE -");
            return;
        }
    }

    /*
     * Enabled aggressive block sorting
     * Enabled unnecessary exception pruning
     */
    public void onResume() {
        synchronized (this) {
            super.onResume();
            Log.e((String)"BluetoothChat", (String)"+ ON RESUME +");
            if (BluetoothChat.mChatService == null) return;
            if (BluetoothChat.mChatService.getState() == 0) {
                BluetoothChat.mChatService.start();
            } else {
                BluetoothChat.mChatService.getState();
            }
            Param.ChatService = BluetoothChat.mChatService;
            return;
        }
    }

    /*
     * Enabled aggressive block sorting
     */
    public void onStart() {
        super.onStart();
        if (!BluetoothChat.mBluetoothAdapter.isEnabled()) {
            this.startActivityForResult(new Intent("android.bluetooth.adapter.action.REQUEST_ENABLE"), 3);
            return;
        }
        if (BluetoothChat.mChatService != null) return;
        this.setupChat();
    }

    public void onStop() {
        super.onStop();
        Log.e((String)"BluetoothChat", (String)"-- ON STOP --");
    }

}

