/*
 * Decompiled with CFR 0_79.
 * 
 * Could not load the following classes:
 *  android.app.Activity
 *  android.content.Context
 *  android.content.Intent
 *  android.os.Bundle
 *  android.os.Handler
 *  android.os.Message
 *  android.util.Log
 *  android.view.KeyEvent
 */
package com.SixClawWorm.application;

import android.app.Activity;
import android.content.Context;
import android.content.Intent;
import android.os.Bundle;
import android.os.Handler;
import android.os.Message;
import android.util.Log;
import android.view.KeyEvent;
import com.SixClawWorm.application.BluetoothChatService;
import com.SixClawWorm.application.NobluetoothActivity;
import com.SixClawWorm.application.inTrodutionActivity;
import com.SixClawWorm.utils.ExitApplication;
import com.SixClawWorm.utils.GButton;
import com.SixClawWorm.utils.Param;
import com.SixClawWorm.utils.PlatformScreen;
import java.io.PrintStream;
import org.anddev.andengine.engine.Engine;
import org.anddev.andengine.engine.camera.Camera;
import org.anddev.andengine.engine.camera.hud.HUD;
import org.anddev.andengine.engine.camera.hud.controls.AnalogOnScreenControl;
import org.anddev.andengine.engine.camera.hud.controls.BaseOnScreenControl;
import org.anddev.andengine.engine.handler.IUpdateHandler;
import org.anddev.andengine.engine.options.EngineOptions;
import org.anddev.andengine.engine.options.resolutionpolicy.IResolutionPolicy;
import org.anddev.andengine.engine.options.resolutionpolicy.RatioResolutionPolicy;
import org.anddev.andengine.entity.IEntity;
import org.anddev.andengine.entity.layer.ILayer;
import org.anddev.andengine.entity.scene.Scene;
import org.anddev.andengine.entity.sprite.AnimatedSprite;
import org.anddev.andengine.entity.sprite.Sprite;
import org.anddev.andengine.entity.util.FPSLogger;
import org.anddev.andengine.extension.input.touch.controller.MultiTouch;
import org.anddev.andengine.extension.input.touch.controller.MultiTouchController;
import org.anddev.andengine.extension.input.touch.controller.MultiTouchException;
import org.anddev.andengine.input.touch.controller.ITouchController;
import org.anddev.andengine.opengl.texture.Texture;
import org.anddev.andengine.opengl.texture.TextureManager;
import org.anddev.andengine.opengl.texture.TextureOptions;
import org.anddev.andengine.opengl.texture.region.TextureRegion;
import org.anddev.andengine.opengl.texture.region.TextureRegionFactory;
import org.anddev.andengine.opengl.texture.region.TiledTextureRegion;
import org.anddev.andengine.ui.activity.BaseGameActivity;

public class PlayControlActivity1280
extends BaseGameActivity {
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
    public static boolean ifPlayControlActivity;
    public static boolean left;
    public static boolean leftDown;
    public static boolean leftUp;
    public static boolean redOnclock;
    public static boolean right;
    public static boolean rightDown;
    public static boolean rightUp;
    public static boolean up;
    public static boolean yellowOnclock;
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
    private Handler mhandler;
    private GButton redButton;
    private TiledTextureRegion redButtonRegion;
    Runnable runnable;
    int sencondOnclock = 0;
    private AnimatedSprite singalSprite;
    private TiledTextureRegion singalSpriteRegion;
    private long startPauseTime;
    boolean stopThread = false;
    long stopTime = 0;
    private GButton yellowButton;
    private TiledTextureRegion yellowButtonRegion;

    static {
        PlayControlActivity1280.redOnclock = false;
        PlayControlActivity1280.yellowOnclock = false;
        PlayControlActivity1280.blueOnclock = false;
        PlayControlActivity1280.greenOnclock = false;
        PlayControlActivity1280.left = false;
        PlayControlActivity1280.right = false;
        PlayControlActivity1280.up = false;
        PlayControlActivity1280.down = false;
        PlayControlActivity1280.leftUp = false;
        PlayControlActivity1280.leftDown = false;
        PlayControlActivity1280.rightUp = false;
        PlayControlActivity1280.rightDown = false;
        PlayControlActivity1280.ifPlayControlActivity = false;
    }

    public PlayControlActivity1280() {
        this.runnable = new Runnable(){

            @Override
            public void run() {
                if (!(Param.ConntectSucceed || PlayControlActivity1280.this.sencondOnclock != 0)) {
                    Intent intent = new Intent((Context)PlayControlActivity1280.this, (Class)NobluetoothActivity.class);
                    PlayControlActivity1280.this.startActivity(intent);
                    Param.ConntectSucceed = false;
                    PlayControlActivity1280.this.sencondOnclock = 1;
                    PlayControlActivity1280.this.stopThread = true;
                    PlayControlActivity1280.this.handler.removeCallbacks(PlayControlActivity1280.this.runnable);
                }
                PlayControlActivity1280.this.handler.postDelayed((Runnable)this, 10);
            }
        };
        this.mhandler = new Handler(){

            public void handleMessage(Message message) {
                int n = message.what;
            }
        };
    }

    /*
     * Enabled aggressive block sorting
     * Enabled unnecessary exception pruning
     */
    private void TsendMessage(byte[] arrby) {
        this.stopThread = false;
        this.mChatService = Param.ChatService;
        this.mOutStringBuffer = new StringBuffer("");
        if (this.mChatService != null) {
            if (this.mChatService.getState() != 3) {
                Param.ConntectSucceed = false;
                return;
            }
            try {
                Thread.sleep(98);
            }
            catch (InterruptedException var2_2) {
                var2_2.printStackTrace();
            }
        }
        if (arrby.length <= 0) return;
        this.mChatService.write(arrby);
        this.mOutStringBuffer.setLength(0);
    }

    private void gotoAbout() {
        this.startActivity(new Intent((Context)this, (Class)inTrodutionActivity.class));
    }

    /*
     * Enabled aggressive block sorting
     */
    private void onKnobDirectionChange(int n) {
        switch (n) {
            default: {
                break;
            }
            case 0: {
                Log.e((String)"SJF", (String)"\u3010\u5de6\u3011 ");
                PlayControlActivity1280.left = true;
                if (PlayControlActivity1280.greenOnclock) {
                    this.sendMessage(PlayControlActivity1280.string2Bytes("7100808280800248"));
                    break;
                }
                if (PlayControlActivity1280.blueOnclock) {
                    this.sendMessage(PlayControlActivity1280.string2Bytes("7100808282808028"));
                    break;
                }
                if (PlayControlActivity1280.yellowOnclock) {
                    this.sendMessage(PlayControlActivity1280.string2Bytes("7100808202808018"));
                    break;
                }
                if (PlayControlActivity1280.redOnclock) {
                    this.sendMessage(PlayControlActivity1280.string2Bytes("7100808280808288"));
                    break;
                }
                this.sendMessage(PlayControlActivity1280.string2Bytes("7100808280808008"));
                break;
            }
            case 1: {
                Log.e((String)"SJF", (String)"\u3010\u53f3\u3011 ");
                PlayControlActivity1280.right = true;
                if (PlayControlActivity1280.redOnclock) {
                    this.sendMessage(PlayControlActivity1280.string2Bytes("7100800280808284"));
                    break;
                }
                if (PlayControlActivity1280.greenOnclock) {
                    this.sendMessage(PlayControlActivity1280.string2Bytes("7100800280800244"));
                    break;
                }
                if (PlayControlActivity1280.yellowOnclock) {
                    this.sendMessage(PlayControlActivity1280.string2Bytes("7100800202808014"));
                    break;
                }
                if (PlayControlActivity1280.blueOnclock) {
                    this.sendMessage(PlayControlActivity1280.string2Bytes("7100800282808024"));
                    break;
                }
                this.sendMessage(PlayControlActivity1280.string2Bytes("7100800280808004"));
                break;
            }
            case 2: {
                Log.e((String)"SJF", (String)"\u3010\u4e0a\u3011 ");
                PlayControlActivity1280.up = true;
                if (PlayControlActivity1280.redOnclock) {
                    this.sendMessage(PlayControlActivity1280.string2Bytes("7100028080808241"));
                    break;
                }
                if (PlayControlActivity1280.greenOnclock) {
                    this.sendMessage(PlayControlActivity1280.string2Bytes("7100028080800241"));
                    break;
                }
                if (PlayControlActivity1280.yellowOnclock) {
                    this.sendMessage(PlayControlActivity1280.string2Bytes("7100028002808011"));
                    break;
                }
                if (PlayControlActivity1280.blueOnclock) {
                    this.sendMessage(PlayControlActivity1280.string2Bytes("7100028082808021"));
                    break;
                }
                this.sendMessage(PlayControlActivity1280.string2Bytes("7100028080808001"));
                break;
            }
            case 3: {
                Log.e((String)"SJF", (String)"\u3010\u4e0b\u3011 ");
                PlayControlActivity1280.down = true;
                if (PlayControlActivity1280.redOnclock) {
                    this.sendMessage(PlayControlActivity1280.string2Bytes("7100828080808282"));
                    break;
                }
                if (PlayControlActivity1280.greenOnclock) {
                    this.sendMessage(PlayControlActivity1280.string2Bytes("7100828080800242"));
                    break;
                }
                if (PlayControlActivity1280.yellowOnclock) {
                    this.sendMessage(PlayControlActivity1280.string2Bytes("7100828002808012"));
                    break;
                }
                if (PlayControlActivity1280.blueOnclock) {
                    this.sendMessage(PlayControlActivity1280.string2Bytes("7100828082808022"));
                    break;
                }
                this.sendMessage(PlayControlActivity1280.string2Bytes("7100828080808002"));
                break;
            }
            case 4: {
                Log.e((String)"SJF", (String)"\u3010\u5de6\u4e0a\u3011 ");
                PlayControlActivity1280.leftUp = true;
                if (PlayControlActivity1280.redOnclock) {
                    this.sendMessage(PlayControlActivity1280.string2Bytes("7100028280808289"));
                    break;
                }
                if (PlayControlActivity1280.greenOnclock) {
                    this.sendMessage(PlayControlActivity1280.string2Bytes("7100028280800249"));
                    break;
                }
                if (PlayControlActivity1280.yellowOnclock) {
                    this.sendMessage(PlayControlActivity1280.string2Bytes("7100028202808019"));
                    break;
                }
                if (PlayControlActivity1280.blueOnclock) {
                    this.sendMessage(PlayControlActivity1280.string2Bytes("7100028282808029"));
                    break;
                }
                this.sendMessage(PlayControlActivity1280.string2Bytes("7100028280808009"));
                break;
            }
            case 5: {
                Log.e((String)"SJF", (String)"\u3010\u5de6\u4e0b\u3011 ");
                PlayControlActivity1280.leftDown = true;
                if (PlayControlActivity1280.redOnclock) {
                    this.sendMessage(PlayControlActivity1280.string2Bytes("7100828280808290"));
                    break;
                }
                if (PlayControlActivity1280.greenOnclock) {
                    this.sendMessage(PlayControlActivity1280.string2Bytes("7100828280800250"));
                    break;
                }
                if (PlayControlActivity1280.yellowOnclock) {
                    this.sendMessage(PlayControlActivity1280.string2Bytes("7100828202808020"));
                    break;
                }
                if (PlayControlActivity1280.blueOnclock) {
                    this.sendMessage(PlayControlActivity1280.string2Bytes("7100828282808030"));
                    break;
                }
                this.sendMessage(PlayControlActivity1280.string2Bytes("7100828280808010"));
                break;
            }
            case 6: {
                Log.e((String)"SJF", (String)"\u3010\u53f3\u4e0a\u3011 ");
                PlayControlActivity1280.rightUp = true;
                if (PlayControlActivity1280.redOnclock) {
                    this.sendMessage(PlayControlActivity1280.string2Bytes("7100020280808285"));
                    break;
                }
                if (PlayControlActivity1280.greenOnclock) {
                    this.sendMessage(PlayControlActivity1280.string2Bytes("7100020280800245"));
                    break;
                }
                if (PlayControlActivity1280.yellowOnclock) {
                    this.sendMessage(PlayControlActivity1280.string2Bytes("7100020202808015"));
                    break;
                }
                if (PlayControlActivity1280.blueOnclock) {
                    this.sendMessage(PlayControlActivity1280.string2Bytes("7100020282808025"));
                    break;
                }
                this.sendMessage(PlayControlActivity1280.string2Bytes("7100020280808005"));
                break;
            }
            case 7: {
                Log.e((String)"SJF", (String)"\u3010\u53f3\u4e0b\u3011 ");
                PlayControlActivity1280.rightDown = true;
                if (PlayControlActivity1280.redOnclock) {
                    this.sendMessage(PlayControlActivity1280.string2Bytes("7100820280808286"));
                    break;
                }
                if (PlayControlActivity1280.greenOnclock) {
                    this.sendMessage(PlayControlActivity1280.string2Bytes("7100820280800246"));
                    break;
                }
                if (PlayControlActivity1280.yellowOnclock) {
                    this.sendMessage(PlayControlActivity1280.string2Bytes("7100820202808016"));
                    break;
                }
                if (PlayControlActivity1280.blueOnclock) {
                    this.sendMessage(PlayControlActivity1280.string2Bytes("7100820282808026"));
                    break;
                }
                this.sendMessage(PlayControlActivity1280.string2Bytes("7100820280808006"));
                break;
            }
            case -1: {
                Log.e((String)"SJF", (String)"\u3010\u6447\u6746\u6309\u4e0b\u3011 ");
                this.startPauseTime = System.currentTimeMillis();
                this.UpSongkai = false;
                break;
            }
            case -2: {
                long l = this.startPauseTime;
                this.UpSongkai = true;
                System.out.println(l);
                this.stopTime = System.currentTimeMillis() - l;
                System.out.println(this.stopTime);
                Log.e((String)"SJF", (String)"\u3010\u6447\u6746\u677e\u5f00\u3011 ");
                PlayControlActivity1280.left = false;
                PlayControlActivity1280.right = false;
                PlayControlActivity1280.leftDown = false;
                PlayControlActivity1280.leftUp = false;
                PlayControlActivity1280.rightDown = false;
                PlayControlActivity1280.rightUp = false;
                PlayControlActivity1280.up = false;
                PlayControlActivity1280.down = false;
                if (PlayControlActivity1280.right) break;
            }
        }
        this.stopThread = true;
    }

    /*
     * Enabled aggressive block sorting
     */
    private void sendMessage(byte[] arrby) {
        this.mChatService = Param.ChatService;
        this.mOutStringBuffer = new StringBuffer("");
        if (this.mChatService == null) return;
        if (this.mChatService.getState() != 3) {
            Param.ConntectSucceed = false;
            return;
        }
        new Thread(){

            @Override
            public void run() {
                while (!PlayControlActivity1280.this.stopThread) {
                    try {
                        Thread.sleep(100);
                        continue;
                    }
                    catch (InterruptedException var1_1) {
                        var1_1.printStackTrace();
                        continue;
                    }
                    break;
                }
                return;
            }
        }.start();
        if (arrby.length > 0) {
            this.mChatService.write(arrby);
            this.mOutStringBuffer.setLength(0);
            if ((PlayControlActivity1280.left || PlayControlActivity1280.right || PlayControlActivity1280.blueOnclock || PlayControlActivity1280.yellowOnclock) && (this.stopTime < 500 || GButton.stopTime < 500) && this.startPauseTime != this.stopTime && !PlayControlActivity1280.redOnclock && !PlayControlActivity1280.blueOnclock && !PlayControlActivity1280.yellowOnclock && !PlayControlActivity1280.greenOnclock) {
                this.TsendMessage(PlayControlActivity1280.string2Bytes("7100808080808001"));
                this.startPauseTime = this.stopTime;
            } else if (!(!PlayControlActivity1280.blueOnclock && !PlayControlActivity1280.yellowOnclock || GButton.stopTime >= 500 || GButton.startPauseTime == GButton.stopTime || PlayControlActivity1280.up || PlayControlActivity1280.down || PlayControlActivity1280.left || PlayControlActivity1280.leftDown || PlayControlActivity1280.leftUp || PlayControlActivity1280.right || PlayControlActivity1280.rightDown || PlayControlActivity1280.rightUp)) {
                this.TsendMessage(PlayControlActivity1280.string2Bytes("7100808080808001"));
                GButton.stopTime = 600;
            }
        }
        this.stopThread = true;
    }

    private static byte[] string2Bytes(String string) {
        int n = string.length() / 2;
        byte[] arrby = new byte[n];
        int n2 = 0;
        while (n2 < n) {
            arrby[n2] = (byte)Integer.parseInt(string.substring(n2 * 2, 2 * (n2 + 1)), 16);
            ++n2;
        }
        return arrby;
    }

    protected void onCreate(Bundle bundle) {
        ExitApplication.getInstance().addActivity((Activity)this);
        super.onCreate(bundle);
        this.stopThread = false;
    }

    protected void onDestroy() {
        this.handler.removeCallbacks(this.runnable);
        this.stopThread = true;
        GButton.isPlayControl = false;
        this.mEngine.getTextureManager().unloadTexture(this.mTexture);
        this.mEngine.getTextureManager().unloadTexture(this.mOnScreenControlTexture);
        this.mEngine.getTextureManager().unloadTexture(this.mControlButtonTexture);
        super.onDestroy();
    }

    public boolean onKeyDown(int n, KeyEvent keyEvent) {
        if (n != 4) return super.onKeyDown(n, keyEvent);
        this.stopThread = true;
        this.handler.removeCallbacks(this.runnable);
        PlayControlActivity1280.ifPlayControlActivity = true;
        this.finish();
        return super.onKeyDown(n, keyEvent);
    }

    public void onLoadComplete() {
    }

    public Engine onLoadEngine() {
        this.CAMERA_WIDTH = PlatformScreen.GetWidth((Activity)this);
        this.CAMERA_HEIGHT = PlatformScreen.GetHeight((Activity)this);
        ExitApplication.getInstance().addActivity((Activity)this);
        this.handler.postDelayed(this.runnable, 100);
        this.mCamera = new Camera(0.0f, 0.0f, this.CAMERA_WIDTH, this.CAMERA_HEIGHT);
        Engine engine = new Engine(new EngineOptions(true, EngineOptions.ScreenOrientation.LANDSCAPE, new RatioResolutionPolicy(this.CAMERA_WIDTH, this.CAMERA_HEIGHT), this.mCamera));
        try {
            if (!MultiTouch.isSupported((Context)this)) return engine;
            engine.setTouchController(new MultiTouchController());
            MultiTouch.isSupportedDistinct((Context)this);
            return engine;
        }
        catch (MultiTouchException var3_2) {
            return engine;
        }
    }

    public void onLoadResources() {
        TextureRegionFactory.setAssetBasePath("gfx/");
        this.mHudScene = new HUD();
        this.CAMERA_WIDTH = PlatformScreen.GetWidth((Activity)this);
        this.CAMERA_HEIGHT = PlatformScreen.GetHeight((Activity)this);
        this.mTexture = new Texture(2048, 2048, TextureOptions.BILINEAR_PREMULTIPLYALPHA);
        this.mBackgroundTextureRegion = TextureRegionFactory.createFromAsset(this.mTexture, (Context)this, "background-1280.jpg", 0, 0);
        this.singalSpriteRegion = TextureRegionFactory.createTiledFromAsset(this.mTexture, (Context)this, "signal.png", 0, 1150, 4, 1);
        this.backButtonRegion = TextureRegionFactory.createTiledFromAsset(this.mTexture, (Context)this, "btn_back1280.png", this.CAMERA_WIDTH, 0, 2, 1);
        this.aboutButtonRegion = TextureRegionFactory.createTiledFromAsset(this.mTexture, (Context)this, "btn_about1280.png", this.CAMERA_WIDTH, 1281, 2, 1);
        this.mOnScreenControlTexture = new Texture(1024, 1024, TextureOptions.BILINEAR_PREMULTIPLYALPHA);
        this.mOnScreenControlBaseTextureRegion = TextureRegionFactory.createFromAsset(this.mOnScreenControlTexture, (Context)this, "control_base1280.png", 120, 120);
        this.mOnScreenControlKnobTextureRegion = TextureRegionFactory.createFromAsset(this.mOnScreenControlTexture, (Context)this, "control_knob1280.png", 550, 0);
        this.mControlButtonTexture = new Texture(1024, 512, TextureOptions.BILINEAR_PREMULTIPLYALPHA);
        this.greenButtonRegion = TextureRegionFactory.createTiledFromAsset(this.mControlButtonTexture, (Context)this, "btn_green1280.png", 0, 0, 2, 1);
        this.redButtonRegion = TextureRegionFactory.createTiledFromAsset(this.mControlButtonTexture, (Context)this, "btn_red1280.png", 280, 0, 2, 1);
        this.blueButtonRegion = TextureRegionFactory.createTiledFromAsset(this.mControlButtonTexture, (Context)this, "btn_blue1280.png", 0, 140, 2, 1);
        this.yellowButtonRegion = TextureRegionFactory.createTiledFromAsset(this.mControlButtonTexture, (Context)this, "btn_yellow1280.png", 280, 140, 2, 1);
        TextureManager textureManager = this.mEngine.getTextureManager();
        Texture[] arrtexture = new Texture[]{this.mTexture, this.mOnScreenControlTexture, this.mControlButtonTexture};
        textureManager.loadTextures(arrtexture);
    }

    public Scene onLoadScene() {
        this.mEngine.registerUpdateHandler(new FPSLogger());
        new Scene(1);
        this.mCamera.setHUD(this.mHudScene);
        this.CAMERA_WIDTH = PlatformScreen.GetWidth((Activity)this);
        this.CAMERA_HEIGHT = PlatformScreen.GetHeight((Activity)this);
        this.mBackgroundSprite = new Sprite(0.0f, 0.0f, this.mBackgroundTextureRegion);
        this.mHudScene.getTopLayer().addEntity(this.mBackgroundSprite);
        this.backButton = new GButton(30, 10, this.mCamera, this.mEngine, this.backButtonRegion, new GButton.GButtonClickListener(){

            @Override
            public void onClick(AnimatedSprite animatedSprite) {
                PlayControlActivity1280.this.stopThread = true;
                PlayControlActivity1280.this.handler.removeCallbacks(PlayControlActivity1280.this.runnable);
                PlayControlActivity1280.ifPlayControlActivity = true;
                PlayControlActivity1280.this.finish();
            }

            @Override
            public void onLongClick(AnimatedSprite animatedSprite) {
            }
        }, null);
        this.mHudScene.getTopLayer().addEntity(this.backButton);
        this.aboutButton = new GButton(1281, 665, this.mCamera, this.mEngine, this.aboutButtonRegion, new GButton.GButtonClickListener(){

            @Override
            public void onClick(AnimatedSprite animatedSprite) {
                Intent intent = new Intent((Context)PlayControlActivity1280.this, (Class)inTrodutionActivity.class);
                PlayControlActivity1280.this.startActivity(intent);
            }

            @Override
            public void onLongClick(AnimatedSprite animatedSprite) {
            }
        }, null);
        this.mHudScene.getTopLayer().addEntity(this.aboutButton);
        this.singalSprite = new AnimatedSprite(1200.0f, 12.0f, this.singalSpriteRegion);
        this.mHudScene.getTopLayer().addEntity(this.singalSprite);
        this.singalSprite.setCurrentTileIndex(3);
        AnalogOnScreenControl analogOnScreenControl = new AnalogOnScreenControl(140, 160, this.mCamera, this.mOnScreenControlBaseTextureRegion, this.mOnScreenControlKnobTextureRegion, 0.1f, 350, new AnalogOnScreenControl.IAnalogOnScreenControlListener(){

            @Override
            public void onControlChange(BaseOnScreenControl baseOnScreenControl, float f, float f2) {
                float f3 = f * 100.0f;
                float f4 = f2 * 100.0f;
                if (Math.sqrt(f3 * f3 + f4 * f4) <= (double)PlayControlActivity1280.this.RockerCircleR) return;
                double d = - (double)(180.0f * (float)Math.atan(f2 / f)) / 3.141592653589793;
                if (f > 0.0f) {
                    if (Math.abs(d) <= 22.5) {
                        PlayControlActivity1280.this.onKnobDirectionChange(1);
                        return;
                    }
                    if (Math.abs(d) > 22.5 && Math.abs(d) <= 67.5) {
                        if (f2 > 0.0f) {
                            PlayControlActivity1280.this.onKnobDirectionChange(7);
                            return;
                        }
                        PlayControlActivity1280.this.onKnobDirectionChange(6);
                        return;
                    }
                    if (f2 > 0.0f) {
                        PlayControlActivity1280.this.onKnobDirectionChange(3);
                        return;
                    }
                    PlayControlActivity1280.this.onKnobDirectionChange(2);
                    return;
                }
                if (Math.abs(d) <= 22.5) {
                    PlayControlActivity1280.this.onKnobDirectionChange(0);
                    return;
                }
                if (Math.abs(d) > 22.5 && Math.abs(d) <= 67.5) {
                    if (f2 > 0.0f) {
                        PlayControlActivity1280.this.onKnobDirectionChange(5);
                        return;
                    }
                    PlayControlActivity1280.this.onKnobDirectionChange(4);
                    return;
                }
                if (f2 > 0.0f) {
                    PlayControlActivity1280.this.onKnobDirectionChange(3);
                    return;
                }
                PlayControlActivity1280.this.onKnobDirectionChange(2);
            }

            @Override
            public void onControlClick(AnalogOnScreenControl analogOnScreenControl) {
            }

            @Override
            public void onControlKnobDown(BaseOnScreenControl baseOnScreenControl) {
                PlayControlActivity1280.this.onKnobDirectionChange(-1);
            }

            @Override
            public void onControlKnobUp(BaseOnScreenControl baseOnScreenControl) {
                PlayControlActivity1280.this.onKnobDirectionChange(-2);
            }
        });
        analogOnScreenControl.getControlBase().setBlendFunction(770, 771);
        analogOnScreenControl.getControlBase().setAlpha(1.0f);
        analogOnScreenControl.getControlBase().setScaleCenter(0.0f, 128.0f);
        analogOnScreenControl.getControlBase().setScale(1.25f);
        analogOnScreenControl.getControlKnob().setScale(1.25f);
        analogOnScreenControl.refreshControlKnobPosition();
        this.mHudScene.setChildScene((Scene)analogOnScreenControl);
        this.greenButton = new GButton(875, 125, this.mCamera, this.mEngine, this.greenButtonRegion, new GButton.GButtonClickListener(){

            /*
             * Enabled aggressive block sorting
             */
            @Override
            public void onClick(AnimatedSprite animatedSprite) {
                PlayControlActivity1280.greenOnclock = true;
                if (PlayControlActivity1280.yellowOnclock) {
                    byte[] arrby = PlayControlActivity1280.string2Bytes("7100808002800250");
                    PlayControlActivity1280.this.sendMessage(arrby);
                    return;
                }
                if (PlayControlActivity1280.blueOnclock) {
                    byte[] arrby = PlayControlActivity1280.string2Bytes("7100808082800260");
                    PlayControlActivity1280.this.sendMessage(arrby);
                    return;
                }
                if (PlayControlActivity1280.redOnclock) return;
                if (PlayControlActivity1280.down) return;
                if (PlayControlActivity1280.up) return;
                if (PlayControlActivity1280.left) return;
                if (PlayControlActivity1280.right) return;
                if (PlayControlActivity1280.leftDown) return;
                if (PlayControlActivity1280.leftUp) return;
                if (PlayControlActivity1280.rightDown) return;
                if (PlayControlActivity1280.rightUp) return;
                byte[] arrby = PlayControlActivity1280.string2Bytes("7100808080800240");
                PlayControlActivity1280.this.sendMessage(arrby);
            }

            @Override
            public void onLongClick(AnimatedSprite animatedSprite) {
            }
        }, null);
        this.mHudScene.getTopLayer().addEntity(this.greenButton);
        this.blueButton = new GButton(1050, 310, this.mCamera, this.mEngine, this.blueButtonRegion, new GButton.GButtonClickListener(){

            /*
             * Enabled aggressive block sorting
             */
            @Override
            public void onClick(AnimatedSprite animatedSprite) {
                PlayControlActivity1280.blueOnclock = true;
                if (PlayControlActivity1280.redOnclock) {
                    byte[] arrby = PlayControlActivity1280.string2Bytes("71008080828082A0");
                    PlayControlActivity1280.this.sendMessage(arrby);
                    return;
                }
                if (PlayControlActivity1280.greenOnclock) return;
                if (PlayControlActivity1280.yellowOnclock) return;
                if (PlayControlActivity1280.down) return;
                if (PlayControlActivity1280.up) return;
                if (PlayControlActivity1280.left) return;
                if (PlayControlActivity1280.right) return;
                if (PlayControlActivity1280.leftDown) return;
                if (PlayControlActivity1280.leftUp) return;
                if (PlayControlActivity1280.rightDown) return;
                if (PlayControlActivity1280.rightUp) return;
                byte[] arrby = PlayControlActivity1280.string2Bytes("7100808082808020");
                PlayControlActivity1280.this.sendMessage(arrby);
            }

            @Override
            public void onLongClick(AnimatedSprite animatedSprite) {
            }
        }, null);
        this.mHudScene.getTopLayer().addEntity(this.blueButton);
        this.redButton = new GButton(700, 305, this.mCamera, this.mEngine, this.redButtonRegion, new GButton.GButtonClickListener(){

            /*
             * Enabled aggressive block sorting
             */
            @Override
            public void onClick(AnimatedSprite animatedSprite) {
                PlayControlActivity1280.redOnclock = true;
                if (PlayControlActivity1280.yellowOnclock) {
                    byte[] arrby = PlayControlActivity1280.string2Bytes("7100808002808290");
                    PlayControlActivity1280.this.sendMessage(arrby);
                    return;
                }
                if (PlayControlActivity1280.blueOnclock) return;
                if (PlayControlActivity1280.greenOnclock) return;
                if (PlayControlActivity1280.down) return;
                if (PlayControlActivity1280.up) return;
                if (PlayControlActivity1280.left) return;
                if (PlayControlActivity1280.right) return;
                if (PlayControlActivity1280.leftDown) return;
                if (PlayControlActivity1280.leftUp) return;
                if (PlayControlActivity1280.rightDown) return;
                if (PlayControlActivity1280.rightUp) return;
                byte[] arrby = PlayControlActivity1280.string2Bytes("7100808080808280");
                PlayControlActivity1280.this.sendMessage(arrby);
            }

            @Override
            public void onLongClick(AnimatedSprite animatedSprite) {
            }
        }, null);
        this.mHudScene.getTopLayer().addEntity(this.redButton);
        this.yellowButton = new GButton(875, 470, this.mCamera, this.mEngine, this.yellowButtonRegion, new GButton.GButtonClickListener(){

            @Override
            public void onClick(AnimatedSprite animatedSprite) {
                PlayControlActivity1280.yellowOnclock = true;
                if (PlayControlActivity1280.greenOnclock || PlayControlActivity1280.blueOnclock || PlayControlActivity1280.redOnclock || PlayControlActivity1280.down || PlayControlActivity1280.up || PlayControlActivity1280.left || PlayControlActivity1280.right || PlayControlActivity1280.leftDown || PlayControlActivity1280.leftUp || PlayControlActivity1280.rightDown || PlayControlActivity1280.rightUp) return;
                byte[] arrby = PlayControlActivity1280.string2Bytes("7100808002808010");
                PlayControlActivity1280.this.sendMessage(arrby);
            }

            @Override
            public void onLongClick(AnimatedSprite animatedSprite) {
            }
        }, null);
        this.mHudScene.getTopLayer().addEntity(this.yellowButton);
        return this.mHudScene;
    }

    protected void onResume() {
        PlayControlActivity1280.left = false;
        PlayControlActivity1280.right = false;
        PlayControlActivity1280.leftDown = false;
        PlayControlActivity1280.leftUp = false;
        PlayControlActivity1280.rightDown = false;
        PlayControlActivity1280.rightUp = false;
        PlayControlActivity1280.up = false;
        PlayControlActivity1280.down = false;
        PlayControlActivity1280.greenOnclock = false;
        PlayControlActivity1280.yellowOnclock = false;
        PlayControlActivity1280.redOnclock = false;
        PlayControlActivity1280.blueOnclock = false;
        this.stopThread = false;
        GButton.isPlayControl = true;
        super.onResume();
    }

}

