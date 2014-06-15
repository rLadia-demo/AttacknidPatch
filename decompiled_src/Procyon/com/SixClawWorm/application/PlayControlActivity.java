package com.SixClawWorm.application;

import org.anddev.andengine.ui.activity.*;
import org.anddev.andengine.engine.camera.*;
import org.anddev.andengine.engine.camera.hud.*;
import org.anddev.andengine.entity.sprite.*;
import android.content.*;
import android.util.*;
import android.os.*;
import android.app.*;
import android.view.*;
import org.anddev.andengine.engine.*;
import com.SixClawWorm.utils.*;
import org.anddev.andengine.engine.options.*;
import org.anddev.andengine.engine.options.resolutionpolicy.*;
import org.anddev.andengine.input.touch.controller.*;
import org.anddev.andengine.extension.input.touch.controller.*;
import org.anddev.andengine.opengl.texture.region.*;
import org.anddev.andengine.opengl.texture.*;
import org.anddev.andengine.entity.scene.*;
import org.anddev.andengine.entity.util.*;
import org.anddev.andengine.engine.handler.*;
import org.anddev.andengine.entity.*;
import org.anddev.andengine.engine.camera.hud.controls.*;

public class PlayControlActivity extends BaseGameActivity
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
    private int CAMERA_HEIGHT;
    private int CAMERA_WIDTH;
    private int RockerCircleR;
    private int RockerCircleX;
    private int RockerCircleY;
    private String StartStr;
    boolean UpSongkai;
    private GButton aboutButton;
    private TiledTextureRegion aboutButtonRegion;
    private GButton backButton;
    private TiledTextureRegion backButtonRegion;
    private GButton blueButton;
    private TiledTextureRegion blueButtonRegion;
    int firstOnclock;
    private GButton greenButton;
    private TiledTextureRegion greenButtonRegion;
    Handler handler;
    private Sprite mBackgroundSprite;
    private TextureRegion mBackgroundTextureRegion;
    private Camera mCamera;
    private BluetoothChatService mChatService;
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
    int sencondOnclock;
    private AnimatedSprite singalSprite;
    private TiledTextureRegion singalSpriteRegion;
    private long startPauseTime;
    boolean stopThread;
    long stopTime;
    private GButton yellowButton;
    private TiledTextureRegion yellowButtonRegion;
    
    static {
        PlayControlActivity.redOnclock = false;
        PlayControlActivity.yellowOnclock = false;
        PlayControlActivity.blueOnclock = false;
        PlayControlActivity.greenOnclock = false;
        PlayControlActivity.left = false;
        PlayControlActivity.right = false;
        PlayControlActivity.up = false;
        PlayControlActivity.down = false;
        PlayControlActivity.leftUp = false;
        PlayControlActivity.leftDown = false;
        PlayControlActivity.rightUp = false;
        PlayControlActivity.rightDown = false;
        PlayControlActivity.ifPlayControlActivity = false;
    }
    
    public PlayControlActivity() {
        super();
        this.CAMERA_WIDTH = 480;
        this.CAMERA_HEIGHT = 800;
        this.RockerCircleX = 0;
        this.RockerCircleY = 128;
        this.RockerCircleR = 50;
        this.mChatService = null;
        this.StartStr = "7104808080808001";
        this.firstOnclock = 0;
        this.sencondOnclock = 0;
        this.stopThread = false;
        this.stopTime = 0L;
        this.UpSongkai = false;
        this.handler = new Handler();
        this.runnable = new Runnable() {
            @Override
            public void run() {
                if (!Param.ConntectSucceed && PlayControlActivity.this.sencondOnclock == 0) {
                    PlayControlActivity.this.startActivity(new Intent((Context)PlayControlActivity.this, (Class)NobluetoothActivity.class));
                    Param.ConntectSucceed = false;
                    PlayControlActivity.this.sencondOnclock = 1;
                    PlayControlActivity.this.stopThread = true;
                    PlayControlActivity.this.handler.removeCallbacks(PlayControlActivity.this.runnable);
                }
                PlayControlActivity.this.handler.postDelayed((Runnable)this, 10L);
            }
        };
        this.mhandler = new Handler() {
            public void handleMessage(final Message message) {
                switch (message.what) {
                    default: {}
                }
            }
        };
    }
    
    private void TsendMessage(final byte[] array) {
        this.stopThread = false;
        this.mChatService = Param.ChatService;
        this.mOutStringBuffer = new StringBuffer("");
        while (true) {
            if (this.mChatService == null) {
                break Label_0054;
            }
            Label_0048: {
                if (this.mChatService.getState() == 3) {
                    break Label_0048;
                }
                Param.ConntectSucceed = false;
                return;
                try {
                    Thread.sleep(98L);
                    if (array.length > 0) {
                        this.mChatService.write(array);
                        this.mOutStringBuffer.setLength(0);
                    }
                }
                catch (InterruptedException ex) {
                    ex.printStackTrace();
                    continue;
                }
            }
            break;
        }
    }
    
    private void gotoAbout() {
        this.startActivity(new Intent((Context)this, (Class)inTrodutionActivity.class));
    }
    
    private void onKnobDirectionChange(final int n) {
        switch (n) {
            case 0: {
                Log.e("SJF", "\u3010\u5de6\u3011 ");
                PlayControlActivity.left = true;
                if (PlayControlActivity.greenOnclock) {
                    this.sendMessage(string2Bytes("7100808280800248"));
                    break;
                }
                if (PlayControlActivity.blueOnclock) {
                    this.sendMessage(string2Bytes("7100808282808028"));
                    break;
                }
                if (PlayControlActivity.yellowOnclock) {
                    this.sendMessage(string2Bytes("7100808202808018"));
                    break;
                }
                if (PlayControlActivity.redOnclock) {
                    this.sendMessage(string2Bytes("7100808280808288"));
                    break;
                }
                this.sendMessage(string2Bytes("7100808280808008"));
                break;
            }
            case 1: {
                Log.e("SJF", "\u3010\u53f3\u3011 ");
                PlayControlActivity.right = true;
                if (PlayControlActivity.redOnclock) {
                    this.sendMessage(string2Bytes("7100800280808284"));
                    break;
                }
                if (PlayControlActivity.greenOnclock) {
                    this.sendMessage(string2Bytes("7100800280800244"));
                    break;
                }
                if (PlayControlActivity.yellowOnclock) {
                    this.sendMessage(string2Bytes("7100800202808014"));
                    break;
                }
                if (PlayControlActivity.blueOnclock) {
                    this.sendMessage(string2Bytes("7100800282808024"));
                    break;
                }
                this.sendMessage(string2Bytes("7100800280808004"));
                break;
            }
            case 2: {
                Log.e("SJF", "\u3010\u4e0a\u3011 ");
                PlayControlActivity.up = true;
                if (PlayControlActivity.redOnclock) {
                    this.sendMessage(string2Bytes("7100028080808241"));
                    break;
                }
                if (PlayControlActivity.greenOnclock) {
                    this.sendMessage(string2Bytes("7100028080800241"));
                    break;
                }
                if (PlayControlActivity.yellowOnclock) {
                    this.sendMessage(string2Bytes("7100028002808011"));
                    break;
                }
                if (PlayControlActivity.blueOnclock) {
                    this.sendMessage(string2Bytes("7100028082808021"));
                    break;
                }
                this.sendMessage(string2Bytes("7100028080808001"));
                break;
            }
            case 3: {
                Log.e("SJF", "\u3010\u4e0b\u3011 ");
                PlayControlActivity.down = true;
                if (PlayControlActivity.redOnclock) {
                    this.sendMessage(string2Bytes("7100828080808282"));
                    break;
                }
                if (PlayControlActivity.greenOnclock) {
                    this.sendMessage(string2Bytes("7100828080800242"));
                    break;
                }
                if (PlayControlActivity.yellowOnclock) {
                    this.sendMessage(string2Bytes("7100828002808012"));
                    break;
                }
                if (PlayControlActivity.blueOnclock) {
                    this.sendMessage(string2Bytes("7100828082808022"));
                    break;
                }
                this.sendMessage(string2Bytes("7100828080808002"));
                break;
            }
            case 4: {
                Log.e("SJF", "\u3010\u5de6\u4e0a\u3011 ");
                PlayControlActivity.leftUp = true;
                if (PlayControlActivity.redOnclock) {
                    this.sendMessage(string2Bytes("7100028280808289"));
                    break;
                }
                if (PlayControlActivity.greenOnclock) {
                    this.sendMessage(string2Bytes("7100028280800249"));
                    break;
                }
                if (PlayControlActivity.yellowOnclock) {
                    this.sendMessage(string2Bytes("7100028202808019"));
                    break;
                }
                if (PlayControlActivity.blueOnclock) {
                    this.sendMessage(string2Bytes("7100028282808029"));
                    break;
                }
                this.sendMessage(string2Bytes("7100028280808009"));
                break;
            }
            case 5: {
                Log.e("SJF", "\u3010\u5de6\u4e0b\u3011 ");
                PlayControlActivity.leftDown = true;
                if (PlayControlActivity.redOnclock) {
                    this.sendMessage(string2Bytes("7100828280808290"));
                    break;
                }
                if (PlayControlActivity.greenOnclock) {
                    this.sendMessage(string2Bytes("7100828280800250"));
                    break;
                }
                if (PlayControlActivity.yellowOnclock) {
                    this.sendMessage(string2Bytes("7100828202808020"));
                    break;
                }
                if (PlayControlActivity.blueOnclock) {
                    this.sendMessage(string2Bytes("7100828282808030"));
                    break;
                }
                this.sendMessage(string2Bytes("7100828280808010"));
                break;
            }
            case 6: {
                Log.e("SJF", "\u3010\u53f3\u4e0a\u3011 ");
                PlayControlActivity.rightUp = true;
                if (PlayControlActivity.redOnclock) {
                    this.sendMessage(string2Bytes("7100020280808285"));
                    break;
                }
                if (PlayControlActivity.greenOnclock) {
                    this.sendMessage(string2Bytes("7100020280800245"));
                    break;
                }
                if (PlayControlActivity.yellowOnclock) {
                    this.sendMessage(string2Bytes("7100020202808015"));
                    break;
                }
                if (PlayControlActivity.blueOnclock) {
                    this.sendMessage(string2Bytes("7100020282808025"));
                    break;
                }
                this.sendMessage(string2Bytes("7100020280808005"));
                break;
            }
            case 7: {
                Log.e("SJF", "\u3010\u53f3\u4e0b\u3011 ");
                PlayControlActivity.rightDown = true;
                if (PlayControlActivity.redOnclock) {
                    this.sendMessage(string2Bytes("7100820280808286"));
                    break;
                }
                if (PlayControlActivity.greenOnclock) {
                    this.sendMessage(string2Bytes("7100820280800246"));
                    break;
                }
                if (PlayControlActivity.yellowOnclock) {
                    this.sendMessage(string2Bytes("7100820202808016"));
                    break;
                }
                if (PlayControlActivity.blueOnclock) {
                    this.sendMessage(string2Bytes("7100820282808026"));
                    break;
                }
                this.sendMessage(string2Bytes("7100820280808006"));
                break;
            }
            case -1: {
                Log.e("SJF", "\u3010\u6447\u6746\u6309\u4e0b\u3011 ");
                this.startPauseTime = System.currentTimeMillis();
                this.UpSongkai = false;
                break;
            }
            case -2: {
                final long startPauseTime = this.startPauseTime;
                this.UpSongkai = true;
                System.out.println(startPauseTime);
                this.stopTime = System.currentTimeMillis() - startPauseTime;
                System.out.println(this.stopTime);
                Log.e("SJF", "\u3010\u6447\u6746\u677e\u5f00\u3011 ");
                PlayControlActivity.left = false;
                PlayControlActivity.right = false;
                PlayControlActivity.leftDown = false;
                PlayControlActivity.leftUp = false;
                PlayControlActivity.rightDown = false;
                PlayControlActivity.rightUp = false;
                PlayControlActivity.up = false;
                PlayControlActivity.down = false;
                if (!PlayControlActivity.right) {
                    break;
                }
                break;
            }
        }
        this.stopThread = true;
    }
    
    private void sendMessage(final byte[] array) {
        this.mChatService = Param.ChatService;
        this.mOutStringBuffer = new StringBuffer("");
        if (this.mChatService != null) {
            if (this.mChatService.getState() == 3) {
                new Thread() {
                    @Override
                    public void run() {
                        while (!PlayControlActivity.this.stopThread) {
                            try {
                                Thread.sleep(100L);
                            }
                            catch (InterruptedException ex) {
                                ex.printStackTrace();
                            }
                        }
                    }
                }.start();
                if (array.length > 0) {
                    this.mChatService.write(array);
                    this.mOutStringBuffer.setLength(0);
                    if ((PlayControlActivity.left || PlayControlActivity.right || PlayControlActivity.blueOnclock || PlayControlActivity.yellowOnclock) && (this.stopTime < 500L || GButton.stopTime < 500L) && this.startPauseTime != this.stopTime && !PlayControlActivity.redOnclock && !PlayControlActivity.blueOnclock && !PlayControlActivity.yellowOnclock && !PlayControlActivity.greenOnclock) {
                        this.TsendMessage(string2Bytes("7100808080808001"));
                        this.startPauseTime = this.stopTime;
                    }
                    else if ((PlayControlActivity.blueOnclock || PlayControlActivity.yellowOnclock) && GButton.stopTime < 500L && GButton.startPauseTime != GButton.stopTime && !PlayControlActivity.up && !PlayControlActivity.down && !PlayControlActivity.left && !PlayControlActivity.leftDown && !PlayControlActivity.leftUp && !PlayControlActivity.right && !PlayControlActivity.rightDown && !PlayControlActivity.rightUp) {
                        this.TsendMessage(string2Bytes("7100808080808001"));
                        GButton.stopTime = 600L;
                    }
                }
                this.stopThread = true;
                return;
            }
            Param.ConntectSucceed = false;
        }
    }
    
    private static byte[] string2Bytes(final String s) {
        final int n = s.length() / 2;
        final byte[] array = new byte[n];
        for (int i = 0; i < n; ++i) {
            array[i] = (byte)Integer.parseInt(s.substring(i * 2, 2 * (i + 1)), 16);
        }
        return array;
    }
    
    @Override
    protected void onCreate(final Bundle bundle) {
        ExitApplication.getInstance().addActivity(this);
        super.onCreate(bundle);
        this.stopThread = false;
    }
    
    @Override
    protected void onDestroy() {
        this.handler.removeCallbacks(this.runnable);
        this.stopThread = true;
        GButton.isPlayControl = false;
        this.mEngine.getTextureManager().unloadTexture(this.mTexture);
        this.mEngine.getTextureManager().unloadTexture(this.mOnScreenControlTexture);
        this.mEngine.getTextureManager().unloadTexture(this.mControlButtonTexture);
        super.onDestroy();
    }
    
    public boolean onKeyDown(final int n, final KeyEvent keyEvent) {
        if (n == 4) {
            this.stopThread = true;
            this.handler.removeCallbacks(this.runnable);
            PlayControlActivity.ifPlayControlActivity = true;
            this.finish();
        }
        return super.onKeyDown(n, keyEvent);
    }
    
    @Override
    public void onLoadComplete() {
    }
    
    @Override
    public Engine onLoadEngine() {
        this.CAMERA_WIDTH = PlatformScreen.GetWidth(this);
        this.CAMERA_HEIGHT = PlatformScreen.GetHeight(this);
        ExitApplication.getInstance().addActivity(this);
        this.handler.postDelayed(this.runnable, 100L);
        this.mCamera = new Camera(0.0f, 0.0f, this.CAMERA_WIDTH, this.CAMERA_HEIGHT);
        final Engine engine = new Engine(new EngineOptions(true, EngineOptions.ScreenOrientation.LANDSCAPE, new RatioResolutionPolicy(this.CAMERA_WIDTH, this.CAMERA_HEIGHT), this.mCamera));
        try {
            if (MultiTouch.isSupported((Context)this)) {
                engine.setTouchController(new MultiTouchController());
                MultiTouch.isSupportedDistinct((Context)this);
            }
            return engine;
        }
        catch (MultiTouchException ex) {
            return engine;
        }
    }
    
    @Override
    public void onLoadResources() {
        TextureRegionFactory.setAssetBasePath("gfx/");
        this.mHudScene = new HUD();
        this.CAMERA_WIDTH = PlatformScreen.GetWidth(this);
        this.CAMERA_HEIGHT = PlatformScreen.GetHeight(this);
        this.mTexture = new Texture(1024, 1024, TextureOptions.BILINEAR_PREMULTIPLYALPHA);
        this.mBackgroundTextureRegion = TextureRegionFactory.createFromAsset(this.mTexture, (Context)this, "background.jpg", 0, 0);
        this.singalSpriteRegion = TextureRegionFactory.createTiledFromAsset(this.mTexture, (Context)this, "signal.png", 0, 481, 4, 1);
        this.backButtonRegion = TextureRegionFactory.createTiledFromAsset(this.mTexture, (Context)this, "btn_back.png", this.CAMERA_WIDTH, 0, 2, 1);
        this.aboutButtonRegion = TextureRegionFactory.createTiledFromAsset(this.mTexture, (Context)this, "btn_about.png", this.CAMERA_WIDTH, 80, 2, 1);
        this.mOnScreenControlTexture = new Texture(512, 512, TextureOptions.BILINEAR_PREMULTIPLYALPHA);
        this.mOnScreenControlBaseTextureRegion = TextureRegionFactory.createFromAsset(this.mOnScreenControlTexture, (Context)this, "control_base.png", 0, 0);
        this.mOnScreenControlKnobTextureRegion = TextureRegionFactory.createFromAsset(this.mOnScreenControlTexture, (Context)this, "control_knob.png", 262, 0);
        this.mControlButtonTexture = new Texture(512, 512, TextureOptions.BILINEAR_PREMULTIPLYALPHA);
        this.greenButtonRegion = TextureRegionFactory.createTiledFromAsset(this.mControlButtonTexture, (Context)this, "btn_green.png", 0, 0, 2, 1);
        this.redButtonRegion = TextureRegionFactory.createTiledFromAsset(this.mControlButtonTexture, (Context)this, "btn_red.png", 228, 0, 2, 1);
        this.blueButtonRegion = TextureRegionFactory.createTiledFromAsset(this.mControlButtonTexture, (Context)this, "btn_blue.png", 0, 228, 2, 1);
        this.yellowButtonRegion = TextureRegionFactory.createTiledFromAsset(this.mControlButtonTexture, (Context)this, "btn_yellow.png", 228, 228, 2, 1);
        this.mEngine.getTextureManager().loadTextures(this.mTexture, this.mOnScreenControlTexture, this.mControlButtonTexture);
    }
    
    @Override
    public Scene onLoadScene() {
        this.mEngine.registerUpdateHandler(new FPSLogger());
        new Scene(1);
        this.mCamera.setHUD(this.mHudScene);
        this.CAMERA_WIDTH = PlatformScreen.GetWidth(this);
        this.CAMERA_HEIGHT = PlatformScreen.GetHeight(this);
        this.mBackgroundSprite = new Sprite(0.0f, 0.0f, this.mBackgroundTextureRegion);
        this.mHudScene.getTopLayer().addEntity(this.mBackgroundSprite);
        this.backButton = new GButton(30, 10, this.mCamera, this.mEngine, this.backButtonRegion, (GButton.GButtonClickListener)new GButton.GButtonClickListener() {
            @Override
            public void onClick(final AnimatedSprite animatedSprite) {
                PlayControlActivity.this.stopThread = true;
                PlayControlActivity.ifPlayControlActivity = true;
                PlayControlActivity.this.handler.removeCallbacks(PlayControlActivity.this.runnable);
                PlayControlActivity.this.finish();
            }
            
            @Override
            public void onLongClick(final AnimatedSprite animatedSprite) {
            }
        }, null);
        this.mHudScene.getTopLayer().addEntity(this.backButton);
        this.aboutButton = new GButton(801, 440, this.mCamera, this.mEngine, this.aboutButtonRegion, (GButton.GButtonClickListener)new GButton.GButtonClickListener() {
            @Override
            public void onClick(final AnimatedSprite animatedSprite) {
                PlayControlActivity.this.startActivity(new Intent((Context)PlayControlActivity.this, (Class)inTrodutionActivity.class));
            }
            
            @Override
            public void onLongClick(final AnimatedSprite animatedSprite) {
            }
        }, null);
        this.mHudScene.getTopLayer().addEntity(this.aboutButton);
        this.singalSprite = new AnimatedSprite(700.0f, 12.0f, this.singalSpriteRegion);
        this.mHudScene.getTopLayer().addEntity(this.singalSprite);
        this.singalSprite.setCurrentTileIndex(3);
        final AnalogOnScreenControl childScene = new AnalogOnScreenControl(88, 100, this.mCamera, this.mOnScreenControlBaseTextureRegion, this.mOnScreenControlKnobTextureRegion, 0.1f, 350L, (AnalogOnScreenControl.IAnalogOnScreenControlListener)new AnalogOnScreenControl.IAnalogOnScreenControlListener() {
            @Override
            public void onControlChange(final BaseOnScreenControl baseOnScreenControl, final float n, final float n2) {
                final float n3 = n * 100.0f;
                final float n4 = n2 * 100.0f;
                if (Math.sqrt(n3 * n3 + n4 * n4) > PlayControlActivity.this.RockerCircleR) {
                    final double n5 = -(180.0f * (float)Math.atan(n2 / n) / 3.141592653589793);
                    if (n > 0.0f) {
                        if (Math.abs(n5) <= 22.5) {
                            PlayControlActivity.this.onKnobDirectionChange(1);
                        }
                        else if (Math.abs(n5) > 22.5 && Math.abs(n5) <= 67.5) {
                            if (n2 > 0.0f) {
                                PlayControlActivity.this.onKnobDirectionChange(7);
                                return;
                            }
                            PlayControlActivity.this.onKnobDirectionChange(6);
                        }
                        else {
                            if (n2 > 0.0f) {
                                PlayControlActivity.this.onKnobDirectionChange(3);
                                return;
                            }
                            PlayControlActivity.this.onKnobDirectionChange(2);
                        }
                    }
                    else {
                        if (Math.abs(n5) <= 22.5) {
                            PlayControlActivity.this.onKnobDirectionChange(0);
                            return;
                        }
                        if (Math.abs(n5) > 22.5 && Math.abs(n5) <= 67.5) {
                            if (n2 > 0.0f) {
                                PlayControlActivity.this.onKnobDirectionChange(5);
                                return;
                            }
                            PlayControlActivity.this.onKnobDirectionChange(4);
                        }
                        else {
                            if (n2 > 0.0f) {
                                PlayControlActivity.this.onKnobDirectionChange(3);
                                return;
                            }
                            PlayControlActivity.this.onKnobDirectionChange(2);
                        }
                    }
                }
            }
            
            @Override
            public void onControlClick(final AnalogOnScreenControl analogOnScreenControl) {
            }
            
            @Override
            public void onControlKnobDown(final BaseOnScreenControl baseOnScreenControl) {
                PlayControlActivity.this.onKnobDirectionChange(-1);
            }
            
            @Override
            public void onControlKnobUp(final BaseOnScreenControl baseOnScreenControl) {
                PlayControlActivity.this.onKnobDirectionChange(-2);
            }
        });
        childScene.getControlBase().setBlendFunction(770, 771);
        childScene.getControlBase().setAlpha(1.0f);
        childScene.getControlBase().setScaleCenter(0.0f, 0.0f);
        childScene.getControlBase().setScale(1.25f);
        childScene.getControlKnob().setScale(1.25f);
        childScene.refreshControlKnobPosition();
        this.mHudScene.setChildScene(childScene);
        this.greenButton = new GButton(535, 85, this.mCamera, this.mEngine, this.greenButtonRegion, (GButton.GButtonClickListener)new GButton.GButtonClickListener() {
            @Override
            public void onClick(final AnimatedSprite animatedSprite) {
                PlayControlActivity.greenOnclock = true;
                if (PlayControlActivity.yellowOnclock) {
                    PlayControlActivity.this.sendMessage(string2Bytes("7100808002800250"));
                }
                else {
                    if (PlayControlActivity.blueOnclock) {
                        PlayControlActivity.this.sendMessage(string2Bytes("7100808082800260"));
                        return;
                    }
                    if (!PlayControlActivity.redOnclock && !PlayControlActivity.down && !PlayControlActivity.up && !PlayControlActivity.left && !PlayControlActivity.right && !PlayControlActivity.leftDown && !PlayControlActivity.leftUp && !PlayControlActivity.rightDown && !PlayControlActivity.rightUp) {
                        PlayControlActivity.this.sendMessage(string2Bytes("7100808080800240"));
                    }
                }
            }
            
            @Override
            public void onLongClick(final AnimatedSprite animatedSprite) {
            }
        }, null);
        this.mHudScene.getTopLayer().addEntity(this.greenButton);
        this.blueButton = new GButton(630, 186, this.mCamera, this.mEngine, this.blueButtonRegion, (GButton.GButtonClickListener)new GButton.GButtonClickListener() {
            @Override
            public void onClick(final AnimatedSprite animatedSprite) {
                PlayControlActivity.blueOnclock = true;
                if (PlayControlActivity.redOnclock) {
                    PlayControlActivity.this.sendMessage(string2Bytes("71008080828082A0"));
                }
                else if (!PlayControlActivity.greenOnclock && !PlayControlActivity.yellowOnclock && !PlayControlActivity.down && !PlayControlActivity.up && !PlayControlActivity.left && !PlayControlActivity.right && !PlayControlActivity.leftDown && !PlayControlActivity.leftUp && !PlayControlActivity.rightDown && !PlayControlActivity.rightUp) {
                    PlayControlActivity.this.sendMessage(string2Bytes("7100808082808020"));
                }
            }
            
            @Override
            public void onLongClick(final AnimatedSprite animatedSprite) {
            }
        }, null);
        this.mHudScene.getTopLayer().addEntity(this.blueButton);
        this.redButton = new GButton(435, 190, this.mCamera, this.mEngine, this.redButtonRegion, (GButton.GButtonClickListener)new GButton.GButtonClickListener() {
            @Override
            public void onClick(final AnimatedSprite animatedSprite) {
                PlayControlActivity.redOnclock = true;
                if (PlayControlActivity.yellowOnclock) {
                    PlayControlActivity.this.sendMessage(string2Bytes("7100808002808290"));
                }
                else if (!PlayControlActivity.blueOnclock && !PlayControlActivity.greenOnclock && !PlayControlActivity.down && !PlayControlActivity.up && !PlayControlActivity.left && !PlayControlActivity.right && !PlayControlActivity.leftDown && !PlayControlActivity.leftUp && !PlayControlActivity.rightDown && !PlayControlActivity.rightUp) {
                    PlayControlActivity.this.sendMessage(string2Bytes("7100808080808280"));
                }
            }
            
            @Override
            public void onLongClick(final AnimatedSprite animatedSprite) {
            }
        }, null);
        this.mHudScene.getTopLayer().addEntity(this.redButton);
        this.yellowButton = new GButton(530, 280, this.mCamera, this.mEngine, this.yellowButtonRegion, (GButton.GButtonClickListener)new GButton.GButtonClickListener() {
            @Override
            public void onClick(final AnimatedSprite animatedSprite) {
                PlayControlActivity.yellowOnclock = true;
                if (!PlayControlActivity.greenOnclock && !PlayControlActivity.blueOnclock && !PlayControlActivity.redOnclock && !PlayControlActivity.down && !PlayControlActivity.up && !PlayControlActivity.left && !PlayControlActivity.right && !PlayControlActivity.leftDown && !PlayControlActivity.leftUp && !PlayControlActivity.rightDown && !PlayControlActivity.rightUp) {
                    PlayControlActivity.this.sendMessage(string2Bytes("7100808002808010"));
                }
            }
            
            @Override
            public void onLongClick(final AnimatedSprite animatedSprite) {
            }
        }, null);
        this.mHudScene.getTopLayer().addEntity(this.yellowButton);
        return this.mHudScene;
    }
    
    @Override
    protected void onResume() {
        PlayControlActivity.left = false;
        PlayControlActivity.right = false;
        PlayControlActivity.leftDown = false;
        PlayControlActivity.leftUp = false;
        PlayControlActivity.rightDown = false;
        PlayControlActivity.rightUp = false;
        PlayControlActivity.up = false;
        PlayControlActivity.down = false;
        PlayControlActivity.greenOnclock = false;
        PlayControlActivity.yellowOnclock = false;
        PlayControlActivity.redOnclock = false;
        PlayControlActivity.blueOnclock = false;
        GButton.isPlayControl = true;
        this.stopThread = false;
        super.onResume();
    }
}
