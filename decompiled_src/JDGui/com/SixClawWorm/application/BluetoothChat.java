package com.SixClawWorm.application;

import android.app.Activity;
import android.bluetooth.BluetoothAdapter;
import android.bluetooth.BluetoothDevice;
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
import android.view.View.OnClickListener;
import android.widget.ArrayAdapter;
import android.widget.Button;
import android.widget.EditText;
import android.widget.ListView;
import android.widget.TextView;
import android.widget.TextView.OnEditorActionListener;
import android.widget.Toast;
import com.SixClawWorm.utils.ExitApplication;
import com.SixClawWorm.utils.ProgressDialogHint;
import com.SixClawWorm.utils.ToastHint;

public class BluetoothChat
  extends Activity
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
  private static BluetoothAdapter mBluetoothAdapter = null;
  public static BluetoothChatService mChatService = null;
  private Button Mlayer;
  private Button StartBtn;
  private String mConnectedDeviceName = null;
  private ArrayAdapter<String> mConversationArrayAdapter;
  private ListView mConversationView;
  private final Handler mHandler = new Handler()
  {
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
        }
        ProgressDialogHint.Dismiss();
        ToastHint.show(BluetoothChat.this, "The connection is successful");
        com.SixClawWorm.utils.Param.ConntectSucceed = true;
        return;
      case 3: 
        ((byte[])paramAnonymousMessage.obj);
        return;
      case 2: 
        ((byte[])paramAnonymousMessage.obj);
        return;
      case 4: 
        BluetoothChat.this.mConnectedDeviceName = paramAnonymousMessage.getData().getString("device_name");
        Toast.makeText(BluetoothChat.this.getApplicationContext(), "Connected to " + BluetoothChat.this.mConnectedDeviceName, 0).show();
        return;
      }
      Toast.makeText(BluetoothChat.this.getApplicationContext(), paramAnonymousMessage.getData().getString("toast"), 0).show();
    }
  };
  private EditText mOutEditText;
  private StringBuffer mOutStringBuffer;
  private Button mSendButton;
  private TextView mTitle;
  private TextView.OnEditorActionListener mWriteListener = new TextView.OnEditorActionListener()
  {
    public boolean onEditorAction(TextView paramAnonymousTextView, int paramAnonymousInt, KeyEvent paramAnonymousKeyEvent)
    {
      if ((paramAnonymousInt == 0) && (paramAnonymousKeyEvent.getAction() == 1)) {
        paramAnonymousTextView.getText().toString();
      }
      Log.i("BluetoothChat", "END onEditorAction");
      return true;
    }
  };
  private long maxMemory;
  private Button rssiNum;
  
  public static void connectDevice(Intent paramIntent, boolean paramBoolean)
  {
    String str = paramIntent.getExtras().getString(DeviceListActivity.EXTRA_DEVICE_ADDRESS);
    BluetoothDevice localBluetoothDevice = mBluetoothAdapter.getRemoteDevice(str);
    if ((localBluetoothDevice != null) && (mChatService != null)) {
      mChatService.connect(localBluetoothDevice, paramBoolean);
    }
  }
  
  private void ensureDiscoverable()
  {
    Log.d("BluetoothChat", "ensure discoverable");
    if (mBluetoothAdapter.getScanMode() != 23)
    {
      Intent localIntent = new Intent("android.bluetooth.adapter.action.REQUEST_DISCOVERABLE");
      localIntent.putExtra("android.bluetooth.adapter.extra.DISCOVERABLE_DURATION", 300);
      startActivity(localIntent);
    }
  }
  
  private void sendMessage(byte[] paramArrayOfByte)
  {
    if (mChatService.getState() != 3) {
      Toast.makeText(this, 2130968578, 0).show();
    }
    while (paramArrayOfByte.length <= 0) {
      return;
    }
    mChatService.write(paramArrayOfByte);
    this.mOutStringBuffer.setLength(0);
  }
  
  private void setupChat()
  {
    Log.d("BluetoothChat", "setupChat()");
    mChatService = new BluetoothChatService(this, this.mHandler);
    this.mOutStringBuffer = new StringBuffer("");
  }
  
  private byte[] toStringHex(String paramString)
  {
    byte[] arrayOfByte = new byte[paramString.length() / 2];
    int i = 0;
    for (;;)
    {
      if (i >= arrayOfByte.length) {
        return arrayOfByte;
      }
      int j = i * 2;
      int k = 2 + i * 2;
      try
      {
        arrayOfByte[i] = ((byte)(0xFF & Integer.parseInt(paramString.substring(j, k), 16)));
        return arrayOfByte;
      }
      catch (Exception localException)
      {
        localException.printStackTrace();
        i++;
      }
    }
  }
  
  public void onActivityResult(int paramInt1, int paramInt2, Intent paramIntent)
  {
    Log.d("BluetoothChat", "onActivityResult " + paramInt2);
    switch (paramInt1)
    {
    default: 
    case 1: 
    case 2: 
      do
      {
        do
        {
          return;
        } while (paramInt2 != -1);
        connectDevice(paramIntent, true);
        return;
      } while (paramInt2 != -1);
      connectDevice(paramIntent, false);
      return;
    }
    if (paramInt2 == -1)
    {
      setupChat();
      return;
    }
    Log.d("BluetoothChat", "BT not enabled");
    Toast.makeText(this, 2130968579, 0).show();
    finish();
  }
  
  public void onCreate(Bundle paramBundle)
  {
    super.onCreate(paramBundle);
    setContentView(2130903041);
    ExitApplication.getInstance().addActivity(this);
    this.Mlayer = ((Button)findViewById(2131099649));
    this.Mlayer.setOnClickListener(new View.OnClickListener()
    {
      public void onClick(View paramAnonymousView)
      {
        Intent localIntent = new Intent(BluetoothChat.this, inTrodutionActivity.class);
        BluetoothChat.this.startActivity(localIntent);
      }
    });
    mBluetoothAdapter = BluetoothAdapter.getDefaultAdapter();
    if (mBluetoothAdapter == null)
    {
      Toast.makeText(this, "Bluetooth is not available", 1).show();
      finish();
      return;
    }
    this.StartBtn = ((Button)findViewById(2131099655));
    this.StartBtn.setOnClickListener(new View.OnClickListener()
    {
      public void onClick(View paramAnonymousView)
      {
        Intent localIntent = new Intent(BluetoothChat.this, MenuActivity.class);
        BluetoothChat.this.startActivity(localIntent);
      }
    });
  }
  
  public boolean onCreateOptionsMenu(Menu paramMenu)
  {
    getMenuInflater().inflate(2131034112, paramMenu);
    return true;
  }
  
  public void onDestroy()
  {
    super.onDestroy();
    if (mChatService != null) {
      mChatService.stop();
    }
    Log.e("BluetoothChat", "--- ON DESTROY ---");
  }
  
  public boolean onKeyDown(int paramInt, KeyEvent paramKeyEvent)
  {
    if (paramInt == 4) {
      ExitApplication.getInstance().exit(this);
    }
    return super.onKeyDown(paramInt, paramKeyEvent);
  }
  
  public boolean onOptionsItemSelected(MenuItem paramMenuItem)
  {
    switch (paramMenuItem.getItemId())
    {
    default: 
      return false;
    case 2131099672: 
      startActivityForResult(new Intent(this, DeviceListActivity.class), 2);
      return true;
    }
    ensureDiscoverable();
    return true;
  }
  
  public void onPause()
  {
    try
    {
      super.onPause();
      Log.e("BluetoothChat", "- ON PAUSE -");
      return;
    }
    finally
    {
      localObject = finally;
      throw localObject;
    }
  }
  
  /* Error */
  public void onResume()
  {
    // Byte code:
    //   0: aload_0
    //   1: monitorenter
    //   2: aload_0
    //   3: invokespecial 330	android/app/Activity:onResume	()V
    //   6: ldc 27
    //   8: ldc_w 332
    //   11: invokestatic 298	android/util/Log:e	(Ljava/lang/String;Ljava/lang/String;)I
    //   14: pop
    //   15: getstatic 63	com/SixClawWorm/application/BluetoothChat:mChatService	Lcom/SixClawWorm/application/BluetoothChatService;
    //   18: ifnull +24 -> 42
    //   21: getstatic 63	com/SixClawWorm/application/BluetoothChat:mChatService	Lcom/SixClawWorm/application/BluetoothChatService;
    //   24: invokevirtual 148	com/SixClawWorm/application/BluetoothChatService:getState	()I
    //   27: ifne +18 -> 45
    //   30: getstatic 63	com/SixClawWorm/application/BluetoothChat:mChatService	Lcom/SixClawWorm/application/BluetoothChatService;
    //   33: invokevirtual 335	com/SixClawWorm/application/BluetoothChatService:start	()V
    //   36: getstatic 63	com/SixClawWorm/application/BluetoothChat:mChatService	Lcom/SixClawWorm/application/BluetoothChatService;
    //   39: putstatic 340	com/SixClawWorm/utils/Param:ChatService	Lcom/SixClawWorm/application/BluetoothChatService;
    //   42: aload_0
    //   43: monitorexit
    //   44: return
    //   45: getstatic 63	com/SixClawWorm/application/BluetoothChat:mChatService	Lcom/SixClawWorm/application/BluetoothChatService;
    //   48: invokevirtual 148	com/SixClawWorm/application/BluetoothChatService:getState	()I
    //   51: pop
    //   52: goto -16 -> 36
    //   55: astore_1
    //   56: aload_0
    //   57: monitorexit
    //   58: aload_1
    //   59: athrow
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	60	0	this	BluetoothChat
    //   55	4	1	localObject	Object
    // Exception table:
    //   from	to	target	type
    //   2	36	55	finally
    //   36	42	55	finally
    //   45	52	55	finally
  }
  
  public void onStart()
  {
    super.onStart();
    if (!mBluetoothAdapter.isEnabled()) {
      startActivityForResult(new Intent("android.bluetooth.adapter.action.REQUEST_ENABLE"), 3);
    }
    while (mChatService != null) {
      return;
    }
    setupChat();
  }
  
  public void onStop()
  {
    super.onStop();
    Log.e("BluetoothChat", "-- ON STOP --");
  }
}


/* Location:           C:\Users\Rodelle\Desktop\Attacknid\Tools\Attacknids-dex2jar.jar
 * Qualified Name:     com.SixClawWorm.application.BluetoothChat
 * JD-Core Version:    0.7.0.1
 */