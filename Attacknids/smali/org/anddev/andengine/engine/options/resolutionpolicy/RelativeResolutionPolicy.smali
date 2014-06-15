.class public Lorg/anddev/andengine/engine/options/resolutionpolicy/RelativeResolutionPolicy;
.super Lorg/anddev/andengine/engine/options/resolutionpolicy/BaseResolutionPolicy;
.source "RelativeResolutionPolicy.java"


# instance fields
.field private final mHeightScale:F

.field private final mWidthScale:F


# direct methods
.method public constructor <init>(F)V
    .locals 0
    .parameter "pScale"

    .prologue
    .line 28
    invoke-direct {p0, p1, p1}, Lorg/anddev/andengine/engine/options/resolutionpolicy/RelativeResolutionPolicy;-><init>(FF)V

    .line 29
    return-void
.end method

.method public constructor <init>(FF)V
    .locals 0
    .parameter "pWidthScale"
    .parameter "pHeightScale"

    .prologue
    .line 31
    invoke-direct {p0}, Lorg/anddev/andengine/engine/options/resolutionpolicy/BaseResolutionPolicy;-><init>()V

    .line 32
    iput p1, p0, Lorg/anddev/andengine/engine/options/resolutionpolicy/RelativeResolutionPolicy;->mWidthScale:F

    .line 33
    iput p2, p0, Lorg/anddev/andengine/engine/options/resolutionpolicy/RelativeResolutionPolicy;->mHeightScale:F

    .line 34
    return-void
.end method


# virtual methods
.method public onMeasure(Lorg/anddev/andengine/opengl/view/RenderSurfaceView;II)V
    .locals 4
    .parameter "pRenderSurfaceView"
    .parameter "pWidthMeasureSpec"
    .parameter "pHeightMeasureSpec"

    .prologue
    .line 45
    invoke-static {p2, p3}, Lorg/anddev/andengine/engine/options/resolutionpolicy/BaseResolutionPolicy;->throwOnNotMeasureSpecEXACTLY(II)V

    .line 47
    invoke-static {p2}, Landroid/view/View$MeasureSpec;->getSize(I)I

    move-result v2

    int-to-float v2, v2

    iget v3, p0, Lorg/anddev/andengine/engine/options/resolutionpolicy/RelativeResolutionPolicy;->mWidthScale:F

    mul-float/2addr v2, v3

    float-to-int v1, v2

    .line 48
    .local v1, measuredWidth:I
    invoke-static {p3}, Landroid/view/View$MeasureSpec;->getSize(I)I

    move-result v2

    int-to-float v2, v2

    iget v3, p0, Lorg/anddev/andengine/engine/options/resolutionpolicy/RelativeResolutionPolicy;->mHeightScale:F

    mul-float/2addr v2, v3

    float-to-int v0, v2

    .line 50
    .local v0, measuredHeight:I
    invoke-virtual {p1, v1, v0}, Lorg/anddev/andengine/opengl/view/RenderSurfaceView;->setMeasuredDimensionProxy(II)V

    .line 51
    return-void
.end method
