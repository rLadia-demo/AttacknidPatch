.class public Lcom/SixClawWorm/utils/GUtils;
.super Ljava/lang/Object;
.source "GUtils.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static contains(FFFF)Z
    .locals 1
    .parameter "controlWidth"
    .parameter "controlHeight"
    .parameter "targetX"
    .parameter "targetY"

    .prologue
    .line 7
    cmpg-float v0, p2, p0

    if-gtz v0, :cond_0

    cmpg-float v0, p3, p1

    if-gtz v0, :cond_0

    .line 9
    const/4 v0, 0x1

    .line 11
    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method
