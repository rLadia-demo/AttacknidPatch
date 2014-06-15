.class public Lorg/anddev/andengine/entity/scene/Scene;
.super Lorg/anddev/andengine/entity/Entity;
.source "Scene.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/anddev/andengine/entity/scene/Scene$IOnAreaTouchListener;,
        Lorg/anddev/andengine/entity/scene/Scene$IOnSceneTouchListener;,
        Lorg/anddev/andengine/entity/scene/Scene$ITouchArea;
    }
.end annotation


# instance fields
.field private mBackground:Lorg/anddev/andengine/entity/scene/background/IBackground;

.field private mBackgroundEnabled:Z

.field protected mChildScene:Lorg/anddev/andengine/entity/scene/Scene;

.field private mChildSceneModalDraw:Z

.field private mChildSceneModalTouch:Z

.field private mChildSceneModalUpdate:Z

.field private final mLayerCount:I

.field private final mLayers:[Lorg/anddev/andengine/entity/layer/ILayer;

.field private mOnAreaTouchListener:Lorg/anddev/andengine/entity/scene/Scene$IOnAreaTouchListener;

.field private mOnAreaTouchTraversalBackToFront:Z

.field private mOnSceneTouchListener:Lorg/anddev/andengine/entity/scene/Scene$IOnSceneTouchListener;

.field protected mParentScene:Lorg/anddev/andengine/entity/scene/Scene;

.field private final mRunnableHandler:Lorg/anddev/andengine/engine/handler/runnable/RunnableHandler;

.field private mSecondsElapsedTotal:F

.field private mTouchAreaBindingEnabled:Z

.field private final mTouchAreaBindings:Landroid/util/SparseArray;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/SparseArray",
            "<",
            "Lorg/anddev/andengine/entity/scene/Scene$ITouchArea;",
            ">;"
        }
    .end annotation
.end field

.field private final mTouchAreas:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lorg/anddev/andengine/entity/scene/Scene$ITouchArea;",
            ">;"
        }
    .end annotation
.end field

.field private final mUpdateHandlers:Lorg/anddev/andengine/engine/handler/UpdateHandlerList;


# direct methods
.method public constructor <init>(I)V
    .locals 3
    .parameter "pLayerCount"

    .prologue
    const/4 v2, 0x1

    const/4 v1, 0x0

    .line 74
    invoke-direct {p0}, Lorg/anddev/andengine/entity/Entity;-><init>()V

    .line 52
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lorg/anddev/andengine/entity/scene/Scene;->mTouchAreas:Ljava/util/ArrayList;

    .line 54
    new-instance v0, Lorg/anddev/andengine/engine/handler/runnable/RunnableHandler;

    invoke-direct {v0}, Lorg/anddev/andengine/engine/handler/runnable/RunnableHandler;-><init>()V

    iput-object v0, p0, Lorg/anddev/andengine/entity/scene/Scene;->mRunnableHandler:Lorg/anddev/andengine/engine/handler/runnable/RunnableHandler;

    .line 56
    new-instance v0, Lorg/anddev/andengine/engine/handler/UpdateHandlerList;

    invoke-direct {v0}, Lorg/anddev/andengine/engine/handler/UpdateHandlerList;-><init>()V

    iput-object v0, p0, Lorg/anddev/andengine/entity/scene/Scene;->mUpdateHandlers:Lorg/anddev/andengine/engine/handler/UpdateHandlerList;

    .line 62
    new-instance v0, Lorg/anddev/andengine/entity/scene/background/ColorBackground;

    invoke-direct {v0, v1, v1, v1}, Lorg/anddev/andengine/entity/scene/background/ColorBackground;-><init>(FFF)V

    iput-object v0, p0, Lorg/anddev/andengine/entity/scene/Scene;->mBackground:Lorg/anddev/andengine/entity/scene/background/IBackground;

    .line 63
    iput-boolean v2, p0, Lorg/anddev/andengine/entity/scene/Scene;->mBackgroundEnabled:Z

    .line 65
    iput-boolean v2, p0, Lorg/anddev/andengine/entity/scene/Scene;->mOnAreaTouchTraversalBackToFront:Z

    .line 67
    const/4 v0, 0x0

    iput-boolean v0, p0, Lorg/anddev/andengine/entity/scene/Scene;->mTouchAreaBindingEnabled:Z

    .line 68
    new-instance v0, Landroid/util/SparseArray;

    invoke-direct {v0}, Landroid/util/SparseArray;-><init>()V

    iput-object v0, p0, Lorg/anddev/andengine/entity/scene/Scene;->mTouchAreaBindings:Landroid/util/SparseArray;

    .line 75
    iput p1, p0, Lorg/anddev/andengine/entity/scene/Scene;->mLayerCount:I

    .line 76
    new-array v0, p1, [Lorg/anddev/andengine/entity/layer/ILayer;

    iput-object v0, p0, Lorg/anddev/andengine/entity/scene/Scene;->mLayers:[Lorg/anddev/andengine/entity/layer/ILayer;

    .line 77
    invoke-direct {p0}, Lorg/anddev/andengine/entity/scene/Scene;->createLayers()V

    .line 78
    return-void
.end method

.method public varargs constructor <init>(IZ[I)V
    .locals 3
    .parameter "pLayerCount"
    .parameter "pFixedCapacityLayers"
    .parameter "pLayerCapacities"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalArgumentException;
        }
    .end annotation

    .prologue
    const/4 v2, 0x1

    const/4 v1, 0x0

    .line 80
    invoke-direct {p0}, Lorg/anddev/andengine/entity/Entity;-><init>()V

    .line 52
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lorg/anddev/andengine/entity/scene/Scene;->mTouchAreas:Ljava/util/ArrayList;

    .line 54
    new-instance v0, Lorg/anddev/andengine/engine/handler/runnable/RunnableHandler;

    invoke-direct {v0}, Lorg/anddev/andengine/engine/handler/runnable/RunnableHandler;-><init>()V

    iput-object v0, p0, Lorg/anddev/andengine/entity/scene/Scene;->mRunnableHandler:Lorg/anddev/andengine/engine/handler/runnable/RunnableHandler;

    .line 56
    new-instance v0, Lorg/anddev/andengine/engine/handler/UpdateHandlerList;

    invoke-direct {v0}, Lorg/anddev/andengine/engine/handler/UpdateHandlerList;-><init>()V

    iput-object v0, p0, Lorg/anddev/andengine/entity/scene/Scene;->mUpdateHandlers:Lorg/anddev/andengine/engine/handler/UpdateHandlerList;

    .line 62
    new-instance v0, Lorg/anddev/andengine/entity/scene/background/ColorBackground;

    invoke-direct {v0, v1, v1, v1}, Lorg/anddev/andengine/entity/scene/background/ColorBackground;-><init>(FFF)V

    iput-object v0, p0, Lorg/anddev/andengine/entity/scene/Scene;->mBackground:Lorg/anddev/andengine/entity/scene/background/IBackground;

    .line 63
    iput-boolean v2, p0, Lorg/anddev/andengine/entity/scene/Scene;->mBackgroundEnabled:Z

    .line 65
    iput-boolean v2, p0, Lorg/anddev/andengine/entity/scene/Scene;->mOnAreaTouchTraversalBackToFront:Z

    .line 67
    const/4 v0, 0x0

    iput-boolean v0, p0, Lorg/anddev/andengine/entity/scene/Scene;->mTouchAreaBindingEnabled:Z

    .line 68
    new-instance v0, Landroid/util/SparseArray;

    invoke-direct {v0}, Landroid/util/SparseArray;-><init>()V

    iput-object v0, p0, Lorg/anddev/andengine/entity/scene/Scene;->mTouchAreaBindings:Landroid/util/SparseArray;

    .line 81
    array-length v0, p3

    if-eq p1, v0, :cond_0

    .line 82
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "pLayerCount must be the same as the length of pLayerCapacities."

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 84
    :cond_0
    iput p1, p0, Lorg/anddev/andengine/entity/scene/Scene;->mLayerCount:I

    .line 85
    new-array v0, p1, [Lorg/anddev/andengine/entity/layer/ILayer;

    iput-object v0, p0, Lorg/anddev/andengine/entity/scene/Scene;->mLayers:[Lorg/anddev/andengine/entity/layer/ILayer;

    .line 86
    invoke-direct {p0, p2, p3}, Lorg/anddev/andengine/entity/scene/Scene;->createLayers(Z[I)V

    .line 87
    return-void
.end method

.method private createLayers()V
    .locals 3

    .prologue
    .line 496
    iget-object v1, p0, Lorg/anddev/andengine/entity/scene/Scene;->mLayers:[Lorg/anddev/andengine/entity/layer/ILayer;

    .line 497
    .local v1, layers:[Lorg/anddev/andengine/entity/layer/ILayer;
    iget v2, p0, Lorg/anddev/andengine/entity/scene/Scene;->mLayerCount:I

    add-int/lit8 v0, v2, -0x1

    .local v0, i:I
    :goto_0
    if-gez v0, :cond_0

    .line 500
    return-void

    .line 498
    :cond_0
    new-instance v2, Lorg/anddev/andengine/entity/layer/DynamicCapacityLayer;

    invoke-direct {v2}, Lorg/anddev/andengine/entity/layer/DynamicCapacityLayer;-><init>()V

    aput-object v2, v1, v0

    .line 497
    add-int/lit8 v0, v0, -0x1

    goto :goto_0
.end method

.method private createLayers(Z[I)V
    .locals 4
    .parameter "pFixedCapacityLayers"
    .parameter "pLayerCapacities"

    .prologue
    .line 503
    iget-object v1, p0, Lorg/anddev/andengine/entity/scene/Scene;->mLayers:[Lorg/anddev/andengine/entity/layer/ILayer;

    .line 504
    .local v1, layers:[Lorg/anddev/andengine/entity/layer/ILayer;
    if-eqz p1, :cond_2

    .line 505
    iget v2, p0, Lorg/anddev/andengine/entity/scene/Scene;->mLayerCount:I

    add-int/lit8 v0, v2, -0x1

    .local v0, i:I
    :goto_0
    if-gez v0, :cond_1

    .line 513
    :cond_0
    return-void

    .line 506
    :cond_1
    new-instance v2, Lorg/anddev/andengine/entity/layer/FixedCapacityLayer;

    aget v3, p2, v0

    invoke-direct {v2, v3}, Lorg/anddev/andengine/entity/layer/FixedCapacityLayer;-><init>(I)V

    aput-object v2, v1, v0

    .line 505
    add-int/lit8 v0, v0, -0x1

    goto :goto_0

    .line 509
    .end local v0           #i:I
    :cond_2
    iget v2, p0, Lorg/anddev/andengine/entity/scene/Scene;->mLayerCount:I

    add-int/lit8 v0, v2, -0x1

    .restart local v0       #i:I
    :goto_1
    if-ltz v0, :cond_0

    .line 510
    new-instance v2, Lorg/anddev/andengine/entity/layer/DynamicCapacityLayer;

    aget v3, p2, v0

    invoke-direct {v2, v3}, Lorg/anddev/andengine/entity/layer/DynamicCapacityLayer;-><init>(I)V

    aput-object v2, v1, v0

    .line 509
    add-int/lit8 v0, v0, -0x1

    goto :goto_1
.end method

.method private drawLayers(Ljavax/microedition/khronos/opengles/GL10;Lorg/anddev/andengine/engine/camera/Camera;)V
    .locals 4
    .parameter "pGL"
    .parameter "pCamera"

    .prologue
    .line 524
    iget-object v2, p0, Lorg/anddev/andengine/entity/scene/Scene;->mLayers:[Lorg/anddev/andengine/entity/layer/ILayer;

    .line 525
    .local v2, layers:[Lorg/anddev/andengine/entity/layer/ILayer;
    iget v1, p0, Lorg/anddev/andengine/entity/scene/Scene;->mLayerCount:I

    .line 526
    .local v1, layerCount:I
    const/4 v0, 0x0

    .local v0, i:I
    :goto_0
    if-lt v0, v1, :cond_0

    .line 529
    return-void

    .line 527
    :cond_0
    aget-object v3, v2, v0

    invoke-interface {v3, p1, p2}, Lorg/anddev/andengine/entity/layer/ILayer;->onDraw(Ljavax/microedition/khronos/opengles/GL10;Lorg/anddev/andengine/engine/camera/Camera;)V

    .line 526
    add-int/lit8 v0, v0, 0x1

    goto :goto_0
.end method

.method private onAreaTouchEvent(Lorg/anddev/andengine/input/touch/TouchEvent;FFLorg/anddev/andengine/entity/scene/Scene$ITouchArea;)Ljava/lang/Boolean;
    .locals 5
    .parameter "pSceneTouchEvent"
    .parameter "sceneTouchEventX"
    .parameter "sceneTouchEventY"
    .parameter "touchArea"

    .prologue
    .line 448
    invoke-interface {p4, p2, p3}, Lorg/anddev/andengine/entity/scene/Scene$ITouchArea;->convertSceneToLocalCoordinates(FF)[F

    move-result-object v1

    .line 449
    .local v1, touchAreaLocalCoordinates:[F
    const/4 v4, 0x0

    aget v2, v1, v4

    .line 450
    .local v2, touchAreaLocalX:F
    const/4 v4, 0x1

    aget v3, v1, v4

    .line 452
    .local v3, touchAreaLocalY:F
    invoke-interface {p4, p1, v2, v3}, Lorg/anddev/andengine/entity/scene/Scene$ITouchArea;->onAreaTouched(Lorg/anddev/andengine/input/touch/TouchEvent;FF)Z

    move-result v0

    .line 453
    .local v0, handledSelf:Z
    if-eqz v0, :cond_0

    .line 454
    sget-object v4, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 458
    :goto_0
    return-object v4

    .line 455
    :cond_0
    iget-object v4, p0, Lorg/anddev/andengine/entity/scene/Scene;->mOnAreaTouchListener:Lorg/anddev/andengine/entity/scene/Scene$IOnAreaTouchListener;

    if-eqz v4, :cond_1

    .line 456
    iget-object v4, p0, Lorg/anddev/andengine/entity/scene/Scene;->mOnAreaTouchListener:Lorg/anddev/andengine/entity/scene/Scene$IOnAreaTouchListener;

    invoke-interface {v4, p1, p4, v2, v3}, Lorg/anddev/andengine/entity/scene/Scene$IOnAreaTouchListener;->onAreaTouched(Lorg/anddev/andengine/input/touch/TouchEvent;Lorg/anddev/andengine/entity/scene/Scene$ITouchArea;FF)Z

    move-result v4

    invoke-static {v4}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v4

    goto :goto_0

    .line 458
    :cond_1
    const/4 v4, 0x0

    goto :goto_0
.end method

.method private setParentScene(Lorg/anddev/andengine/entity/scene/Scene;)V
    .locals 0
    .parameter "pParentScene"

    .prologue
    .line 210
    iput-object p1, p0, Lorg/anddev/andengine/entity/scene/Scene;->mParentScene:Lorg/anddev/andengine/entity/scene/Scene;

    .line 211
    return-void
.end method

.method private updateLayers(F)V
    .locals 4
    .parameter "pSecondsElapsed"

    .prologue
    .line 516
    iget-object v2, p0, Lorg/anddev/andengine/entity/scene/Scene;->mLayers:[Lorg/anddev/andengine/entity/layer/ILayer;

    .line 517
    .local v2, layers:[Lorg/anddev/andengine/entity/layer/ILayer;
    iget v1, p0, Lorg/anddev/andengine/entity/scene/Scene;->mLayerCount:I

    .line 518
    .local v1, layerCount:I
    const/4 v0, 0x0

    .local v0, i:I
    :goto_0
    if-lt v0, v1, :cond_0

    .line 521
    return-void

    .line 519
    :cond_0
    aget-object v3, v2, v0

    invoke-interface {v3, p1}, Lorg/anddev/andengine/entity/layer/ILayer;->onUpdate(F)V

    .line 518
    add-int/lit8 v0, v0, 0x1

    goto :goto_0
.end method

.method private updateUpdateHandlers(F)V
    .locals 1
    .parameter "pSecondsElapsed"

    .prologue
    .line 532
    iget-object v0, p0, Lorg/anddev/andengine/entity/scene/Scene;->mChildScene:Lorg/anddev/andengine/entity/scene/Scene;

    if-eqz v0, :cond_0

    iget-boolean v0, p0, Lorg/anddev/andengine/entity/scene/Scene;->mChildSceneModalUpdate:Z

    if-nez v0, :cond_1

    .line 533
    :cond_0
    iget-object v0, p0, Lorg/anddev/andengine/entity/scene/Scene;->mUpdateHandlers:Lorg/anddev/andengine/engine/handler/UpdateHandlerList;

    invoke-virtual {v0, p1}, Lorg/anddev/andengine/engine/handler/UpdateHandlerList;->onUpdate(F)V

    .line 536
    :cond_1
    iget-object v0, p0, Lorg/anddev/andengine/entity/scene/Scene;->mChildScene:Lorg/anddev/andengine/entity/scene/Scene;

    if-eqz v0, :cond_2

    .line 537
    iget-object v0, p0, Lorg/anddev/andengine/entity/scene/Scene;->mChildScene:Lorg/anddev/andengine/entity/scene/Scene;

    invoke-direct {v0, p1}, Lorg/anddev/andengine/entity/scene/Scene;->updateUpdateHandlers(F)V

    .line 539
    :cond_2
    return-void
.end method


# virtual methods
.method public back()V
    .locals 1

    .prologue
    .line 487
    invoke-virtual {p0}, Lorg/anddev/andengine/entity/scene/Scene;->clearChildScene()V

    .line 489
    iget-object v0, p0, Lorg/anddev/andengine/entity/scene/Scene;->mParentScene:Lorg/anddev/andengine/entity/scene/Scene;

    if-eqz v0, :cond_0

    .line 490
    iget-object v0, p0, Lorg/anddev/andengine/entity/scene/Scene;->mParentScene:Lorg/anddev/andengine/entity/scene/Scene;

    invoke-virtual {v0}, Lorg/anddev/andengine/entity/scene/Scene;->clearChildScene()V

    .line 491
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/anddev/andengine/entity/scene/Scene;->mParentScene:Lorg/anddev/andengine/entity/scene/Scene;

    .line 493
    :cond_0
    return-void
.end method

.method public clearChildScene()V
    .locals 1

    .prologue
    .line 238
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/anddev/andengine/entity/scene/Scene;->mChildScene:Lorg/anddev/andengine/entity/scene/Scene;

    .line 239
    return-void
.end method

.method public clearTouchAreas()V
    .locals 1

    .prologue
    .line 162
    iget-object v0, p0, Lorg/anddev/andengine/entity/scene/Scene;->mTouchAreas:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    .line 163
    return-void
.end method

.method public clearUpdateHandlers()V
    .locals 1

    .prologue
    .line 174
    iget-object v0, p0, Lorg/anddev/andengine/entity/scene/Scene;->mUpdateHandlers:Lorg/anddev/andengine/engine/handler/UpdateHandlerList;

    invoke-virtual {v0}, Lorg/anddev/andengine/engine/handler/UpdateHandlerList;->clear()V

    .line 175
    return-void
.end method

.method public getBackground()Lorg/anddev/andengine/entity/scene/background/IBackground;
    .locals 1

    .prologue
    .line 98
    iget-object v0, p0, Lorg/anddev/andengine/entity/scene/Scene;->mBackground:Lorg/anddev/andengine/entity/scene/background/IBackground;

    return-object v0
.end method

.method public getBottomLayer()Lorg/anddev/andengine/entity/layer/ILayer;
    .locals 2

    .prologue
    .line 114
    iget-object v0, p0, Lorg/anddev/andengine/entity/scene/Scene;->mLayers:[Lorg/anddev/andengine/entity/layer/ILayer;

    const/4 v1, 0x0

    aget-object v0, v0, v1

    return-object v0
.end method

.method public getChildScene()Lorg/anddev/andengine/entity/scene/Scene;
    .locals 1

    .prologue
    .line 218
    iget-object v0, p0, Lorg/anddev/andengine/entity/scene/Scene;->mChildScene:Lorg/anddev/andengine/entity/scene/Scene;

    return-object v0
.end method

.method public getLayer(I)Lorg/anddev/andengine/entity/layer/ILayer;
    .locals 1
    .parameter "pLayerIndex"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/ArrayIndexOutOfBoundsException;
        }
    .end annotation

    .prologue
    .line 106
    iget-object v0, p0, Lorg/anddev/andengine/entity/scene/Scene;->mLayers:[Lorg/anddev/andengine/entity/layer/ILayer;

    aget-object v0, v0, p1

    return-object v0
.end method

.method public getLayerCount()I
    .locals 1

    .prologue
    .line 110
    iget-object v0, p0, Lorg/anddev/andengine/entity/scene/Scene;->mLayers:[Lorg/anddev/andengine/entity/layer/ILayer;

    array-length v0, v0

    return v0
.end method

.method public getOnAreaTouchListener()Lorg/anddev/andengine/entity/scene/Scene$IOnAreaTouchListener;
    .locals 1

    .prologue
    .line 202
    iget-object v0, p0, Lorg/anddev/andengine/entity/scene/Scene;->mOnAreaTouchListener:Lorg/anddev/andengine/entity/scene/Scene$IOnAreaTouchListener;

    return-object v0
.end method

.method public getOnSceneTouchListener()Lorg/anddev/andengine/entity/scene/Scene$IOnSceneTouchListener;
    .locals 1

    .prologue
    .line 190
    iget-object v0, p0, Lorg/anddev/andengine/entity/scene/Scene;->mOnSceneTouchListener:Lorg/anddev/andengine/entity/scene/Scene$IOnSceneTouchListener;

    return-object v0
.end method

.method public getSecondsElapsedTotal()F
    .locals 1

    .prologue
    .line 94
    iget v0, p0, Lorg/anddev/andengine/entity/scene/Scene;->mSecondsElapsedTotal:F

    return v0
.end method

.method public getTopLayer()Lorg/anddev/andengine/entity/layer/ILayer;
    .locals 2

    .prologue
    .line 118
    iget-object v0, p0, Lorg/anddev/andengine/entity/scene/Scene;->mLayers:[Lorg/anddev/andengine/entity/layer/ILayer;

    iget v1, p0, Lorg/anddev/andengine/entity/scene/Scene;->mLayerCount:I

    add-int/lit8 v1, v1, -0x1

    aget-object v0, v0, v1

    return-object v0
.end method

.method public hasChildScene()Z
    .locals 1

    .prologue
    .line 214
    iget-object v0, p0, Lorg/anddev/andengine/entity/scene/Scene;->mChildScene:Lorg/anddev/andengine/entity/scene/Scene;

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public hasOnAreaTouchListener()Z
    .locals 1

    .prologue
    .line 206
    iget-object v0, p0, Lorg/anddev/andengine/entity/scene/Scene;->mOnAreaTouchListener:Lorg/anddev/andengine/entity/scene/Scene$IOnAreaTouchListener;

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public hasOnSceneTouchListener()Z
    .locals 1

    .prologue
    .line 194
    iget-object v0, p0, Lorg/anddev/andengine/entity/scene/Scene;->mOnSceneTouchListener:Lorg/anddev/andengine/entity/scene/Scene$IOnSceneTouchListener;

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public isBackgroundEnabled()Z
    .locals 1

    .prologue
    .line 154
    iget-boolean v0, p0, Lorg/anddev/andengine/entity/scene/Scene;->mBackgroundEnabled:Z

    return v0
.end method

.method public isTouchAreaBindingEnabled()Z
    .locals 1

    .prologue
    .line 268
    iget-boolean v0, p0, Lorg/anddev/andengine/entity/scene/Scene;->mTouchAreaBindingEnabled:Z

    return v0
.end method

.method protected onChildSceneTouchEvent(Lorg/anddev/andengine/input/touch/TouchEvent;)Z
    .locals 1
    .parameter "pSceneTouchEvent"

    .prologue
    .line 463
    iget-object v0, p0, Lorg/anddev/andengine/entity/scene/Scene;->mChildScene:Lorg/anddev/andengine/entity/scene/Scene;

    invoke-virtual {v0, p1}, Lorg/anddev/andengine/entity/scene/Scene;->onSceneTouchEvent(Lorg/anddev/andengine/input/touch/TouchEvent;)Z

    move-result v0

    return v0
.end method

.method protected onManagedDraw(Ljavax/microedition/khronos/opengles/GL10;Lorg/anddev/andengine/engine/camera/Camera;)V
    .locals 2
    .parameter "pGL"
    .parameter "pCamera"

    .prologue
    .line 277
    iget-object v0, p0, Lorg/anddev/andengine/entity/scene/Scene;->mChildScene:Lorg/anddev/andengine/entity/scene/Scene;

    .line 278
    .local v0, childScene:Lorg/anddev/andengine/entity/scene/Scene;
    if-eqz v0, :cond_0

    iget-boolean v1, p0, Lorg/anddev/andengine/entity/scene/Scene;->mChildSceneModalDraw:Z

    if-nez v1, :cond_2

    .line 279
    :cond_0
    iget-boolean v1, p0, Lorg/anddev/andengine/entity/scene/Scene;->mBackgroundEnabled:Z

    if-eqz v1, :cond_1

    .line 280
    invoke-virtual {p2, p1}, Lorg/anddev/andengine/engine/camera/Camera;->onApplyPositionIndependentMatrix(Ljavax/microedition/khronos/opengles/GL10;)V

    .line 281
    invoke-static {p1}, Lorg/anddev/andengine/opengl/util/GLHelper;->setModelViewIdentityMatrix(Ljavax/microedition/khronos/opengles/GL10;)V

    .line 283
    iget-object v1, p0, Lorg/anddev/andengine/entity/scene/Scene;->mBackground:Lorg/anddev/andengine/entity/scene/background/IBackground;

    invoke-interface {v1, p1, p2}, Lorg/anddev/andengine/entity/scene/background/IBackground;->onDraw(Ljavax/microedition/khronos/opengles/GL10;Lorg/anddev/andengine/engine/camera/Camera;)V

    .line 286
    :cond_1
    invoke-virtual {p2, p1}, Lorg/anddev/andengine/engine/camera/Camera;->onApplyMatrix(Ljavax/microedition/khronos/opengles/GL10;)V

    .line 287
    invoke-static {p1}, Lorg/anddev/andengine/opengl/util/GLHelper;->setModelViewIdentityMatrix(Ljavax/microedition/khronos/opengles/GL10;)V

    .line 289
    invoke-direct {p0, p1, p2}, Lorg/anddev/andengine/entity/scene/Scene;->drawLayers(Ljavax/microedition/khronos/opengles/GL10;Lorg/anddev/andengine/engine/camera/Camera;)V

    .line 291
    :cond_2
    if-eqz v0, :cond_3

    .line 292
    invoke-virtual {v0, p1, p2}, Lorg/anddev/andengine/entity/scene/Scene;->onDraw(Ljavax/microedition/khronos/opengles/GL10;Lorg/anddev/andengine/engine/camera/Camera;)V

    .line 294
    :cond_3
    return-void
.end method

.method protected onManagedUpdate(F)V
    .locals 2
    .parameter "pSecondsElapsed"

    .prologue
    .line 298
    invoke-direct {p0, p1}, Lorg/anddev/andengine/entity/scene/Scene;->updateUpdateHandlers(F)V

    .line 300
    iget-object v1, p0, Lorg/anddev/andengine/entity/scene/Scene;->mRunnableHandler:Lorg/anddev/andengine/engine/handler/runnable/RunnableHandler;

    invoke-virtual {v1, p1}, Lorg/anddev/andengine/engine/handler/runnable/RunnableHandler;->onUpdate(F)V

    .line 301
    iget v1, p0, Lorg/anddev/andengine/entity/scene/Scene;->mSecondsElapsedTotal:F

    add-float/2addr v1, p1

    iput v1, p0, Lorg/anddev/andengine/entity/scene/Scene;->mSecondsElapsedTotal:F

    .line 303
    iget-object v0, p0, Lorg/anddev/andengine/entity/scene/Scene;->mChildScene:Lorg/anddev/andengine/entity/scene/Scene;

    .line 304
    .local v0, childScene:Lorg/anddev/andengine/entity/scene/Scene;
    if-eqz v0, :cond_0

    iget-boolean v1, p0, Lorg/anddev/andengine/entity/scene/Scene;->mChildSceneModalUpdate:Z

    if-nez v1, :cond_1

    .line 305
    :cond_0
    iget-object v1, p0, Lorg/anddev/andengine/entity/scene/Scene;->mBackground:Lorg/anddev/andengine/entity/scene/background/IBackground;

    invoke-interface {v1, p1}, Lorg/anddev/andengine/entity/scene/background/IBackground;->onUpdate(F)V

    .line 306
    invoke-direct {p0, p1}, Lorg/anddev/andengine/entity/scene/Scene;->updateLayers(F)V

    .line 309
    :cond_1
    if-eqz v0, :cond_2

    .line 310
    invoke-virtual {v0, p1}, Lorg/anddev/andengine/entity/scene/Scene;->onUpdate(F)V

    .line 312
    :cond_2
    return-void
.end method

.method public onSceneTouchEvent(Lorg/anddev/andengine/input/touch/TouchEvent;)Z
    .locals 27
    .parameter "pSceneTouchEvent"

    .prologue
    .line 315
    invoke-virtual/range {p1 .. p1}, Lorg/anddev/andengine/input/touch/TouchEvent;->getAction()I

    move-result v5

    .line 316
    .local v5, action:I
    if-nez v5, :cond_0

    const/4 v11, 0x1

    .line 318
    .local v11, isDownAction:Z
    :goto_0
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lorg/anddev/andengine/entity/scene/Scene;->mTouchAreaBindingEnabled:Z

    move/from16 v25, v0

    if-eqz v25, :cond_1

    if-nez v11, :cond_1

    .line 319
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/anddev/andengine/entity/scene/Scene;->mTouchAreaBindings:Landroid/util/SparseArray;

    move-object/from16 v22, v0

    .line 320
    .local v22, touchAreaBindings:Landroid/util/SparseArray;,"Landroid/util/SparseArray<Lorg/anddev/andengine/entity/scene/Scene$ITouchArea;>;"
    invoke-virtual/range {p1 .. p1}, Lorg/anddev/andengine/input/touch/TouchEvent;->getPointerID()I

    move-result v25

    move-object/from16 v0, v22

    move/from16 v1, v25

    invoke-virtual {v0, v1}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lorg/anddev/andengine/entity/scene/Scene$ITouchArea;

    .line 323
    .local v6, boundTouchArea:Lorg/anddev/andengine/entity/scene/Scene$ITouchArea;
    if-eqz v6, :cond_1

    .line 324
    invoke-virtual/range {p1 .. p1}, Lorg/anddev/andengine/input/touch/TouchEvent;->getX()F

    move-result v19

    .line 325
    .local v19, sceneTouchEventX:F
    invoke-virtual/range {p1 .. p1}, Lorg/anddev/andengine/input/touch/TouchEvent;->getY()F

    move-result v20

    .line 328
    .local v20, sceneTouchEventY:F
    packed-switch v5, :pswitch_data_0

    .line 333
    :goto_1
    :pswitch_0
    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move/from16 v2, v19

    move/from16 v3, v20

    invoke-direct {v0, v1, v2, v3, v6}, Lorg/anddev/andengine/entity/scene/Scene;->onAreaTouchEvent(Lorg/anddev/andengine/input/touch/TouchEvent;FFLorg/anddev/andengine/entity/scene/Scene$ITouchArea;)Ljava/lang/Boolean;

    move-result-object v8

    .line 334
    .local v8, handled:Ljava/lang/Boolean;
    if-eqz v8, :cond_1

    invoke-virtual {v8}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v25

    if-eqz v25, :cond_1

    .line 335
    const/16 v25, 0x1

    .line 443
    .end local v6           #boundTouchArea:Lorg/anddev/andengine/entity/scene/Scene$ITouchArea;
    .end local v8           #handled:Ljava/lang/Boolean;
    .end local v19           #sceneTouchEventX:F
    .end local v20           #sceneTouchEventY:F
    .end local v22           #touchAreaBindings:Landroid/util/SparseArray;,"Landroid/util/SparseArray<Lorg/anddev/andengine/entity/scene/Scene$ITouchArea;>;"
    :goto_2
    return v25

    .line 316
    .end local v11           #isDownAction:Z
    :cond_0
    const/4 v11, 0x0

    goto :goto_0

    .line 331
    .restart local v6       #boundTouchArea:Lorg/anddev/andengine/entity/scene/Scene$ITouchArea;
    .restart local v11       #isDownAction:Z
    .restart local v19       #sceneTouchEventX:F
    .restart local v20       #sceneTouchEventY:F
    .restart local v22       #touchAreaBindings:Landroid/util/SparseArray;,"Landroid/util/SparseArray<Lorg/anddev/andengine/entity/scene/Scene$ITouchArea;>;"
    :pswitch_1
    invoke-virtual/range {p1 .. p1}, Lorg/anddev/andengine/input/touch/TouchEvent;->getPointerID()I

    move-result v25

    move-object/from16 v0, v22

    move/from16 v1, v25

    invoke-virtual {v0, v1}, Landroid/util/SparseArray;->remove(I)V

    goto :goto_1

    .line 340
    .end local v6           #boundTouchArea:Lorg/anddev/andengine/entity/scene/Scene$ITouchArea;
    .end local v19           #sceneTouchEventX:F
    .end local v20           #sceneTouchEventY:F
    .end local v22           #touchAreaBindings:Landroid/util/SparseArray;,"Landroid/util/SparseArray<Lorg/anddev/andengine/entity/scene/Scene$ITouchArea;>;"
    :cond_1
    move-object/from16 v0, p0

    iget-object v7, v0, Lorg/anddev/andengine/entity/scene/Scene;->mChildScene:Lorg/anddev/andengine/entity/scene/Scene;

    .line 341
    .local v7, childScene:Lorg/anddev/andengine/entity/scene/Scene;
    if-eqz v7, :cond_3

    .line 342
    invoke-virtual/range {p0 .. p1}, Lorg/anddev/andengine/entity/scene/Scene;->onChildSceneTouchEvent(Lorg/anddev/andengine/input/touch/TouchEvent;)Z

    move-result v9

    .line 343
    .local v9, handledByChild:Z
    if-eqz v9, :cond_2

    .line 344
    const/16 v25, 0x1

    goto :goto_2

    .line 345
    :cond_2
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lorg/anddev/andengine/entity/scene/Scene;->mChildSceneModalTouch:Z

    move/from16 v25, v0

    if-eqz v25, :cond_3

    .line 346
    const/16 v25, 0x0

    goto :goto_2

    .line 350
    .end local v9           #handledByChild:Z
    :cond_3
    invoke-virtual/range {p1 .. p1}, Lorg/anddev/andengine/input/touch/TouchEvent;->getX()F

    move-result v19

    .line 351
    .restart local v19       #sceneTouchEventX:F
    invoke-virtual/range {p1 .. p1}, Lorg/anddev/andengine/input/touch/TouchEvent;->getY()F

    move-result v20

    .line 355
    .restart local v20       #sceneTouchEventY:F
    move-object/from16 v0, p0

    iget v14, v0, Lorg/anddev/andengine/entity/scene/Scene;->mLayerCount:I

    .line 356
    .local v14, layerCount:I
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/anddev/andengine/entity/scene/Scene;->mLayers:[Lorg/anddev/andengine/entity/layer/ILayer;

    move-object/from16 v18, v0

    .line 357
    .local v18, layers:[Lorg/anddev/andengine/entity/layer/ILayer;
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lorg/anddev/andengine/entity/scene/Scene;->mOnAreaTouchTraversalBackToFront:Z

    move/from16 v25, v0

    if-eqz v25, :cond_b

    .line 358
    const/4 v10, 0x0

    .local v10, i:I
    :goto_3
    if-lt v10, v14, :cond_6

    .line 404
    :cond_4
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/anddev/andengine/entity/scene/Scene;->mTouchAreas:Ljava/util/ArrayList;

    move-object/from16 v24, v0

    .line 405
    .local v24, touchAreas:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lorg/anddev/andengine/entity/scene/Scene$ITouchArea;>;"
    invoke-virtual/range {v24 .. v24}, Ljava/util/ArrayList;->size()I

    move-result v23

    .line 406
    .local v23, touchAreaCount:I
    if-lez v23, :cond_5

    .line 407
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lorg/anddev/andengine/entity/scene/Scene;->mOnAreaTouchTraversalBackToFront:Z

    move/from16 v25, v0

    if-eqz v25, :cond_13

    .line 408
    const/4 v10, 0x0

    :goto_4
    move/from16 v0, v23

    if-lt v10, v0, :cond_10

    .line 440
    :cond_5
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/anddev/andengine/entity/scene/Scene;->mOnSceneTouchListener:Lorg/anddev/andengine/entity/scene/Scene$IOnSceneTouchListener;

    move-object/from16 v25, v0

    if-eqz v25, :cond_16

    .line 441
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/anddev/andengine/entity/scene/Scene;->mOnSceneTouchListener:Lorg/anddev/andengine/entity/scene/Scene$IOnSceneTouchListener;

    move-object/from16 v25, v0

    move-object/from16 v0, v25

    move-object/from16 v1, p0

    move-object/from16 v2, p1

    invoke-interface {v0, v1, v2}, Lorg/anddev/andengine/entity/scene/Scene$IOnSceneTouchListener;->onSceneTouchEvent(Lorg/anddev/andengine/entity/scene/Scene;Lorg/anddev/andengine/input/touch/TouchEvent;)Z

    move-result v25

    goto :goto_2

    .line 359
    .end local v23           #touchAreaCount:I
    .end local v24           #touchAreas:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lorg/anddev/andengine/entity/scene/Scene$ITouchArea;>;"
    :cond_6
    aget-object v13, v18, v10

    .line 360
    .local v13, layer:Lorg/anddev/andengine/entity/layer/ILayer;
    invoke-interface {v13}, Lorg/anddev/andengine/entity/layer/ILayer;->getTouchAreas()Ljava/util/ArrayList;

    move-result-object v17

    .line 361
    .local v17, layerTouchAreas:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lorg/anddev/andengine/entity/scene/Scene$ITouchArea;>;"
    invoke-virtual/range {v17 .. v17}, Ljava/util/ArrayList;->size()I

    move-result v16

    .line 362
    .local v16, layerTouchAreaCount:I
    if-lez v16, :cond_7

    .line 363
    const/4 v12, 0x0

    .local v12, j:I
    :goto_5
    move/from16 v0, v16

    if-lt v12, v0, :cond_8

    .line 358
    .end local v12           #j:I
    :cond_7
    add-int/lit8 v10, v10, 0x1

    goto :goto_3

    .line 364
    .restart local v12       #j:I
    :cond_8
    move-object/from16 v0, v17

    invoke-virtual {v0, v12}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v15

    check-cast v15, Lorg/anddev/andengine/entity/scene/Scene$ITouchArea;

    .line 365
    .local v15, layerTouchArea:Lorg/anddev/andengine/entity/scene/Scene$ITouchArea;
    move/from16 v0, v19

    move/from16 v1, v20

    invoke-interface {v15, v0, v1}, Lorg/anddev/andengine/entity/scene/Scene$ITouchArea;->contains(FF)Z

    move-result v25

    if-eqz v25, :cond_a

    .line 366
    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move/from16 v2, v19

    move/from16 v3, v20

    invoke-direct {v0, v1, v2, v3, v15}, Lorg/anddev/andengine/entity/scene/Scene;->onAreaTouchEvent(Lorg/anddev/andengine/input/touch/TouchEvent;FFLorg/anddev/andengine/entity/scene/Scene$ITouchArea;)Ljava/lang/Boolean;

    move-result-object v8

    .line 367
    .restart local v8       #handled:Ljava/lang/Boolean;
    if-eqz v8, :cond_a

    invoke-virtual {v8}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v25

    if-eqz v25, :cond_a

    .line 370
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lorg/anddev/andengine/entity/scene/Scene;->mTouchAreaBindingEnabled:Z

    move/from16 v25, v0

    if-eqz v25, :cond_9

    if-eqz v11, :cond_9

    .line 371
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/anddev/andengine/entity/scene/Scene;->mTouchAreaBindings:Landroid/util/SparseArray;

    move-object/from16 v25, v0

    invoke-virtual/range {p1 .. p1}, Lorg/anddev/andengine/input/touch/TouchEvent;->getPointerID()I

    move-result v26

    move-object/from16 v0, v25

    move/from16 v1, v26

    invoke-virtual {v0, v1, v15}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 373
    :cond_9
    const/16 v25, 0x1

    goto/16 :goto_2

    .line 363
    .end local v8           #handled:Ljava/lang/Boolean;
    :cond_a
    add-int/lit8 v12, v12, 0x1

    goto :goto_5

    .line 380
    .end local v10           #i:I
    .end local v12           #j:I
    .end local v13           #layer:Lorg/anddev/andengine/entity/layer/ILayer;
    .end local v15           #layerTouchArea:Lorg/anddev/andengine/entity/scene/Scene$ITouchArea;
    .end local v16           #layerTouchAreaCount:I
    .end local v17           #layerTouchAreas:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lorg/anddev/andengine/entity/scene/Scene$ITouchArea;>;"
    :cond_b
    add-int/lit8 v10, v14, -0x1

    .restart local v10       #i:I
    :goto_6
    if-ltz v10, :cond_4

    .line 381
    aget-object v13, v18, v10

    .line 382
    .restart local v13       #layer:Lorg/anddev/andengine/entity/layer/ILayer;
    invoke-interface {v13}, Lorg/anddev/andengine/entity/layer/ILayer;->getTouchAreas()Ljava/util/ArrayList;

    move-result-object v17

    .line 383
    .restart local v17       #layerTouchAreas:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lorg/anddev/andengine/entity/scene/Scene$ITouchArea;>;"
    invoke-virtual/range {v17 .. v17}, Ljava/util/ArrayList;->size()I

    move-result v16

    .line 384
    .restart local v16       #layerTouchAreaCount:I
    if-lez v16, :cond_c

    .line 385
    add-int/lit8 v12, v16, -0x1

    .restart local v12       #j:I
    :goto_7
    if-gez v12, :cond_d

    .line 380
    .end local v12           #j:I
    :cond_c
    add-int/lit8 v10, v10, -0x1

    goto :goto_6

    .line 386
    .restart local v12       #j:I
    :cond_d
    move-object/from16 v0, v17

    invoke-virtual {v0, v12}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v15

    check-cast v15, Lorg/anddev/andengine/entity/scene/Scene$ITouchArea;

    .line 387
    .restart local v15       #layerTouchArea:Lorg/anddev/andengine/entity/scene/Scene$ITouchArea;
    move/from16 v0, v19

    move/from16 v1, v20

    invoke-interface {v15, v0, v1}, Lorg/anddev/andengine/entity/scene/Scene$ITouchArea;->contains(FF)Z

    move-result v25

    if-eqz v25, :cond_f

    .line 388
    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move/from16 v2, v19

    move/from16 v3, v20

    invoke-direct {v0, v1, v2, v3, v15}, Lorg/anddev/andengine/entity/scene/Scene;->onAreaTouchEvent(Lorg/anddev/andengine/input/touch/TouchEvent;FFLorg/anddev/andengine/entity/scene/Scene$ITouchArea;)Ljava/lang/Boolean;

    move-result-object v8

    .line 389
    .restart local v8       #handled:Ljava/lang/Boolean;
    if-eqz v8, :cond_f

    invoke-virtual {v8}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v25

    if-eqz v25, :cond_f

    .line 392
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lorg/anddev/andengine/entity/scene/Scene;->mTouchAreaBindingEnabled:Z

    move/from16 v25, v0

    if-eqz v25, :cond_e

    if-eqz v11, :cond_e

    .line 393
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/anddev/andengine/entity/scene/Scene;->mTouchAreaBindings:Landroid/util/SparseArray;

    move-object/from16 v25, v0

    invoke-virtual/range {p1 .. p1}, Lorg/anddev/andengine/input/touch/TouchEvent;->getPointerID()I

    move-result v26

    move-object/from16 v0, v25

    move/from16 v1, v26

    invoke-virtual {v0, v1, v15}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 395
    :cond_e
    const/16 v25, 0x1

    goto/16 :goto_2

    .line 385
    .end local v8           #handled:Ljava/lang/Boolean;
    :cond_f
    add-int/lit8 v12, v12, -0x1

    goto :goto_7

    .line 409
    .end local v12           #j:I
    .end local v13           #layer:Lorg/anddev/andengine/entity/layer/ILayer;
    .end local v15           #layerTouchArea:Lorg/anddev/andengine/entity/scene/Scene$ITouchArea;
    .end local v16           #layerTouchAreaCount:I
    .end local v17           #layerTouchAreas:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lorg/anddev/andengine/entity/scene/Scene$ITouchArea;>;"
    .restart local v23       #touchAreaCount:I
    .restart local v24       #touchAreas:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lorg/anddev/andengine/entity/scene/Scene$ITouchArea;>;"
    :cond_10
    move-object/from16 v0, v24

    invoke-virtual {v0, v10}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v21

    check-cast v21, Lorg/anddev/andengine/entity/scene/Scene$ITouchArea;

    .line 410
    .local v21, touchArea:Lorg/anddev/andengine/entity/scene/Scene$ITouchArea;
    move-object/from16 v0, v21

    move/from16 v1, v19

    move/from16 v2, v20

    invoke-interface {v0, v1, v2}, Lorg/anddev/andengine/entity/scene/Scene$ITouchArea;->contains(FF)Z

    move-result v25

    if-eqz v25, :cond_12

    .line 411
    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move/from16 v2, v19

    move/from16 v3, v20

    move-object/from16 v4, v21

    invoke-direct {v0, v1, v2, v3, v4}, Lorg/anddev/andengine/entity/scene/Scene;->onAreaTouchEvent(Lorg/anddev/andengine/input/touch/TouchEvent;FFLorg/anddev/andengine/entity/scene/Scene$ITouchArea;)Ljava/lang/Boolean;

    move-result-object v8

    .line 412
    .restart local v8       #handled:Ljava/lang/Boolean;
    if-eqz v8, :cond_12

    invoke-virtual {v8}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v25

    if-eqz v25, :cond_12

    .line 415
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lorg/anddev/andengine/entity/scene/Scene;->mTouchAreaBindingEnabled:Z

    move/from16 v25, v0

    if-eqz v25, :cond_11

    if-eqz v11, :cond_11

    .line 416
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/anddev/andengine/entity/scene/Scene;->mTouchAreaBindings:Landroid/util/SparseArray;

    move-object/from16 v25, v0

    invoke-virtual/range {p1 .. p1}, Lorg/anddev/andengine/input/touch/TouchEvent;->getPointerID()I

    move-result v26

    move-object/from16 v0, v25

    move/from16 v1, v26

    move-object/from16 v2, v21

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 418
    :cond_11
    const/16 v25, 0x1

    goto/16 :goto_2

    .line 408
    .end local v8           #handled:Ljava/lang/Boolean;
    :cond_12
    add-int/lit8 v10, v10, 0x1

    goto/16 :goto_4

    .line 423
    .end local v21           #touchArea:Lorg/anddev/andengine/entity/scene/Scene$ITouchArea;
    :cond_13
    add-int/lit8 v10, v23, -0x1

    :goto_8
    if-ltz v10, :cond_5

    .line 424
    move-object/from16 v0, v24

    invoke-virtual {v0, v10}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v21

    check-cast v21, Lorg/anddev/andengine/entity/scene/Scene$ITouchArea;

    .line 425
    .restart local v21       #touchArea:Lorg/anddev/andengine/entity/scene/Scene$ITouchArea;
    move-object/from16 v0, v21

    move/from16 v1, v19

    move/from16 v2, v20

    invoke-interface {v0, v1, v2}, Lorg/anddev/andengine/entity/scene/Scene$ITouchArea;->contains(FF)Z

    move-result v25

    if-eqz v25, :cond_15

    .line 426
    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move/from16 v2, v19

    move/from16 v3, v20

    move-object/from16 v4, v21

    invoke-direct {v0, v1, v2, v3, v4}, Lorg/anddev/andengine/entity/scene/Scene;->onAreaTouchEvent(Lorg/anddev/andengine/input/touch/TouchEvent;FFLorg/anddev/andengine/entity/scene/Scene$ITouchArea;)Ljava/lang/Boolean;

    move-result-object v8

    .line 427
    .restart local v8       #handled:Ljava/lang/Boolean;
    if-eqz v8, :cond_15

    invoke-virtual {v8}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v25

    if-eqz v25, :cond_15

    .line 430
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lorg/anddev/andengine/entity/scene/Scene;->mTouchAreaBindingEnabled:Z

    move/from16 v25, v0

    if-eqz v25, :cond_14

    if-eqz v11, :cond_14

    .line 431
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/anddev/andengine/entity/scene/Scene;->mTouchAreaBindings:Landroid/util/SparseArray;

    move-object/from16 v25, v0

    invoke-virtual/range {p1 .. p1}, Lorg/anddev/andengine/input/touch/TouchEvent;->getPointerID()I

    move-result v26

    move-object/from16 v0, v25

    move/from16 v1, v26

    move-object/from16 v2, v21

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 433
    :cond_14
    const/16 v25, 0x1

    goto/16 :goto_2

    .line 423
    .end local v8           #handled:Ljava/lang/Boolean;
    :cond_15
    add-int/lit8 v10, v10, -0x1

    goto :goto_8

    .line 443
    .end local v21           #touchArea:Lorg/anddev/andengine/entity/scene/Scene$ITouchArea;
    :cond_16
    const/16 v25, 0x0

    goto/16 :goto_2

    .line 328
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_1
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method

.method public postRunnable(Ljava/lang/Runnable;)V
    .locals 1
    .parameter "pRunnable"

    .prologue
    .line 483
    iget-object v0, p0, Lorg/anddev/andengine/entity/scene/Scene;->mRunnableHandler:Lorg/anddev/andengine/engine/handler/runnable/RunnableHandler;

    invoke-virtual {v0, p1}, Lorg/anddev/andengine/engine/handler/runnable/RunnableHandler;->postRunnable(Ljava/lang/Runnable;)V

    .line 484
    return-void
.end method

.method public registerTouchArea(Lorg/anddev/andengine/entity/scene/Scene$ITouchArea;)V
    .locals 1
    .parameter "pTouchArea"

    .prologue
    .line 166
    iget-object v0, p0, Lorg/anddev/andengine/entity/scene/Scene;->mTouchAreas:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 167
    return-void
.end method

.method public registerUpdateHandler(Lorg/anddev/andengine/engine/handler/IUpdateHandler;)V
    .locals 1
    .parameter "pUpdateHandler"

    .prologue
    .line 178
    iget-object v0, p0, Lorg/anddev/andengine/entity/scene/Scene;->mUpdateHandlers:Lorg/anddev/andengine/engine/handler/UpdateHandlerList;

    invoke-virtual {v0, p1}, Lorg/anddev/andengine/engine/handler/UpdateHandlerList;->add(Ljava/lang/Object;)Z

    .line 179
    return-void
.end method

.method public replaceLayer(ILorg/anddev/andengine/entity/layer/ILayer;)Lorg/anddev/andengine/entity/layer/ILayer;
    .locals 2
    .parameter "pLayerIndex"
    .parameter "pLayer"

    .prologue
    .line 140
    iget-object v0, p0, Lorg/anddev/andengine/entity/scene/Scene;->mLayers:[Lorg/anddev/andengine/entity/layer/ILayer;

    .line 141
    .local v0, layers:[Lorg/anddev/andengine/entity/layer/ILayer;
    aget-object v1, v0, p1

    .line 142
    .local v1, oldLayer:Lorg/anddev/andengine/entity/layer/ILayer;
    aput-object p2, v0, p1

    .line 143
    return-object v1
.end method

.method public reset()V
    .locals 3

    .prologue
    .line 468
    invoke-super {p0}, Lorg/anddev/andengine/entity/Entity;->reset()V

    .line 470
    invoke-virtual {p0}, Lorg/anddev/andengine/entity/scene/Scene;->clearChildScene()V

    .line 472
    iget-object v1, p0, Lorg/anddev/andengine/entity/scene/Scene;->mLayers:[Lorg/anddev/andengine/entity/layer/ILayer;

    .line 473
    .local v1, layers:[Lorg/anddev/andengine/entity/layer/ILayer;
    iget v2, p0, Lorg/anddev/andengine/entity/scene/Scene;->mLayerCount:I

    add-int/lit8 v0, v2, -0x1

    .local v0, i:I
    :goto_0
    if-gez v0, :cond_0

    .line 476
    return-void

    .line 474
    :cond_0
    aget-object v2, v1, v0

    invoke-interface {v2}, Lorg/anddev/andengine/entity/layer/ILayer;->reset()V

    .line 473
    add-int/lit8 v0, v0, -0x1

    goto :goto_0
.end method

.method public setBackground(Lorg/anddev/andengine/entity/scene/background/IBackground;)V
    .locals 0
    .parameter "pBackground"

    .prologue
    .line 102
    iput-object p1, p0, Lorg/anddev/andengine/entity/scene/Scene;->mBackground:Lorg/anddev/andengine/entity/scene/background/IBackground;

    .line 103
    return-void
.end method

.method public setBackgroundEnabled(Z)V
    .locals 0
    .parameter "pEnabled"

    .prologue
    .line 158
    iput-boolean p1, p0, Lorg/anddev/andengine/entity/scene/Scene;->mBackgroundEnabled:Z

    .line 159
    return-void
.end method

.method public setChildScene(Lorg/anddev/andengine/entity/scene/Scene;)V
    .locals 1
    .parameter "pChildScene"

    .prologue
    const/4 v0, 0x0

    .line 226
    invoke-virtual {p0, p1, v0, v0, v0}, Lorg/anddev/andengine/entity/scene/Scene;->setChildScene(Lorg/anddev/andengine/entity/scene/Scene;ZZZ)V

    .line 227
    return-void
.end method

.method public setChildScene(Lorg/anddev/andengine/entity/scene/Scene;ZZZ)V
    .locals 0
    .parameter "pChildScene"
    .parameter "pModalDraw"
    .parameter "pModalUpdate"
    .parameter "pModalTouch"

    .prologue
    .line 230
    invoke-direct {p1, p0}, Lorg/anddev/andengine/entity/scene/Scene;->setParentScene(Lorg/anddev/andengine/entity/scene/Scene;)V

    .line 231
    iput-object p1, p0, Lorg/anddev/andengine/entity/scene/Scene;->mChildScene:Lorg/anddev/andengine/entity/scene/Scene;

    .line 232
    iput-boolean p2, p0, Lorg/anddev/andengine/entity/scene/Scene;->mChildSceneModalDraw:Z

    .line 233
    iput-boolean p3, p0, Lorg/anddev/andengine/entity/scene/Scene;->mChildSceneModalUpdate:Z

    .line 234
    iput-boolean p4, p0, Lorg/anddev/andengine/entity/scene/Scene;->mChildSceneModalTouch:Z

    .line 235
    return-void
.end method

.method public setChildSceneModal(Lorg/anddev/andengine/entity/scene/Scene;)V
    .locals 1
    .parameter "pChildScene"

    .prologue
    const/4 v0, 0x1

    .line 222
    invoke-virtual {p0, p1, v0, v0, v0}, Lorg/anddev/andengine/entity/scene/Scene;->setChildScene(Lorg/anddev/andengine/entity/scene/Scene;ZZZ)V

    .line 223
    return-void
.end method

.method public setLayer(ILorg/anddev/andengine/entity/layer/ILayer;)V
    .locals 1
    .parameter "pLayerIndex"
    .parameter "pLayer"

    .prologue
    .line 122
    iget-object v0, p0, Lorg/anddev/andengine/entity/scene/Scene;->mLayers:[Lorg/anddev/andengine/entity/layer/ILayer;

    aput-object p2, v0, p1

    .line 123
    return-void
.end method

.method public setOnAreaTouchListener(Lorg/anddev/andengine/entity/scene/Scene$IOnAreaTouchListener;)V
    .locals 0
    .parameter "pOnAreaTouchListener"

    .prologue
    .line 198
    iput-object p1, p0, Lorg/anddev/andengine/entity/scene/Scene;->mOnAreaTouchListener:Lorg/anddev/andengine/entity/scene/Scene$IOnAreaTouchListener;

    .line 199
    return-void
.end method

.method public setOnAreaTouchTraversalBackToFront()V
    .locals 1

    .prologue
    .line 242
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/anddev/andengine/entity/scene/Scene;->mOnAreaTouchTraversalBackToFront:Z

    .line 243
    return-void
.end method

.method public setOnAreaTouchTraversalFrontToBack()V
    .locals 1

    .prologue
    .line 246
    const/4 v0, 0x0

    iput-boolean v0, p0, Lorg/anddev/andengine/entity/scene/Scene;->mOnAreaTouchTraversalBackToFront:Z

    .line 247
    return-void
.end method

.method public setOnSceneTouchListener(Lorg/anddev/andengine/entity/scene/Scene$IOnSceneTouchListener;)V
    .locals 0
    .parameter "pOnSceneTouchListener"

    .prologue
    .line 186
    iput-object p1, p0, Lorg/anddev/andengine/entity/scene/Scene;->mOnSceneTouchListener:Lorg/anddev/andengine/entity/scene/Scene$IOnSceneTouchListener;

    .line 187
    return-void
.end method

.method public setTouchAreaBindingEnabled(Z)V
    .locals 1
    .parameter "pTouchAreaBindingEnabled"

    .prologue
    .line 261
    iput-boolean p1, p0, Lorg/anddev/andengine/entity/scene/Scene;->mTouchAreaBindingEnabled:Z

    .line 262
    iget-boolean v0, p0, Lorg/anddev/andengine/entity/scene/Scene;->mTouchAreaBindingEnabled:Z

    if-nez v0, :cond_0

    .line 263
    iget-object v0, p0, Lorg/anddev/andengine/entity/scene/Scene;->mTouchAreaBindings:Landroid/util/SparseArray;

    invoke-virtual {v0}, Landroid/util/SparseArray;->clear()V

    .line 265
    :cond_0
    return-void
.end method

.method public sortLayers()V
    .locals 2

    .prologue
    .line 150
    invoke-static {}, Lorg/anddev/andengine/entity/layer/ZIndexSorter;->getInstance()Lorg/anddev/andengine/entity/layer/ZIndexSorter;

    move-result-object v0

    iget-object v1, p0, Lorg/anddev/andengine/entity/scene/Scene;->mLayers:[Lorg/anddev/andengine/entity/layer/ILayer;

    invoke-virtual {v0, v1}, Lorg/anddev/andengine/entity/layer/ZIndexSorter;->sort([Lorg/anddev/andengine/entity/IEntity;)V

    .line 151
    return-void
.end method

.method public swapLayers(II)V
    .locals 3
    .parameter "pLayerIndexA"
    .parameter "pLayerIndexB"

    .prologue
    .line 126
    iget-object v0, p0, Lorg/anddev/andengine/entity/scene/Scene;->mLayers:[Lorg/anddev/andengine/entity/layer/ILayer;

    .line 127
    .local v0, layers:[Lorg/anddev/andengine/entity/layer/ILayer;
    aget-object v1, v0, p1

    .line 128
    .local v1, tmp:Lorg/anddev/andengine/entity/layer/ILayer;
    aget-object v2, v0, p2

    aput-object v2, v0, p1

    .line 129
    aput-object v1, v0, p2

    .line 130
    return-void
.end method

.method public unregisterTouchArea(Lorg/anddev/andengine/entity/scene/Scene$ITouchArea;)V
    .locals 1
    .parameter "pTouchArea"

    .prologue
    .line 170
    iget-object v0, p0, Lorg/anddev/andengine/entity/scene/Scene;->mTouchAreas:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    .line 171
    return-void
.end method

.method public unregisterUpdateHandler(Lorg/anddev/andengine/engine/handler/IUpdateHandler;)V
    .locals 1
    .parameter "pUpdateHandler"

    .prologue
    .line 182
    iget-object v0, p0, Lorg/anddev/andengine/entity/scene/Scene;->mUpdateHandlers:Lorg/anddev/andengine/engine/handler/UpdateHandlerList;

    invoke-virtual {v0, p1}, Lorg/anddev/andengine/engine/handler/UpdateHandlerList;->remove(Ljava/lang/Object;)Z

    .line 183
    return-void
.end method
