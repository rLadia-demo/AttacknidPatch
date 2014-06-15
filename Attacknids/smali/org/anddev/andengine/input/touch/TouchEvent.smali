.class public Lorg/anddev/andengine/input/touch/TouchEvent;
.super Ljava/lang/Object;
.source "TouchEvent.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/anddev/andengine/input/touch/TouchEvent$TouchEventPool;
    }
.end annotation


# static fields
.field public static final ACTION_CANCEL:I = 0x3

.field public static final ACTION_DOWN:I = 0x0

.field public static final ACTION_MOVE:I = 0x2

.field public static final ACTION_OUTSIDE:I = 0x4

.field public static final ACTION_UP:I = 0x1

.field private static final TOUCHEVENT_POOL:Lorg/anddev/andengine/input/touch/TouchEvent$TouchEventPool;


# instance fields
.field protected mAction:I

.field protected mMotionEvent:Landroid/view/MotionEvent;

.field protected mPointerID:I

.field protected mX:F

.field protected mY:F


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .prologue
    .line 22
    new-instance v0, Lorg/anddev/andengine/input/touch/TouchEvent$TouchEventPool;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lorg/anddev/andengine/input/touch/TouchEvent$TouchEventPool;-><init>(Lorg/anddev/andengine/input/touch/TouchEvent$TouchEventPool;)V

    sput-object v0, Lorg/anddev/andengine/input/touch/TouchEvent;->TOUCHEVENT_POOL:Lorg/anddev/andengine/input/touch/TouchEvent$TouchEventPool;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 11
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static obtain(FFIILandroid/view/MotionEvent;)Lorg/anddev/andengine/input/touch/TouchEvent;
    .locals 6
    .parameter "pX"
    .parameter "pY"
    .parameter "pAction"
    .parameter "pPointerID"
    .parameter "pMotionEvent"

    .prologue
    .line 42
    sget-object v1, Lorg/anddev/andengine/input/touch/TouchEvent;->TOUCHEVENT_POOL:Lorg/anddev/andengine/input/touch/TouchEvent$TouchEventPool;

    invoke-virtual {v1}, Lorg/anddev/andengine/input/touch/TouchEvent$TouchEventPool;->obtainPoolItem()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/anddev/andengine/input/touch/TouchEvent;

    .local v0, touchEvent:Lorg/anddev/andengine/input/touch/TouchEvent;
    move v1, p0

    move v2, p1

    move v3, p2

    move v4, p3

    move-object v5, p4

    .line 43
    invoke-direct/range {v0 .. v5}, Lorg/anddev/andengine/input/touch/TouchEvent;->set(FFIILandroid/view/MotionEvent;)V

    .line 44
    return-object v0
.end method

.method public static recycle(Lorg/anddev/andengine/input/touch/TouchEvent;)V
    .locals 1
    .parameter "pTouchEvent"

    .prologue
    .line 60
    sget-object v0, Lorg/anddev/andengine/input/touch/TouchEvent;->TOUCHEVENT_POOL:Lorg/anddev/andengine/input/touch/TouchEvent$TouchEventPool;

    invoke-virtual {v0, p0}, Lorg/anddev/andengine/input/touch/TouchEvent$TouchEventPool;->recyclePoolItem(Ljava/lang/Object;)V

    .line 61
    return-void
.end method

.method private set(FFIILandroid/view/MotionEvent;)V
    .locals 0
    .parameter "pX"
    .parameter "pY"
    .parameter "pAction"
    .parameter "pPointerID"
    .parameter "pMotionEvent"

    .prologue
    .line 48
    iput p1, p0, Lorg/anddev/andengine/input/touch/TouchEvent;->mX:F

    .line 49
    iput p2, p0, Lorg/anddev/andengine/input/touch/TouchEvent;->mY:F

    .line 50
    iput p3, p0, Lorg/anddev/andengine/input/touch/TouchEvent;->mAction:I

    .line 51
    iput p4, p0, Lorg/anddev/andengine/input/touch/TouchEvent;->mPointerID:I

    .line 52
    iput-object p5, p0, Lorg/anddev/andengine/input/touch/TouchEvent;->mMotionEvent:Landroid/view/MotionEvent;

    .line 53
    return-void
.end method


# virtual methods
.method public getAction()I
    .locals 1

    .prologue
    .line 90
    iget v0, p0, Lorg/anddev/andengine/input/touch/TouchEvent;->mAction:I

    return v0
.end method

.method public getMotionEvent()Landroid/view/MotionEvent;
    .locals 1

    .prologue
    .line 99
    iget-object v0, p0, Lorg/anddev/andengine/input/touch/TouchEvent;->mMotionEvent:Landroid/view/MotionEvent;

    return-object v0
.end method

.method public getPointerID()I
    .locals 1

    .prologue
    .line 86
    iget v0, p0, Lorg/anddev/andengine/input/touch/TouchEvent;->mPointerID:I

    return v0
.end method

.method public getX()F
    .locals 1

    .prologue
    .line 68
    iget v0, p0, Lorg/anddev/andengine/input/touch/TouchEvent;->mX:F

    return v0
.end method

.method public getY()F
    .locals 1

    .prologue
    .line 72
    iget v0, p0, Lorg/anddev/andengine/input/touch/TouchEvent;->mY:F

    return v0
.end method

.method public offset(FF)V
    .locals 1
    .parameter "pDeltaX"
    .parameter "pDeltaY"

    .prologue
    .line 81
    iget v0, p0, Lorg/anddev/andengine/input/touch/TouchEvent;->mX:F

    add-float/2addr v0, p1

    iput v0, p0, Lorg/anddev/andengine/input/touch/TouchEvent;->mX:F

    .line 82
    iget v0, p0, Lorg/anddev/andengine/input/touch/TouchEvent;->mY:F

    add-float/2addr v0, p2

    iput v0, p0, Lorg/anddev/andengine/input/touch/TouchEvent;->mY:F

    .line 83
    return-void
.end method

.method public recycle()V
    .locals 1

    .prologue
    .line 56
    sget-object v0, Lorg/anddev/andengine/input/touch/TouchEvent;->TOUCHEVENT_POOL:Lorg/anddev/andengine/input/touch/TouchEvent$TouchEventPool;

    invoke-virtual {v0, p0}, Lorg/anddev/andengine/input/touch/TouchEvent$TouchEventPool;->recyclePoolItem(Ljava/lang/Object;)V

    .line 57
    return-void
.end method

.method public set(FF)V
    .locals 0
    .parameter "pX"
    .parameter "pY"

    .prologue
    .line 76
    iput p1, p0, Lorg/anddev/andengine/input/touch/TouchEvent;->mX:F

    .line 77
    iput p2, p0, Lorg/anddev/andengine/input/touch/TouchEvent;->mY:F

    .line 78
    return-void
.end method
