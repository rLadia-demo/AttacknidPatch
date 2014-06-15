package com.SixClawWorm.application;

import android.app.Activity;
import android.content.Intent;
import android.os.Bundle;
import android.view.KeyEvent;
import android.view.View;
import android.view.View.OnClickListener;
import android.widget.Button;
import com.SixClawWorm.utils.ExitApplication;
import com.SixClawWorm.utils.Param;
import com.SixClawWorm.utils.PlatformScreen;

public class MenuActivity
  extends Activity
{
  private Button Mlayer;
  private Button aboutBtn;
  private Button backBtn;
  private Button introdutionBtn;
  private Button playBtn;
  private Button rssiNum;
  
  protected void onCreate(Bundle paramBundle)
  {
    super.onCreate(paramBundle);
    setContentView(2130903047);
    ExitApplication.getInstance().addActivity(this);
    this.Mlayer = ((Button)findViewById(2131099649));
    this.Mlayer.setOnClickListener(new View.OnClickListener()
    {
      public void onClick(View paramAnonymousView)
      {
        Intent localIntent = new Intent(MenuActivity.this, inTrodutionActivity.class);
        MenuActivity.this.startActivity(localIntent);
      }
    });
    this.aboutBtn = ((Button)findViewById(2131099668));
    this.aboutBtn.setOnClickListener(new View.OnClickListener()
    {
      public void onClick(View paramAnonymousView)
      {
        Intent localIntent = new Intent(MenuActivity.this, aboutActivity.class);
        MenuActivity.this.startActivity(localIntent);
      }
    });
    this.backBtn = ((Button)findViewById(2131099650));
    this.backBtn.setOnClickListener(new View.OnClickListener()
    {
      public void onClick(View paramAnonymousView)
      {
        Intent localIntent = new Intent(MenuActivity.this, BluetoothChat.class);
        MenuActivity.this.startActivity(localIntent);
      }
    });
    this.playBtn = ((Button)findViewById(2131099666));
    this.playBtn.setOnClickListener(new View.OnClickListener()
    {
      public void onClick(View paramAnonymousView)
      {
        if (Param.ConntectSucceed)
        {
          int i = PlatformScreen.GetWidth(MenuActivity.this);
          PlatformScreen.GetHeight(MenuActivity.this);
          if (i == 1280)
          {
            Intent localIntent2 = new Intent(MenuActivity.this, PlayControlActivity1280.class);
            MenuActivity.this.startActivity(localIntent2);
            return;
          }
          if (i == 1920 || i == 1794)
          {
            Intent localIntent3 = new Intent(MenuActivity.this, PlayControlActivity1920.class);
            MenuActivity.this.startActivity(localIntent3);
            return;
          }
          Intent localIntent4 = new Intent(MenuActivity.this, PlayControlActivity.class);
          MenuActivity.this.startActivity(localIntent4);
          return;
        }
        Intent localIntent1 = new Intent(MenuActivity.this, NobluetoothActivity.class);
        MenuActivity.this.startActivity(localIntent1);
      }
    });
    this.introdutionBtn = ((Button)findViewById(2131099667));
    this.introdutionBtn.setOnClickListener(new View.OnClickListener()
    {
      public void onClick(View paramAnonymousView)
      {
        Intent localIntent = new Intent(MenuActivity.this, inTrodutionActivity.class);
        MenuActivity.this.startActivity(localIntent);
      }
    });
  }
  
  public boolean onKeyDown(int paramInt, KeyEvent paramKeyEvent)
  {
    if (paramInt == 4) {
      startActivity(new Intent(this, BluetoothChat.class));
    }
    return super.onKeyDown(paramInt, paramKeyEvent);
  }
}


/* Location:           C:\Users\Rodelle\Desktop\Attacknid\Tools\Attacknids-dex2jar.jar
 * Qualified Name:     com.SixClawWorm.application.MenuActivity
 * JD-Core Version:    0.7.0.1
 */