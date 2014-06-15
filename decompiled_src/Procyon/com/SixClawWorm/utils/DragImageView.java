package com.SixClawWorm.utils;

import android.widget.*;
import android.app.*;
import android.view.animation.*;
import android.content.*;
import android.view.*;
import android.graphics.*;
import android.os.*;
import android.util.*;

public class DragImageView extends ImageView
{
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
    private boolean isControl_H;
    private boolean isControl_V;
    private boolean isScaleAnim;
    private Activity mActivity;
    private MODE mode;
    private MyAsyncTask myAsyncTask;
    private ScaleAnimation scaleAnimation;
    private float scale_temp;
    private int screen_H;
    private int screen_W;
    private int start_Bottom;
    private int start_Left;
    private int start_Right;
    private int start_Top;
    private int start_x;
    private int start_y;
    
    public DragImageView(final Context context) {
        super(context);
        this.start_Top = -1;
        this.start_Right = -1;
        this.start_Bottom = -1;
        this.start_Left = -1;
        this.mode = MODE.NONE;
        this.isControl_V = false;
        this.isControl_H = false;
        this.isScaleAnim = false;
    }
    
    public DragImageView(final Context context, final AttributeSet set) {
        super(context, set);
        this.start_Top = -1;
        this.start_Right = -1;
        this.start_Bottom = -1;
        this.start_Left = -1;
        this.mode = MODE.NONE;
        this.isControl_V = false;
        this.isControl_H = false;
        this.isScaleAnim = false;
    }
    
    static /* synthetic */ boolean access$5(final DragImageView dragImageView, final int n, final int n2, final int n3, final int n4) {
        return dragImageView.setFrame(n, n2, n3, n4);
    }
    
    private void setPosition(final int n, final int n2, final int n3, final int n4) {
        this.layout(n, n2, n3, n4);
    }
    
    public void doScaleAnim() {
        (this.myAsyncTask = new MyAsyncTask(this.screen_W, this.getWidth(), this.getHeight())).setLTRB(this.getLeft(), this.getTop(), this.getRight(), this.getBottom());
        this.myAsyncTask.execute((Object[])new Void[0]);
        this.isScaleAnim = false;
    }
    
    float getDistance(final MotionEvent motionEvent) {
        final float n = motionEvent.getX(0) - motionEvent.getX(1);
        final float n2 = motionEvent.getY(0) - motionEvent.getY(1);
        return FloatMath.sqrt(n * n + n2 * n2);
    }
    
    protected void onLayout(final boolean b, final int start_Left, final int start_Top, final int start_Right, final int start_Bottom) {
        super.onLayout(b, start_Left, start_Top, start_Right, start_Bottom);
        if (this.start_Top == -1) {
            this.start_Top = start_Top;
            this.start_Left = start_Left;
            this.start_Bottom = start_Bottom;
            this.start_Right = start_Right;
        }
    }
    
    void onPointerDown(final MotionEvent motionEvent) {
        if (motionEvent.getPointerCount() == 2) {
            this.mode = MODE.ZOOM;
            this.beforeLenght = this.getDistance(motionEvent);
        }
    }
    
    void onTouchDown(final MotionEvent motionEvent) {
        this.mode = MODE.DRAG;
        this.current_x = (int)motionEvent.getRawX();
        this.current_y = (int)motionEvent.getRawY();
        this.start_x = (int)motionEvent.getX();
        this.start_y = this.current_y - this.getTop();
    }
    
    public boolean onTouchEvent(final MotionEvent motionEvent) {
        switch (0xFF & motionEvent.getAction()) {
            case 0: {
                this.onTouchDown(motionEvent);
                break;
            }
            case 5: {
                this.onPointerDown(motionEvent);
                break;
            }
            case 2: {
                this.onTouchMove(motionEvent);
                break;
            }
            case 1: {
                this.mode = MODE.NONE;
                break;
            }
            case 6: {
                this.mode = MODE.NONE;
                if (this.isScaleAnim) {
                    this.doScaleAnim();
                    break;
                }
                break;
            }
        }
        return true;
    }
    
    void onTouchMove(final MotionEvent motionEvent) {
        if (this.mode == MODE.DRAG) {
            int left = this.current_x - this.start_x;
            int n = this.current_x + this.getWidth() - this.start_x;
            int top = this.current_y - this.start_y;
            int n2 = this.current_y - this.start_y + this.getHeight();
            if (this.isControl_H) {
                if (left >= 0) {
                    left = 0;
                    n = this.getWidth();
                }
                if (n <= this.screen_W) {
                    left = this.screen_W - this.getWidth();
                    n = this.screen_W;
                }
            }
            else {
                left = this.getLeft();
                n = this.getRight();
            }
            if (this.isControl_V) {
                if (top >= 0) {
                    top = 0;
                    n2 = this.getHeight();
                }
                if (n2 <= this.screen_H) {
                    top = this.screen_H - this.getHeight();
                    n2 = this.screen_H;
                }
            }
            else {
                top = this.getTop();
                n2 = this.getBottom();
            }
            if (this.isControl_H || this.isControl_V) {
                this.setPosition(left, top, n, n2);
            }
            this.current_x = (int)motionEvent.getRawX();
            this.current_y = (int)motionEvent.getRawY();
        }
        else if (this.mode == MODE.ZOOM) {
            this.afterLenght = this.getDistance(motionEvent);
            if (Math.abs(this.afterLenght - this.beforeLenght) > 5.0f) {
                this.setScale(this.scale_temp = this.afterLenght / this.beforeLenght);
                this.beforeLenght = this.afterLenght;
            }
        }
    }
    
    public void setImageBitmap(final Bitmap imageBitmap) {
        super.setImageBitmap(imageBitmap);
        this.bitmap_W = imageBitmap.getWidth();
        this.bitmap_H = imageBitmap.getHeight();
        this.MAX_W = 5 * this.bitmap_W;
        this.MAX_H = 5 * this.bitmap_H;
        this.MIN_W = 2 * (this.bitmap_W / 7);
        this.MIN_H = 2 * (this.bitmap_H / 7);
    }
    
    void setScale(final float n) {
        final int n2 = 5 * (int)(this.getWidth() * Math.abs(1.0f - n)) / 2;
        final int n3 = 3 * (int)(this.getHeight() * Math.abs(1.0f - n)) / 2;
        if (n > 1.0f && this.getWidth() <= this.MAX_W) {
            this.current_Left = this.getLeft() - n2;
            this.current_Top = this.getTop() - n3;
            this.current_Right = n2 + this.getRight();
            this.current_Bottom = n3 + this.getBottom();
            this.setFrame(this.current_Left, this.current_Top, this.current_Right, this.current_Bottom);
            if (this.current_Top <= 0 && this.current_Bottom >= this.screen_H) {
                this.isControl_V = true;
            }
            else {
                this.isControl_V = false;
            }
            if (this.current_Left > 0 || this.current_Right < this.screen_W) {
                this.isControl_H = false;
                return;
            }
            this.isControl_H = true;
        }
        else if (n < 1.0f && this.getWidth() >= this.MIN_W) {
            this.current_Left = n2 + this.getLeft();
            this.current_Top = n3 + this.getTop();
            this.current_Right = this.getRight() - n2;
            this.current_Bottom = this.getBottom() - n3;
            if (this.isControl_V && this.current_Top > 0) {
                this.current_Top = 0;
                this.current_Bottom = this.getBottom() - n3 * 2;
                if (this.current_Bottom < this.screen_H) {
                    this.current_Bottom = this.screen_H;
                    this.isControl_V = false;
                }
            }
            if (this.isControl_V && this.current_Bottom < this.screen_H) {
                this.current_Bottom = this.screen_H;
                this.current_Top = this.getTop() + n3 * 2;
                if (this.current_Top > 0) {
                    this.current_Top = 0;
                    this.isControl_V = false;
                }
            }
            if (this.isControl_H && this.current_Left >= 0) {
                this.current_Left = 0;
                this.current_Right = this.getRight() - n2 * 2;
                if (this.current_Right <= this.screen_W) {
                    this.current_Right = this.screen_W;
                    this.isControl_H = false;
                }
            }
            if (this.isControl_H && this.current_Right <= this.screen_W) {
                this.current_Right = this.screen_W;
                this.current_Left = this.getLeft() + n2 * 2;
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
    }
    
    public void setScreen_H(final int screen_H) {
        this.screen_H = screen_H;
    }
    
    public void setScreen_W(final int screen_W) {
        this.screen_W = screen_W;
    }
    
    public void setmActivity(final Activity mActivity) {
        this.mActivity = mActivity;
    }
    
    private enum MODE
    {
        DRAG("DRAG", 1), 
        NONE("NONE", 0), 
        ZOOM("ZOOM", 2);
    }
    
    class MyAsyncTask extends AsyncTask<Void, Integer, Void>
    {
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
        
        public MyAsyncTask(final int screen_W, final int current_Width, final int current_Height) {
            super();
            this.STEP = 8.0f;
            this.screen_W = screen_W;
            this.current_Width = current_Width;
            this.current_Height = current_Height;
            this.scale_WH = current_Height / current_Width;
            this.step_H = this.STEP;
            this.step_V = this.scale_WH * this.STEP;
        }
        
        protected Void doInBackground(final Void... array) {
            while (this.current_Width <= this.screen_W) {
                this.left -= (int)this.step_H;
                this.top -= (int)this.step_V;
                this.right += (int)this.step_H;
                this.bottom += (int)this.step_V;
                this.current_Width += (int)(2.0f * this.step_H);
                this.left = Math.max(this.left, DragImageView.this.start_Left);
                this.top = Math.max(this.top, DragImageView.this.start_Top);
                this.right = Math.min(this.right, DragImageView.this.start_Right);
                this.bottom = Math.min(this.bottom, DragImageView.this.start_Bottom);
                Log.e("jj", "top=" + this.top + ",bottom=" + this.bottom + ",left=" + this.left + ",right=" + this.right);
                this.onProgressUpdate(this.left, this.top, this.right, this.bottom);
                try {
                    Thread.sleep(10L);
                }
                catch (InterruptedException ex) {
                    ex.printStackTrace();
                }
            }
            return null;
        }
        
        protected void onProgressUpdate(final Integer... array) {
            super.onProgressUpdate((Object[])array);
            DragImageView.this.mActivity.runOnUiThread((Runnable)new Runnable() {
                @Override
                public void run() {
                    DragImageView.access$5(DragImageView.this, array[0], array[1], array[2], array[3]);
                }
            });
        }
        
        public void setLTRB(final int left, final int top, final int right, final int bottom) {
            this.left = left;
            this.top = top;
            this.right = right;
            this.bottom = bottom;
        }
    }
}
