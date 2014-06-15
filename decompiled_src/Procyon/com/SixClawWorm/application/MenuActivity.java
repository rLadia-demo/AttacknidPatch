package com.SixClawWorm.application;

import android.app.*;
import android.widget.*;
import android.os.*;
import android.content.*;
import com.SixClawWorm.utils.*;
import android.view.*;

public class MenuActivity extends Activity
{
    private Button Mlayer;
    private Button aboutBtn;
    private Button backBtn;
    private Button introdutionBtn;
    private Button playBtn;
    private Button rssiNum;
    
    protected void onCreate(final Bundle bundle) {
        super.onCreate(bundle);
        this.setContentView(2130903047);
        ExitApplication.getInstance().addActivity(this);
        (this.Mlayer = (Button)this.findViewById(2131099649)).setOnClickListener((View$OnClickListener)new View$OnClickListener() {
            public void onClick(final View view) {
                MenuActivity.this.startActivity(new Intent((Context)MenuActivity.this, (Class)inTrodutionActivity.class));
            }
        });
        (this.aboutBtn = (Button)this.findViewById(2131099668)).setOnClickListener((View$OnClickListener)new View$OnClickListener() {
            public void onClick(final View view) {
                MenuActivity.this.startActivity(new Intent((Context)MenuActivity.this, (Class)aboutActivity.class));
            }
        });
        (this.backBtn = (Button)this.findViewById(2131099650)).setOnClickListener((View$OnClickListener)new View$OnClickListener() {
            public void onClick(final View view) {
                MenuActivity.this.startActivity(new Intent((Context)MenuActivity.this, (Class)BluetoothChat.class));
            }
        });
        (this.playBtn = (Button)this.findViewById(2131099666)).setOnClickListener((View$OnClickListener)new View$OnClickListener() {
            public void onClick(final View view) {
                if (!Param.ConntectSucceed) {
                    MenuActivity.this.startActivity(new Intent((Context)MenuActivity.this, (Class)NobluetoothActivity.class));
                    return;
                }
                final int getWidth = PlatformScreen.GetWidth(MenuActivity.this);
                PlatformScreen.GetHeight(MenuActivity.this);
                if (getWidth == 1280) {
                    MenuActivity.this.startActivity(new Intent((Context)MenuActivity.this, (Class)PlayControlActivity1280.class));
                    return;
                }
                if (getWidth == 1920) {
                    MenuActivity.this.startActivity(new Intent((Context)MenuActivity.this, (Class)PlayControlActivity1920.class));
                    return;
                }
                MenuActivity.this.startActivity(new Intent((Context)MenuActivity.this, (Class)PlayControlActivity.class));
            }
        });
        (this.introdutionBtn = (Button)this.findViewById(2131099667)).setOnClickListener((View$OnClickListener)new View$OnClickListener() {
            public void onClick(final View view) {
                MenuActivity.this.startActivity(new Intent((Context)MenuActivity.this, (Class)inTrodutionActivity.class));
            }
        });
    }
    
    public boolean onKeyDown(final int n, final KeyEvent keyEvent) {
        if (n == 4) {
            this.startActivity(new Intent((Context)this, (Class)BluetoothChat.class));
        }
        return super.onKeyDown(n, keyEvent);
    }
}
