package com.SixClawWorm.application;

import android.app.Activity;
import android.content.Intent;
import android.net.Uri;
import android.os.Bundle;
import android.view.View;
import android.view.View.OnClickListener;
import android.view.Window;
import android.widget.Button;
import com.SixClawWorm.utils.ExitApplication;

public class aboutActivity
  extends Activity
{
  private Button Mlayer;
  private Button Myt_Btn;
  private Button about_logoBtn;
  private Button backBtn;
  private Button facebook_Btn;
  private Button mtwitter_button;
  private Button wow_Btn;
  
  protected void onCreate(Bundle paramBundle)
  {
    super.onCreate(paramBundle);
    requestWindowFeature(1);
    getWindow().setFlags(1024, 1024);
    setContentView(2130903040);
    ExitApplication.getInstance().addActivity(this);
    this.backBtn = ((Button)findViewById(2131099650));
    this.backBtn.setOnClickListener(new View.OnClickListener()
    {
      public void onClick(View paramAnonymousView)
      {
        aboutActivity.this.finish();
      }
    });
    this.Mlayer = ((Button)findViewById(2131099649));
    this.Mlayer.setOnClickListener(new View.OnClickListener()
    {
      public void onClick(View paramAnonymousView)
      {
        Intent localIntent = new Intent(aboutActivity.this, inTrodutionActivity.class);
        aboutActivity.this.startActivity(localIntent);
      }
    });
    this.wow_Btn = ((Button)findViewById(2131099651));
    this.wow_Btn.setOnClickListener(new View.OnClickListener()
    {
      public void onClick(View paramAnonymousView)
      {
        Uri localUri = Uri.parse("http://www.WowStuff.com");
        aboutActivity.this.startActivity(new Intent("android.intent.action.VIEW", localUri));
      }
    });
    this.facebook_Btn = ((Button)findViewById(2131099652));
    this.facebook_Btn.setOnClickListener(new View.OnClickListener()
    {
      public void onClick(View paramAnonymousView)
      {
        Uri localUri = Uri.parse("http://www.Facebook.com/CombatCreatures");
        aboutActivity.this.startActivity(new Intent("android.intent.action.VIEW", localUri));
      }
    });
    this.mtwitter_button = ((Button)findViewById(2131099653));
    this.mtwitter_button.setOnClickListener(new View.OnClickListener()
    {
      public void onClick(View paramAnonymousView)
      {
        Uri localUri = Uri.parse("http://www.Twitter.com/CombatCreatures");
        aboutActivity.this.startActivity(new Intent("android.intent.action.VIEW", localUri));
      }
    });
    this.Myt_Btn = ((Button)findViewById(2131099654));
    this.Myt_Btn.setOnClickListener(new View.OnClickListener()
    {
      public void onClick(View paramAnonymousView)
      {
        Uri localUri = Uri.parse("http://www.YouTube.com/WowStuffOnline");
        aboutActivity.this.startActivity(new Intent("android.intent.action.VIEW", localUri));
      }
    });
    this.about_logoBtn = ((Button)findViewById(2131099648));
    this.about_logoBtn.setOnClickListener(new View.OnClickListener()
    {
      public void onClick(View paramAnonymousView)
      {
        Uri localUri = Uri.parse("http://www.CombatCreatures.com");
        aboutActivity.this.startActivity(new Intent("android.intent.action.VIEW", localUri));
      }
    });
  }
}


/* Location:           C:\Users\Rodelle\Desktop\Attacknid\Tools\Attacknids-dex2jar.jar
 * Qualified Name:     com.SixClawWorm.application.aboutActivity
 * JD-Core Version:    0.7.0.1
 */