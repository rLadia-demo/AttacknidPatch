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
 *  android.view.View
 *  android.view.View$OnClickListener
 *  android.view.Window
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
import android.view.View;
import android.view.Window;
import android.widget.ArrayAdapter;
import android.widget.Button;
import android.widget.EditText;
import android.widget.ListView;
import android.widget.TextView;
import android.widget.Toast;
import com.SixClawWorm.application.BluetoothChatService;
import com.SixClawWorm.application.MenuActivity;
import com.SixClawWorm.application.PlayControlActivity;
import com.SixClawWorm.application.PlayControlActivity1280;
import com.SixClawWorm.application.PlayControlActivity1920;
import com.SixClawWorm.application.inTrodutionActivity;
import com.SixClawWorm.utils.ExitApplication;
import com.SixClawWorm.utils.Param;
import com.SixClawWorm.utils.PlatformScreen;
import com.SixClawWorm.utils.ProgressDialogHint;
import com.SixClawWorm.utils.ToastHint;

public class NobluetoothActivity
extends Activity {
    private static final boolean D = true;
    public static final String DEVICE_NAME = "device_name";
    public static String EXTRA_DEVICE_ADDRESS;
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
    private static BluetoothAdapter mBluetoothAdapter;
    public static BluetoothChatService mChatService;
    private Button Mlayer;
    private Button StartBtn;
    private Button backBtn;
    private int first = 0;
    Handler handler = new Handler();
    private Button helpBtn;
    private String mConnectedDeviceName = null;
    private ArrayAdapter<String> mConversationArrayAdapter;
    private ListView mConversationView;
    private final Handler mHandler;
    private EditText mOutEditText;
    private StringBuffer mOutStringBuffer;
    private Button mSendButton;
    private TextView mTitle;
    private TextView.OnEditorActionListener mWriteListener;
    private Button okBtn;
    private Button rssiNum;
    Runnable runnable;

    static {
        NobluetoothActivity.mBluetoothAdapter = null;
        NobluetoothActivity.mChatService = null;
        NobluetoothActivity.EXTRA_DEVICE_ADDRESS = "device_address";
    }

    public NobluetoothActivity() {
        this.runnable = new Runnable(){

            @Override
            public void run() {
                if (!(Param.ConntectSucceed || Param.address.equals("") || Param.connecting)) {
                    Intent intent = new Intent();
                    intent.putExtra(NobluetoothActivity.EXTRA_DEVICE_ADDRESS, Param.address);
                    NobluetoothActivity.this.setResult(-1, intent);
                    NobluetoothActivity.connectDevice(false);
                }
                NobluetoothActivity.this.handler.postDelayed((Runnable)this, 1000);
            }
        };
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
             * Enabled aggressive block sorting
             */
            public void handleMessage(Message message) {
                switch (message.what) {
                    default: {
                        return;
                    }
                    case 1: {
                        Log.i((String)"BluetoothChat", (String)("MESSAGE_STATE_CHANGE: " + message.arg1));
                        switch (message.arg1) {
                            default: {
                                return;
                            }
                            case 0: {
                                ToastHint.show((Context)NobluetoothActivity.this, "The connection fails");
                                Param.connecting = false;
                                Param.ConntectSucceed = false;
                                return;
                            }
                            case 3: {
                                ProgressDialogHint.Dismiss();
                                Param.ConntectSucceed = true;
                                ToastHint.show((Context)NobluetoothActivity.this, "The connection is successful");
                                int n = PlatformScreen.GetWidth((Activity)NobluetoothActivity.this);
                                PlatformScreen.GetHeight((Activity)NobluetoothActivity.this);
                                if (n == 1280) {
                                    Intent intent = new Intent((Context)NobluetoothActivity.this, (Class)PlayControlActivity1280.class);
                                    NobluetoothActivity.this.startActivityFromChild((Activity)NobluetoothActivity.this, intent, 0);
                                } else if (n == 1920) {
                                    Intent intent = new Intent((Context)NobluetoothActivity.this, (Class)PlayControlActivity1920.class);
                                    NobluetoothActivity.this.startActivity(intent);
                                } else {
                                    Intent intent = new Intent((Context)NobluetoothActivity.this, (Class)PlayControlActivity.class);
                                    NobluetoothActivity.this.startActivity(intent);
                                }
                                Param.connecting = false;
                                NobluetoothActivity.this.handler.removeCallbacks(NobluetoothActivity.this.runnable);
                                return;
                            }
                            case 2: {
                                Param.connecting = true;
                                return;
                            }
                            case 1: 
                        }
                        Param.connecting = false;
                        return;
                    }
                    case 3: {
                    	final byte[] array = (byte[])message.obj;
                        return;
                    }
                    case 2: {
                    	final byte[] array = (byte[])message.obj;
                        return;
                    }
                    case 4: {
                        NobluetoothActivity.access$0(NobluetoothActivity.this, message.getData().getString("device_name"));
                        Toast.makeText((Context)NobluetoothActivity.this.getApplicationContext(), (CharSequence)("Connected to " + NobluetoothActivity.this.mConnectedDeviceName), (int)0).show();
                        return;
                    }
                    case 5: 
                }
                Toast.makeText((Context)NobluetoothActivity.this.getApplicationContext(), (CharSequence)message.getData().getString("toast"), (int)0).show();
            }
        };
    }

    static /* synthetic */ void access$0(NobluetoothActivity nobluetoothActivity, String string) {
        nobluetoothActivity.mConnectedDeviceName = string;
    }

    public static void connectDevice(boolean bl) {
        String string = Param.address;
        BluetoothDevice bluetoothDevice = NobluetoothActivity.mBluetoothAdapter.getRemoteDevice(string);
        if (bluetoothDevice == null || NobluetoothActivity.mChatService == null) return;
        NobluetoothActivity.mChatService.connect(bluetoothDevice, bl);
    }

    private void setupChat() {
        Log.d((String)"BluetoothChat", (String)"setupChat()");
        NobluetoothActivity.mChatService = new BluetoothChatService((Context)this, this.mHandler);
        this.mOutStringBuffer = new StringBuffer("");
    }

    public void onCreate(Bundle bundle) {
        super.onCreate(bundle);
        this.requestWindowFeature(1);
        this.getWindow().setFlags(1024, 1024);
        this.setContentView(2130903049);
        ExitApplication.getInstance().addActivity((Activity)this);
        NobluetoothActivity.mBluetoothAdapter = BluetoothAdapter.getDefaultAdapter();
        this.okBtn = (Button)this.findViewById(2131099669);
        this.okBtn.setOnClickListener((View.OnClickListener)new View.OnClickListener(){

            public void onClick(View view) {
                if (!Param.ConntectSucceed) return;
                Intent intent = new Intent((Context)NobluetoothActivity.this, (Class)PlayControlActivity.class);
                NobluetoothActivity.this.startActivity(intent);
            }
        });
        this.backBtn = (Button)this.findViewById(2131099650);
        this.backBtn.setOnClickListener((View.OnClickListener)new View.OnClickListener(){

            public void onClick(View view) {
                Intent intent = new Intent((Context)NobluetoothActivity.this, (Class)MenuActivity.class);
                NobluetoothActivity.this.startActivity(intent);
            }
        });
        this.helpBtn = (Button)this.findViewById(2131099670);
        this.helpBtn.setOnClickListener((View.OnClickListener)new View.OnClickListener(){

            public void onClick(View view) {
                Intent intent = new Intent((Context)NobluetoothActivity.this, (Class)inTrodutionActivity.class);
                NobluetoothActivity.this.startActivity(intent);
            }
        });
        NobluetoothActivity.mBluetoothAdapter = BluetoothAdapter.getDefaultAdapter();
        if (NobluetoothActivity.mBluetoothAdapter != null) return;
        Toast.makeText((Context)this, (CharSequence)"Bluetooth is not available", (int)1).show();
    }

    public void onDestroy() {
        super.onDestroy();
        if (NobluetoothActivity.mChatService != null) {
            NobluetoothActivity.mChatService.stop();
        }
        Log.e((String)"BluetoothChat", (String)"--- ON DESTROY ---");
    }

    public boolean onKeyDown(int n, KeyEvent keyEvent) {
        if (n != 4) return super.onKeyDown(n, keyEvent);
        this.startActivity(new Intent((Context)this, (Class)MenuActivity.class));
        return super.onKeyDown(n, keyEvent);
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
            if (Param.ConntectSucceed && (PlayControlActivity.ifPlayControlActivity || PlayControlActivity1280.ifPlayControlActivity || PlayControlActivity1920.ifPlayControlActivity)) {
                this.startActivity(new Intent((Context)this, (Class)MenuActivity.class));
            }
            this.handler.postDelayed(this.runnable, 1000);
            Log.e((String)"BluetoothChat", (String)"+ ON RESUME +");
            if (NobluetoothActivity.mChatService == null) return;
            if (NobluetoothActivity.mChatService.getState() == 0) {
                NobluetoothActivity.mChatService.start();
            } else {
                NobluetoothActivity.mChatService.getState();
            }
            Param.ChatService = NobluetoothActivity.mChatService;
            return;
        }
    }

    /*
     * Enabled aggressive block sorting
     */
    public void onStart() {
        super.onStart();
        if (!NobluetoothActivity.mBluetoothAdapter.isEnabled()) {
            this.startActivityForResult(new Intent("android.bluetooth.adapter.action.REQUEST_ENABLE"), 3);
            return;
        }
        if (NobluetoothActivity.mChatService != null) return;
        this.setupChat();
    }

    public void onStop() {
        super.onStop();
        Log.e((String)"BluetoothChat", (String)"-- ON STOP --");
    }

}

