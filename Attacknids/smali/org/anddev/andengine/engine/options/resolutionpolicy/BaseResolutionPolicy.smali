.class public abstract Lorg/anddev/andengine/engine/options/resolutionpolicy/BaseResolutionPolicy;
.super Ljava/lang/Object;
.source "BaseResolutionPolicy.java"

# interfaces
.implements Lorg/anddev/andengine/engine/options/resolutionpolicy/IResolutionPolicy;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 9
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method protected static throwOnNotMeasureSpecEXACTLY(II)V
    .locals 4
    .parameter "pWidthMeasureSpec"
    .parameter "pHeightMeasureSpec"

    .prologue
    const/high16 v2, 0x4000

    .line 31
    invoke-static {p0}, Landroid/view/View$MeasureSpec;->getMode(I)I

    move-result v1

    .line 32
    .local v1, specWidthMode:I
    invoke-static {p1}, Landroid/view/View$MeasureSpec;->getMode(I)I

    move-result v0

    .line 34
    .local v0, specHeightMode:I
    if-ne v1, v2, :cond_0

    if-eq v0, v2, :cond_1

    .line 35
    :cond_0
    new-instance v2, Ljava/lang/IllegalStateException;

    const-string v3, "This IResolutionPolicy requires MeasureSpec.EXACTLY ! That means "

    invoke-direct {v2, v3}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 37
    :cond_1
    return-void
.end method
