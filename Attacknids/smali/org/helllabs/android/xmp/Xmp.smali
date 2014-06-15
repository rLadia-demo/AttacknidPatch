.class public Lorg/helllabs/android/xmp/Xmp;
.super Ljava/lang/Object;
.source "Xmp.java"


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 37
    const-string v0, "xmp"

    invoke-static {v0}, Ljava/lang/System;->loadLibrary(Ljava/lang/String;)V

    .line 4
    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 4
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public native decGvol()I
.end method

.method public native deinit()I
.end method

.method public native endPlayer()I
.end method

.method public native getBuffer(I[S)[S
.end method

.method public native getFormatCount()I
.end method

.method public native getFormats()[Ljava/lang/String;
.end method

.method public native getModInfo(Ljava/lang/String;)Lorg/helllabs/android/xmp/ModInfo;
.end method

.method public native getPlayBpm()I
.end method

.method public native getPlayPat()I
.end method

.method public native getPlayPos()I
.end method

.method public native getPlayTempo()I
.end method

.method public native getVersion()Ljava/lang/String;
.end method

.method public native incGvol()I
.end method

.method public native init()I
.end method

.method public native loadModule(Ljava/lang/String;)I
.end method

.method public native nextOrd()I
.end method

.method public native playFrame()I
.end method

.method public native prevOrd()I
.end method

.method public native releaseModule()I
.end method

.method public native restartModule()I
.end method

.method public native restartTimer()I
.end method

.method public native seek(I)I
.end method

.method public native seek(J)I
.end method

.method public native setOrd(I)I
.end method

.method public native softmixer()I
.end method

.method public native startPlayer()I
.end method

.method public native stopModule()I
.end method

.method public native stopTimer()I
.end method

.method public native testModule(Ljava/lang/String;)I
.end method

.method public native time()I
.end method
