package com.SixClawWorm.application;

import android.app.*;
import android.bluetooth.*;
import android.util.*;
import android.os.*;
import com.SixClawWorm.utils.*;
import android.view.*;
import android.widget.*;
import android.content.*;
import java.util.*;

public class DeviceListActivity extends Activity
{
    private static final boolean D = true;
    public static String EXTRA_DEVICE_ADDRESS;
    private static final String TAG = "DeviceListActivity";
    private BluetoothAdapter mBtAdapter;
    private AdapterView$OnItemClickListener mDeviceClickListener;
    private ArrayAdapter<String> mNewDevicesArrayAdapter;
    private ArrayAdapter<String> mPairedDevicesArrayAdapter;
    private final BroadcastReceiver mReceiver;
    
    static {
        DeviceListActivity.EXTRA_DEVICE_ADDRESS = "device_address";
    }
    
    public DeviceListActivity() {
        super();
        this.mDeviceClickListener = (AdapterView$OnItemClickListener)new AdapterView$OnItemClickListener() {
            public void onItemClick(final AdapterView<?> adapterView, final View view, final int n, final long n2) {
                DeviceListActivity.this.mBtAdapter.cancelDiscovery();
                final String string = ((TextView)view).getText().toString();
                try {
                    final String s = Param.address = string.substring(-17 + string.length());
                    final Intent intent = new Intent();
                    intent.putExtra(DeviceListActivity.EXTRA_DEVICE_ADDRESS, s);
                    DeviceListActivity.this.setResult(-1, intent);
                    DeviceListActivity.this.finish();
                }
                catch (Exception ex) {
                    ex.fillInStackTrace();
                }
            }
        };
        this.mReceiver = new BroadcastReceiver() {
            public void onReceive(final Context context, final Intent intent) {
                final String action = intent.getAction();
                if ("android.bluetooth.device.action.FOUND".equals(action)) {
                    final BluetoothDevice bluetoothDevice = (BluetoothDevice)intent.getParcelableExtra("android.bluetooth.device.extra.DEVICE");
                    if (bluetoothDevice.getBondState() != 12) {
                        DeviceListActivity.this.mNewDevicesArrayAdapter.add((Object)(String.valueOf(bluetoothDevice.getName()) + "\n" + bluetoothDevice.getAddress()));
                    }
                }
                else if ("android.bluetooth.adapter.action.DISCOVERY_FINISHED".equals(action)) {
                    DeviceListActivity.this.setProgressBarIndeterminateVisibility(false);
                    DeviceListActivity.this.setTitle(2130968584);
                    if (DeviceListActivity.this.mNewDevicesArrayAdapter.getCount() == 0) {
                        DeviceListActivity.this.mNewDevicesArrayAdapter.add((Object)DeviceListActivity.this.getResources().getText(2130968586).toString());
                    }
                }
            }
        };
    }
    
    private void doDiscovery() {
        Log.d("DeviceListActivity", "doDiscovery()");
        this.setProgressBarIndeterminateVisibility(true);
        this.setTitle(2130968583);
        this.findViewById(2131099660).setVisibility(0);
        if (this.mBtAdapter.isDiscovering()) {
            this.mBtAdapter.cancelDiscovery();
        }
        this.mBtAdapter.startDiscovery();
    }
    
    protected void onCreate(final Bundle bundle) {
        super.onCreate(bundle);
        this.requestWindowFeature(5);
        this.setContentView(2130903043);
        this.setResult(0);
        ExitApplication.getInstance().addActivity(this);
        ((Button)this.findViewById(2131099662)).setOnClickListener((View$OnClickListener)new View$OnClickListener() {
            public void onClick(final View view) {
                DeviceListActivity.this.doDiscovery();
                view.setVisibility(8);
            }
        });
        this.mPairedDevicesArrayAdapter = (ArrayAdapter<String>)new ArrayAdapter((Context)this, 2130903044);
        this.mNewDevicesArrayAdapter = (ArrayAdapter<String>)new ArrayAdapter((Context)this, 2130903044);
        final ListView listView = (ListView)this.findViewById(2131099659);
        listView.setAdapter((ListAdapter)this.mPairedDevicesArrayAdapter);
        listView.setOnItemClickListener(this.mDeviceClickListener);
        final ListView listView2 = (ListView)this.findViewById(2131099661);
        listView2.setAdapter((ListAdapter)this.mNewDevicesArrayAdapter);
        listView2.setOnItemClickListener(this.mDeviceClickListener);
        this.registerReceiver(this.mReceiver, new IntentFilter("android.bluetooth.device.action.FOUND"));
        this.registerReceiver(this.mReceiver, new IntentFilter("android.bluetooth.adapter.action.DISCOVERY_FINISHED"));
        this.mBtAdapter = BluetoothAdapter.getDefaultAdapter();
        final Set bondedDevices = this.mBtAdapter.getBondedDevices();
        if (bondedDevices.size() > 0) {
            this.findViewById(2131099658).setVisibility(0);
            for (final BluetoothDevice bluetoothDevice : bondedDevices) {
                this.mPairedDevicesArrayAdapter.add((Object)(String.valueOf(bluetoothDevice.getName()) + "\n" + bluetoothDevice.getAddress()));
            }
            return;
        }
        this.mPairedDevicesArrayAdapter.add((Object)this.getResources().getText(2130968585).toString());
    }
    
    protected void onDestroy() {
        super.onDestroy();
        if (this.mBtAdapter != null) {
            this.mBtAdapter.cancelDiscovery();
        }
        this.unregisterReceiver(this.mReceiver);
    }
}
