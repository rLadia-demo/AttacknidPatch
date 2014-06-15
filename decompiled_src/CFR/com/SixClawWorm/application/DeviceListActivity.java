/*
 * Decompiled with CFR 0_79.
 * 
 * Could not load the following classes:
 *  android.app.Activity
 *  android.bluetooth.BluetoothAdapter
 *  android.bluetooth.BluetoothDevice
 *  android.content.BroadcastReceiver
 *  android.content.Context
 *  android.content.Intent
 *  android.content.IntentFilter
 *  android.content.res.Resources
 *  android.os.Bundle
 *  android.os.Parcelable
 *  android.util.Log
 *  android.view.View
 *  android.view.View$OnClickListener
 *  android.widget.AdapterView
 *  android.widget.AdapterView$OnItemClickListener
 *  android.widget.ArrayAdapter
 *  android.widget.Button
 *  android.widget.ListAdapter
 *  android.widget.ListView
 *  android.widget.TextView
 */
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
import android.os.Parcelable;
import android.util.Log;
import android.view.View;
import android.widget.AdapterView;
import android.widget.ArrayAdapter;
import android.widget.Button;
import android.widget.ListAdapter;
import android.widget.ListView;
import android.widget.TextView;
import com.SixClawWorm.utils.ExitApplication;
import com.SixClawWorm.utils.Param;
import java.util.Iterator;
import java.util.Set;

public class DeviceListActivity
extends Activity {
    private static final boolean D = 1;
    public static String EXTRA_DEVICE_ADDRESS = "device_address";
    private static final String TAG = "DeviceListActivity";
    private BluetoothAdapter mBtAdapter;
    private AdapterView.OnItemClickListener mDeviceClickListener;
    private ArrayAdapter<String> mNewDevicesArrayAdapter;
    private ArrayAdapter<String> mPairedDevicesArrayAdapter;
    private final BroadcastReceiver mReceiver;

    public DeviceListActivity() {
        this.mDeviceClickListener = new AdapterView.OnItemClickListener(){

            public void onItemClick(AdapterView<?> adapterView22, View view, int adapterView22, long adapterView22) {
                DeviceListActivity.this.mBtAdapter.cancelDiscovery();
                String string = ((TextView)view).getText().toString();
                try {
                    String string2;
                    Param.address = string2 = string.substring(-17 + string.length());
                    Intent intent = new Intent();
                    intent.putExtra(DeviceListActivity.EXTRA_DEVICE_ADDRESS, string2);
                    DeviceListActivity.this.setResult(-1, intent);
                    DeviceListActivity.this.finish();
                    return;
                }
                catch (Exception var8_5) {
                    var8_5.fillInStackTrace();
                    return;
                }
            }
        };
        this.mReceiver = new BroadcastReceiver(){

            /*
             * Enabled aggressive block sorting
             */
            public void onReceive(Context context, Intent intent) {
                String string = intent.getAction();
                if ("android.bluetooth.device.action.FOUND".equals(string)) {
                    BluetoothDevice bluetoothDevice = (BluetoothDevice)intent.getParcelableExtra("android.bluetooth.device.extra.DEVICE");
                    if (bluetoothDevice.getBondState() == 12) return;
                    DeviceListActivity.this.mNewDevicesArrayAdapter.add((Object)(String.valueOf(bluetoothDevice.getName()) + "\n" + bluetoothDevice.getAddress()));
                    return;
                }
                if (!"android.bluetooth.adapter.action.DISCOVERY_FINISHED".equals(string)) return;
                DeviceListActivity.this.setProgressBarIndeterminateVisibility(false);
                DeviceListActivity.this.setTitle(2130968584);
                if (DeviceListActivity.this.mNewDevicesArrayAdapter.getCount() != 0) return;
                String string2 = DeviceListActivity.this.getResources().getText(2130968586).toString();
                DeviceListActivity.this.mNewDevicesArrayAdapter.add((Object)string2);
            }
        };
    }

    private void doDiscovery() {
        Log.d((String)"DeviceListActivity", (String)"doDiscovery()");
        this.setProgressBarIndeterminateVisibility(true);
        this.setTitle(2130968583);
        this.findViewById(2131099660).setVisibility(0);
        if (this.mBtAdapter.isDiscovering()) {
            this.mBtAdapter.cancelDiscovery();
        }
        this.mBtAdapter.startDiscovery();
    }

    protected void onCreate(Bundle bundle) {
        super.onCreate(bundle);
        this.requestWindowFeature(5);
        this.setContentView(2130903043);
        this.setResult(0);
        ExitApplication.getInstance().addActivity((Activity)this);
        ((Button)this.findViewById(2131099662)).setOnClickListener((View.OnClickListener)new View.OnClickListener(){

            public void onClick(View view) {
                DeviceListActivity.this.doDiscovery();
                view.setVisibility(8);
            }
        });
        this.mPairedDevicesArrayAdapter = new ArrayAdapter((Context)this, 2130903044);
        this.mNewDevicesArrayAdapter = new ArrayAdapter((Context)this, 2130903044);
        ListView listView = (ListView)this.findViewById(2131099659);
        listView.setAdapter(this.mPairedDevicesArrayAdapter);
        listView.setOnItemClickListener(this.mDeviceClickListener);
        ListView listView2 = (ListView)this.findViewById(2131099661);
        listView2.setAdapter(this.mNewDevicesArrayAdapter);
        listView2.setOnItemClickListener(this.mDeviceClickListener);
        IntentFilter intentFilter = new IntentFilter("android.bluetooth.device.action.FOUND");
        this.registerReceiver(this.mReceiver, intentFilter);
        IntentFilter intentFilter2 = new IntentFilter("android.bluetooth.adapter.action.DISCOVERY_FINISHED");
        this.registerReceiver(this.mReceiver, intentFilter2);
        this.mBtAdapter = BluetoothAdapter.getDefaultAdapter();
        Set set = this.mBtAdapter.getBondedDevices();
        if (set.size() > 0) {
            this.findViewById(2131099658).setVisibility(0);
            Iterator iterator = set.iterator();
            do {
                if (!iterator.hasNext()) {
                    return;
                }
                BluetoothDevice bluetoothDevice = (BluetoothDevice)iterator.next();
                this.mPairedDevicesArrayAdapter.add((Object)(String.valueOf(bluetoothDevice.getName()) + "\n" + bluetoothDevice.getAddress()));
            } while (true);
        }
        String string = this.getResources().getText(2130968585).toString();
        this.mPairedDevicesArrayAdapter.add((Object)string);
    }

    protected void onDestroy() {
        super.onDestroy();
        if (this.mBtAdapter != null) {
            this.mBtAdapter.cancelDiscovery();
        }
        this.unregisterReceiver(this.mReceiver);
    }

}

