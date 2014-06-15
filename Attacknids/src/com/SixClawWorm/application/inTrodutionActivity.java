package com.SixClawWorm.application;

import android.app.Activity;
import android.content.Context;
import android.content.Intent;
import android.content.res.Resources;
import android.graphics.Bitmap;
import android.graphics.Bitmap.Config;
import android.graphics.BitmapFactory;
import android.graphics.BitmapFactory.Options;
import android.os.Bundle;
import android.view.KeyEvent;
import android.view.View;
import android.view.View.OnClickListener;
import android.view.ViewTreeObserver;
import android.view.Window;
import android.webkit.WebSettings;
import android.webkit.WebSettings.LayoutAlgorithm;
import android.webkit.WebView;
import android.widget.Button;
import android.widget.ZoomButtonsController;
import com.SixClawWorm.utils.DragImageView;
import com.SixClawWorm.utils.ExitApplication;
import com.SixClawWorm.utils.PlatformScreen;
import java.lang.reflect.Field;

public class inTrodutionActivity
  extends Activity
{
  private Button backBtn;
  Bitmap bmp = null;
  private DragImageView dragImageView;
  private int state_height;
  private ViewTreeObserver viewTreeObserver;
  private WebView webview;
  private int window_height;
  private int window_width;
  
  public Bitmap ReadBitmapById(Context paramContext, int paramInt)
  {
    BitmapFactory.Options localOptions = new BitmapFactory.Options();
    localOptions.inPreferredConfig = Bitmap.Config.RGB_565;
    localOptions.inPurgeable = true;
    localOptions.inInputShareable = true;
    localOptions.inSampleSize = 2;
    return BitmapFactory.decodeStream(paramContext.getResources().openRawResource(paramInt), null, localOptions);
  }
  
  protected void onCreate(Bundle paramBundle)
  {
    super.onCreate(paramBundle);
    requestWindowFeature(1);
    getWindow().setFlags(1024, 1024);
    setContentView(2130903050);
    PlatformScreen.GetWidth(this);
    PlatformScreen.GetHeight(this);
    this.webview = ((WebView)findViewById(2131099671));
    this.webview.getSettings().setUseWideViewPort(true);
    this.webview.getSettings().setBuiltInZoomControls(true);
    setZoomControlGone(this.webview);
    this.webview.getSettings().setSupportZoom(true);
    this.webview.getSettings().setLayoutAlgorithm(WebSettings.LayoutAlgorithm.SINGLE_COLUMN);
    this.webview.setInitialScale(1);
    this.webview.getSettings().setDisplayZoomControls(false);
    this.webview.loadUrl("file:///android_asset/gfx/introtionalpic1280.jpg");
    ExitApplication.getInstance().addActivity(this);
    this.backBtn = ((Button)findViewById(2131099650));
    this.backBtn.setOnClickListener(new View.OnClickListener()
    {
      public void onClick(View paramAnonymousView)
      {
        Intent localIntent = new Intent(inTrodutionActivity.this, MenuActivity.class);
        inTrodutionActivity.this.startActivity(localIntent);
      }
    });
  }
  
  public boolean onKeyDown(int paramInt, KeyEvent paramKeyEvent)
  {
    if (paramInt == 4) {
      finish();
    }
    return super.onKeyDown(paramInt, paramKeyEvent);
  }
  
  protected void onStop()
  {
    if ((this.bmp != null) && (!this.bmp.isRecycled()))
    {
      this.bmp.recycle();
      System.gc();
      this.bmp = null;
    }
    super.onStop();
  }
  
  public void setZoomControlGone(View paramView)
  {
    try
    {
      Field localField = WebView.class.getDeclaredField("mZoomButtonsController");
      localField.setAccessible(true);
      ZoomButtonsController localZoomButtonsController = new ZoomButtonsController(paramView);
      localZoomButtonsController.getZoomControls().setVisibility(8);
      return;
    }
    catch (SecurityException localSecurityException)
    {
      try
      {
        localField.set(paramView, localZoomButtonsController);
        return;
      }
      catch (IllegalArgumentException localIllegalArgumentException)
      {
        localIllegalArgumentException.printStackTrace();
        return;
        localSecurityException = localSecurityException;
        localSecurityException.printStackTrace();
        return;
      }
      catch (IllegalAccessException localIllegalAccessException)
      {
        localIllegalAccessException.printStackTrace();
        return;
      }
    }
    catch (NoSuchFieldException localNoSuchFieldException)
    {
      localNoSuchFieldException.printStackTrace();
    }
  }
}


/* Location:           C:\Users\Rodelle\Desktop\Attacknid\Tools\Attacknids-dex2jar.jar
 * Qualified Name:     com.SixClawWorm.application.inTrodutionActivity
 * JD-Core Version:    0.7.0.1
 */