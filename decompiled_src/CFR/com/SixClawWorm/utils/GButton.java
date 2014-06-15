/*
 * Decompiled with CFR 0_79.
 * 
 * Could not load the following classes:
 *  android.graphics.Paint
 *  android.graphics.Rect
 *  android.graphics.Typeface
 *  android.os.Handler
 *  android.util.Log
 */
package com.SixClawWorm.utils;

import android.graphics.Paint;
import android.graphics.Rect;
import android.graphics.Typeface;
import android.os.Handler;
import android.util.Log;
import com.SixClawWorm.application.PlayControlActivity;
import com.SixClawWorm.application.PlayControlActivity1280;
import com.SixClawWorm.application.PlayControlActivity1920;
import com.SixClawWorm.utils.GUtils;
import com.SixClawWorm.utils.Param;
import java.io.PrintStream;
import org.anddev.andengine.engine.Engine;
import org.anddev.andengine.engine.camera.Camera;
import org.anddev.andengine.engine.camera.hud.HUD;
import org.anddev.andengine.entity.IEntity;
import org.anddev.andengine.entity.layer.ILayer;
import org.anddev.andengine.entity.scene.Scene;
import org.anddev.andengine.entity.sprite.AnimatedSprite;
import org.anddev.andengine.entity.text.ChangeableText;
import org.anddev.andengine.input.touch.TouchEvent;
import org.anddev.andengine.input.touch.detector.ClickDetector;
import org.anddev.andengine.opengl.font.Font;
import org.anddev.andengine.opengl.font.FontManager;
import org.anddev.andengine.opengl.texture.Texture;
import org.anddev.andengine.opengl.texture.TextureManager;
import org.anddev.andengine.opengl.texture.TextureOptions;
import org.anddev.andengine.opengl.texture.region.TiledTextureRegion;

public class GButton
extends HUD
implements ClickDetector.IClickDetectorListener {
    public static boolean isPlayControl;
    public static long startPauseTime;
    public static long stopTime;
    private final String TAG = "GButton";
    Handler handler = new Handler();
    private ChangeableText mButonName;
    private AnimatedSprite mControlButton;
    private final GButtonClickListener mGButtonClickListener;
    private boolean mStatus = false;
    Runnable runnable;

    static {
        GButton.stopTime = 600;
        GButton.isPlayControl = false;
    }

    public GButton(int n, int n2, Camera camera, Engine engine, TiledTextureRegion tiledTextureRegion, GButtonClickListener gButtonClickListener, String string) {
        this.runnable = new Runnable(){

            @Override
            public void run() {
                GButton.this.mGButtonClickListener.onClick(GButton.this.mControlButton);
                if (!(!Param.ConntectSucceed || PlayControlActivity1920.left || PlayControlActivity1920.leftDown || PlayControlActivity1920.leftUp || PlayControlActivity1920.right || PlayControlActivity1920.rightDown || PlayControlActivity1920.rightUp || PlayControlActivity1920.up || PlayControlActivity1920.down || PlayControlActivity1280.left || PlayControlActivity1280.leftDown || PlayControlActivity1280.leftUp || PlayControlActivity1280.right || PlayControlActivity1280.rightDown || PlayControlActivity1280.rightUp || PlayControlActivity1280.up || PlayControlActivity1280.down || PlayControlActivity.left || PlayControlActivity.leftDown || PlayControlActivity.leftUp || PlayControlActivity.right || PlayControlActivity.rightDown || PlayControlActivity.rightUp || PlayControlActivity.up || PlayControlActivity.down || !GButton.isPlayControl)) {
                    GButton.this.handler.postDelayed((Runnable)this, 100);
                    return;
                }
                if (GButton.this.mStatus && Param.ConntectSucceed && GButton.isPlayControl) {
                    GButton.this.handler.postDelayed((Runnable)this, 100);
                    return;
                }
                GButton.this.handler.removeCallbacks(GButton.this.runnable);
            }
        };
        this.setCamera(camera);
        this.mGButtonClickListener = gButtonClickListener;
        this.mControlButton = new AnimatedSprite(n, n2, tiledTextureRegion){

            @Override
            public boolean onAreaTouched(TouchEvent touchEvent, float f, float f2) {
                switch (touchEvent.getAction()) {
                    default: {
                        return true;
                    }
                    case 0: {
                        GButton.startPauseTime = System.currentTimeMillis();
                        this.setCurrentTileIndex(1);
                        int n = (int)f;
                        int n2 = (int)f2;
                        System.out.println(n);
                        System.out.println(n2);
                        GButton.access$3(GButton.this, true);
                        GButton.this.mGButtonClickListener.onClick(GButton.this.mControlButton);
                        GButton.this.handler.postDelayed(GButton.this.runnable, 100);
                        return true;
                    }
                    case 1: 
                }
                long l = GButton.startPauseTime;
                GButton.stopTime = System.currentTimeMillis() - l;
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
                if (GButton.this.mStatus && GUtils.contains(this.mWidth, this.mHeight, f, f2) && GButton.this.mGButtonClickListener != null) {
                    Log.i((String)"GButton", (String)"\u89e6\u53d1\u52a8\u4f5c....");
                }
                GButton.access$3(GButton.this, false);
                this.setCurrentTileIndex(0);
                return true;
            }
        };
        this.mControlButton.setCurrentTileIndex(0);
        this.mCamera.getHUD().registerTouchArea((Scene.ITouchArea)this.mControlButton);
        this.mCamera.getHUD().setTouchAreaBindingEnabled(true);
        this.getBottomLayer().addEntity(this.mControlButton);
        if (string == null) return;
        Texture texture = new Texture(256, 256, TextureOptions.BILINEAR_PREMULTIPLYALPHA);
        Font font = new Font(texture, Typeface.create((Typeface)Typeface.DEFAULT, (int)0), 16.0f, true, -1);
        engine.getTextureManager().loadTexture(texture);
        engine.getFontManager().loadFont(font);
        Paint paint = new Paint();
        Rect rect = new Rect();
        paint.getTextBounds(string, 0, string.length(), rect);
        int n3 = -5 + n + (int)(this.mControlButton.getWidth() - (float)rect.width()) / 2;
        int n4 = -2 + n2 + (int)(this.mControlButton.getHeight() - (float)rect.height()) / 2;
        this.mButonName = new ChangeableText(n3, n4, font, string, 8);
        this.getBottomLayer().addEntity(this.mButonName);
    }

    static /* synthetic */ void access$3(GButton gButton, boolean bl) {
        gButton.mStatus = bl;
    }

    public float getX() {
        if (this.mControlButton == null) return 0.0f;
        return this.mControlButton.getX();
    }

    public float getY() {
        if (this.mControlButton == null) return 0.0f;
        return this.mControlButton.getY();
    }

    @Override
    public void onClick(ClickDetector clickDetector2, TouchEvent clickDetector2) {
        Log.i((String)"GButton", (String)"onClick");
    }

    public void setPosition(float f, float f2) {
        if (this.mControlButton == null) return;
        this.mControlButton.setPosition(f, f2);
    }

    public interface GButtonClickListener {
        public void onClick(AnimatedSprite var1);

        public void onLongClick(AnimatedSprite var1);
    }

}

