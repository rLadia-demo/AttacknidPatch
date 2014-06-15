package com.SixClawWorm.utils;

import android.graphics.Paint;
import android.graphics.Rect;
import android.graphics.Typeface;
import android.os.Handler;
import android.util.Log;
import com.SixClawWorm.application.PlayControlActivity;
import com.SixClawWorm.application.PlayControlActivity1280;
import com.SixClawWorm.application.PlayControlActivity1920;
import java.io.PrintStream;
import org.anddev.andengine.engine.Engine;
import org.anddev.andengine.engine.camera.Camera;
import org.anddev.andengine.engine.camera.hud.HUD;
import org.anddev.andengine.entity.layer.ILayer;
import org.anddev.andengine.entity.sprite.AnimatedSprite;
import org.anddev.andengine.entity.text.ChangeableText;
import org.anddev.andengine.input.touch.TouchEvent;
import org.anddev.andengine.input.touch.detector.ClickDetector;
import org.anddev.andengine.input.touch.detector.ClickDetector.IClickDetectorListener;
import org.anddev.andengine.opengl.font.Font;
import org.anddev.andengine.opengl.font.FontManager;
import org.anddev.andengine.opengl.texture.Texture;
import org.anddev.andengine.opengl.texture.TextureManager;
import org.anddev.andengine.opengl.texture.TextureOptions;
import org.anddev.andengine.opengl.texture.region.TiledTextureRegion;

public class GButton
  extends HUD
  implements ClickDetector.IClickDetectorListener
{
  public static boolean isPlayControl = false;
  public static long startPauseTime;
  public static long stopTime = 600L;
  private final String TAG = "GButton";
  Handler handler = new Handler();
  private ChangeableText mButonName;
  private AnimatedSprite mControlButton;
  private final GButtonClickListener mGButtonClickListener;
  private boolean mStatus = false;
  Runnable runnable = new Runnable()
  {
    public void run()
    {
      GButton.this.mGButtonClickListener.onClick(GButton.this.mControlButton);
      if ((Param.ConntectSucceed) && (!PlayControlActivity1920.left) && (!PlayControlActivity1920.leftDown) && (!PlayControlActivity1920.leftUp) && (!PlayControlActivity1920.right) && (!PlayControlActivity1920.rightDown) && (!PlayControlActivity1920.rightUp) && (!PlayControlActivity1920.up) && (!PlayControlActivity1920.down) && (!PlayControlActivity1280.left) && (!PlayControlActivity1280.leftDown) && (!PlayControlActivity1280.leftUp) && (!PlayControlActivity1280.right) && (!PlayControlActivity1280.rightDown) && (!PlayControlActivity1280.rightUp) && (!PlayControlActivity1280.up) && (!PlayControlActivity1280.down) && (!PlayControlActivity.left) && (!PlayControlActivity.leftDown) && (!PlayControlActivity.leftUp) && (!PlayControlActivity.right) && (!PlayControlActivity.rightDown) && (!PlayControlActivity.rightUp) && (!PlayControlActivity.up) && (!PlayControlActivity.down) && (GButton.isPlayControl))
      {
        GButton.this.handler.postDelayed(this, 100L);
        return;
      }
      if ((GButton.this.mStatus) && (Param.ConntectSucceed) && (GButton.isPlayControl))
      {
        GButton.this.handler.postDelayed(this, 100L);
        return;
      }
      GButton.this.handler.removeCallbacks(GButton.this.runnable);
    }
  };
  
  public GButton(int paramInt1, int paramInt2, Camera paramCamera, Engine paramEngine, TiledTextureRegion paramTiledTextureRegion, GButtonClickListener paramGButtonClickListener, String paramString)
  {
    setCamera(paramCamera);
    this.mGButtonClickListener = paramGButtonClickListener;
    this.mControlButton = new AnimatedSprite(paramInt1, paramInt2, paramTiledTextureRegion)
    {
      public boolean onAreaTouched(TouchEvent paramAnonymousTouchEvent, float paramAnonymousFloat1, float paramAnonymousFloat2)
      {
        switch (paramAnonymousTouchEvent.getAction())
        {
        default: 
          return true;
        case 0: 
          GButton.startPauseTime = System.currentTimeMillis();
          setCurrentTileIndex(1);
          int i = (int)paramAnonymousFloat1;
          int j = (int)paramAnonymousFloat2;
          System.out.println(i);
          System.out.println(j);
          GButton.this.mStatus = true;
          GButton.this.mGButtonClickListener.onClick(GButton.this.mControlButton);
          GButton.this.handler.postDelayed(GButton.this.runnable, 100L);
          return true;
        }
        long l = GButton.startPauseTime;
        GButton.stopTime = System.currentTimeMillis() - l;
        System.out.println(GButton.stopTime);
        setCurrentTileIndex(0);
        GButton.this.handler.removeCallbacks(GButton.this.runnable);
        PlayControlActivity.redOnclock = false;
        PlayControlActivity.yellowOnclock = false;
        PlayControlActivity.blueOnclock = false;
        PlayControlActivity.greenOnclock = false;
        PlayControlActivity1280.redOnclock = false;
        PlayControlActivity1280.yellowOnclock = false;
        PlayControlActivity1280.blueOnclock = false;
        PlayControlActivity1280.greenOnclock = false;
        PlayControlActivity1920.redOnclock = false;
        PlayControlActivity1920.yellowOnclock = false;
        PlayControlActivity1920.blueOnclock = false;
        PlayControlActivity1920.greenOnclock = false;
        if ((GButton.this.mStatus) && (GUtils.contains(this.mWidth, this.mHeight, paramAnonymousFloat1, paramAnonymousFloat2)) && (GButton.this.mGButtonClickListener != null)) {
          Log.i("GButton", "触发动作....");
        }
        GButton.this.mStatus = false;
        setCurrentTileIndex(0);
        return true;
      }
    };
    this.mControlButton.setCurrentTileIndex(0);
    this.mCamera.getHUD().registerTouchArea(this.mControlButton);
    this.mCamera.getHUD().setTouchAreaBindingEnabled(true);
    getBottomLayer().addEntity(this.mControlButton);
    if (paramString != null)
    {
      Texture localTexture = new Texture(256, 256, TextureOptions.BILINEAR_PREMULTIPLYALPHA);
      Font localFont = new Font(localTexture, Typeface.create(Typeface.DEFAULT, 0), 16.0F, true, -1);
      paramEngine.getTextureManager().loadTexture(localTexture);
      paramEngine.getFontManager().loadFont(localFont);
      Paint localPaint = new Paint();
      Rect localRect = new Rect();
      localPaint.getTextBounds(paramString, 0, paramString.length(), localRect);
      int i = -5 + (paramInt1 + (int)(this.mControlButton.getWidth() - localRect.width()) / 2);
      int j = -2 + (paramInt2 + (int)(this.mControlButton.getHeight() - localRect.height()) / 2);
      this.mButonName = new ChangeableText(i, j, localFont, paramString, 8);
      getBottomLayer().addEntity(this.mButonName);
    }
  }
  
  public float getX()
  {
    if (this.mControlButton != null) {
      return this.mControlButton.getX();
    }
    return 0.0F;
  }
  
  public float getY()
  {
    if (this.mControlButton != null) {
      return this.mControlButton.getY();
    }
    return 0.0F;
  }
  
  public void onClick(ClickDetector paramClickDetector, TouchEvent paramTouchEvent)
  {
    Log.i("GButton", "onClick");
  }
  
  public void setPosition(float paramFloat1, float paramFloat2)
  {
    if (this.mControlButton != null) {
      this.mControlButton.setPosition(paramFloat1, paramFloat2);
    }
  }
  
  public static abstract interface GButtonClickListener
  {
    public abstract void onClick(AnimatedSprite paramAnimatedSprite);
    
    public abstract void onLongClick(AnimatedSprite paramAnimatedSprite);
  }
}


/* Location:           C:\Users\Rodelle\Desktop\Attacknid\Tools\Attacknids-dex2jar.jar
 * Qualified Name:     com.SixClawWorm.utils.GButton
 * JD-Core Version:    0.7.0.1
 */