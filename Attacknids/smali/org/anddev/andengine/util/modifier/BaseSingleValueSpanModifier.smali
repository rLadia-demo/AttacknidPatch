.class public abstract Lorg/anddev/andengine/util/modifier/BaseSingleValueSpanModifier;
.super Lorg/anddev/andengine/util/modifier/BaseDurationModifier;
.source "BaseSingleValueSpanModifier.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Lorg/anddev/andengine/util/modifier/BaseDurationModifier",
        "<TT;>;"
    }
.end annotation


# instance fields
.field protected final mEaseFunction:Lorg/anddev/andengine/util/modifier/ease/IEaseFunction;

.field private final mFromValue:F

.field private final mValueSpan:F


# direct methods
.method public constructor <init>(FFF)V
    .locals 6
    .parameter "pDuration"
    .parameter "pFromValue"
    .parameter "pToValue"

    .prologue
    .line 28
    .local p0, this:Lorg/anddev/andengine/util/modifier/BaseSingleValueSpanModifier;,"Lorg/anddev/andengine/util/modifier/BaseSingleValueSpanModifier<TT;>;"
    const/4 v4, 0x0

    sget-object v5, Lorg/anddev/andengine/util/modifier/ease/IEaseFunction;->DEFAULT:Lorg/anddev/andengine/util/modifier/ease/IEaseFunction;

    move-object v0, p0

    move v1, p1

    move v2, p2

    move v3, p3

    invoke-direct/range {v0 .. v5}, Lorg/anddev/andengine/util/modifier/BaseSingleValueSpanModifier;-><init>(FFFLorg/anddev/andengine/util/modifier/IModifier$IModifierListener;Lorg/anddev/andengine/util/modifier/ease/IEaseFunction;)V

    .line 29
    return-void
.end method

.method public constructor <init>(FFFLorg/anddev/andengine/util/modifier/IModifier$IModifierListener;)V
    .locals 1
    .parameter "pDuration"
    .parameter "pFromValue"
    .parameter "pToValue"
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(FFF",
            "Lorg/anddev/andengine/util/modifier/IModifier$IModifierListener",
            "<TT;>;)V"
        }
    .end annotation

    .prologue
    .line 36
    .local p0, this:Lorg/anddev/andengine/util/modifier/BaseSingleValueSpanModifier;,"Lorg/anddev/andengine/util/modifier/BaseSingleValueSpanModifier<TT;>;"
    .local p4, pModifierListener:Lorg/anddev/andengine/util/modifier/IModifier$IModifierListener;,"Lorg/anddev/andengine/util/modifier/IModifier$IModifierListener<TT;>;"
    sget-object v0, Lorg/anddev/andengine/util/modifier/ease/IEaseFunction;->DEFAULT:Lorg/anddev/andengine/util/modifier/ease/IEaseFunction;

    invoke-direct {p0, p1, p2, p3, v0}, Lorg/anddev/andengine/util/modifier/BaseSingleValueSpanModifier;-><init>(FFFLorg/anddev/andengine/util/modifier/ease/IEaseFunction;)V

    .line 37
    return-void
.end method

.method public constructor <init>(FFFLorg/anddev/andengine/util/modifier/IModifier$IModifierListener;Lorg/anddev/andengine/util/modifier/ease/IEaseFunction;)V
    .locals 1
    .parameter "pDuration"
    .parameter "pFromValue"
    .parameter "pToValue"
    .parameter
    .parameter "pEaseFunction"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(FFF",
            "Lorg/anddev/andengine/util/modifier/IModifier$IModifierListener",
            "<TT;>;",
            "Lorg/anddev/andengine/util/modifier/ease/IEaseFunction;",
            ")V"
        }
    .end annotation

    .prologue
    .line 40
    .local p0, this:Lorg/anddev/andengine/util/modifier/BaseSingleValueSpanModifier;,"Lorg/anddev/andengine/util/modifier/BaseSingleValueSpanModifier<TT;>;"
    .local p4, pModifierListener:Lorg/anddev/andengine/util/modifier/IModifier$IModifierListener;,"Lorg/anddev/andengine/util/modifier/IModifier$IModifierListener<TT;>;"
    invoke-direct {p0, p1, p4}, Lorg/anddev/andengine/util/modifier/BaseDurationModifier;-><init>(FLorg/anddev/andengine/util/modifier/IModifier$IModifierListener;)V

    .line 41
    iput p2, p0, Lorg/anddev/andengine/util/modifier/BaseSingleValueSpanModifier;->mFromValue:F

    .line 42
    sub-float v0, p3, p2

    iput v0, p0, Lorg/anddev/andengine/util/modifier/BaseSingleValueSpanModifier;->mValueSpan:F

    .line 43
    iput-object p5, p0, Lorg/anddev/andengine/util/modifier/BaseSingleValueSpanModifier;->mEaseFunction:Lorg/anddev/andengine/util/modifier/ease/IEaseFunction;

    .line 44
    return-void
.end method

.method public constructor <init>(FFFLorg/anddev/andengine/util/modifier/ease/IEaseFunction;)V
    .locals 6
    .parameter "pDuration"
    .parameter "pFromValue"
    .parameter "pToValue"
    .parameter "pEaseFunction"

    .prologue
    .line 32
    .local p0, this:Lorg/anddev/andengine/util/modifier/BaseSingleValueSpanModifier;,"Lorg/anddev/andengine/util/modifier/BaseSingleValueSpanModifier<TT;>;"
    const/4 v4, 0x0

    move-object v0, p0

    move v1, p1

    move v2, p2

    move v3, p3

    move-object v5, p4

    invoke-direct/range {v0 .. v5}, Lorg/anddev/andengine/util/modifier/BaseSingleValueSpanModifier;-><init>(FFFLorg/anddev/andengine/util/modifier/IModifier$IModifierListener;Lorg/anddev/andengine/util/modifier/ease/IEaseFunction;)V

    .line 33
    return-void
.end method

.method protected constructor <init>(Lorg/anddev/andengine/util/modifier/BaseSingleValueSpanModifier;)V
    .locals 1
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/anddev/andengine/util/modifier/BaseSingleValueSpanModifier",
            "<TT;>;)V"
        }
    .end annotation

    .prologue
    .line 47
    .local p0, this:Lorg/anddev/andengine/util/modifier/BaseSingleValueSpanModifier;,"Lorg/anddev/andengine/util/modifier/BaseSingleValueSpanModifier<TT;>;"
    .local p1, pBaseSingleValueSpanModifier:Lorg/anddev/andengine/util/modifier/BaseSingleValueSpanModifier;,"Lorg/anddev/andengine/util/modifier/BaseSingleValueSpanModifier<TT;>;"
    invoke-direct {p0, p1}, Lorg/anddev/andengine/util/modifier/BaseDurationModifier;-><init>(Lorg/anddev/andengine/util/modifier/BaseDurationModifier;)V

    .line 48
    iget v0, p1, Lorg/anddev/andengine/util/modifier/BaseSingleValueSpanModifier;->mFromValue:F

    iput v0, p0, Lorg/anddev/andengine/util/modifier/BaseSingleValueSpanModifier;->mFromValue:F

    .line 49
    iget v0, p1, Lorg/anddev/andengine/util/modifier/BaseSingleValueSpanModifier;->mValueSpan:F

    iput v0, p0, Lorg/anddev/andengine/util/modifier/BaseSingleValueSpanModifier;->mValueSpan:F

    .line 50
    iget-object v0, p1, Lorg/anddev/andengine/util/modifier/BaseSingleValueSpanModifier;->mEaseFunction:Lorg/anddev/andengine/util/modifier/ease/IEaseFunction;

    iput-object v0, p0, Lorg/anddev/andengine/util/modifier/BaseSingleValueSpanModifier;->mEaseFunction:Lorg/anddev/andengine/util/modifier/ease/IEaseFunction;

    .line 51
    return-void
.end method


# virtual methods
.method protected onManagedInitialize(Ljava/lang/Object;)V
    .locals 1
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)V"
        }
    .end annotation

    .prologue
    .line 66
    .local p0, this:Lorg/anddev/andengine/util/modifier/BaseSingleValueSpanModifier;,"Lorg/anddev/andengine/util/modifier/BaseSingleValueSpanModifier<TT;>;"
    .local p1, pItem:Ljava/lang/Object;,"TT;"
    iget v0, p0, Lorg/anddev/andengine/util/modifier/BaseSingleValueSpanModifier;->mFromValue:F

    invoke-virtual {p0, p1, v0}, Lorg/anddev/andengine/util/modifier/BaseSingleValueSpanModifier;->onSetInitialValue(Ljava/lang/Object;F)V

    .line 67
    return-void
.end method

.method protected onManagedUpdate(FLjava/lang/Object;)V
    .locals 6
    .parameter "pSecondsElapsed"
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(FTT;)V"
        }
    .end annotation

    .prologue
    .line 71
    .local p0, this:Lorg/anddev/andengine/util/modifier/BaseSingleValueSpanModifier;,"Lorg/anddev/andengine/util/modifier/BaseSingleValueSpanModifier<TT;>;"
    .local p2, pItem:Ljava/lang/Object;,"TT;"
    iget-object v1, p0, Lorg/anddev/andengine/util/modifier/BaseSingleValueSpanModifier;->mEaseFunction:Lorg/anddev/andengine/util/modifier/ease/IEaseFunction;

    invoke-virtual {p0}, Lorg/anddev/andengine/util/modifier/BaseSingleValueSpanModifier;->getTotalSecondsElapsed()F

    move-result v2

    iget v3, p0, Lorg/anddev/andengine/util/modifier/BaseSingleValueSpanModifier;->mDuration:F

    const/4 v4, 0x0

    const/high16 v5, 0x3f80

    invoke-interface {v1, v2, v3, v4, v5}, Lorg/anddev/andengine/util/modifier/ease/IEaseFunction;->getPercentageDone(FFFF)F

    move-result v0

    .line 73
    .local v0, percentageDone:F
    iget v1, p0, Lorg/anddev/andengine/util/modifier/BaseSingleValueSpanModifier;->mFromValue:F

    iget v2, p0, Lorg/anddev/andengine/util/modifier/BaseSingleValueSpanModifier;->mValueSpan:F

    mul-float/2addr v2, v0

    add-float/2addr v1, v2

    invoke-virtual {p0, p2, v0, v1}, Lorg/anddev/andengine/util/modifier/BaseSingleValueSpanModifier;->onSetValue(Ljava/lang/Object;FF)V

    .line 74
    return-void
.end method

.method protected abstract onSetInitialValue(Ljava/lang/Object;F)V
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;F)V"
        }
    .end annotation
.end method

.method protected abstract onSetValue(Ljava/lang/Object;FF)V
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;FF)V"
        }
    .end annotation
.end method
