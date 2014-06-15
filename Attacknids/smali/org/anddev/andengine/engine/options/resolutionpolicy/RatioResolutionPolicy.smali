.class public Lorg/anddev/andengine/engine/options/resolutionpolicy/RatioResolutionPolicy;
.super Lorg/anddev/andengine/engine/options/resolutionpolicy/BaseResolutionPolicy;
.source "RatioResolutionPolicy.java"


# instance fields
.field private final mRatio:F


# direct methods
.method public constructor <init>(F)V
    .locals 0
    .parameter "pRatio"

    .prologue
    .line 26
    invoke-direct {p0}, Lorg/anddev/andengine/engine/options/resolutionpolicy/BaseResolutionPolicy;-><init>()V

    .line 27
    iput p1, p0, Lorg/anddev/andengine/engine/options/resolutionpolicy/RatioResolutionPolicy;->mRatio:F

    .line 28
    return-void
.end method

.method public constructor <init>(FF)V
    .locals 1
    .parameter "pWidthRatio"
    .parameter "pHeightRatio"

    .prologue
    .line 30
    invoke-direct {p0}, Lorg/anddev/andengine/engine/options/resolutionpolicy/BaseResolutionPolicy;-><init>()V

    .line 31
    div-float v0, p1, p2

    iput v0, p0, Lorg/anddev/andengine/engine/options/resolutionpolicy/RatioResolutionPolicy;->mRatio:F

    .line 32
    return-void
.end method


# virtual methods
.method public onMeasure(Lorg/anddev/andengine/opengl/view/RenderSurfaceView;II)V
    .locals 8
    .parameter "pRenderSurfaceView"
    .parameter "pWidthMeasureSpec"
    .parameter "pHeightMeasureSpec"

    .prologue
    .line 44
    invoke-static {p2, p3}, Lorg/anddev/andengine/engine/options/resolutionpolicy/BaseResolutionPolicy;->throwOnNotMeasureSpecEXACTLY(II)V

    .line 46
    invoke-static {p2}, Landroid/view/View$MeasureSpec;->getSize(I)I

    move-result v5

    .line 47
    .local v5, specWidth:I
    invoke-static {p3}, Landroid/view/View$MeasureSpec;->getSize(I)I

    move-result v4

    .line 49
    .local v4, specHeight:I
    iget v0, p0, Lorg/anddev/andengine/engine/options/resolutionpolicy/RatioResolutionPolicy;->mRatio:F

    .line 50
    .local v0, desiredRatio:F
    int-to-float v6, v5

    int-to-float v7, v4

    div-float v3, v6, v7

    .line 54
    .local v3, realRatio:F
    cmpg-float v6, v3, v0

    if-gez v6, :cond_0

    .line 55
    move v2, v5

    .line 56
    .local v2, measuredWidth:I
    int-to-float v6, v2

    div-float/2addr v6, v0

    invoke-static {v6}, Ljava/lang/Math;->round(F)I

    move-result v1

    .line 62
    .local v1, measuredHeight:I
    :goto_0
    invoke-virtual {p1, v2, v1}, Lorg/anddev/andengine/opengl/view/RenderSurfaceView;->setMeasuredDimensionProxy(II)V

    .line 63
    return-void

    .line 58
    .end local v1           #measuredHeight:I
    .end local v2           #measuredWidth:I
    :cond_0
    move v1, v4

    .line 59
    .restart local v1       #measuredHeight:I
    int-to-float v6, v1

    mul-float/2addr v6, v0

    invoke-static {v6}, Ljava/lang/Math;->round(F)I

    move-result v2

    .restart local v2       #measuredWidth:I
    goto :goto_0
.end method
