.class public Lorg/anddev/andengine/engine/options/resolutionpolicy/FixedResolutionPolicy;
.super Lorg/anddev/andengine/engine/options/resolutionpolicy/BaseResolutionPolicy;
.source "FixedResolutionPolicy.java"


# instance fields
.field private final mHeight:I

.field private final mWidth:I


# direct methods
.method public constructor <init>(II)V
    .locals 0
    .parameter "pWidth"
    .parameter "pHeight"

    .prologue
    .line 25
    invoke-direct {p0}, Lorg/anddev/andengine/engine/options/resolutionpolicy/BaseResolutionPolicy;-><init>()V

    .line 26
    iput p1, p0, Lorg/anddev/andengine/engine/options/resolutionpolicy/FixedResolutionPolicy;->mWidth:I

    .line 27
    iput p2, p0, Lorg/anddev/andengine/engine/options/resolutionpolicy/FixedResolutionPolicy;->mHeight:I

    .line 28
    return-void
.end method


# virtual methods
.method public onMeasure(Lorg/anddev/andengine/opengl/view/RenderSurfaceView;II)V
    .locals 2
    .parameter "pRenderSurfaceView"
    .parameter "pWidthMeasureSpec"
    .parameter "pHeightMeasureSpec"

    .prologue
    .line 40
    iget v0, p0, Lorg/anddev/andengine/engine/options/resolutionpolicy/FixedResolutionPolicy;->mWidth:I

    iget v1, p0, Lorg/anddev/andengine/engine/options/resolutionpolicy/FixedResolutionPolicy;->mHeight:I

    invoke-virtual {p1, v0, v1}, Lorg/anddev/andengine/opengl/view/RenderSurfaceView;->setMeasuredDimensionProxy(II)V

    .line 41
    return-void
.end method
