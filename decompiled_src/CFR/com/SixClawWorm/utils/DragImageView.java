/*
 * Decompiled with CFR 0_79.
 * 
 * Could not load the following classes:
 *  android.app.Activity
 *  android.content.Context
 *  android.graphics.Bitmap
 *  android.os.AsyncTask
 *  android.util.AttributeSet
 *  android.util.FloatMath
 *  android.util.Log
 *  android.view.MotionEvent
 *  android.view.animation.ScaleAnimation
 *  android.widget.ImageView
 */
package com.SixClawWorm.utils;

import android.app.Activity;
import android.content.Context;
import android.graphics.Bitmap;
import android.os.AsyncTask;
import android.util.AttributeSet;
import android.util.FloatMath;
import android.util.Log;
import android.view.MotionEvent;
import android.view.animation.ScaleAnimation;
import android.widget.ImageView;

public class DragImageView
extends ImageView {
    private int MAX_H;
    private int MAX_W;
    private int MIN_H;
    private int MIN_W;
    private float afterLenght;
    private float beforeLenght;
    private int bitmap_H;
    private int bitmap_W;
    private int current_Bottom;
    private int current_Left;
    private int current_Right;
    private int current_Top;
    private int current_x;
    private int current_y;
    private boolean isControl_H = false;
    private boolean isControl_V = false;
    private boolean isScaleAnim = false;
    private Activity mActivity;
    private MODE mode = MODE.NONE;
    private MyAsyncTask myAsyncTask;
    private ScaleAnimation scaleAnimation;
    private float scale_temp;
    private int screen_H;
    private int screen_W;
    private int start_Bottom = -1;
    private int start_Left = -1;
    private int start_Right = -1;
    private int start_Top = -1;
    private int start_x;
    private int start_y;

    public DragImageView(Context context) {
        super(context);
    }

    public DragImageView(Context context, AttributeSet attributeSet) {
        super(context, attributeSet);
    }

    private void setPosition(int n, int n2, int n3, int n4) {
        this.layout(n, n2, n3, n4);
    }

    public void doScaleAnim() {
        this.myAsyncTask = new MyAsyncTask(this.screen_W, this.getWidth(), this.getHeight());
        this.myAsyncTask.setLTRB(this.getLeft(), this.getTop(), this.getRight(), this.getBottom());
        this.myAsyncTask.execute((Object[])new Void[0]);
        this.isScaleAnim = false;
    }

    float getDistance(MotionEvent motionEvent) {
        float f = motionEvent.getX(0) - motionEvent.getX(1);
        float f2 = motionEvent.getY(0) - motionEvent.getY(1);
        return FloatMath.sqrt((float)(f * f + f2 * f2));
    }

    protected void onLayout(boolean bl, int n, int n2, int n3, int n4) {
        super.onLayout(bl, n, n2, n3, n4);
        if (this.start_Top != -1) return;
        this.start_Top = n2;
        this.start_Left = n;
        this.start_Bottom = n4;
        this.start_Right = n3;
    }

    void onPointerDown(MotionEvent motionEvent) {
        if (motionEvent.getPointerCount() != 2) return;
        this.mode = MODE.ZOOM;
        this.beforeLenght = this.getDistance(motionEvent);
    }

    void onTouchDown(MotionEvent motionEvent) {
        this.mode = MODE.DRAG;
        this.current_x = (int)motionEvent.getRawX();
        this.current_y = (int)motionEvent.getRawY();
        this.start_x = (int)motionEvent.getX();
        this.start_y = this.current_y - this.getTop();
    }

    /*
     * Enabled aggressive block sorting
     */
    public boolean onTouchEvent(MotionEvent motionEvent) {
        switch (255 & motionEvent.getAction()) {
            default: {
                return true;
            }
            case 0: {
                this.onTouchDown(motionEvent);
                return true;
            }
            case 5: {
                this.onPointerDown(motionEvent);
                return true;
            }
            case 2: {
                this.onTouchMove(motionEvent);
                return true;
            }
            case 1: {
                this.mode = MODE.NONE;
                return true;
            }
            case 6: {
                this.mode = MODE.NONE;
                if (!this.isScaleAnim) return true;
                this.doScaleAnim();
            }
        }
        return true;
    }

    /*
     * Enabled aggressive block sorting
     */
    void onTouchMove(MotionEvent motionEvent) {
        if (this.mode == MODE.DRAG) {
            int n = this.current_x - this.start_x;
            int n2 = this.current_x + this.getWidth() - this.start_x;
            int n3 = this.current_y - this.start_y;
            int n4 = this.current_y - this.start_y + this.getHeight();
            if (this.isControl_H) {
                if (n >= 0) {
                    n = 0;
                    n2 = this.getWidth();
                }
                if (n2 <= this.screen_W) {
                    n = this.screen_W - this.getWidth();
                    n2 = this.screen_W;
                }
            } else {
                n = this.getLeft();
                n2 = this.getRight();
            }
            if (this.isControl_V) {
                if (n3 >= 0) {
                    n3 = 0;
                    n4 = this.getHeight();
                }
                if (n4 <= this.screen_H) {
                    n3 = this.screen_H - this.getHeight();
                    n4 = this.screen_H;
                }
            } else {
                n3 = this.getTop();
                n4 = this.getBottom();
            }
            if (this.isControl_H || this.isControl_V) {
                this.setPosition(n, n3, n2, n4);
            }
            this.current_x = (int)motionEvent.getRawX();
            this.current_y = (int)motionEvent.getRawY();
            return;
        }
        if (this.mode != MODE.ZOOM) return;
        this.afterLenght = this.getDistance(motionEvent);
        if (Math.abs(this.afterLenght - this.beforeLenght) <= 5.0f) return;
        this.scale_temp = this.afterLenght / this.beforeLenght;
        this.setScale(this.scale_temp);
        this.beforeLenght = this.afterLenght;
    }

    public void setImageBitmap(Bitmap bitmap) {
        super.setImageBitmap(bitmap);
        this.bitmap_W = bitmap.getWidth();
        this.bitmap_H = bitmap.getHeight();
        this.MAX_W = 5 * this.bitmap_W;
        this.MAX_H = 5 * this.bitmap_H;
        this.MIN_W = 2 * this.bitmap_W / 7;
        this.MIN_H = 2 * this.bitmap_H / 7;
    }

    /*
     * Enabled aggressive block sorting
     */
    void setScale(float f) {
        int n = 5 * (int)((float)this.getWidth() * Math.abs(1.0f - f)) / 2;
        int n2 = 3 * (int)((float)this.getHeight() * Math.abs(1.0f - f)) / 2;
        if (f > 1.0f && this.getWidth() <= this.MAX_W) {
            this.current_Left = this.getLeft() - n;
            this.current_Top = this.getTop() - n2;
            this.current_Right = n + this.getRight();
            this.current_Bottom = n2 + this.getBottom();
            this.setFrame(this.current_Left, this.current_Top, this.current_Right, this.current_Bottom);
            this.isControl_V = this.current_Top <= 0 && this.current_Bottom >= this.screen_H;
            if (this.current_Left <= 0 && this.current_Right >= this.screen_W) {
                this.isControl_H = true;
                return;
            }
            this.isControl_H = false;
            return;
        }
        if (f >= 1.0f) return;
        if (this.getWidth() < this.MIN_W) return;
        this.current_Left = n + this.getLeft();
        this.current_Top = n2 + this.getTop();
        this.current_Right = this.getRight() - n;
        this.current_Bottom = this.getBottom() - n2;
        if (this.isControl_V && this.current_Top > 0) {
            this.current_Top = 0;
            this.current_Bottom = this.getBottom() - n2 * 2;
            if (this.current_Bottom < this.screen_H) {
                this.current_Bottom = this.screen_H;
                this.isControl_V = false;
            }
        }
        if (this.isControl_V && this.current_Bottom < this.screen_H) {
            this.current_Bottom = this.screen_H;
            this.current_Top = this.getTop() + n2 * 2;
            if (this.current_Top > 0) {
                this.current_Top = 0;
                this.isControl_V = false;
            }
        }
        if (this.isControl_H && this.current_Left >= 0) {
            this.current_Left = 0;
            this.current_Right = this.getRight() - n * 2;
            if (this.current_Right <= this.screen_W) {
                this.current_Right = this.screen_W;
                this.isControl_H = false;
            }
        }
        if (this.isControl_H && this.current_Right <= this.screen_W) {
            this.current_Right = this.screen_W;
            this.current_Left = this.getLeft() + n * 2;
            if (this.current_Left >= 0) {
                this.current_Left = 0;
                this.isControl_H = false;
            }
        }
        if (this.isControl_H || this.isControl_V) {
            this.setFrame(this.current_Left, this.current_Top, this.current_Right, this.current_Bottom);
            return;
        }
        this.setFrame(this.current_Left, this.current_Top, this.current_Right, this.current_Bottom);
        this.isScaleAnim = true;
    }

    public void setScreen_H(int n) {
        this.screen_H = n;
    }

    public void setScreen_W(int n) {
        this.screen_W = n;
    }

    public void setmActivity(Activity activity) {
        this.mActivity = activity;
    }

    static final class MODE
    extends Enum<MODE> {
        public static final /* enum */ MODE DRAG;
        private static final /* synthetic */ MODE[] ENUM$VALUES;
        public static final /* enum */ MODE NONE;
        public static final /* enum */ MODE ZOOM;

        static {
            MODE.NONE = new MODE("NONE", 0);
            MODE.DRAG = new MODE("DRAG", 1);
            MODE.ZOOM = new MODE("ZOOM", 2);
            MODE[] arrmODE = new MODE[]{MODE.NONE, MODE.DRAG, MODE.ZOOM};
            MODE.ENUM$VALUES = arrmODE;
        }

        private MODE(String string22, int string22) {
            super(string, n);
        }

        public static MODE valueOf(String string) {
            return (MODE)Enum.valueOf(MODE.class, string);
        }

        public static MODE[] values() {
            MODE[] arrmODE = MODE.ENUM$VALUES;
            int n = arrmODE.length;
            MODE[] arrmODE2 = new MODE[n];
            System.arraycopy(arrmODE, 0, arrmODE2, 0, n);
            return arrmODE2;
        }
    }

    class MyAsyncTask
    extends AsyncTask<Void, Integer, Void> {
        private float STEP;
        private int bottom;
        private int current_Height;
        private int current_Width;
        private int left;
        private int right;
        private float scale_WH;
        private int screen_W;
        private float step_H;
        private float step_V;
        private int top;

        public MyAsyncTask(int n, int n2, int n3) {
            this.STEP = 8.0f;
            this.screen_W = n;
            this.current_Width = n2;
            this.current_Height = n3;
            this.scale_WH = (float)n3 / (float)n2;
            this.step_H = this.STEP;
            this.step_V = this.scale_WH * this.STEP;
        }

        protected /* varargs */ Void doInBackground(Void ... arrvoid) {
            while (this.current_Width <= this.screen_W) {
                this.left = (int)((float)this.left - this.step_H);
                this.top = (int)((float)this.top - this.step_V);
                this.right = (int)((float)this.right + this.step_H);
                this.bottom = (int)((float)this.bottom + this.step_V);
                this.current_Width = (int)((float)this.current_Width + 2.0f * this.step_H);
                this.left = Math.max(this.left, DragImageView.this.start_Left);
                this.top = Math.max(this.top, DragImageView.this.start_Top);
                this.right = Math.min(this.right, DragImageView.this.start_Right);
                this.bottom = Math.min(this.bottom, DragImageView.this.start_Bottom);
                Log.e((String)"jj", (String)("top=" + this.top + ",bottom=" + this.bottom + ",left=" + this.left + ",right=" + this.right));
                Integer[] arrinteger = new Integer[]{this.left, this.top, this.right, this.bottom};
                this.onProgressUpdate(arrinteger);
                try {
                    Thread.sleep(10);
                    continue;
                }
                catch (InterruptedException var4_3) {
                    var4_3.printStackTrace();
                    continue;
                }
                break;
            }
            return null;
        }

        protected /* varargs */ void onProgressUpdate(Integer ... arrinteger) {
            super.onProgressUpdate((Object[])arrinteger);
            DragImageView.this.mActivity.runOnUiThread((Runnable)new Runnable(){

                @Override
                public void run() {
                    MyAsyncTask.this.DragImageView.this.setFrame(arrinteger[0], arrinteger[1], arrinteger[2], arrinteger[3]);
                }
            });
        }

        public void setLTRB(int n, int n2, int n3, int n4) {
            this.left = n;
            this.top = n2;
            this.right = n3;
            this.bottom = n4;
        }

    }

}

