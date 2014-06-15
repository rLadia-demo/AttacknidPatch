package com.SixClawWorm.application;

import android.app.*;
import android.graphics.*;
import android.os.*;
import android.webkit.*;
import com.SixClawWorm.utils.*;
import android.content.*;
import android.view.*;
import android.widget.*;
import java.lang.reflect.*;

public class inTrodutionActivity extends Activity
{
    private Button backBtn;
    Bitmap bmp;
    private DragImageView dragImageView;
    private int state_height;
    private ViewTreeObserver viewTreeObserver;
    private WebView webview;
    private int window_height;
    private int window_width;
    
    public inTrodutionActivity() {
        super();
        this.bmp = null;
    }
    
    public Bitmap ReadBitmapById(final Context context, final int n) {
        final BitmapFactory.Options bitmapFactory = new BitmapFactory.Options();
        bitmapFactory.inPreferredConfig = Bitmap.Config.RGB_565;
        bitmapFactory.inPurgeable = true;
        bitmapFactory.inInputShareable = true;
        bitmapFactory.inSampleSize = 2;
        return BitmapFactory.decodeStream(context.getResources().openRawResource(n), (Rect)null, bitmapFactory);
    }
    
    protected void onCreate(final Bundle bundle) {
        super.onCreate(bundle);
        this.requestWindowFeature(1);
        this.getWindow().setFlags(1024, 1024);
        this.setContentView(2130903050);
        PlatformScreen.GetWidth(this);
        PlatformScreen.GetHeight(this);
        this.webview = (WebView)this.findViewById(2131099671);
        this.webview.getSettings().setUseWideViewPort(true);
        this.webview.getSettings().setBuiltInZoomControls(true);
        this.setZoomControlGone((View)this.webview);
        this.webview.getSettings().setSupportZoom(true);
        this.webview.getSettings().setLayoutAlgorithm(WebSettings.LayoutAlgorithm.SINGLE_COLUMN);
        this.webview.setInitialScale(1);
        this.webview.getSettings().setDisplayZoomControls(false);
        this.webview.loadUrl("file:///android_asset/gfx/introtionalpic1280.jpg");
        ExitApplication.getInstance().addActivity(this);
        (this.backBtn = (Button)this.findViewById(2131099650)).setOnClickListener((View.OnClickListener)new View.OnClickListener() {
            public void onClick(final View view) {
                inTrodutionActivity.this.startActivity(new Intent((Context)inTrodutionActivity.this, (Class)MenuActivity.class));
            }
        });
    }
    
    public boolean onKeyDown(final int n, final KeyEvent keyEvent) {
        if (n == 4) {
            this.finish();
        }
        return super.onKeyDown(n, keyEvent);
    }
    
    protected void onStop() {
        if (this.bmp != null && !this.bmp.isRecycled()) {
            this.bmp.recycle();
            System.gc();
            this.bmp = null;
        }
        super.onStop();
    }
    
    public void setZoomControlGone(final View view) {
        try {
            final Field declaredField = WebView.class.getDeclaredField("mZoomButtonsController");
            declaredField.setAccessible(true);
            final ZoomButtonsController zoomButtonsController = new ZoomButtonsController(view);
            zoomButtonsController.getZoomControls().setVisibility(8);
            try {
                declaredField.set(view, zoomButtonsController);
            }
            catch (IllegalArgumentException ex) {
                ex.printStackTrace();
            }
            catch (IllegalAccessException ex2) {
                ex2.printStackTrace();
            }
        }
        catch (SecurityException ex4) {}
        catch (NoSuchFieldException ex3) {
            ex3.printStackTrace();
        }
    }
}
