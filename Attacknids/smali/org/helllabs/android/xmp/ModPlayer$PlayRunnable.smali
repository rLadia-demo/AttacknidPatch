.class Lorg/helllabs/android/xmp/ModPlayer$PlayRunnable;
.super Ljava/lang/Object;
.source "ModPlayer.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/helllabs/android/xmp/ModPlayer;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "PlayRunnable"
.end annotation


# instance fields
.field final synthetic this$0:Lorg/helllabs/android/xmp/ModPlayer;


# direct methods
.method private constructor <init>(Lorg/helllabs/android/xmp/ModPlayer;)V
    .locals 0
    .parameter

    .prologue
    .line 36
    iput-object p1, p0, Lorg/helllabs/android/xmp/ModPlayer$PlayRunnable;->this$0:Lorg/helllabs/android/xmp/ModPlayer;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lorg/helllabs/android/xmp/ModPlayer;Lorg/helllabs/android/xmp/ModPlayer$PlayRunnable;)V
    .locals 0
    .parameter
    .parameter

    .prologue
    .line 36
    invoke-direct {p0, p1}, Lorg/helllabs/android/xmp/ModPlayer$PlayRunnable;-><init>(Lorg/helllabs/android/xmp/ModPlayer;)V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 6

    .prologue
    .line 38
    iget-object v3, p0, Lorg/helllabs/android/xmp/ModPlayer$PlayRunnable;->this$0:Lorg/helllabs/android/xmp/ModPlayer;

    #getter for: Lorg/helllabs/android/xmp/ModPlayer;->minSize:I
    invoke-static {v3}, Lorg/helllabs/android/xmp/ModPlayer;->access$0(Lorg/helllabs/android/xmp/ModPlayer;)I

    move-result v3

    new-array v0, v3, [S

    .line 39
    .local v0, buffer:[S
    :cond_0
    :goto_0
    iget-object v3, p0, Lorg/helllabs/android/xmp/ModPlayer$PlayRunnable;->this$0:Lorg/helllabs/android/xmp/ModPlayer;

    #getter for: Lorg/helllabs/android/xmp/ModPlayer;->xmp:Lorg/helllabs/android/xmp/Xmp;
    invoke-static {v3}, Lorg/helllabs/android/xmp/ModPlayer;->access$1(Lorg/helllabs/android/xmp/ModPlayer;)Lorg/helllabs/android/xmp/Xmp;

    move-result-object v3

    invoke-virtual {v3}, Lorg/helllabs/android/xmp/Xmp;->playFrame()I

    move-result v3

    if-eqz v3, :cond_1

    .line 53
    iget-object v3, p0, Lorg/helllabs/android/xmp/ModPlayer$PlayRunnable;->this$0:Lorg/helllabs/android/xmp/ModPlayer;

    #getter for: Lorg/helllabs/android/xmp/ModPlayer;->audio:Landroid/media/AudioTrack;
    invoke-static {v3}, Lorg/helllabs/android/xmp/ModPlayer;->access$2(Lorg/helllabs/android/xmp/ModPlayer;)Landroid/media/AudioTrack;

    move-result-object v3

    invoke-virtual {v3}, Landroid/media/AudioTrack;->stop()V

    .line 54
    iget-object v3, p0, Lorg/helllabs/android/xmp/ModPlayer$PlayRunnable;->this$0:Lorg/helllabs/android/xmp/ModPlayer;

    #getter for: Lorg/helllabs/android/xmp/ModPlayer;->xmp:Lorg/helllabs/android/xmp/Xmp;
    invoke-static {v3}, Lorg/helllabs/android/xmp/ModPlayer;->access$1(Lorg/helllabs/android/xmp/ModPlayer;)Lorg/helllabs/android/xmp/Xmp;

    move-result-object v3

    invoke-virtual {v3}, Lorg/helllabs/android/xmp/Xmp;->endPlayer()I

    .line 55
    iget-object v3, p0, Lorg/helllabs/android/xmp/ModPlayer$PlayRunnable;->this$0:Lorg/helllabs/android/xmp/ModPlayer;

    #getter for: Lorg/helllabs/android/xmp/ModPlayer;->xmp:Lorg/helllabs/android/xmp/Xmp;
    invoke-static {v3}, Lorg/helllabs/android/xmp/ModPlayer;->access$1(Lorg/helllabs/android/xmp/ModPlayer;)Lorg/helllabs/android/xmp/Xmp;

    move-result-object v3

    invoke-virtual {v3}, Lorg/helllabs/android/xmp/Xmp;->releaseModule()I

    .line 56
    return-void

    .line 40
    :cond_1
    iget-object v3, p0, Lorg/helllabs/android/xmp/ModPlayer$PlayRunnable;->this$0:Lorg/helllabs/android/xmp/ModPlayer;

    #getter for: Lorg/helllabs/android/xmp/ModPlayer;->xmp:Lorg/helllabs/android/xmp/Xmp;
    invoke-static {v3}, Lorg/helllabs/android/xmp/ModPlayer;->access$1(Lorg/helllabs/android/xmp/ModPlayer;)Lorg/helllabs/android/xmp/Xmp;

    move-result-object v3

    invoke-virtual {v3}, Lorg/helllabs/android/xmp/Xmp;->softmixer()I

    move-result v2

    .line 41
    .local v2, size:I
    iget-object v3, p0, Lorg/helllabs/android/xmp/ModPlayer$PlayRunnable;->this$0:Lorg/helllabs/android/xmp/ModPlayer;

    #getter for: Lorg/helllabs/android/xmp/ModPlayer;->xmp:Lorg/helllabs/android/xmp/Xmp;
    invoke-static {v3}, Lorg/helllabs/android/xmp/ModPlayer;->access$1(Lorg/helllabs/android/xmp/ModPlayer;)Lorg/helllabs/android/xmp/Xmp;

    move-result-object v3

    invoke-virtual {v3, v2, v0}, Lorg/helllabs/android/xmp/Xmp;->getBuffer(I[S)[S

    move-result-object v0

    .line 42
    iget-object v3, p0, Lorg/helllabs/android/xmp/ModPlayer$PlayRunnable;->this$0:Lorg/helllabs/android/xmp/ModPlayer;

    #getter for: Lorg/helllabs/android/xmp/ModPlayer;->audio:Landroid/media/AudioTrack;
    invoke-static {v3}, Lorg/helllabs/android/xmp/ModPlayer;->access$2(Lorg/helllabs/android/xmp/ModPlayer;)Landroid/media/AudioTrack;

    move-result-object v3

    const/4 v4, 0x0

    div-int/lit8 v5, v2, 0x2

    invoke-virtual {v3, v0, v4, v5}, Landroid/media/AudioTrack;->write([SII)I

    .line 44
    :goto_1
    iget-object v3, p0, Lorg/helllabs/android/xmp/ModPlayer$PlayRunnable;->this$0:Lorg/helllabs/android/xmp/ModPlayer;

    iget-boolean v3, v3, Lorg/helllabs/android/xmp/ModPlayer;->paused:Z

    if-eqz v3, :cond_0

    .line 46
    const-wide/16 v3, 0x1f4

    :try_start_0
    invoke-static {v3, v4}, Ljava/lang/Thread;->sleep(J)V
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    .line 47
    :catch_0
    move-exception v1

    .line 48
    .local v1, e:Ljava/lang/InterruptedException;
    goto :goto_0
.end method
