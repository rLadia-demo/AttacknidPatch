.class public Lorg/anddev/andengine/engine/camera/CameraFactory;
.super Ljava/lang/Object;
.source "CameraFactory.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 10
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static createPixelPerfectCamera(Landroid/app/Activity;FF)Lorg/anddev/andengine/engine/camera/Camera;
    .locals 6
    .parameter "pActivity"
    .parameter "pCenterX"
    .parameter "pCenterY"

    .prologue
    const/high16 v5, 0x3f00

    .line 36
    invoke-static {p0}, Lorg/anddev/andengine/engine/camera/CameraFactory;->getDisplayMetrics(Landroid/app/Activity;)Landroid/util/DisplayMetrics;

    move-result-object v0

    .line 38
    .local v0, displayMetrics:Landroid/util/DisplayMetrics;
    iget v3, v0, Landroid/util/DisplayMetrics;->widthPixels:I

    int-to-float v2, v3

    .line 39
    .local v2, width:F
    iget v3, v0, Landroid/util/DisplayMetrics;->heightPixels:I

    int-to-float v1, v3

    .line 40
    .local v1, height:F
    new-instance v3, Lorg/anddev/andengine/engine/camera/Camera;

    mul-float v4, v2, v5

    sub-float v4, p1, v4

    mul-float/2addr v5, v1

    sub-float v5, p2, v5

    invoke-direct {v3, v4, v5, v2, v1}, Lorg/anddev/andengine/engine/camera/Camera;-><init>(FFFF)V

    return-object v3
.end method

.method private static getDisplayMetrics(Landroid/app/Activity;)Landroid/util/DisplayMetrics;
    .locals 2
    .parameter "pActivity"

    .prologue
    .line 44
    new-instance v0, Landroid/util/DisplayMetrics;

    invoke-direct {v0}, Landroid/util/DisplayMetrics;-><init>()V

    .line 45
    .local v0, displayMetrics:Landroid/util/DisplayMetrics;
    invoke-virtual {p0}, Landroid/app/Activity;->getWindowManager()Landroid/view/WindowManager;

    move-result-object v1

    invoke-interface {v1}, Landroid/view/WindowManager;->getDefaultDisplay()Landroid/view/Display;

    move-result-object v1

    invoke-virtual {v1, v0}, Landroid/view/Display;->getMetrics(Landroid/util/DisplayMetrics;)V

    .line 46
    return-object v0
.end method
