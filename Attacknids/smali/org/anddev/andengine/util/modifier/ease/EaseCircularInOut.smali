.class public Lorg/anddev/andengine/util/modifier/ease/EaseCircularInOut;
.super Ljava/lang/Object;
.source "EaseCircularInOut.java"

# interfaces
.implements Lorg/anddev/andengine/util/modifier/ease/IEaseFunction;


# static fields
.field private static INSTANCE:Lorg/anddev/andengine/util/modifier/ease/EaseCircularInOut;


# direct methods
.method private constructor <init>()V
    .locals 0

    .prologue
    .line 24
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 25
    return-void
.end method

.method public static getInstance()Lorg/anddev/andengine/util/modifier/ease/EaseCircularInOut;
    .locals 1

    .prologue
    .line 28
    sget-object v0, Lorg/anddev/andengine/util/modifier/ease/EaseCircularInOut;->INSTANCE:Lorg/anddev/andengine/util/modifier/ease/EaseCircularInOut;

    if-nez v0, :cond_0

    .line 29
    new-instance v0, Lorg/anddev/andengine/util/modifier/ease/EaseCircularInOut;

    invoke-direct {v0}, Lorg/anddev/andengine/util/modifier/ease/EaseCircularInOut;-><init>()V

    sput-object v0, Lorg/anddev/andengine/util/modifier/ease/EaseCircularInOut;->INSTANCE:Lorg/anddev/andengine/util/modifier/ease/EaseCircularInOut;

    .line 31
    :cond_0
    sget-object v0, Lorg/anddev/andengine/util/modifier/ease/EaseCircularInOut;->INSTANCE:Lorg/anddev/andengine/util/modifier/ease/EaseCircularInOut;

    return-object v0
.end method


# virtual methods
.method public getPercentageDone(FFFF)F
    .locals 7
    .parameter "pSecondsElapsed"
    .parameter "pDuration"
    .parameter "pMinValue"
    .parameter "pMaxValue"

    .prologue
    const-wide/high16 v5, 0x3fe0

    const/high16 v4, 0x3f80

    .line 44
    float-to-double v0, p1

    float-to-double v2, p2

    mul-double/2addr v2, v5

    div-double/2addr v0, v2

    double-to-float p1, v0

    cmpg-float v0, p1, v4

    if-gez v0, :cond_0

    .line 45
    neg-float v0, p4

    float-to-double v0, v0

    mul-double/2addr v0, v5

    mul-float v2, p1, p1

    sub-float v2, v4, v2

    invoke-static {v2}, Landroid/util/FloatMath;->sqrt(F)F

    move-result v2

    sub-float/2addr v2, v4

    float-to-double v2, v2

    mul-double/2addr v0, v2

    float-to-double v2, p3

    add-double/2addr v0, v2

    double-to-float v0, v0

    .line 48
    :goto_0
    return v0

    :cond_0
    float-to-double v0, p4

    mul-double/2addr v0, v5

    const/high16 v2, 0x4000

    sub-float/2addr p1, v2

    mul-float v2, p1, p1

    sub-float v2, v4, v2

    invoke-static {v2}, Landroid/util/FloatMath;->sqrt(F)F

    move-result v2

    add-float/2addr v2, v4

    float-to-double v2, v2

    mul-double/2addr v0, v2

    float-to-double v2, p3

    add-double/2addr v0, v2

    double-to-float v0, v0

    goto :goto_0
.end method
