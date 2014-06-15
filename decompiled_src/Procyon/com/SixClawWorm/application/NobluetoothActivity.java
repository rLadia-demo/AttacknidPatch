package com.SixClawWorm.application;

import android.app.*;
import android.util.*;
import android.content.*;
import android.widget.*;
import android.bluetooth.*;
import android.os.*;
import com.SixClawWorm.utils.*;
import android.view.*;

public class NobluetoothActivity extends Activity
{
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
    private int first;
    Handler handler;
    private Button helpBtn;
    private String mConnectedDeviceName;
    private ArrayAdapter<String> mConversationArrayAdapter;
    private ListView mConversationView;
    private final Handler mHandler;
    private EditText mOutEditText;
    private StringBuffer mOutStringBuffer;
    private Button mSendButton;
    private TextView mTitle;
    private TextView$OnEditorActionListener mWriteListener;
    private Button okBtn;
    private Button rssiNum;
    Runnable runnable;
    
    static {
        NobluetoothActivity.mBluetoothAdapter = null;
        NobluetoothActivity.mChatService = null;
        NobluetoothActivity.EXTRA_DEVICE_ADDRESS = "device_address";
    }
    
    public NobluetoothActivity() {
        super();
        this.mConnectedDeviceName = null;
        this.first = 0;
        this.handler = new Handler();
        this.runnable = new Runnable() {
            @Override
            public void run() {
                if (!Param.ConntectSucceed && !Param.address.equals("") && !Param.connecting) {
                    final Intent intent = new Intent();
                    intent.putExtra(NobluetoothActivity.EXTRA_DEVICE_ADDRESS, Param.address);
                    NobluetoothActivity.this.setResult(-1, intent);
                    NobluetoothActivity.connectDevice(false);
                }
                NobluetoothActivity.this.handler.postDelayed((Runnable)this, 1000L);
            }
        };
        this.mWriteListener = (TextView$OnEditorActionListener)new TextView$OnEditorActionListener() {
            public boolean onEditorAction(final TextView textView, final int n, final KeyEvent keyEvent) {
                if (n == 0 && keyEvent.getAction() == 1) {
                    textView.getText().toString();
                }
                Log.i("BluetoothChat", "END onEditorAction");
                return true;
            }
        };
        this.mHandler = new Handler() {
            public void handleMessage(final Message message) {
                switch (message.what) {
                    default: {}
                    case 1: {
                        Log.i("BluetoothChat", "MESSAGE_STATE_CHANGE: " + message.arg1);
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
                                final int getWidth = PlatformScreen.GetWidth(NobluetoothActivity.this);
                                PlatformScreen.GetHeight(NobluetoothActivity.this);
                                if (getWidth == 1280) {
                                    NobluetoothActivity.this.startActivityFromChild((Activity)NobluetoothActivity.this, new Intent((Context)NobluetoothActivity.this, (Class)PlayControlActivity1280.class), 0);
                                }
                                else if (getWidth == 1920) {
                                    NobluetoothActivity.this.startActivity(new Intent((Context)NobluetoothActivity.this, (Class)PlayControlActivity1920.class));
                                }
                                else {
                                    NobluetoothActivity.this.startActivity(new Intent((Context)NobluetoothActivity.this, (Class)PlayControlActivity.class));
                                }
                                Param.connecting = false;
                                NobluetoothActivity.this.handler.removeCallbacks(NobluetoothActivity.this.runnable);
                                return;
                            }
                            case 2: {
                                Param.connecting = true;
                                return;
                            }
                            case 1: {
                                Param.connecting = false;
                                return;
                            }
                        }
                        break;
                    }
                    case 3: {
                        final byte[] array = (byte[])message.obj;
                    }
                    case 2: {
                        final byte[] array2 = (byte[])message.obj;
                    }
                    case 4: {
                        NobluetoothActivity.access$0(NobluetoothActivity.this, message.getData().getString("device_name"));
                        Toast.makeText(NobluetoothActivity.this.getApplicationContext(), (CharSequence)("Connected to " + NobluetoothActivity.this.mConnectedDeviceName), 0).show();
                    }
                    case 5: {
                        Toast.makeText(NobluetoothActivity.this.getApplicationContext(), (CharSequence)message.getData().getString("toast"), 0).show();
                    }
                }
            }
        };
    }
    
    static /* synthetic */ void access$0(final NobluetoothActivity nobluetoothActivity, final String mConnectedDeviceName) {
        nobluetoothActivity.mConnectedDeviceName = mConnectedDeviceName;
    }
    
    public static void connectDevice(final boolean b) {
        final BluetoothDevice remoteDevice = NobluetoothActivity.mBluetoothAdapter.getRemoteDevice(Param.address);
        if (remoteDevice != null && NobluetoothActivity.mChatService != null) {
            NobluetoothActivity.mChatService.connect(remoteDevice, b);
        }
    }
    
    private void setupChat() {
        Log.d("BluetoothChat", "setupChat()");
        NobluetoothActivity.mChatService = new BluetoothChatService((Context)this, this.mHandler);
        this.mOutStringBuffer = new StringBuffer("");
    }
    
    public void onCreate(final Bundle bundle) {
        super.onCreate(bundle);
        this.requestWindowFeature(1);
        this.getWindow().setFlags(1024, 1024);
        this.setContentView(2130903049);
        ExitApplication.getInstance().addActivity(this);
        NobluetoothActivity.mBluetoothAdapter = BluetoothAdapter.getDefaultAdapter();
        (this.okBtn = (Button)this.findViewById(2131099669)).setOnClickListener((View$OnClickListener)new View$OnClickListener() {
            public void onClick(final View view) {
                if (Param.ConntectSucceed) {
                    NobluetoothActivity.this.startActivity(new Intent((Context)NobluetoothActivity.this, (Class)PlayControlActivity.class));
                }
            }
        });
        (this.backBtn = (Button)this.findViewById(2131099650)).setOnClickListener((View$OnClickListener)new View$OnClickListener() {
            public void onClick(final View view) {
                NobluetoothActivity.this.startActivity(new Intent((Context)NobluetoothActivity.this, (Class)MenuActivity.class));
            }
        });
        (this.helpBtn = (Button)this.findViewById(2131099670)).setOnClickListener((View$OnClickListener)new View$OnClickListener() {
            public void onClick(final View view) {
                NobluetoothActivity.this.startActivity(new Intent((Context)NobluetoothActivity.this, (Class)inTrodutionActivity.class));
            }
        });
        NobluetoothActivity.mBluetoothAdapter = BluetoothAdapter.getDefaultAdapter();
        if (NobluetoothActivity.mBluetoothAdapter == null) {
            Toast.makeText((Context)this, (CharSequence)"Bluetooth is not available", 1).show();
        }
    }
    
    public void onDestroy() {
        super.onDestroy();
        if (NobluetoothActivity.mChatService != null) {
            NobluetoothActivity.mChatService.stop();
        }
        Log.e("BluetoothChat", "--- ON DESTROY ---");
    }
    
    public boolean onKeyDown(final int n, final KeyEvent keyEvent) {
        if (n == 4) {
            this.startActivity(new Intent((Context)this, (Class)MenuActivity.class));
        }
        return super.onKeyDown(n, keyEvent);
    }
    
    public void onPause() {
        synchronized (this) {
            super.onPause();
            Log.e("BluetoothChat", "- ON PAUSE -");
        }
    }
    
    public void onResume() {
        synchronized (this) {
            super.onResume();
            if (Param.ConntectSucceed && (PlayControlActivity.ifPlayControlActivity || PlayControlActivity1280.ifPlayControlActivity || PlayControlActivity1920.ifPlayControlActivity)) {
                this.startActivity(new Intent((Context)this, (Class)MenuActivity.class));
            }
            this.handler.postDelayed(this.runnable, 1000L);
            Log.e("BluetoothChat", "+ ON RESUME +");
            if (NobluetoothActivity.mChatService != null) {
                if (NobluetoothActivity.mChatService.getState() == 0) {
                    NobluetoothActivity.mChatService.start();
                }
                else {
                    NobluetoothActivity.mChatService.getState();
                }
                Param.ChatService = NobluetoothActivity.mChatService;
            }
        }
    }
    
    public void onStart() {
        super.onStart();
        if (!NobluetoothActivity.mBluetoothAdapter.isEnabled()) {
            this.startActivityForResult(new Intent("android.bluetooth.adapter.action.REQUEST_ENABLE"), 3);
        }
        else if (NobluetoothActivity.mChatService == null) {
            this.setupChat();
        }
    }
    
    public void onStop() {
        super.onStop();
        Log.e("BluetoothChat", "-- ON STOP --");
    }
}
