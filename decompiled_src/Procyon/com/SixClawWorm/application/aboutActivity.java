package com.SixClawWorm.application;

import android.app.*;
import android.widget.*;
import android.os.*;
import com.SixClawWorm.utils.*;
import android.view.*;
import android.content.*;
import android.net.*;

public class aboutActivity extends Activity
{
    private Button Mlayer;
    private Button Myt_Btn;
    private Button about_logoBtn;
    private Button backBtn;
    private Button facebook_Btn;
    private Button mtwitter_button;
    private Button wow_Btn;
    
    protected void onCreate(final Bundle bundle) {
        super.onCreate(bundle);
        this.requestWindowFeature(1);
        this.getWindow().setFlags(1024, 1024);
        this.setContentView(2130903040);
        ExitApplication.getInstance().addActivity(this);
        (this.backBtn = (Button)this.findViewById(2131099650)).setOnClickListener((View$OnClickListener)new View$OnClickListener() {
            public void onClick(final View view) {
                aboutActivity.this.finish();
            }
        });
        (this.Mlayer = (Button)this.findViewById(2131099649)).setOnClickListener((View$OnClickListener)new View$OnClickListener() {
            public void onClick(final View view) {
                aboutActivity.this.startActivity(new Intent((Context)aboutActivity.this, (Class)inTrodutionActivity.class));
            }
        });
        (this.wow_Btn = (Button)this.findViewById(2131099651)).setOnClickListener((View$OnClickListener)new View$OnClickListener() {
            public void onClick(final View view) {
                aboutActivity.this.startActivity(new Intent("android.intent.action.VIEW", Uri.parse("http://www.WowStuff.com")));
            }
        });
        (this.facebook_Btn = (Button)this.findViewById(2131099652)).setOnClickListener((View$OnClickListener)new View$OnClickListener() {
            public void onClick(final View view) {
                aboutActivity.this.startActivity(new Intent("android.intent.action.VIEW", Uri.parse("http://www.Facebook.com/CombatCreatures")));
            }
        });
        (this.mtwitter_button = (Button)this.findViewById(2131099653)).setOnClickListener((View$OnClickListener)new View$OnClickListener() {
            public void onClick(final View view) {
                aboutActivity.this.startActivity(new Intent("android.intent.action.VIEW", Uri.parse("http://www.Twitter.com/CombatCreatures")));
            }
        });
        (this.Myt_Btn = (Button)this.findViewById(2131099654)).setOnClickListener((View$OnClickListener)new View$OnClickListener() {
            public void onClick(final View view) {
                aboutActivity.this.startActivity(new Intent("android.intent.action.VIEW", Uri.parse("http://www.YouTube.com/WowStuffOnline")));
            }
        });
        (this.about_logoBtn = (Button)this.findViewById(2131099648)).setOnClickListener((View$OnClickListener)new View$OnClickListener() {
            public void onClick(final View view) {
                aboutActivity.this.startActivity(new Intent("android.intent.action.VIEW", Uri.parse("http://www.CombatCreatures.com")));
            }
        });
    }
}
