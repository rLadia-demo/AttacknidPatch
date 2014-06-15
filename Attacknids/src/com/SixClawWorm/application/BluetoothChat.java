package com.SixClawWorm.application;

import android.app.*;
import android.util.*;
import android.widget.*;
import android.content.*;
import android.bluetooth.*;
import android.os.*;
import com.SixClawWorm.utils.*;
import android.view.*;

public class BluetoothChat extends Activity
{
    private static final boolean D = true;
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
    private static BluetoothAdapter mBluetoothAdapter;
    public static BluetoothChatService mChatService;
    private Button Mlayer;
    private Button StartBtn;
    private String mConnectedDeviceName;
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
    
    static {
        BluetoothChat.mBluetoothAdapter = null;
        BluetoothChat.mChatService = null;
    }
    
    public BluetoothChat() {
    	super();
    	this.mConnectedDeviceName = null;
    	this.mWriteListener = (TextView.OnEditorActionListener)new TextView.OnEditorActionListener() {
    		public boolean onEditorAction(final TextView textView, final int n, final KeyEvent keyEvent) {
    			if (n == 0 && keyEvent.getAction() == 1) {
    				textView.getText().toString();
    			}
    			Log.i("BluetoothChat", "END onEditorAction");
    			return true;
    		}
    	};
    	this.mHandler = new Handler() {
    		public void handleMessage(Message paramAnonymousMessage)
    		{
    			switch (paramAnonymousMessage.what)
    			{
    			default: 
    				return;
    			case 1: 
    				Log.i("BluetoothChat", "MESSAGE_STATE_CHANGE: " + paramAnonymousMessage.arg1);
    				switch (paramAnonymousMessage.arg1)
    				{
    				case 1: 
    				case 2: 
    				default: 
    					return;
    				case 0: 
    					ToastHint.show(BluetoothChat.this, "The connection fails");
    					return;
    				case 3:
    					ProgressDialogHint.Dismiss();
        				ToastHint.show(BluetoothChat.this, "The connection is successful");
        				com.SixClawWorm.utils.Param.ConntectSucceed = true;
        				return;
    				}
    				
    			case 3: 
    				final byte[] array = (byte[])paramAnonymousMessage.obj;
    				return;
    			case 2: 
    				final byte[] array1 = (byte[])paramAnonymousMessage.obj;
    				return;
    			case 4: 
    				BluetoothChat.this.mConnectedDeviceName = paramAnonymousMessage.getData().getString("device_name");
    				Toast.makeText(BluetoothChat.this.getApplicationContext(), "Connected to " + BluetoothChat.this.mConnectedDeviceName, 0).show();
    				return;
    			case 5:
    				Toast.makeText(BluetoothChat.this.getApplicationContext(), paramAnonymousMessage.getData().getString("toast"), 0).show();
    				return;
    			}
    			
    		}
    	};
    }
    
    static /* synthetic */ void access$0(final BluetoothChat bluetoothChat, final String mConnectedDeviceName) {
        bluetoothChat.mConnectedDeviceName = mConnectedDeviceName;
    }
    
    public static void connectDevice(final Intent intent, final boolean b) {
        final BluetoothDevice remoteDevice = BluetoothChat.mBluetoothAdapter.getRemoteDevice(intent.getExtras().getString(DeviceListActivity.EXTRA_DEVICE_ADDRESS));
        if (remoteDevice != null && BluetoothChat.mChatService != null) {
            BluetoothChat.mChatService.connect(remoteDevice, b);
        }
    }
    
    private void ensureDiscoverable() {
        Log.d("BluetoothChat", "ensure discoverable");
        if (BluetoothChat.mBluetoothAdapter.getScanMode() != 23) {
            final Intent intent = new Intent("android.bluetooth.adapter.action.REQUEST_DISCOVERABLE");
            intent.putExtra("android.bluetooth.adapter.extra.DISCOVERABLE_DURATION", 300);
            this.startActivity(intent);
        }
    }
    
    private void sendMessage(final byte[] array) {
        if (BluetoothChat.mChatService.getState() != 3) {
            Toast.makeText((Context)this, 2130968578, 0).show();
        }
        else if (array.length > 0) {
            BluetoothChat.mChatService.write(array);
            this.mOutStringBuffer.setLength(0);
        }
    }
    
    private void setupChat() {
        Log.d("BluetoothChat", "setupChat()");
        BluetoothChat.mChatService = new BluetoothChatService((Context)this, this.mHandler);
        this.mOutStringBuffer = new StringBuffer("");
    }
    
    private byte[] toStringHex(final String s) {
        final byte[] array = new byte[s.length() / 2];
        int i = 0;
        while (i < array.length) {
            final int n = i * 2;
            final int n2 = 2 + i * 2;
            try {
                array[i] = (byte)(0xFF & Integer.parseInt(s.substring(n, n2), 16));
                return array;
            }
            catch (Exception ex) {
                ex.printStackTrace();
                ++i;
            }
        }
        return array;
    }
    
    public void onActivityResult(final int n, final int n2, final Intent intent) {
        Log.d("BluetoothChat", "onActivityResult " + n2);
        switch (n) {
            case 1: {
                if (n2 == -1) {
                    connectDevice(intent, true);
                    return;
                }
                break;
            }
            case 2: {
                if (n2 == -1) {
                    connectDevice(intent, false);
                    return;
                }
                break;
            }
            case 3: {
                if (n2 == -1) {
                    this.setupChat();
                    return;
                }
                Log.d("BluetoothChat", "BT not enabled");
                Toast.makeText((Context)this, 2130968579, 0).show();
                this.finish();
            }
        }
    }
    
    public void onCreate(final Bundle bundle) {
        super.onCreate(bundle);
        this.setContentView(2130903041);
        ExitApplication.getInstance().addActivity(this);
        (this.Mlayer = (Button)this.findViewById(2131099649)).setOnClickListener((View.OnClickListener)new View.OnClickListener() {
            public void onClick(final View view) {
                BluetoothChat.this.startActivity(new Intent((Context)BluetoothChat.this, (Class)inTrodutionActivity.class));
            }
        });
        BluetoothChat.mBluetoothAdapter = BluetoothAdapter.getDefaultAdapter();
        if (BluetoothChat.mBluetoothAdapter == null) {
            Toast.makeText((Context)this, (CharSequence)"Bluetooth is not available", 1).show();
            this.finish();
            return;
        }
        (this.StartBtn = (Button)this.findViewById(2131099655)).setOnClickListener((View.OnClickListener)new View.OnClickListener() {
            public void onClick(final View view) {
                BluetoothChat.this.startActivity(new Intent((Context)BluetoothChat.this, (Class)MenuActivity.class));
            }
        });
    }
    
    public boolean onCreateOptionsMenu(final Menu menu) {
        this.getMenuInflater().inflate(2131034112, menu);
        return true;
    }
    
    public void onDestroy() {
        super.onDestroy();
        if (BluetoothChat.mChatService != null) {
            BluetoothChat.mChatService.stop();
        }
        Log.e("BluetoothChat", "--- ON DESTROY ---");
    }
    
    public boolean onKeyDown(final int n, final KeyEvent keyEvent) {
        if (n == 4) {
            ExitApplication.getInstance().exit((Context)this);
        }
        return super.onKeyDown(n, keyEvent);
    }
    
    public boolean onOptionsItemSelected(final MenuItem menuItem) {
        switch (menuItem.getItemId()) {
            default: {
                return false;
            }
            case 2131099672: {
                this.startActivityForResult(new Intent((Context)this, (Class)DeviceListActivity.class), 2);
                return true;
            }
            case 2131099673: {
                this.ensureDiscoverable();
                return true;
            }
        }
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
            Log.e("BluetoothChat", "+ ON RESUME +");
            if (BluetoothChat.mChatService != null) {
                if (BluetoothChat.mChatService.getState() == 0) {
                    BluetoothChat.mChatService.start();
                }
                else {
                    BluetoothChat.mChatService.getState();
                }
                Param.ChatService = BluetoothChat.mChatService;
            }
        }
    }
    
    public void onStart() {
        super.onStart();
        if (!BluetoothChat.mBluetoothAdapter.isEnabled()) {
            this.startActivityForResult(new Intent("android.bluetooth.adapter.action.REQUEST_ENABLE"), 3);
        }
        else if (BluetoothChat.mChatService == null) {
            this.setupChat();
        }
    }
    
    public void onStop() {
        super.onStop();
        Log.e("BluetoothChat", "-- ON STOP --");
    }
}
