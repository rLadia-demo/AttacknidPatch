/*
 * Decompiled with CFR 0_79.
 * 
 * Could not load the following classes:
 *  android.app.Activity
 *  android.content.Context
 *  android.content.Intent
 *  android.content.res.Resources
 *  android.graphics.Bitmap
 *  android.graphics.Bitmap$Config
 *  android.graphics.BitmapFactory
 *  android.graphics.BitmapFactory$Options
 *  android.graphics.Rect
 *  android.os.Bundle
 *  android.view.KeyEvent
 *  android.view.View
 *  android.view.View$OnClickListener
 *  android.view.ViewTreeObserver
 *  android.view.Window
 *  android.webkit.WebSettings
 *  android.webkit.WebSettings$LayoutAlgorithm
 *  android.webkit.WebView
 *  android.widget.Button
 */
package com.SixClawWorm.application;

import android.app.Activity;
import android.content.Context;
import android.content.Intent;
import android.content.res.Resources;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.graphics.Rect;
import android.os.Bundle;
import android.view.KeyEvent;
import android.view.View;
import android.view.ViewTreeObserver;
import android.view.Window;
import android.webkit.WebSettings;
import android.webkit.WebView;
import android.widget.Button;
import com.SixClawWorm.application.MenuActivity;
import com.SixClawWorm.utils.DragImageView;
import com.SixClawWorm.utils.ExitApplication;
import com.SixClawWorm.utils.PlatformScreen;
import java.io.InputStream;

public class inTrodutionActivity
extends Activity {
    private Button backBtn;
    Bitmap bmp = null;
    private DragImageView dragImageView;
    private int state_height;
    private ViewTreeObserver viewTreeObserver;
    private WebView webview;
    private int window_height;
    private int window_width;

    public Bitmap ReadBitmapById(Context context, int n) {
        BitmapFactory.Options options = new BitmapFactory.Options();
        options.inPreferredConfig = Bitmap.Config.RGB_565;
        options.inPurgeable = true;
        options.inInputShareable = true;
        options.inSampleSize = 2;
        return BitmapFactory.decodeStream((InputStream)context.getResources().openRawResource(n), (Rect)null, (BitmapFactory.Options)options);
    }

    protected void onCreate(Bundle bundle) {
        super.onCreate(bundle);
        this.requestWindowFeature(1);
        this.getWindow().setFlags(1024, 1024);
        this.setContentView(2130903050);
        PlatformScreen.GetWidth((Activity)this);
        PlatformScreen.GetHeight((Activity)this);
        this.webview = (WebView)this.findViewById(2131099671);
        this.webview.getSettings().setUseWideViewPort(true);
        this.webview.getSettings().setBuiltInZoomControls(true);
        this.setZoomControlGone((View)this.webview);
        this.webview.getSettings().setSupportZoom(true);
        this.webview.getSettings().setLayoutAlgorithm(WebSettings.LayoutAlgorithm.SINGLE_COLUMN);
        this.webview.setInitialScale(1);
        this.webview.getSettings().setDisplayZoomControls(false);
        this.webview.loadUrl("file:///android_asset/gfx/introtionalpic1280.jpg");
        ExitApplication.getInstance().addActivity((Activity)this);
        this.backBtn = (Button)this.findViewById(2131099650);
        this.backBtn.setOnClickListener((View.OnClickListener)new View.OnClickListener(){

            public void onClick(View view) {
                Intent intent = new Intent((Context)inTrodutionActivity.this, (Class)MenuActivity.class);
                inTrodutionActivity.this.startActivity(intent);
            }
        });
    }

    public boolean onKeyDown(int n, KeyEvent keyEvent) {
        if (n != 4) return super.onKeyDown(n, keyEvent);
        this.finish();
        return super.onKeyDown(n, keyEvent);
    }

    protected void onStop() {
        if (!(this.bmp == null || this.bmp.isRecycled())) {
            this.bmp.recycle();
            System.gc();
            this.bmp = null;
        }
        super.onStop();
    }

    /*
     * Exception decompiling
     */
    public void setZoomControlGone(View var1) {
        // This method has failed to decompile.  When submitting a bug report, please provide this stack trace, and (if you hold appropriate legal rights) the relevant class file.
        // org.benf.cfr.reader.util.ConfusedCFRException: Tried to end blocks [0[TRYBLOCK]], but top level block is 5[CATCHBLOCK]
        // org.benf.cfr.reader.bytecode.analysis.opgraph.Op04StructuredStatement.processEndingBlocks(Op04StructuredStatement.java:406)
        // org.benf.cfr.reader.bytecode.analysis.opgraph.Op04StructuredStatement.buildNestedBlocks(Op04StructuredStatement.java:458)
        // org.benf.cfr.reader.bytecode.analysis.opgraph.Op03SimpleStatement.createInitialStructuredBlock(Op03SimpleStatement.java:2648)
        // org.benf.cfr.reader.bytecode.CodeAnalyser.getAnalysisInner(CodeAnalyser.java:670)
        // org.benf.cfr.reader.bytecode.CodeAnalyser.getAnalysisOrWrapFail(CodeAnalyser.java:185)
        // org.benf.cfr.reader.bytecode.CodeAnalyser.getAnalysis(CodeAnalyser.java:143)
        // org.benf.cfr.reader.entities.attributes.AttributeCode.analyse(AttributeCode.java:78)
        // org.benf.cfr.reader.entities.Method.analyse(Method.java:364)
        // org.benf.cfr.reader.entities.ClassFile.analyseMid(ClassFile.java:683)
        // org.benf.cfr.reader.entities.ClassFile.analyseTop(ClassFile.java:616)
        // org.benf.cfr.reader.Main.doJar(Main.java:116)
        // org.benf.cfr.reader.Main.main(Main.java:167)
        throw new IllegalStateException("Decompilation failed");
    }

}

