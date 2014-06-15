package com.SixClawWorm.utils;

import org.anddev.andengine.engine.camera.hud.*;
import org.anddev.andengine.input.touch.detector.*;
import android.os.*;
import org.anddev.andengine.entity.text.*;
import org.anddev.andengine.entity.sprite.*;
import org.anddev.andengine.engine.camera.*;
import org.anddev.andengine.engine.*;
import org.anddev.andengine.opengl.texture.region.*;
import com.SixClawWorm.application.*;
import org.anddev.andengine.input.touch.*;
import android.util.*;
import org.anddev.andengine.entity.scene.*;
import org.anddev.andengine.entity.*;
import org.anddev.andengine.opengl.texture.*;
import org.anddev.andengine.opengl.font.*;
import android.graphics.*;

public class GButton extends HUD implements IClickDetectorListener
{
    public static boolean isPlayControl;
    public static long startPauseTime;
    public static long stopTime;
    private final String TAG;
    Handler handler;
    private ChangeableText mButonName;
    private AnimatedSprite mControlButton;
    private final GButtonClickListener mGButtonClickListener;
    private boolean mStatus;
    Runnable runnable;
    
    static {
        GButton.stopTime = 600L;
        GButton.isPlayControl = false;
    }
    
    public GButton(final int n, final int n2, final Camera camera, final Engine engine, final TiledTextureRegion tiledTextureRegion, final GButtonClickListener mgButtonClickListener, final String s) {
        super();
        this.TAG = "GButton";
        this.mStatus = false;
        this.handler = new Handler();
        this.runnable = new Runnable() {
            @Override
            public void run() {
                GButton.this.mGButtonClickListener.onClick(GButton.this.mControlButton);
                if (Param.ConntectSucceed && !PlayControlActivity1920.left && !PlayControlActivity1920.leftDown && !PlayControlActivity1920.leftUp && !PlayControlActivity1920.right && !PlayControlActivity1920.rightDown && !PlayControlActivity1920.rightUp && !PlayControlActivity1920.up && !PlayControlActivity1920.down && !PlayControlActivity1280.left && !PlayControlActivity1280.leftDown && !PlayControlActivity1280.leftUp && !PlayControlActivity1280.right && !PlayControlActivity1280.rightDown && !PlayControlActivity1280.rightUp && !PlayControlActivity1280.up && !PlayControlActivity1280.down && !PlayControlActivity.left && !PlayControlActivity.leftDown && !PlayControlActivity.leftUp && !PlayControlActivity.right && !PlayControlActivity.rightDown && !PlayControlActivity.rightUp && !PlayControlActivity.up && !PlayControlActivity.down && GButton.isPlayControl) {
                    GButton.this.handler.postDelayed((Runnable)this, 100L);
                    return;
                }
                if (GButton.this.mStatus && Param.ConntectSucceed && GButton.isPlayControl) {
                    GButton.this.handler.postDelayed((Runnable)this, 100L);
                    return;
                }
                GButton.this.handler.removeCallbacks(GButton.this.runnable);
            }
        };
        this.setCamera(camera);
        this.mGButtonClickListener = mgButtonClickListener;
        (this.mControlButton = new AnimatedSprite((float)n, (float)n2, tiledTextureRegion) {
            @Override
            public boolean onAreaTouched(final TouchEvent touchEvent, final float n, final float n2) {
                switch (touchEvent.getAction()) {
                    default: {
                        return true;
                    }
                    case 0: {
                        GButton.startPauseTime = System.currentTimeMillis();
                        this.setCurrentTileIndex(1);
                        final int n3 = (int)n;
                        final int n4 = (int)n2;
                        System.out.println(n3);
                        System.out.println(n4);
                        GButton.access$3(GButton.this, true);
                        GButton.this.mGButtonClickListener.onClick(GButton.this.mControlButton);
                        GButton.this.handler.postDelayed(GButton.this.runnable, 100L);
                        return true;
                    }
                    case 1: {
                        GButton.stopTime = System.currentTimeMillis() - GButton.startPauseTime;
                        System.out.println(GButton.stopTime);
                        this.setCurrentTileIndex(0);
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
                        if (GButton.this.mStatus && GUtils.contains(this.mWidth, this.mHeight, n, n2) && GButton.this.mGButtonClickListener != null) {
                            Log.i("GButton", "\u89e6\u53d1\u52a8\u4f5c....");
                        }
                        GButton.access$3(GButton.this, false);
                        this.setCurrentTileIndex(0);
                        return true;
                    }
                }
            }
        }).setCurrentTileIndex(0);
        this.mCamera.getHUD().registerTouchArea((ITouchArea)this.mControlButton);
        this.mCamera.getHUD().setTouchAreaBindingEnabled(true);
        this.getBottomLayer().addEntity(this.mControlButton);
        if (s != null) {
            final Texture texture = new Texture(256, 256, TextureOptions.BILINEAR_PREMULTIPLYALPHA);
            final Font font = new Font(texture, Typeface.create(Typeface.DEFAULT, 0), 16.0f, true, -1);
            engine.getTextureManager().loadTexture(texture);
            engine.getFontManager().loadFont(font);
            final Paint paint = new Paint();
            final Rect rect = new Rect();
            paint.getTextBounds(s, 0, s.length(), rect);
            this.mButonName = new ChangeableText(-5 + (n + (int)(this.mControlButton.getWidth() - rect.width()) / 2), -2 + (n2 + (int)(this.mControlButton.getHeight() - rect.height()) / 2), font, s, 8);
            this.getBottomLayer().addEntity(this.mButonName);
        }
    }
    
    static /* synthetic */ void access$3(final GButton gButton, final boolean mStatus) {
        gButton.mStatus = mStatus;
    }
    
    public float getX() {
        if (this.mControlButton != null) {
            return this.mControlButton.getX();
        }
        return 0.0f;
    }
    
    public float getY() {
        if (this.mControlButton != null) {
            return this.mControlButton.getY();
        }
        return 0.0f;
    }
    
    @Override
    public void onClick(final ClickDetector clickDetector, final TouchEvent touchEvent) {
        Log.i("GButton", "onClick");
    }
    
    public void setPosition(final float n, final float n2) {
        if (this.mControlButton != null) {
            this.mControlButton.setPosition(n, n2);
        }
    }
    
    public interface GButtonClickListener
    {
        void onClick(AnimatedSprite p0);
        
        void onLongClick(AnimatedSprite p0);
    }
}
