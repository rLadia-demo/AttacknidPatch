package com.SixClawWorm.application;

import android.app.Activity;
import android.bluetooth.BluetoothAdapter;
import android.bluetooth.BluetoothDevice;
import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.content.IntentFilter;
import android.content.res.Resources;
import android.os.Bundle;
import android.util.Log;
import android.view.View;
import android.view.View.OnClickListener;
import android.widget.AdapterView;
import android.widget.AdapterView.OnItemClickListener;
import android.widget.ArrayAdapter;
import android.widget.Button;
import android.widget.ListView;
import android.widget.TextView;
import com.SixClawWorm.utils.ExitApplication;
import java.util.Iterator;
import java.util.Set;

public class DeviceListActivity
  extends Activity
{
  private static final boolean D = true;
  public static String EXTRA_DEVICE_ADDRESS = "device_address";
  private static final String TAG = "DeviceListActivity";
  private BluetoothAdapter mBtAdapter;
  private AdapterView.OnItemClickListener mDeviceClickListener = new AdapterView.OnItemClickListener()
  {
    public void onItemClick(AdapterView<?> paramAnonymousAdapterView, View paramAnonymousView, int paramAnonymousInt, long paramAnonymousLong)
    {
      DeviceListActivity.this.mBtAdapter.cancelDiscovery();
      String str1 = ((TextView)paramAnonymousView).getText().toString();
      try
      {
        String str2 = str1.substring(-17 + str1.length());
        com.SixClawWorm.utils.Param.address = str2;
        Intent localIntent = new Intent();
        localIntent.putExtra(DeviceListActivity.EXTRA_DEVICE_ADDRESS, str2);
        DeviceListActivity.this.setResult(-1, localIntent);
        DeviceListActivity.this.finish();
        return;
      }
      catch (Exception localException)
      {
        localException.fillInStackTrace();
      }
    }
  };
  private ArrayAdapter<String> mNewDevicesArrayAdapter;
  private ArrayAdapter<String> mPairedDevicesArrayAdapter;
  private final BroadcastReceiver mReceiver = new BroadcastReceiver()
  {
    public void onReceive(Context paramAnonymousContext, Intent paramAnonymousIntent)
    {
      String str1 = paramAnonymousIntent.getAction();
      if ("android.bluetooth.device.action.FOUND".equals(str1))
      {
        BluetoothDevice localBluetoothDevice = (BluetoothDevice)paramAnonymousIntent.getParcelableExtra("android.bluetooth.device.extra.DEVICE");
        if (localBluetoothDevice.getBondState() != 12) {
          DeviceListActivity.this.mNewDevicesArrayAdapter.add(localBluetoothDevice.getName() + "\n" + localBluetoothDevice.getAddress());
        }
      }
      do
      {
        do
        {
          return;
        } while (!"android.bluetooth.adapter.action.DISCOVERY_FINISHED".equals(str1));
        DeviceListActivity.this.setProgressBarIndeterminateVisibility(false);
        DeviceListActivity.this.setTitle(2130968584);
      } while (DeviceListActivity.this.mNewDevicesArrayAdapter.getCount() != 0);
      String str2 = DeviceListActivity.this.getResources().getText(2130968586).toString();
      DeviceListActivity.this.mNewDevicesArrayAdapter.add(str2);
    }
  };
  
  private void doDiscovery()
  {
    Log.d("DeviceListActivity", "doDiscovery()");
    setProgressBarIndeterminateVisibility(true);
    setTitle(2130968583);
    findViewById(2131099660).setVisibility(0);
    if (this.mBtAdapter.isDiscovering()) {
      this.mBtAdapter.cancelDiscovery();
    }
    this.mBtAdapter.startDiscovery();
  }
  
  protected void onCreate(Bundle paramBundle)
  {
    super.onCreate(paramBundle);
    requestWindowFeature(5);
    setContentView(2130903043);
    setResult(0);
    ExitApplication.getInstance().addActivity(this);
    ((Button)findViewById(2131099662)).setOnClickListener(new View.OnClickListener()
    {
      public void onClick(View paramAnonymousView)
      {
        DeviceListActivity.this.doDiscovery();
        paramAnonymousView.setVisibility(8);
      }
    });
    this.mPairedDevicesArrayAdapter = new ArrayAdapter(this, 2130903044);
    this.mNewDevicesArrayAdapter = new ArrayAdapter(this, 2130903044);
    ListView localListView1 = (ListView)findViewById(2131099659);
    localListView1.setAdapter(this.mPairedDevicesArrayAdapter);
    localListView1.setOnItemClickListener(this.mDeviceClickListener);
    ListView localListView2 = (ListView)findViewById(2131099661);
    localListView2.setAdapter(this.mNewDevicesArrayAdapter);
    localListView2.setOnItemClickListener(this.mDeviceClickListener);
    IntentFilter localIntentFilter1 = new IntentFilter("android.bluetooth.device.action.FOUND");
    registerReceiver(this.mReceiver, localIntentFilter1);
    IntentFilter localIntentFilter2 = new IntentFilter("android.bluetooth.adapter.action.DISCOVERY_FINISHED");
    registerReceiver(this.mReceiver, localIntentFilter2);
    this.mBtAdapter = BluetoothAdapter.getDefaultAdapter();
    Set localSet = this.mBtAdapter.getBondedDevices();
    if (localSet.size() > 0)
    {
      findViewById(2131099658).setVisibility(0);
      Iterator localIterator = localSet.iterator();
      for (;;)
      {
        if (!localIterator.hasNext()) {
          return;
        }
        BluetoothDevice localBluetoothDevice = (BluetoothDevice)localIterator.next();
        this.mPairedDevicesArrayAdapter.add(localBluetoothDevice.getName() + "\n" + localBluetoothDevice.getAddress());
      }
    }
    String str = getResources().getText(2130968585).toString();
    this.mPairedDevicesArrayAdapter.add(str);
  }
  
  protected void onDestroy()
  {
    super.onDestroy();
    if (this.mBtAdapter != null) {
      this.mBtAdapter.cancelDiscovery();
    }
    unregisterReceiver(this.mReceiver);
  }
}


/* Location:           C:\Users\Rodelle\Desktop\Attacknid\Tools\Attacknids-dex2jar.jar
 * Qualified Name:     com.SixClawWorm.application.DeviceListActivity
 * JD-Core Version:    0.7.0.1
 */