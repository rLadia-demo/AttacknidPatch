.class public Lorg/anddev/andengine/extension/input/touch/controller/MultiTouch;
.super Ljava/lang/Object;
.source "MultiTouch.java"


# static fields
.field private static SUPPORTED:Ljava/lang/Boolean;

.field private static SUPPORTED_DISTINCT:Ljava/lang/Boolean;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    const/4 v0, 0x0

    .line 24
    sput-object v0, Lorg/anddev/andengine/extension/input/touch/controller/MultiTouch;->SUPPORTED:Ljava/lang/Boolean;

    .line 25
    sput-object v0, Lorg/anddev/andengine/extension/input/touch/controller/MultiTouch;->SUPPORTED_DISTINCT:Ljava/lang/Boolean;

    .line 15
    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 15
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private static hasFeature(Landroid/content/Context;Ljava/lang/String;)Z
    .locals 8
    .parameter "pContext"
    .parameter "pFeature"

    .prologue
    const/4 v3, 0x0

    .line 61
    :try_start_0
    const-class v2, Landroid/content/pm/PackageManager;

    const-string v4, "hasSystemFeature"

    const/4 v5, 0x1

    new-array v5, v5, [Ljava/lang/Class;

    const/4 v6, 0x0

    const-class v7, Ljava/lang/String;

    aput-object v7, v5, v6

    invoke-virtual {v2, v4, v5}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v0

    .line 62
    .local v0, PackageManager_hasSystemFeatures:Ljava/lang/reflect/Method;
    if-nez v0, :cond_0

    move v2, v3

    .line 64
    .end local v0           #PackageManager_hasSystemFeatures:Ljava/lang/reflect/Method;
    :goto_0
    return v2

    .line 62
    .restart local v0       #PackageManager_hasSystemFeatures:Ljava/lang/reflect/Method;
    :cond_0
    invoke-virtual {p0}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v2

    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/Object;

    const/4 v5, 0x0

    aput-object p1, v4, v5

    invoke-virtual {v0, v2, v4}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Boolean;

    invoke-virtual {v2}, Ljava/lang/Boolean;->booleanValue()Z
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    move-result v2

    goto :goto_0

    .line 63
    .end local v0           #PackageManager_hasSystemFeatures:Ljava/lang/reflect/Method;
    :catch_0
    move-exception v1

    .local v1, t:Ljava/lang/Throwable;
    move v2, v3

    .line 64
    goto :goto_0
.end method

.method public static isSupported(Landroid/content/Context;)Z
    .locals 1
    .parameter "pContext"

    .prologue
    .line 44
    sget-object v0, Lorg/anddev/andengine/extension/input/touch/controller/MultiTouch;->SUPPORTED:Ljava/lang/Boolean;

    if-nez v0, :cond_0

    .line 45
    const/4 v0, 0x7

    invoke-static {v0}, Lorg/anddev/andengine/util/SystemUtils;->isAndroidVersionOrHigher(I)Z

    move-result v0

    if-eqz v0, :cond_1

    const-string v0, "android.hardware.touchscreen.multitouch"

    invoke-static {p0, v0}, Lorg/anddev/andengine/extension/input/touch/controller/MultiTouch;->hasFeature(Landroid/content/Context;Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_1

    const/4 v0, 0x1

    :goto_0
    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    sput-object v0, Lorg/anddev/andengine/extension/input/touch/controller/MultiTouch;->SUPPORTED:Ljava/lang/Boolean;

    .line 48
    :cond_0
    sget-object v0, Lorg/anddev/andengine/extension/input/touch/controller/MultiTouch;->SUPPORTED:Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    return v0

    .line 45
    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public static isSupportedByAndroidVersion()Z
    .locals 1

    .prologue
    .line 69
    const/4 v0, 0x5

    invoke-static {v0}, Lorg/anddev/andengine/util/SystemUtils;->isAndroidVersionOrHigher(I)Z

    move-result v0

    return v0
.end method

.method public static isSupportedDistinct(Landroid/content/Context;)Z
    .locals 1
    .parameter "pContext"

    .prologue
    .line 52
    sget-object v0, Lorg/anddev/andengine/extension/input/touch/controller/MultiTouch;->SUPPORTED_DISTINCT:Ljava/lang/Boolean;

    if-nez v0, :cond_0

    .line 53
    const/4 v0, 0x7

    invoke-static {v0}, Lorg/anddev/andengine/util/SystemUtils;->isAndroidVersionOrHigher(I)Z

    move-result v0

    if-eqz v0, :cond_1

    const-string v0, "android.hardware.touchscreen.multitouch.distinct"

    invoke-static {p0, v0}, Lorg/anddev/andengine/extension/input/touch/controller/MultiTouch;->hasFeature(Landroid/content/Context;Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_1

    const/4 v0, 0x1

    :goto_0
    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    sput-object v0, Lorg/anddev/andengine/extension/input/touch/controller/MultiTouch;->SUPPORTED_DISTINCT:Ljava/lang/Boolean;

    .line 56
    :cond_0
    sget-object v0, Lorg/anddev/andengine/extension/input/touch/controller/MultiTouch;->SUPPORTED_DISTINCT:Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    return v0

    .line 53
    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method
