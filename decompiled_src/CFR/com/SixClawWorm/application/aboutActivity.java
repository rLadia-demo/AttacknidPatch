/*
 * Decompiled with CFR 0_79.
 * 
 * Could not load the following classes:
 *  android.app.Activity
 *  android.content.Context
 *  android.content.Intent
 *  android.net.Uri
 *  android.os.Bundle
 *  android.view.View
 *  android.view.View$OnClickListener
 *  android.view.Window
 *  android.widget.Button
 */
package com.SixClawWorm.application;

import android.app.Activity;
import android.content.Context;
import android.content.Intent;
import android.net.Uri;
import android.os.Bundle;
import android.view.View;
import android.view.Window;
import android.widget.Button;
import com.SixClawWorm.application.inTrodutionActivity;
import com.SixClawWorm.utils.ExitApplication;

public class aboutActivity
extends Activity {
    private Button Mlayer;
    private Button Myt_Btn;
    private Button about_logoBtn;
    private Button backBtn;
    private Button facebook_Btn;
    private Button mtwitter_button;
    private Button wow_Btn;

    protected void onCreate(Bundle bundle) {
        super.onCreate(bundle);
        this.requestWindowFeature(1);
        this.getWindow().setFlags(1024, 1024);
        this.setContentView(2130903040);
        ExitApplication.getInstance().addActivity((Activity)this);
        this.backBtn = (Button)this.findViewById(2131099650);
        this.backBtn.setOnClickListener((View.OnClickListener)new View.OnClickListener(){

            public void onClick(View view) {
                aboutActivity.this.finish();
            }
        });
        this.Mlayer = (Button)this.findViewById(2131099649);
        this.Mlayer.setOnClickListener((View.OnClickListener)new View.OnClickListener(){

            public void onClick(View view) {
                Intent intent = new Intent((Context)aboutActivity.this, (Class)inTrodutionActivity.class);
                aboutActivity.this.startActivity(intent);
            }
        });
        this.wow_Btn = (Button)this.findViewById(2131099651);
        this.wow_Btn.setOnClickListener((View.OnClickListener)new View.OnClickListener(){

            public void onClick(View view) {
                Uri uri = Uri.parse((String)"http://www.WowStuff.com");
                aboutActivity.this.startActivity(new Intent("android.intent.action.VIEW", uri));
            }
        });
        this.facebook_Btn = (Button)this.findViewById(2131099652);
        this.facebook_Btn.setOnClickListener((View.OnClickListener)new View.OnClickListener(){

            public void onClick(View view) {
                Uri uri = Uri.parse((String)"http://www.Facebook.com/CombatCreatures");
                aboutActivity.this.startActivity(new Intent("android.intent.action.VIEW", uri));
            }
        });
        this.mtwitter_button = (Button)this.findViewById(2131099653);
        this.mtwitter_button.setOnClickListener((View.OnClickListener)new View.OnClickListener(){

            public void onClick(View view) {
                Uri uri = Uri.parse((String)"http://www.Twitter.com/CombatCreatures");
                aboutActivity.this.startActivity(new Intent("android.intent.action.VIEW", uri));
            }
        });
        this.Myt_Btn = (Button)this.findViewById(2131099654);
        this.Myt_Btn.setOnClickListener((View.OnClickListener)new View.OnClickListener(){

            public void onClick(View view) {
                Uri uri = Uri.parse((String)"http://www.YouTube.com/WowStuffOnline");
                aboutActivity.this.startActivity(new Intent("android.intent.action.VIEW", uri));
            }
        });
        this.about_logoBtn = (Button)this.findViewById(2131099648);
        this.about_logoBtn.setOnClickListener((View.OnClickListener)new View.OnClickListener(){

            public void onClick(View view) {
                Uri uri = Uri.parse((String)"http://www.CombatCreatures.com");
                aboutActivity.this.startActivity(new Intent("android.intent.action.VIEW", uri));
            }
        });
    }

}

