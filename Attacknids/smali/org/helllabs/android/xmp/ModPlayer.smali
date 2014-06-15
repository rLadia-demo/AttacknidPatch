.class public Lorg/helllabs/android/xmp/ModPlayer;
.super Ljava/lang/Object;
.source "ModPlayer.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/helllabs/android/xmp/ModPlayer$PlayRunnable;
    }
.end annotation


# static fields
.field private static instance:Lorg/helllabs/android/xmp/ModPlayer;


# instance fields
.field private audio:Landroid/media/AudioTrack;

.field private minSize:I

.field protected paused:Z

.field private playThread:Ljava/lang/Thread;

.field private xmp:Lorg/helllabs/android/xmp/Xmp;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 9
    const/4 v0, 0x0

    sput-object v0, Lorg/helllabs/android/xmp/ModPlayer;->instance:Lorg/helllabs/android/xmp/ModPlayer;

    .line 8
    return-void
.end method

.method protected constructor <init>()V
    .locals 7

    .prologue
    const v2, 0xac44

    const/16 v5, 0x1000

    const/4 v4, 0x2

    const/4 v1, 0x3

    .line 23
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 10
    new-instance v0, Lorg/helllabs/android/xmp/Xmp;

    invoke-direct {v0}, Lorg/helllabs/android/xmp/Xmp;-><init>()V

    iput-object v0, p0, Lorg/helllabs/android/xmp/ModPlayer;->xmp:Lorg/helllabs/android/xmp/Xmp;

    .line 13
    invoke-static {v2, v1, v4}, Landroid/media/AudioTrack;->getMinBufferSize(III)I

    move-result v0

    iput v0, p0, Lorg/helllabs/android/xmp/ModPlayer;->minSize:I

    .line 14
    new-instance v0, Landroid/media/AudioTrack;

    .line 18
    iget v3, p0, Lorg/helllabs/android/xmp/ModPlayer;->minSize:I

    if-ge v3, v5, :cond_0

    .line 19
    :goto_0
    const/4 v6, 0x1

    move v3, v1

    invoke-direct/range {v0 .. v6}, Landroid/media/AudioTrack;-><init>(IIIIII)V

    iput-object v0, p0, Lorg/helllabs/android/xmp/ModPlayer;->audio:Landroid/media/AudioTrack;

    .line 25
    return-void

    .line 18
    :cond_0
    iget v5, p0, Lorg/helllabs/android/xmp/ModPlayer;->minSize:I

    goto :goto_0
.end method

.method static synthetic access$0(Lorg/helllabs/android/xmp/ModPlayer;)I
    .locals 1
    .parameter

    .prologue
    .line 11
    iget v0, p0, Lorg/helllabs/android/xmp/ModPlayer;->minSize:I

    return v0
.end method

.method static synthetic access$1(Lorg/helllabs/android/xmp/ModPlayer;)Lorg/helllabs/android/xmp/Xmp;
    .locals 1
    .parameter

    .prologue
    .line 10
    iget-object v0, p0, Lorg/helllabs/android/xmp/ModPlayer;->xmp:Lorg/helllabs/android/xmp/Xmp;

    return-object v0
.end method

.method static synthetic access$2(Lorg/helllabs/android/xmp/ModPlayer;)Landroid/media/AudioTrack;
    .locals 1
    .parameter

    .prologue
    .line 14
    iget-object v0, p0, Lorg/helllabs/android/xmp/ModPlayer;->audio:Landroid/media/AudioTrack;

    return-object v0
.end method

.method public static getInstance()Lorg/helllabs/android/xmp/ModPlayer;
    .locals 2

    .prologue
    .line 28
    sget-object v0, Lorg/helllabs/android/xmp/ModPlayer;->instance:Lorg/helllabs/android/xmp/ModPlayer;

    if-nez v0, :cond_0

    .line 29
    new-instance v0, Lorg/helllabs/android/xmp/ModPlayer;

    invoke-direct {v0}, Lorg/helllabs/android/xmp/ModPlayer;-><init>()V

    sput-object v0, Lorg/helllabs/android/xmp/ModPlayer;->instance:Lorg/helllabs/android/xmp/ModPlayer;

    .line 30
    sget-object v0, Lorg/helllabs/android/xmp/ModPlayer;->instance:Lorg/helllabs/android/xmp/ModPlayer;

    iget-object v0, v0, Lorg/helllabs/android/xmp/ModPlayer;->xmp:Lorg/helllabs/android/xmp/Xmp;

    invoke-virtual {v0}, Lorg/helllabs/android/xmp/Xmp;->init()I

    .line 31
    sget-object v0, Lorg/helllabs/android/xmp/ModPlayer;->instance:Lorg/helllabs/android/xmp/ModPlayer;

    const/4 v1, 0x0

    iput-boolean v1, v0, Lorg/helllabs/android/xmp/ModPlayer;->paused:Z

    .line 33
    :cond_0
    sget-object v0, Lorg/helllabs/android/xmp/ModPlayer;->instance:Lorg/helllabs/android/xmp/ModPlayer;

    return-object v0
.end method


# virtual methods
.method protected finalize()V
    .locals 1

    .prologue
    .line 61
    iget-object v0, p0, Lorg/helllabs/android/xmp/ModPlayer;->xmp:Lorg/helllabs/android/xmp/Xmp;

    invoke-virtual {v0}, Lorg/helllabs/android/xmp/Xmp;->stopModule()I

    .line 62
    const/4 v0, 0x0

    iput-boolean v0, p0, Lorg/helllabs/android/xmp/ModPlayer;->paused:Z

    .line 64
    :try_start_0
    iget-object v0, p0, Lorg/helllabs/android/xmp/ModPlayer;->playThread:Ljava/lang/Thread;

    invoke-virtual {v0}, Ljava/lang/Thread;->join()V
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    .line 67
    :goto_0
    iget-object v0, p0, Lorg/helllabs/android/xmp/ModPlayer;->xmp:Lorg/helllabs/android/xmp/Xmp;

    invoke-virtual {v0}, Lorg/helllabs/android/xmp/Xmp;->deinit()I

    .line 68
    return-void

    .line 65
    :catch_0
    move-exception v0

    goto :goto_0
.end method

.method public getPlayBpm()I
    .locals 1

    .prologue
    .line 104
    iget-object v0, p0, Lorg/helllabs/android/xmp/ModPlayer;->xmp:Lorg/helllabs/android/xmp/Xmp;

    invoke-virtual {v0}, Lorg/helllabs/android/xmp/Xmp;->getPlayBpm()I

    move-result v0

    return v0
.end method

.method public getPlayPat()I
    .locals 1

    .prologue
    .line 112
    iget-object v0, p0, Lorg/helllabs/android/xmp/ModPlayer;->xmp:Lorg/helllabs/android/xmp/Xmp;

    invoke-virtual {v0}, Lorg/helllabs/android/xmp/Xmp;->getPlayPat()I

    move-result v0

    return v0
.end method

.method public getPlayPos()I
    .locals 1

    .prologue
    .line 108
    iget-object v0, p0, Lorg/helllabs/android/xmp/ModPlayer;->xmp:Lorg/helllabs/android/xmp/Xmp;

    invoke-virtual {v0}, Lorg/helllabs/android/xmp/Xmp;->getPlayPos()I

    move-result v0

    return v0
.end method

.method public getPlayTempo()I
    .locals 1

    .prologue
    .line 100
    iget-object v0, p0, Lorg/helllabs/android/xmp/ModPlayer;->xmp:Lorg/helllabs/android/xmp/Xmp;

    invoke-virtual {v0}, Lorg/helllabs/android/xmp/Xmp;->getPlayTempo()I

    move-result v0

    return v0
.end method

.method public isPaused()Z
    .locals 1

    .prologue
    .line 116
    iget-boolean v0, p0, Lorg/helllabs/android/xmp/ModPlayer;->paused:Z

    return v0
.end method

.method public pause()V
    .locals 1

    .prologue
    .line 88
    iget-boolean v0, p0, Lorg/helllabs/android/xmp/ModPlayer;->paused:Z

    if-eqz v0, :cond_0

    const/4 v0, 0x0

    :goto_0
    iput-boolean v0, p0, Lorg/helllabs/android/xmp/ModPlayer;->paused:Z

    .line 89
    return-void

    .line 88
    :cond_0
    const/4 v0, 0x1

    goto :goto_0
.end method

.method public play(Ljava/lang/String;)V
    .locals 2
    .parameter "file"

    .prologue
    .line 71
    iget-object v1, p0, Lorg/helllabs/android/xmp/ModPlayer;->xmp:Lorg/helllabs/android/xmp/Xmp;

    invoke-virtual {v1, p1}, Lorg/helllabs/android/xmp/Xmp;->loadModule(Ljava/lang/String;)I

    move-result v1

    if-gez v1, :cond_0

    .line 80
    :goto_0
    return-void

    .line 74
    :cond_0
    iget-object v1, p0, Lorg/helllabs/android/xmp/ModPlayer;->audio:Landroid/media/AudioTrack;

    invoke-virtual {v1}, Landroid/media/AudioTrack;->play()V

    .line 75
    iget-object v1, p0, Lorg/helllabs/android/xmp/ModPlayer;->xmp:Lorg/helllabs/android/xmp/Xmp;

    invoke-virtual {v1}, Lorg/helllabs/android/xmp/Xmp;->startPlayer()I

    .line 77
    new-instance v0, Lorg/helllabs/android/xmp/ModPlayer$PlayRunnable;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lorg/helllabs/android/xmp/ModPlayer$PlayRunnable;-><init>(Lorg/helllabs/android/xmp/ModPlayer;Lorg/helllabs/android/xmp/ModPlayer$PlayRunnable;)V

    .line 78
    .local v0, playRunnable:Lorg/helllabs/android/xmp/ModPlayer$PlayRunnable;
    new-instance v1, Ljava/lang/Thread;

    invoke-direct {v1, v0}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    iput-object v1, p0, Lorg/helllabs/android/xmp/ModPlayer;->playThread:Ljava/lang/Thread;

    .line 79
    iget-object v1, p0, Lorg/helllabs/android/xmp/ModPlayer;->playThread:Ljava/lang/Thread;

    invoke-virtual {v1}, Ljava/lang/Thread;->start()V

    goto :goto_0
.end method

.method public seek(I)V
    .locals 1
    .parameter "seconds"

    .prologue
    .line 96
    iget-object v0, p0, Lorg/helllabs/android/xmp/ModPlayer;->xmp:Lorg/helllabs/android/xmp/Xmp;

    invoke-virtual {v0, p1}, Lorg/helllabs/android/xmp/Xmp;->seek(I)I

    .line 97
    return-void
.end method

.method public stop()V
    .locals 1

    .prologue
    .line 83
    iget-object v0, p0, Lorg/helllabs/android/xmp/ModPlayer;->xmp:Lorg/helllabs/android/xmp/Xmp;

    invoke-virtual {v0}, Lorg/helllabs/android/xmp/Xmp;->stopModule()I

    .line 84
    const/4 v0, 0x0

    iput-boolean v0, p0, Lorg/helllabs/android/xmp/ModPlayer;->paused:Z

    .line 85
    return-void
.end method

.method public time()I
    .locals 1

    .prologue
    .line 92
    iget-object v0, p0, Lorg/helllabs/android/xmp/ModPlayer;->xmp:Lorg/helllabs/android/xmp/Xmp;

    invoke-virtual {v0}, Lorg/helllabs/android/xmp/Xmp;->time()I

    move-result v0

    return v0
.end method
