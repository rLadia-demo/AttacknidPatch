/*
 * Decompiled with CFR 0_79.
 * 
 * Could not load the following classes:
 *  android.app.Activity
 *  android.content.Context
 *  android.content.Intent
 *  android.os.Bundle
 *  android.view.KeyEvent
 *  android.view.View
 *  android.view.View$OnClickListener
 *  android.widget.Button
 */
package com.SixClawWorm.application;

import android.app.Activity;
import android.content.Context;
import android.content.Intent;
import android.os.Bundle;
import android.view.KeyEvent;
import android.view.View;
import android.widget.Button;
import com.SixClawWorm.application.BluetoothChat;
import com.SixClawWorm.application.NobluetoothActivity;
import com.SixClawWorm.application.PlayControlActivity;
import com.SixClawWorm.application.PlayControlActivity1280;
import com.SixClawWorm.application.PlayControlActivity1920;
import com.SixClawWorm.application.aboutActivity;
import com.SixClawWorm.application.inTrodutionActivity;
import com.SixClawWorm.utils.ExitApplication;
import com.SixClawWorm.utils.Param;
import com.SixClawWorm.utils.PlatformScreen;

public class MenuActivity
extends Activity {
    private Button Mlayer;
    private Button aboutBtn;
    private Button backBtn;
    private Button introdutionBtn;
    private Button playBtn;
    private Button rssiNum;

    protected void onCreate(Bundle bundle) {
        super.onCreate(bundle);
        this.setContentView(2130903047);
        ExitApplication.getInstance().addActivity((Activity)this);
        this.Mlayer = (Button)this.findViewById(2131099649);
        this.Mlayer.setOnClickListener((View.OnClickListener)new View.OnClickListener(){

            public void onClick(View view) {
                Intent intent = new Intent((Context)MenuActivity.this, (Class)inTrodutionActivity.class);
                MenuActivity.this.startActivity(intent);
            }
        });
        this.aboutBtn = (Button)this.findViewById(2131099668);
        this.aboutBtn.setOnClickListener((View.OnClickListener)new View.OnClickListener(){

            public void onClick(View view) {
                Intent intent = new Intent((Context)MenuActivity.this, (Class)aboutActivity.class);
                MenuActivity.this.startActivity(intent);
            }
        });
        this.backBtn = (Button)this.findViewById(2131099650);
        this.backBtn.setOnClickListener((View.OnClickListener)new View.OnClickListener(){

            public void onClick(View view) {
                Intent intent = new Intent((Context)MenuActivity.this, (Class)BluetoothChat.class);
                MenuActivity.this.startActivity(intent);
            }
        });
        this.playBtn = (Button)this.findViewById(2131099666);
        this.playBtn.setOnClickListener((View.OnClickListener)new View.OnClickListener(){

            public void onClick(View view) {
                if (Param.ConntectSucceed) {
                    int n = PlatformScreen.GetWidth((Activity)MenuActivity.this);
                    PlatformScreen.GetHeight((Activity)MenuActivity.this);
                    if (n == 1280) {
                        Intent intent = new Intent((Context)MenuActivity.this, (Class)PlayControlActivity1280.class);
                        MenuActivity.this.startActivity(intent);
                        return;
                    }
                    if (n == 1920) {
                        Intent intent = new Intent((Context)MenuActivity.this, (Class)PlayControlActivity1920.class);
                        MenuActivity.this.startActivity(intent);
                        return;
                    }
                    Intent intent = new Intent((Context)MenuActivity.this, (Class)PlayControlActivity.class);
                    MenuActivity.this.startActivity(intent);
                    return;
                }
                Intent intent = new Intent((Context)MenuActivity.this, (Class)NobluetoothActivity.class);
                MenuActivity.this.startActivity(intent);
            }
        });
        this.introdutionBtn = (Button)this.findViewById(2131099667);
        this.introdutionBtn.setOnClickListener((View.OnClickListener)new View.OnClickListener(){

            public void onClick(View view) {
                Intent intent = new Intent((Context)MenuActivity.this, (Class)inTrodutionActivity.class);
                MenuActivity.this.startActivity(intent);
            }
        });
    }

    public boolean onKeyDown(int n, KeyEvent keyEvent) {
        if (n != 4) return super.onKeyDown(n, keyEvent);
        this.startActivity(new Intent((Context)this, (Class)BluetoothChat.class));
        return super.onKeyDown(n, keyEvent);
    }

}

