.class final Lorg/anddev/andengine/input/touch/TouchEvent$TouchEventPool;
.super Lorg/anddev/andengine/util/pool/GenericPool;
.source "TouchEvent.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/anddev/andengine/input/touch/TouchEvent;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "TouchEventPool"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lorg/anddev/andengine/util/pool/GenericPool",
        "<",
        "Lorg/anddev/andengine/input/touch/TouchEvent;",
        ">;"
    }
.end annotation


# direct methods
.method private constructor <init>()V
    .locals 0

    .prologue
    .line 114
    invoke-direct {p0}, Lorg/anddev/andengine/util/pool/GenericPool;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lorg/anddev/andengine/input/touch/TouchEvent$TouchEventPool;)V
    .locals 0
    .parameter

    .prologue
    .line 114
    invoke-direct {p0}, Lorg/anddev/andengine/input/touch/TouchEvent$TouchEventPool;-><init>()V

    return-void
.end method


# virtual methods
.method protected bridge synthetic onAllocatePoolItem()Ljava/lang/Object;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0}, Lorg/anddev/andengine/input/touch/TouchEvent$TouchEventPool;->onAllocatePoolItem()Lorg/anddev/andengine/input/touch/TouchEvent;

    move-result-object v0

    return-object v0
.end method

.method protected onAllocatePoolItem()Lorg/anddev/andengine/input/touch/TouchEvent;
    .locals 1

    .prologue
    .line 121
    new-instance v0, Lorg/anddev/andengine/input/touch/TouchEvent;

    invoke-direct {v0}, Lorg/anddev/andengine/input/touch/TouchEvent;-><init>()V

    return-object v0
.end method
