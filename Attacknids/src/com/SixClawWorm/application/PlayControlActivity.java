package com.SixClawWorm.application;

import android.content.Intent;
import android.os.Bundle;
import android.os.Handler;
import android.os.Message;
import android.util.Log;
import android.view.KeyEvent;
import com.SixClawWorm.utils.ExitApplication;
import com.SixClawWorm.utils.GButton;
import com.SixClawWorm.utils.GButton.GButtonClickListener;
import com.SixClawWorm.utils.Param;
import com.SixClawWorm.utils.PlatformScreen;
import java.io.PrintStream;
import org.anddev.andengine.engine.Engine;
import org.anddev.andengine.engine.camera.Camera;
import org.anddev.andengine.engine.camera.hud.HUD;
import org.anddev.andengine.engine.camera.hud.controls.AnalogOnScreenControl;
import org.anddev.andengine.engine.camera.hud.controls.AnalogOnScreenControl.IAnalogOnScreenControlListener;
import org.anddev.andengine.engine.camera.hud.controls.BaseOnScreenControl;
import org.anddev.andengine.engine.options.EngineOptions;
import org.anddev.andengine.engine.options.EngineOptions.ScreenOrientation;
import org.anddev.andengine.engine.options.resolutionpolicy.RatioResolutionPolicy;
import org.anddev.andengine.entity.layer.ILayer;
import org.anddev.andengine.entity.scene.Scene;
import org.anddev.andengine.entity.sprite.AnimatedSprite;
import org.anddev.andengine.entity.sprite.Sprite;
import org.anddev.andengine.entity.util.FPSLogger;
import org.anddev.andengine.extension.input.touch.controller.MultiTouch;
import org.anddev.andengine.extension.input.touch.controller.MultiTouchController;
import org.anddev.andengine.extension.input.touch.controller.MultiTouchException;
import org.anddev.andengine.opengl.texture.Texture;
import org.anddev.andengine.opengl.texture.TextureManager;
import org.anddev.andengine.opengl.texture.TextureOptions;
import org.anddev.andengine.opengl.texture.region.TextureRegion;
import org.anddev.andengine.opengl.texture.region.TextureRegionFactory;
import org.anddev.andengine.opengl.texture.region.TiledTextureRegion;
import org.anddev.andengine.ui.activity.BaseGameActivity;

public class PlayControlActivity
  extends BaseGameActivity
{
  private static final int DIR_DOWN = 3;
  private static final int DIR_LEFT = 0;
  private static final int DIR_LEFT_DOWN = 5;
  private static final int DIR_LEFT_UP = 4;
  private static final int DIR_PRESSED = -1;
  private static final int DIR_RELEASE = -2;
  private static final int DIR_RIGHT = 1;
  private static final int DIR_RIGHT_DOWN = 7;
  private static final int DIR_RIGHT_UP = 6;
  private static final int DIR_UP = 2;
  public static boolean blueOnclock;
  public static boolean down;
  public static boolean greenOnclock;
  public static boolean ifPlayControlActivity = false;
  public static boolean left;
  public static boolean leftDown;
  public static boolean leftUp;
  public static boolean redOnclock = false;
  public static boolean right;
  public static boolean rightDown;
  public static boolean rightUp;
  public static boolean up;
  public static boolean yellowOnclock = false;
  private int CAMERA_HEIGHT = 800;
  private int CAMERA_WIDTH = 480;
  private int RockerCircleR = 50;
  private int RockerCircleX = 0;
  private int RockerCircleY = 128;
  private String StartStr = "7104808080808001";
  boolean UpSongkai = false;
  private GButton aboutButton;
  private TiledTextureRegion aboutButtonRegion;
  private GButton backButton;
  private TiledTextureRegion backButtonRegion;
  private GButton blueButton;
  private TiledTextureRegion blueButtonRegion;
  int firstOnclock = 0;
  private GButton greenButton;
  private TiledTextureRegion greenButtonRegion;
  Handler handler = new Handler();
  private Sprite mBackgroundSprite;
  private TextureRegion mBackgroundTextureRegion;
  private Camera mCamera;
  private BluetoothChatService mChatService = null;
  private Texture mControlButtonTexture;
  private HUD mHudScene;
  private TextureRegion mOnScreenControlBaseTextureRegion;
  private TextureRegion mOnScreenControlKnobTextureRegion;
  private Texture mOnScreenControlTexture;
  private StringBuffer mOutStringBuffer;
  private Texture mTexture;
  private Handler mhandler = new Handler()
  {
    public void handleMessage(Message paramAnonymousMessage)
    {
      switch (paramAnonymousMessage.what)
      {
      }
    }
  };
  private GButton redButton;
  private TiledTextureRegion redButtonRegion;
  Runnable runnable = new Runnable()
  {
    public void run()
    {
      if ((!Param.ConntectSucceed) && (PlayControlActivity.this.sencondOnclock == 0))
      {
        Intent localIntent = new Intent(PlayControlActivity.this, NobluetoothActivity.class);
        PlayControlActivity.this.startActivity(localIntent);
        Param.ConntectSucceed = false;
        PlayControlActivity.this.sencondOnclock = 1;
        PlayControlActivity.this.stopThread = true;
        PlayControlActivity.this.handler.removeCallbacks(PlayControlActivity.this.runnable);
      }
      PlayControlActivity.this.handler.postDelayed(this, 10L);
    }
  };
  int sencondOnclock = 0;
  private AnimatedSprite singalSprite;
  private TiledTextureRegion singalSpriteRegion;
  private long startPauseTime;
  boolean stopThread = false;
  long stopTime = 0L;
  private GButton yellowButton;
  private TiledTextureRegion yellowButtonRegion;
  
  static
  {
    blueOnclock = false;
    greenOnclock = false;
    left = false;
    right = false;
    up = false;
    down = false;
    leftUp = false;
    leftDown = false;
    rightUp = false;
    rightDown = false;
  }
  
  private void TsendMessage(byte[] paramArrayOfByte)
  {
    this.stopThread = false;
    this.mChatService = Param.ChatService;
    this.mOutStringBuffer = new StringBuffer("");
    if (this.mChatService != null) {
      if (this.mChatService.getState() != 3) {
        Param.ConntectSucceed = false;
      }
    }
    for (;;)
    {
      return;
      try
      {
        Thread.sleep(98L);
        if (paramArrayOfByte.length <= 0) {
          continue;
        }
        this.mChatService.write(paramArrayOfByte);
        this.mOutStringBuffer.setLength(0);
        return;
      }
      catch (InterruptedException localInterruptedException)
      {
        for (;;)
        {
          localInterruptedException.printStackTrace();
        }
      }
    }
  }
  
  private void gotoAbout()
  {
    startActivity(new Intent(this, inTrodutionActivity.class));
  }
  
  private void onKnobDirectionChange(int paramInt)
  {
    switch (paramInt)
    {
    }
    for (;;)
    {
      this.stopThread = true;
      return;
      Log.e("SJF", "【左】 ");
      left = true;
      if (greenOnclock)
      {
        sendMessage(string2Bytes("7100808280800248"));
      }
      else if (blueOnclock)
      {
        sendMessage(string2Bytes("7100808282808028"));
      }
      else if (yellowOnclock)
      {
        sendMessage(string2Bytes("7100808202808018"));
      }
      else if (redOnclock)
      {
        sendMessage(string2Bytes("7100808280808288"));
      }
      else
      {
        sendMessage(string2Bytes("7100808280808008"));
        continue;
        Log.e("SJF", "【右】 ");
        right = true;
        if (redOnclock)
        {
          sendMessage(string2Bytes("7100800280808284"));
        }
        else if (greenOnclock)
        {
          sendMessage(string2Bytes("7100800280800244"));
        }
        else if (yellowOnclock)
        {
          sendMessage(string2Bytes("7100800202808014"));
        }
        else if (blueOnclock)
        {
          sendMessage(string2Bytes("7100800282808024"));
        }
        else
        {
          sendMessage(string2Bytes("7100800280808004"));
          continue;
          Log.e("SJF", "【上】 ");
          up = true;
          if (redOnclock)
          {
            sendMessage(string2Bytes("7100028080808241"));
          }
          else if (greenOnclock)
          {
            sendMessage(string2Bytes("7100028080800241"));
          }
          else if (yellowOnclock)
          {
            sendMessage(string2Bytes("7100028002808011"));
          }
          else if (blueOnclock)
          {
            sendMessage(string2Bytes("7100028082808021"));
          }
          else
          {
            sendMessage(string2Bytes("7100028080808001"));
            continue;
            Log.e("SJF", "【下】 ");
            down = true;
            if (redOnclock)
            {
              sendMessage(string2Bytes("7100828080808282"));
            }
            else if (greenOnclock)
            {
              sendMessage(string2Bytes("7100828080800242"));
            }
            else if (yellowOnclock)
            {
              sendMessage(string2Bytes("7100828002808012"));
            }
            else if (blueOnclock)
            {
              sendMessage(string2Bytes("7100828082808022"));
            }
            else
            {
              sendMessage(string2Bytes("7100828080808002"));
              continue;
              Log.e("SJF", "【左上】 ");
              leftUp = true;
              if (redOnclock)
              {
                sendMessage(string2Bytes("7100028280808289"));
              }
              else if (greenOnclock)
              {
                sendMessage(string2Bytes("7100028280800249"));
              }
              else if (yellowOnclock)
              {
                sendMessage(string2Bytes("7100028202808019"));
              }
              else if (blueOnclock)
              {
                sendMessage(string2Bytes("7100028282808029"));
              }
              else
              {
                sendMessage(string2Bytes("7100028280808009"));
                continue;
                Log.e("SJF", "【左下】 ");
                leftDown = true;
                if (redOnclock)
                {
                  sendMessage(string2Bytes("7100828280808290"));
                }
                else if (greenOnclock)
                {
                  sendMessage(string2Bytes("7100828280800250"));
                }
                else if (yellowOnclock)
                {
                  sendMessage(string2Bytes("7100828202808020"));
                }
                else if (blueOnclock)
                {
                  sendMessage(string2Bytes("7100828282808030"));
                }
                else
                {
                  sendMessage(string2Bytes("7100828280808010"));
                  continue;
                  Log.e("SJF", "【右上】 ");
                  rightUp = true;
                  if (redOnclock)
                  {
                    sendMessage(string2Bytes("7100020280808285"));
                  }
                  else if (greenOnclock)
                  {
                    sendMessage(string2Bytes("7100020280800245"));
                  }
                  else if (yellowOnclock)
                  {
                    sendMessage(string2Bytes("7100020202808015"));
                  }
                  else if (blueOnclock)
                  {
                    sendMessage(string2Bytes("7100020282808025"));
                  }
                  else
                  {
                    sendMessage(string2Bytes("7100020280808005"));
                    continue;
                    Log.e("SJF", "【右下】 ");
                    rightDown = true;
                    if (redOnclock)
                    {
                      sendMessage(string2Bytes("7100820280808286"));
                    }
                    else if (greenOnclock)
                    {
                      sendMessage(string2Bytes("7100820280800246"));
                    }
                    else if (yellowOnclock)
                    {
                      sendMessage(string2Bytes("7100820202808016"));
                    }
                    else if (blueOnclock)
                    {
                      sendMessage(string2Bytes("7100820282808026"));
                    }
                    else
                    {
                      sendMessage(string2Bytes("7100820280808006"));
                      continue;
                      Log.e("SJF", "【摇杆按下】 ");
                      this.startPauseTime = System.currentTimeMillis();
                      this.UpSongkai = false;
                      continue;
                      long l = this.startPauseTime;
                      this.UpSongkai = true;
                      System.out.println(l);
                      this.stopTime = (System.currentTimeMillis() - l);
                      System.out.println(this.stopTime);
                      Log.e("SJF", "【摇杆松开】 ");
                      left = false;
                      right = false;
                      leftDown = false;
                      leftUp = false;
                      rightDown = false;
                      rightUp = false;
                      up = false;
                      down = false;
                      if (right) {}
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  }
  
  private void sendMessage(byte[] paramArrayOfByte)
  {
    this.mChatService = Param.ChatService;
    this.mOutStringBuffer = new StringBuffer("");
    if (this.mChatService != null)
    {
      if (this.mChatService.getState() != 3) {
        Param.ConntectSucceed = false;
      }
    }
    else {
      return;
    }
    new Thread()
    {
      public void run()
      {
        for (;;)
        {
          if (PlayControlActivity.this.stopThread) {
            return;
          }
          try
          {
            Thread.sleep(100L);
          }
          catch (InterruptedException localInterruptedException)
          {
            localInterruptedException.printStackTrace();
          }
        }
      }
    }.start();
    if (paramArrayOfByte.length > 0)
    {
      this.mChatService.write(paramArrayOfByte);
      this.mOutStringBuffer.setLength(0);
      if (((!left) && (!right) && (!blueOnclock) && (!yellowOnclock)) || ((this.stopTime >= 500L) && (GButton.stopTime >= 500L)) || (this.startPauseTime == this.stopTime) || (redOnclock) || (blueOnclock) || (yellowOnclock) || (greenOnclock)) {
        break label180;
      }
      TsendMessage(string2Bytes("7100808080808001"));
      this.startPauseTime = this.stopTime;
    }
    for (;;)
    {
      this.stopThread = true;
      return;
      label180:
      if (((blueOnclock) || (yellowOnclock)) && (GButton.stopTime < 500L) && (GButton.startPauseTime != GButton.stopTime) && (!up) && (!down) && (!left) && (!leftDown) && (!leftUp) && (!right) && (!rightDown) && (!rightUp))
      {
        TsendMessage(string2Bytes("7100808080808001"));
        GButton.stopTime = 600L;
      }
    }
  }
  
  private static byte[] string2Bytes(String paramString)
  {
    int i = paramString.length() / 2;
    byte[] arrayOfByte = new byte[i];
    for (int j = 0;; j++)
    {
      if (j >= i) {
        return arrayOfByte;
      }
      arrayOfByte[j] = ((byte)Integer.parseInt(paramString.substring(j * 2, 2 * (j + 1)), 16));
    }
  }
  
  protected void onCreate(Bundle paramBundle)
  {
    ExitApplication.getInstance().addActivity(this);
    super.onCreate(paramBundle);
    this.stopThread = false;
  }
  
  protected void onDestroy()
  {
    this.handler.removeCallbacks(this.runnable);
    this.stopThread = true;
    GButton.isPlayControl = false;
    this.mEngine.getTextureManager().unloadTexture(this.mTexture);
    this.mEngine.getTextureManager().unloadTexture(this.mOnScreenControlTexture);
    this.mEngine.getTextureManager().unloadTexture(this.mControlButtonTexture);
    super.onDestroy();
  }
  
  public boolean onKeyDown(int paramInt, KeyEvent paramKeyEvent)
  {
    if (paramInt == 4)
    {
      this.stopThread = true;
      this.handler.removeCallbacks(this.runnable);
      ifPlayControlActivity = true;
      finish();
    }
    return super.onKeyDown(paramInt, paramKeyEvent);
  }
  
  public void onLoadComplete() {}
  
  public Engine onLoadEngine()
  {
    this.CAMERA_WIDTH = PlatformScreen.GetWidth(this);
    this.CAMERA_HEIGHT = PlatformScreen.GetHeight(this);
    ExitApplication.getInstance().addActivity(this);
    this.handler.postDelayed(this.runnable, 100L);
    this.mCamera = new Camera(0.0F, 0.0F, this.CAMERA_WIDTH, this.CAMERA_HEIGHT);
    Engine localEngine = new Engine(new EngineOptions(true, EngineOptions.ScreenOrientation.LANDSCAPE, new RatioResolutionPolicy(this.CAMERA_WIDTH, this.CAMERA_HEIGHT), this.mCamera));
    try
    {
      if (MultiTouch.isSupported(this))
      {
        localEngine.setTouchController(new MultiTouchController());
        MultiTouch.isSupportedDistinct(this);
      }
      return localEngine;
    }
    catch (MultiTouchException localMultiTouchException) {}
    return localEngine;
  }
  
  public void onLoadResources()
  {
    TextureRegionFactory.setAssetBasePath("gfx/");
    this.mHudScene = new HUD();
    this.CAMERA_WIDTH = PlatformScreen.GetWidth(this);
    this.CAMERA_HEIGHT = PlatformScreen.GetHeight(this);
    this.mTexture = new Texture(1024, 1024, TextureOptions.BILINEAR_PREMULTIPLYALPHA);
    this.mBackgroundTextureRegion = TextureRegionFactory.createFromAsset(this.mTexture, this, "background.jpg", 0, 0);
    this.singalSpriteRegion = TextureRegionFactory.createTiledFromAsset(this.mTexture, this, "signal.png", 0, 481, 4, 1);
    this.backButtonRegion = TextureRegionFactory.createTiledFromAsset(this.mTexture, this, "btn_back.png", this.CAMERA_WIDTH, 0, 2, 1);
    this.aboutButtonRegion = TextureRegionFactory.createTiledFromAsset(this.mTexture, this, "btn_about.png", this.CAMERA_WIDTH, 80, 2, 1);
    this.mOnScreenControlTexture = new Texture(512, 512, TextureOptions.BILINEAR_PREMULTIPLYALPHA);
    this.mOnScreenControlBaseTextureRegion = TextureRegionFactory.createFromAsset(this.mOnScreenControlTexture, this, "control_base.png", 0, 0);
    this.mOnScreenControlKnobTextureRegion = TextureRegionFactory.createFromAsset(this.mOnScreenControlTexture, this, "control_knob.png", 262, 0);
    this.mControlButtonTexture = new Texture(512, 512, TextureOptions.BILINEAR_PREMULTIPLYALPHA);
    this.greenButtonRegion = TextureRegionFactory.createTiledFromAsset(this.mControlButtonTexture, this, "btn_green.png", 0, 0, 2, 1);
    this.redButtonRegion = TextureRegionFactory.createTiledFromAsset(this.mControlButtonTexture, this, "btn_red.png", 228, 0, 2, 1);
    this.blueButtonRegion = TextureRegionFactory.createTiledFromAsset(this.mControlButtonTexture, this, "btn_blue.png", 0, 228, 2, 1);
    this.yellowButtonRegion = TextureRegionFactory.createTiledFromAsset(this.mControlButtonTexture, this, "btn_yellow.png", 228, 228, 2, 1);
    TextureManager localTextureManager = this.mEngine.getTextureManager();
    Texture[] arrayOfTexture = new Texture[3];
    arrayOfTexture[0] = this.mTexture;
    arrayOfTexture[1] = this.mOnScreenControlTexture;
    arrayOfTexture[2] = this.mControlButtonTexture;
    localTextureManager.loadTextures(arrayOfTexture);
  }
  
  public Scene onLoadScene()
  {
    this.mEngine.registerUpdateHandler(new FPSLogger());
    new Scene(1);
    this.mCamera.setHUD(this.mHudScene);
    this.CAMERA_WIDTH = PlatformScreen.GetWidth(this);
    this.CAMERA_HEIGHT = PlatformScreen.GetHeight(this);
    this.mBackgroundSprite = new Sprite(0.0F, 0.0F, this.mBackgroundTextureRegion);
    this.mHudScene.getTopLayer().addEntity(this.mBackgroundSprite);
    this.backButton = new GButton(30, 10, this.mCamera, this.mEngine, this.backButtonRegion, new GButton.GButtonClickListener()
    {
      public void onClick(AnimatedSprite paramAnonymousAnimatedSprite)
      {
        PlayControlActivity.this.stopThread = true;
        PlayControlActivity.ifPlayControlActivity = true;
        PlayControlActivity.this.handler.removeCallbacks(PlayControlActivity.this.runnable);
        PlayControlActivity.this.finish();
      }
      
      public void onLongClick(AnimatedSprite paramAnonymousAnimatedSprite) {}
    }, null);
    this.mHudScene.getTopLayer().addEntity(this.backButton);
    this.aboutButton = new GButton(801, 440, this.mCamera, this.mEngine, this.aboutButtonRegion, new GButton.GButtonClickListener()
    {
      public void onClick(AnimatedSprite paramAnonymousAnimatedSprite)
      {
        Intent localIntent = new Intent(PlayControlActivity.this, inTrodutionActivity.class);
        PlayControlActivity.this.startActivity(localIntent);
      }
      
      public void onLongClick(AnimatedSprite paramAnonymousAnimatedSprite) {}
    }, null);
    this.mHudScene.getTopLayer().addEntity(this.aboutButton);
    this.singalSprite = new AnimatedSprite(700.0F, 12.0F, this.singalSpriteRegion);
    this.mHudScene.getTopLayer().addEntity(this.singalSprite);
    this.singalSprite.setCurrentTileIndex(3);
    AnalogOnScreenControl localAnalogOnScreenControl = new AnalogOnScreenControl(88, 100, this.mCamera, this.mOnScreenControlBaseTextureRegion, this.mOnScreenControlKnobTextureRegion, 0.1F, 350L, new AnalogOnScreenControl.IAnalogOnScreenControlListener()
    {
      public void onControlChange(BaseOnScreenControl paramAnonymousBaseOnScreenControl, float paramAnonymousFloat1, float paramAnonymousFloat2)
      {
        float f1 = paramAnonymousFloat1 * 100.0F;
        float f2 = paramAnonymousFloat2 * 100.0F;
        double d;
        if (Math.sqrt(f1 * f1 + f2 * f2) > PlayControlActivity.this.RockerCircleR)
        {
          d = -(180.0F * (float)Math.atan(paramAnonymousFloat2 / paramAnonymousFloat1) / 3.141592653589793D);
          if (paramAnonymousFloat1 <= 0.0F) {
            break label159;
          }
          if (Math.abs(d) <= 22.5D) {
            PlayControlActivity.this.onKnobDirectionChange(1);
          }
        }
        else
        {
          return;
        }
        if ((Math.abs(d) > 22.5D) && (Math.abs(d) <= 67.5D))
        {
          if (paramAnonymousFloat2 > 0.0F)
          {
            PlayControlActivity.this.onKnobDirectionChange(7);
            return;
          }
          PlayControlActivity.this.onKnobDirectionChange(6);
          return;
        }
        if (paramAnonymousFloat2 > 0.0F)
        {
          PlayControlActivity.this.onKnobDirectionChange(3);
          return;
        }
        PlayControlActivity.this.onKnobDirectionChange(2);
        return;
        label159:
        if (Math.abs(d) <= 22.5D)
        {
          PlayControlActivity.this.onKnobDirectionChange(0);
          return;
        }
        if ((Math.abs(d) > 22.5D) && (Math.abs(d) <= 67.5D))
        {
          if (paramAnonymousFloat2 > 0.0F)
          {
            PlayControlActivity.this.onKnobDirectionChange(5);
            return;
          }
          PlayControlActivity.this.onKnobDirectionChange(4);
          return;
        }
        if (paramAnonymousFloat2 > 0.0F)
        {
          PlayControlActivity.this.onKnobDirectionChange(3);
          return;
        }
        PlayControlActivity.this.onKnobDirectionChange(2);
      }
      
      public void onControlClick(AnalogOnScreenControl paramAnonymousAnalogOnScreenControl) {}
      
      public void onControlKnobDown(BaseOnScreenControl paramAnonymousBaseOnScreenControl)
      {
        PlayControlActivity.this.onKnobDirectionChange(-1);
      }
      
      public void onControlKnobUp(BaseOnScreenControl paramAnonymousBaseOnScreenControl)
      {
        PlayControlActivity.this.onKnobDirectionChange(-2);
      }
    });
    localAnalogOnScreenControl.getControlBase().setBlendFunction(770, 771);
    localAnalogOnScreenControl.getControlBase().setAlpha(1.0F);
    localAnalogOnScreenControl.getControlBase().setScaleCenter(0.0F, 0.0F);
    localAnalogOnScreenControl.getControlBase().setScale(1.25F);
    localAnalogOnScreenControl.getControlKnob().setScale(1.25F);
    localAnalogOnScreenControl.refreshControlKnobPosition();
    this.mHudScene.setChildScene(localAnalogOnScreenControl);
    this.greenButton = new GButton(535, 85, this.mCamera, this.mEngine, this.greenButtonRegion, new GButton.GButtonClickListener()
    {
      public void onClick(AnimatedSprite paramAnonymousAnimatedSprite)
      {
        PlayControlActivity.greenOnclock = true;
        if (PlayControlActivity.yellowOnclock)
        {
          byte[] arrayOfByte3 = PlayControlActivity.string2Bytes("7100808002800250");
          PlayControlActivity.this.sendMessage(arrayOfByte3);
        }
        do
        {
          return;
          if (PlayControlActivity.blueOnclock)
          {
            byte[] arrayOfByte2 = PlayControlActivity.string2Bytes("7100808082800260");
            PlayControlActivity.this.sendMessage(arrayOfByte2);
            return;
          }
        } while ((PlayControlActivity.redOnclock) || (PlayControlActivity.down) || (PlayControlActivity.up) || (PlayControlActivity.left) || (PlayControlActivity.right) || (PlayControlActivity.leftDown) || (PlayControlActivity.leftUp) || (PlayControlActivity.rightDown) || (PlayControlActivity.rightUp));
        byte[] arrayOfByte1 = PlayControlActivity.string2Bytes("7100808080800240");
        PlayControlActivity.this.sendMessage(arrayOfByte1);
      }
      
      public void onLongClick(AnimatedSprite paramAnonymousAnimatedSprite) {}
    }, null);
    this.mHudScene.getTopLayer().addEntity(this.greenButton);
    this.blueButton = new GButton(630, 186, this.mCamera, this.mEngine, this.blueButtonRegion, new GButton.GButtonClickListener()
    {
      public void onClick(AnimatedSprite paramAnonymousAnimatedSprite)
      {
        PlayControlActivity.blueOnclock = true;
        if (PlayControlActivity.redOnclock)
        {
          arrayOfByte2 = PlayControlActivity.string2Bytes("71008080828082A0");
          PlayControlActivity.this.sendMessage(arrayOfByte2);
        }
        while ((PlayControlActivity.greenOnclock) || (PlayControlActivity.yellowOnclock) || (PlayControlActivity.down) || (PlayControlActivity.up) || (PlayControlActivity.left) || (PlayControlActivity.right) || (PlayControlActivity.leftDown) || (PlayControlActivity.leftUp) || (PlayControlActivity.rightDown) || (PlayControlActivity.rightUp))
        {
          byte[] arrayOfByte2;
          return;
        }
        byte[] arrayOfByte1 = PlayControlActivity.string2Bytes("7100808082808020");
        PlayControlActivity.this.sendMessage(arrayOfByte1);
      }
      
      public void onLongClick(AnimatedSprite paramAnonymousAnimatedSprite) {}
    }, null);
    this.mHudScene.getTopLayer().addEntity(this.blueButton);
    this.redButton = new GButton(435, 190, this.mCamera, this.mEngine, this.redButtonRegion, new GButton.GButtonClickListener()
    {
      public void onClick(AnimatedSprite paramAnonymousAnimatedSprite)
      {
        PlayControlActivity.redOnclock = true;
        if (PlayControlActivity.yellowOnclock)
        {
          arrayOfByte2 = PlayControlActivity.string2Bytes("7100808002808290");
          PlayControlActivity.this.sendMessage(arrayOfByte2);
        }
        while ((PlayControlActivity.blueOnclock) || (PlayControlActivity.greenOnclock) || (PlayControlActivity.down) || (PlayControlActivity.up) || (PlayControlActivity.left) || (PlayControlActivity.right) || (PlayControlActivity.leftDown) || (PlayControlActivity.leftUp) || (PlayControlActivity.rightDown) || (PlayControlActivity.rightUp))
        {
          byte[] arrayOfByte2;
          return;
        }
        byte[] arrayOfByte1 = PlayControlActivity.string2Bytes("7100808080808280");
        PlayControlActivity.this.sendMessage(arrayOfByte1);
      }
      
      public void onLongClick(AnimatedSprite paramAnonymousAnimatedSprite) {}
    }, null);
    this.mHudScene.getTopLayer().addEntity(this.redButton);
    this.yellowButton = new GButton(530, 280, this.mCamera, this.mEngine, this.yellowButtonRegion, new GButton.GButtonClickListener()
    {
      public void onClick(AnimatedSprite paramAnonymousAnimatedSprite)
      {
        PlayControlActivity.yellowOnclock = true;
        if ((!PlayControlActivity.greenOnclock) && (!PlayControlActivity.blueOnclock) && (!PlayControlActivity.redOnclock) && (!PlayControlActivity.down) && (!PlayControlActivity.up) && (!PlayControlActivity.left) && (!PlayControlActivity.right) && (!PlayControlActivity.leftDown) && (!PlayControlActivity.leftUp) && (!PlayControlActivity.rightDown) && (!PlayControlActivity.rightUp))
        {
          byte[] arrayOfByte = PlayControlActivity.string2Bytes("7100808002808010");
          PlayControlActivity.this.sendMessage(arrayOfByte);
        }
      }
      
      public void onLongClick(AnimatedSprite paramAnonymousAnimatedSprite) {}
    }, null);
    this.mHudScene.getTopLayer().addEntity(this.yellowButton);
    return this.mHudScene;
  }
  
  protected void onResume()
  {
    left = false;
    right = false;
    leftDown = false;
    leftUp = false;
    rightDown = false;
    rightUp = false;
    up = false;
    down = false;
    greenOnclock = false;
    yellowOnclock = false;
    redOnclock = false;
    blueOnclock = false;
    GButton.isPlayControl = true;
    this.stopThread = false;
    super.onResume();
  }
}


/* Location:           C:\Users\Rodelle\Desktop\Attacknid\Tools\Attacknids-dex2jar.jar
 * Qualified Name:     com.SixClawWorm.application.PlayControlActivity
 * JD-Core Version:    0.7.0.1
 */