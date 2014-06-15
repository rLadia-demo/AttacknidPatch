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
import android.view.View;
import android.view.View.OnClickListener;
import android.view.Window;
import android.widget.ArrayAdapter;
import android.widget.Button;
import android.widget.EditText;
import android.widget.ListView;
import android.widget.TextView;
import android.widget.TextView.OnEditorActionListener;
import android.widget.Toast;
import com.SixClawWorm.utils.ExitApplication;
import com.SixClawWorm.utils.Param;
import com.SixClawWorm.utils.PlatformScreen;
import com.SixClawWorm.utils.ProgressDialogHint;
import com.SixClawWorm.utils.ToastHint;

public class NobluetoothActivity
  extends Activity
{
  private static final boolean D = true;
  public static final String DEVICE_NAME = "device_name";
  public static String EXTRA_DEVICE_ADDRESS = "device_address";
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
  private Button backBtn;
  private int first = 0;
  Handler handler = new Handler();
  private Button helpBtn;
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
        default: 
          return;
        case 0: 
          ToastHint.show(NobluetoothActivity.this, "The connection fails");
          Param.connecting = false;
          Param.ConntectSucceed = false;
          return;
        case 3: 
          ProgressDialogHint.Dismiss();
          Param.ConntectSucceed = true;
          ToastHint.show(NobluetoothActivity.this, "The connection is successful");
          int i = PlatformScreen.GetWidth(NobluetoothActivity.this);
          PlatformScreen.GetHeight(NobluetoothActivity.this);
          if (i == 1280)
          {
            Intent localIntent1 = new Intent(NobluetoothActivity.this, PlayControlActivity1280.class);
            NobluetoothActivity.this.startActivityFromChild(NobluetoothActivity.this, localIntent1, 0);
          }
          for (;;)
          {
            Param.connecting = false;
            NobluetoothActivity.this.handler.removeCallbacks(NobluetoothActivity.this.runnable);
            return;
            if (i == 1920)
            {
              Intent localIntent2 = new Intent(NobluetoothActivity.this, PlayControlActivity1920.class);
              NobluetoothActivity.this.startActivity(localIntent2);
            }
            else
            {
              Intent localIntent3 = new Intent(NobluetoothActivity.this, PlayControlActivity.class);
              NobluetoothActivity.this.startActivity(localIntent3);
            }
          }
        case 2: 
          Param.connecting = true;
          return;
        }
        Param.connecting = false;
        return;
      case 3: 
        ((byte[])paramAnonymousMessage.obj);
        return;
      case 2: 
        ((byte[])paramAnonymousMessage.obj);
        return;
      case 4: 
        NobluetoothActivity.this.mConnectedDeviceName = paramAnonymousMessage.getData().getString("device_name");
        Toast.makeText(NobluetoothActivity.this.getApplicationContext(), "Connected to " + NobluetoothActivity.this.mConnectedDeviceName, 0).show();
        return;
      }
      Toast.makeText(NobluetoothActivity.this.getApplicationContext(), paramAnonymousMessage.getData().getString("toast"), 0).show();
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
  private Button okBtn;
  private Button rssiNum;
  Runnable runnable = new Runnable()
  {
    public void run()
    {
      if ((!Param.ConntectSucceed) && (!Param.address.equals("")) && (!Param.connecting))
      {
        Intent localIntent = new Intent();
        localIntent.putExtra(NobluetoothActivity.EXTRA_DEVICE_ADDRESS, Param.address);
        NobluetoothActivity.this.setResult(-1, localIntent);
        NobluetoothActivity.connectDevice(false);
      }
      NobluetoothActivity.this.handler.postDelayed(this, 1000L);
    }
  };
  
  public static void connectDevice(boolean paramBoolean)
  {
    String str = Param.address;
    BluetoothDevice localBluetoothDevice = mBluetoothAdapter.getRemoteDevice(str);
    if ((localBluetoothDevice != null) && (mChatService != null)) {
      mChatService.connect(localBluetoothDevice, paramBoolean);
    }
  }
  
  private void setupChat()
  {
    Log.d("BluetoothChat", "setupChat()");
    mChatService = new BluetoothChatService(this, this.mHandler);
    this.mOutStringBuffer = new StringBuffer("");
  }
  
  public void onCreate(Bundle paramBundle)
  {
    super.onCreate(paramBundle);
    requestWindowFeature(1);
    getWindow().setFlags(1024, 1024);
    setContentView(2130903049);
    ExitApplication.getInstance().addActivity(this);
    mBluetoothAdapter = BluetoothAdapter.getDefaultAdapter();
    this.okBtn = ((Button)findViewById(2131099669));
    this.okBtn.setOnClickListener(new View.OnClickListener()
    {
      public void onClick(View paramAnonymousView)
      {
        if (Param.ConntectSucceed)
        {
          Intent localIntent = new Intent(NobluetoothActivity.this, PlayControlActivity.class);
          NobluetoothActivity.this.startActivity(localIntent);
        }
      }
    });
    this.backBtn = ((Button)findViewById(2131099650));
    this.backBtn.setOnClickListener(new View.OnClickListener()
    {
      public void onClick(View paramAnonymousView)
      {
        Intent localIntent = new Intent(NobluetoothActivity.this, MenuActivity.class);
        NobluetoothActivity.this.startActivity(localIntent);
      }
    });
    this.helpBtn = ((Button)findViewById(2131099670));
    this.helpBtn.setOnClickListener(new View.OnClickListener()
    {
      public void onClick(View paramAnonymousView)
      {
        Intent localIntent = new Intent(NobluetoothActivity.this, inTrodutionActivity.class);
        NobluetoothActivity.this.startActivity(localIntent);
      }
    });
    mBluetoothAdapter = BluetoothAdapter.getDefaultAdapter();
    if (mBluetoothAdapter == null) {
      Toast.makeText(this, "Bluetooth is not available", 1).show();
    }
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
      startActivity(new Intent(this, MenuActivity.class));
    }
    return super.onKeyDown(paramInt, paramKeyEvent);
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
    //   3: invokespecial 256	android/app/Activity:onResume	()V
    //   6: getstatic 259	com/SixClawWorm/utils/Param:ConntectSucceed	Z
    //   9: ifeq +35 -> 44
    //   12: getstatic 264	com/SixClawWorm/application/PlayControlActivity:ifPlayControlActivity	Z
    //   15: ifne +15 -> 30
    //   18: getstatic 267	com/SixClawWorm/application/PlayControlActivity1280:ifPlayControlActivity	Z
    //   21: ifne +9 -> 30
    //   24: getstatic 270	com/SixClawWorm/application/PlayControlActivity1920:ifPlayControlActivity	Z
    //   27: ifeq +17 -> 44
    //   30: aload_0
    //   31: new 237	android/content/Intent
    //   34: dup
    //   35: aload_0
    //   36: ldc 239
    //   38: invokespecial 242	android/content/Intent:<init>	(Landroid/content/Context;Ljava/lang/Class;)V
    //   41: invokevirtual 246	com/SixClawWorm/application/NobluetoothActivity:startActivity	(Landroid/content/Intent;)V
    //   44: aload_0
    //   45: getfield 85	com/SixClawWorm/application/NobluetoothActivity:handler	Landroid/os/Handler;
    //   48: aload_0
    //   49: getfield 92	com/SixClawWorm/application/NobluetoothActivity:runnable	Ljava/lang/Runnable;
    //   52: ldc2_w 271
    //   55: invokevirtual 276	android/os/Handler:postDelayed	(Ljava/lang/Runnable;J)Z
    //   58: pop
    //   59: ldc 28
    //   61: ldc_w 278
    //   64: invokestatic 233	android/util/Log:e	(Ljava/lang/String;Ljava/lang/String;)I
    //   67: pop
    //   68: getstatic 69	com/SixClawWorm/application/NobluetoothActivity:mChatService	Lcom/SixClawWorm/application/BluetoothChatService;
    //   71: ifnull +24 -> 95
    //   74: getstatic 69	com/SixClawWorm/application/NobluetoothActivity:mChatService	Lcom/SixClawWorm/application/BluetoothChatService;
    //   77: invokevirtual 282	com/SixClawWorm/application/BluetoothChatService:getState	()I
    //   80: ifne +18 -> 98
    //   83: getstatic 69	com/SixClawWorm/application/NobluetoothActivity:mChatService	Lcom/SixClawWorm/application/BluetoothChatService;
    //   86: invokevirtual 285	com/SixClawWorm/application/BluetoothChatService:start	()V
    //   89: getstatic 69	com/SixClawWorm/application/NobluetoothActivity:mChatService	Lcom/SixClawWorm/application/BluetoothChatService;
    //   92: putstatic 288	com/SixClawWorm/utils/Param:ChatService	Lcom/SixClawWorm/application/BluetoothChatService;
    //   95: aload_0
    //   96: monitorexit
    //   97: return
    //   98: getstatic 69	com/SixClawWorm/application/NobluetoothActivity:mChatService	Lcom/SixClawWorm/application/BluetoothChatService;
    //   101: invokevirtual 282	com/SixClawWorm/application/BluetoothChatService:getState	()I
    //   104: pop
    //   105: goto -16 -> 89
    //   108: astore_1
    //   109: aload_0
    //   110: monitorexit
    //   111: aload_1
    //   112: athrow
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	113	0	this	NobluetoothActivity
    //   108	4	1	localObject	Object
    // Exception table:
    //   from	to	target	type
    //   2	30	108	finally
    //   30	44	108	finally
    //   44	89	108	finally
    //   89	95	108	finally
    //   98	105	108	finally
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
 * Qualified Name:     com.SixClawWorm.application.NobluetoothActivity
 * JD-Core Version:    0.7.0.1
 */