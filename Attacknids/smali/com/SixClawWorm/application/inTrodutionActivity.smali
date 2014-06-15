.class public Lcom/SixClawWorm/application/inTrodutionActivity;
.super Landroid/app/Activity;
.source "inTrodutionActivity.java"


# instance fields
.field private backBtn:Landroid/widget/Button;

.field bmp:Landroid/graphics/Bitmap;

.field private dragImageView:Lcom/SixClawWorm/utils/DragImageView;

.field private state_height:I

.field private viewTreeObserver:Landroid/view/ViewTreeObserver;

.field private webview:Landroid/webkit/WebView;

.field private window_height:I

.field private window_width:I


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 30
    invoke-direct {p0}, Landroid/app/Activity;-><init>()V

    .line 37
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/SixClawWorm/application/inTrodutionActivity;->bmp:Landroid/graphics/Bitmap;

    .line 30
    return-void
.end method


# virtual methods
.method public ReadBitmapById(Landroid/content/Context;I)Landroid/graphics/Bitmap;
    .locals 4
    .parameter "context"
    .parameter "resId"

    .prologue
    const/4 v3, 0x1

    .line 70
    new-instance v1, Landroid/graphics/BitmapFactory$Options;

    invoke-direct {v1}, Landroid/graphics/BitmapFactory$Options;-><init>()V

    .line 71
    .local v1, opt:Landroid/graphics/BitmapFactory$Options;
    sget-object v2, Landroid/graphics/Bitmap$Config;->RGB_565:Landroid/graphics/Bitmap$Config;

    iput-object v2, v1, Landroid/graphics/BitmapFactory$Options;->inPreferredConfig:Landroid/graphics/Bitmap$Config;

    .line 72
    iput-boolean v3, v1, Landroid/graphics/BitmapFactory$Options;->inPurgeable:Z

    .line 73
    iput-boolean v3, v1, Landroid/graphics/BitmapFactory$Options;->inInputShareable:Z

    .line 74
    const/4 v2, 0x2

    iput v2, v1, Landroid/graphics/BitmapFactory$Options;->inSampleSize:I

    .line 75
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    invoke-virtual {v2, p2}, Landroid/content/res/Resources;->openRawResource(I)Ljava/io/InputStream;

    move-result-object v0

    .line 76
    .local v0, is:Ljava/io/InputStream;
    const/4 v2, 0x0

    invoke-static {v0, v2, v1}, Landroid/graphics/BitmapFactory;->decodeStream(Ljava/io/InputStream;Landroid/graphics/Rect;Landroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;

    move-result-object v2

    return-object v2
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .locals 6
    .parameter "savedInstanceState"

    .prologue
    const/16 v4, 0x400

    const/4 v5, 0x1

    .line 40
    invoke-super {p0, p1}, Landroid/app/Activity;->onCreate(Landroid/os/Bundle;)V

    .line 41
    invoke-virtual {p0, v5}, Lcom/SixClawWorm/application/inTrodutionActivity;->requestWindowFeature(I)Z

    .line 42
    invoke-virtual {p0}, Lcom/SixClawWorm/application/inTrodutionActivity;->getWindow()Landroid/view/Window;

    move-result-object v3

    invoke-virtual {v3, v4, v4}, Landroid/view/Window;->setFlags(II)V

    .line 44
    const v3, 0x7f03000a

    invoke-virtual {p0, v3}, Lcom/SixClawWorm/application/inTrodutionActivity;->setContentView(I)V

    .line 45
    invoke-static {p0}, Lcom/SixClawWorm/utils/PlatformScreen;->GetWidth(Landroid/app/Activity;)I

    move-result v1

    .line 46
    .local v1, CAMERA_WIDTH:I
    invoke-static {p0}, Lcom/SixClawWorm/utils/PlatformScreen;->GetHeight(Landroid/app/Activity;)I

    move-result v0

    .line 47
    .local v0, CAMERA_HEIGHT:I
    const v3, 0x7f060017

    invoke-virtual {p0, v3}, Lcom/SixClawWorm/application/inTrodutionActivity;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/webkit/WebView;

    iput-object v3, p0, Lcom/SixClawWorm/application/inTrodutionActivity;->webview:Landroid/webkit/WebView;

    .line 48
    iget-object v3, p0, Lcom/SixClawWorm/application/inTrodutionActivity;->webview:Landroid/webkit/WebView;

    invoke-virtual {v3}, Landroid/webkit/WebView;->getSettings()Landroid/webkit/WebSettings;

    move-result-object v2

    .line 49
    .local v2, settings:Landroid/webkit/WebSettings;
    invoke-virtual {v2, v5}, Landroid/webkit/WebSettings;->setUseWideViewPort(Z)V

    .line 51
    iget-object v3, p0, Lcom/SixClawWorm/application/inTrodutionActivity;->webview:Landroid/webkit/WebView;

    invoke-virtual {v3}, Landroid/webkit/WebView;->getSettings()Landroid/webkit/WebSettings;

    move-result-object v3

    invoke-virtual {v3, v5}, Landroid/webkit/WebSettings;->setBuiltInZoomControls(Z)V

    .line 52
    iget-object v3, p0, Lcom/SixClawWorm/application/inTrodutionActivity;->webview:Landroid/webkit/WebView;

    invoke-virtual {p0, v3}, Lcom/SixClawWorm/application/inTrodutionActivity;->setZoomControlGone(Landroid/view/View;)V

    .line 53
    iget-object v3, p0, Lcom/SixClawWorm/application/inTrodutionActivity;->webview:Landroid/webkit/WebView;

    invoke-virtual {v3}, Landroid/webkit/WebView;->getSettings()Landroid/webkit/WebSettings;

    move-result-object v3

    invoke-virtual {v3, v5}, Landroid/webkit/WebSettings;->setSupportZoom(Z)V

    .line 54
    iget-object v3, p0, Lcom/SixClawWorm/application/inTrodutionActivity;->webview:Landroid/webkit/WebView;

    invoke-virtual {v3}, Landroid/webkit/WebView;->getSettings()Landroid/webkit/WebSettings;

    move-result-object v3

    sget-object v4, Landroid/webkit/WebSettings$LayoutAlgorithm;->SINGLE_COLUMN:Landroid/webkit/WebSettings$LayoutAlgorithm;

    invoke-virtual {v3, v4}, Landroid/webkit/WebSettings;->setLayoutAlgorithm(Landroid/webkit/WebSettings$LayoutAlgorithm;)V

    .line 55
    iget-object v3, p0, Lcom/SixClawWorm/application/inTrodutionActivity;->webview:Landroid/webkit/WebView;

    invoke-virtual {v3, v5}, Landroid/webkit/WebView;->setInitialScale(I)V

    .line 56
    iget-object v3, p0, Lcom/SixClawWorm/application/inTrodutionActivity;->webview:Landroid/webkit/WebView;

    invoke-virtual {v3}, Landroid/webkit/WebView;->getSettings()Landroid/webkit/WebSettings;

    move-result-object v3

    const/4 v4, 0x0

    invoke-virtual {v3, v4}, Landroid/webkit/WebSettings;->setDisplayZoomControls(Z)V

    .line 57
    iget-object v3, p0, Lcom/SixClawWorm/application/inTrodutionActivity;->webview:Landroid/webkit/WebView;

    const-string v4, "file:///android_asset/gfx/introtionalpic1280.jpg"

    invoke-virtual {v3, v4}, Landroid/webkit/WebView;->loadUrl(Ljava/lang/String;)V

    .line 58
    invoke-static {}, Lcom/SixClawWorm/utils/ExitApplication;->getInstance()Lcom/SixClawWorm/utils/ExitApplication;

    move-result-object v3

    invoke-virtual {v3, p0}, Lcom/SixClawWorm/utils/ExitApplication;->addActivity(Landroid/app/Activity;)V

    .line 59
    const v3, 0x7f060002

    invoke-virtual {p0, v3}, Lcom/SixClawWorm/application/inTrodutionActivity;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/Button;

    iput-object v3, p0, Lcom/SixClawWorm/application/inTrodutionActivity;->backBtn:Landroid/widget/Button;

    .line 60
    iget-object v3, p0, Lcom/SixClawWorm/application/inTrodutionActivity;->backBtn:Landroid/widget/Button;

    new-instance v4, Lcom/SixClawWorm/application/inTrodutionActivity$1;

    invoke-direct {v4, p0}, Lcom/SixClawWorm/application/inTrodutionActivity$1;-><init>(Lcom/SixClawWorm/application/inTrodutionActivity;)V

    invoke-virtual {v3, v4}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 68
    return-void
.end method

.method public onKeyDown(ILandroid/view/KeyEvent;)Z
    .locals 1
    .parameter "keyCode"
    .parameter "event"

    .prologue
    .line 81
    const/4 v0, 0x4

    if-ne p1, v0, :cond_0

    .line 83
    invoke-virtual {p0}, Lcom/SixClawWorm/application/inTrodutionActivity;->finish()V

    .line 86
    :cond_0
    invoke-super {p0, p1, p2}, Landroid/app/Activity;->onKeyDown(ILandroid/view/KeyEvent;)Z

    move-result v0

    return v0
.end method

.method protected onStop()V
    .locals 1

    .prologue
    .line 114
    iget-object v0, p0, Lcom/SixClawWorm/application/inTrodutionActivity;->bmp:Landroid/graphics/Bitmap;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/SixClawWorm/application/inTrodutionActivity;->bmp:Landroid/graphics/Bitmap;

    invoke-virtual {v0}, Landroid/graphics/Bitmap;->isRecycled()Z

    move-result v0

    if-nez v0, :cond_0

    .line 115
    iget-object v0, p0, Lcom/SixClawWorm/application/inTrodutionActivity;->bmp:Landroid/graphics/Bitmap;

    invoke-virtual {v0}, Landroid/graphics/Bitmap;->recycle()V

    .line 116
    invoke-static {}, Ljava/lang/System;->gc()V

    .line 117
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/SixClawWorm/application/inTrodutionActivity;->bmp:Landroid/graphics/Bitmap;

    .line 119
    :cond_0
    invoke-super {p0}, Landroid/app/Activity;->onStop()V

    .line 120
    return-void
.end method

.method public setZoomControlGone(Landroid/view/View;)V
    .locals 6
    .parameter "view"

    .prologue
    .line 94
    :try_start_0
    const-class v0, Landroid/webkit/WebView;

    .line 95
    .local v0, classType:Ljava/lang/Class;
    const-string v4, "mZoomButtonsController"

    invoke-virtual {v0, v4}, Ljava/lang/Class;->getDeclaredField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v2

    .line 96
    .local v2, field:Ljava/lang/reflect/Field;
    const/4 v4, 0x1

    invoke-virtual {v2, v4}, Ljava/lang/reflect/Field;->setAccessible(Z)V

    .line 97
    new-instance v3, Landroid/widget/ZoomButtonsController;

    invoke-direct {v3, p1}, Landroid/widget/ZoomButtonsController;-><init>(Landroid/view/View;)V

    .line 98
    .local v3, mZoomButtonsController:Landroid/widget/ZoomButtonsController;
    invoke-virtual {v3}, Landroid/widget/ZoomButtonsController;->getZoomControls()Landroid/view/View;

    move-result-object v4

    const/16 v5, 0x8

    invoke-virtual {v4, v5}, Landroid/view/View;->setVisibility(I)V
    :try_end_0
    .catch Ljava/lang/SecurityException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/NoSuchFieldException; {:try_start_0 .. :try_end_0} :catch_3

    .line 100
    :try_start_1
    invoke-virtual {v2, p1, v3}, Ljava/lang/reflect/Field;->set(Ljava/lang/Object;Ljava/lang/Object;)V
    :try_end_1
    .catch Ljava/lang/IllegalArgumentException; {:try_start_1 .. :try_end_1} :catch_0
    .catch Ljava/lang/IllegalAccessException; {:try_start_1 .. :try_end_1} :catch_2
    .catch Ljava/lang/SecurityException; {:try_start_1 .. :try_end_1} :catch_1
    .catch Ljava/lang/NoSuchFieldException; {:try_start_1 .. :try_end_1} :catch_3

    .line 111
    .end local v0           #classType:Ljava/lang/Class;
    .end local v2           #field:Ljava/lang/reflect/Field;
    .end local v3           #mZoomButtonsController:Landroid/widget/ZoomButtonsController;
    :goto_0
    return-void

    .line 101
    .restart local v0       #classType:Ljava/lang/Class;
    .restart local v2       #field:Ljava/lang/reflect/Field;
    .restart local v3       #mZoomButtonsController:Landroid/widget/ZoomButtonsController;
    :catch_0
    move-exception v1

    .line 102
    .local v1, e:Ljava/lang/IllegalArgumentException;
    :try_start_2
    invoke-virtual {v1}, Ljava/lang/IllegalArgumentException;->printStackTrace()V
    :try_end_2
    .catch Ljava/lang/SecurityException; {:try_start_2 .. :try_end_2} :catch_1
    .catch Ljava/lang/NoSuchFieldException; {:try_start_2 .. :try_end_2} :catch_3

    goto :goto_0

    .line 106
    .end local v0           #classType:Ljava/lang/Class;
    .end local v1           #e:Ljava/lang/IllegalArgumentException;
    .end local v2           #field:Ljava/lang/reflect/Field;
    .end local v3           #mZoomButtonsController:Landroid/widget/ZoomButtonsController;
    :catch_1
    move-exception v1

    .line 107
    .local v1, e:Ljava/lang/SecurityException;
    invoke-virtual {v1}, Ljava/lang/SecurityException;->printStackTrace()V

    goto :goto_0

    .line 103
    .end local v1           #e:Ljava/lang/SecurityException;
    .restart local v0       #classType:Ljava/lang/Class;
    .restart local v2       #field:Ljava/lang/reflect/Field;
    .restart local v3       #mZoomButtonsController:Landroid/widget/ZoomButtonsController;
    :catch_2
    move-exception v1

    .line 104
    .local v1, e:Ljava/lang/IllegalAccessException;
    :try_start_3
    invoke-virtual {v1}, Ljava/lang/IllegalAccessException;->printStackTrace()V
    :try_end_3
    .catch Ljava/lang/SecurityException; {:try_start_3 .. :try_end_3} :catch_1
    .catch Ljava/lang/NoSuchFieldException; {:try_start_3 .. :try_end_3} :catch_3

    goto :goto_0

    .line 108
    .end local v0           #classType:Ljava/lang/Class;
    .end local v1           #e:Ljava/lang/IllegalAccessException;
    .end local v2           #field:Ljava/lang/reflect/Field;
    .end local v3           #mZoomButtonsController:Landroid/widget/ZoomButtonsController;
    :catch_3
    move-exception v1

    .line 109
    .local v1, e:Ljava/lang/NoSuchFieldException;
    invoke-virtual {v1}, Ljava/lang/NoSuchFieldException;->printStackTrace()V

    goto :goto_0
.end method
