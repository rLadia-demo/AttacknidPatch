.class public Lorg/anddev/andengine/entity/scene/background/ParallaxBackground;
.super Lorg/anddev/andengine/entity/scene/background/ColorBackground;
.source "ParallaxBackground.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/anddev/andengine/entity/scene/background/ParallaxBackground$ParallaxEntity;
    }
.end annotation


# instance fields
.field private final mParallaxEntities:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lorg/anddev/andengine/entity/scene/background/ParallaxBackground$ParallaxEntity;",
            ">;"
        }
    .end annotation
.end field

.field private mParallaxEntityCount:I

.field protected mParallaxValue:F


# direct methods
.method public constructor <init>(FFF)V
    .locals 1
    .parameter "pRed"
    .parameter "pGreen"
    .parameter "pBlue"

    .prologue
    .line 33
    invoke-direct {p0, p1, p2, p3}, Lorg/anddev/andengine/entity/scene/background/ColorBackground;-><init>(FFF)V

    .line 23
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lorg/anddev/andengine/entity/scene/background/ParallaxBackground;->mParallaxEntities:Ljava/util/ArrayList;

    .line 34
    return-void
.end method


# virtual methods
.method public addParallaxEntity(Lorg/anddev/andengine/entity/scene/background/ParallaxBackground$ParallaxEntity;)V
    .locals 1
    .parameter "pParallaxEntity"

    .prologue
    .line 65
    iget-object v0, p0, Lorg/anddev/andengine/entity/scene/background/ParallaxBackground;->mParallaxEntities:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 66
    iget v0, p0, Lorg/anddev/andengine/entity/scene/background/ParallaxBackground;->mParallaxEntityCount:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lorg/anddev/andengine/entity/scene/background/ParallaxBackground;->mParallaxEntityCount:I

    .line 67
    return-void
.end method

.method public onDraw(Ljavax/microedition/khronos/opengles/GL10;Lorg/anddev/andengine/engine/camera/Camera;)V
    .locals 4
    .parameter "pGL"
    .parameter "pCamera"

    .prologue
    .line 50
    invoke-super {p0, p1, p2}, Lorg/anddev/andengine/entity/scene/background/ColorBackground;->onDraw(Ljavax/microedition/khronos/opengles/GL10;Lorg/anddev/andengine/engine/camera/Camera;)V

    .line 52
    iget v2, p0, Lorg/anddev/andengine/entity/scene/background/ParallaxBackground;->mParallaxValue:F

    .line 53
    .local v2, parallaxValue:F
    iget-object v1, p0, Lorg/anddev/andengine/entity/scene/background/ParallaxBackground;->mParallaxEntities:Ljava/util/ArrayList;

    .line 55
    .local v1, parallaxEntities:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lorg/anddev/andengine/entity/scene/background/ParallaxBackground$ParallaxEntity;>;"
    const/4 v0, 0x0

    .local v0, i:I
    :goto_0
    iget v3, p0, Lorg/anddev/andengine/entity/scene/background/ParallaxBackground;->mParallaxEntityCount:I

    if-lt v0, v3, :cond_0

    .line 58
    return-void

    .line 56
    :cond_0
    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lorg/anddev/andengine/entity/scene/background/ParallaxBackground$ParallaxEntity;

    invoke-virtual {v3, p1, v2, p2}, Lorg/anddev/andengine/entity/scene/background/ParallaxBackground$ParallaxEntity;->onDraw(Ljavax/microedition/khronos/opengles/GL10;FLorg/anddev/andengine/engine/camera/Camera;)V

    .line 55
    add-int/lit8 v0, v0, 0x1

    goto :goto_0
.end method

.method public removeParallaxEntity(Lorg/anddev/andengine/entity/scene/background/ParallaxBackground$ParallaxEntity;)Z
    .locals 2
    .parameter "pParallaxEntity"

    .prologue
    .line 70
    iget v1, p0, Lorg/anddev/andengine/entity/scene/background/ParallaxBackground;->mParallaxEntityCount:I

    add-int/lit8 v1, v1, -0x1

    iput v1, p0, Lorg/anddev/andengine/entity/scene/background/ParallaxBackground;->mParallaxEntityCount:I

    .line 71
    iget-object v1, p0, Lorg/anddev/andengine/entity/scene/background/ParallaxBackground;->mParallaxEntities:Ljava/util/ArrayList;

    invoke-virtual {v1, p1}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    move-result v0

    .line 72
    .local v0, success:Z
    if-nez v0, :cond_0

    .line 73
    iget v1, p0, Lorg/anddev/andengine/entity/scene/background/ParallaxBackground;->mParallaxEntityCount:I

    add-int/lit8 v1, v1, 0x1

    iput v1, p0, Lorg/anddev/andengine/entity/scene/background/ParallaxBackground;->mParallaxEntityCount:I

    .line 75
    :cond_0
    return v0
.end method

.method public setParallaxValue(F)V
    .locals 0
    .parameter "pParallaxValue"

    .prologue
    .line 41
    iput p1, p0, Lorg/anddev/andengine/entity/scene/background/ParallaxBackground;->mParallaxValue:F

    .line 42
    return-void
.end method
