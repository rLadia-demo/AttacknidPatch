.class public Lorg/anddev/andengine/audio/sound/SoundFactory;
.super Ljava/lang/Object;
.source "SoundFactory.java"


# static fields
.field private static sAssetBasePath:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 20
    const-string v0, ""

    sput-object v0, Lorg/anddev/andengine/audio/sound/SoundFactory;->sAssetBasePath:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 11
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static createSoundFromAsset(Lorg/anddev/andengine/audio/sound/SoundManager;Landroid/content/Context;Ljava/lang/String;)Lorg/anddev/andengine/audio/sound/Sound;
    .locals 6
    .parameter "pSoundManager"
    .parameter "pContext"
    .parameter "pAssetPath"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 57
    invoke-virtual {p0}, Lorg/anddev/andengine/audio/sound/SoundManager;->getSoundPool()Landroid/media/SoundPool;

    move-result-object v2

    invoke-virtual {p1}, Landroid/content/Context;->getAssets()Landroid/content/res/AssetManager;

    move-result-object v3

    new-instance v4, Ljava/lang/StringBuilder;

    sget-object v5, Lorg/anddev/andengine/audio/sound/SoundFactory;->sAssetBasePath:Ljava/lang/String;

    invoke-static {v5}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v4, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Landroid/content/res/AssetManager;->openFd(Ljava/lang/String;)Landroid/content/res/AssetFileDescriptor;

    move-result-object v3

    const/4 v4, 0x1

    invoke-virtual {v2, v3, v4}, Landroid/media/SoundPool;->load(Landroid/content/res/AssetFileDescriptor;I)I

    move-result v1

    .line 58
    .local v1, soundID:I
    new-instance v0, Lorg/anddev/andengine/audio/sound/Sound;

    invoke-direct {v0, p0, v1}, Lorg/anddev/andengine/audio/sound/Sound;-><init>(Lorg/anddev/andengine/audio/sound/SoundManager;I)V

    .line 59
    .local v0, sound:Lorg/anddev/andengine/audio/sound/Sound;
    invoke-virtual {p0, v0}, Lorg/anddev/andengine/audio/sound/SoundManager;->add(Lorg/anddev/andengine/audio/IAudioEntity;)V

    .line 60
    return-object v0
.end method

.method public static createSoundFromPath(Lorg/anddev/andengine/audio/sound/SoundManager;Landroid/content/Context;Ljava/lang/String;)Lorg/anddev/andengine/audio/sound/Sound;
    .locals 4
    .parameter "pSoundManager"
    .parameter "pContext"
    .parameter "pPath"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 50
    invoke-virtual {p0}, Lorg/anddev/andengine/audio/sound/SoundManager;->getSoundPool()Landroid/media/SoundPool;

    move-result-object v2

    const/4 v3, 0x1

    invoke-virtual {v2, p2, v3}, Landroid/media/SoundPool;->load(Ljava/lang/String;I)I

    move-result v1

    .line 51
    .local v1, soundID:I
    new-instance v0, Lorg/anddev/andengine/audio/sound/Sound;

    invoke-direct {v0, p0, v1}, Lorg/anddev/andengine/audio/sound/Sound;-><init>(Lorg/anddev/andengine/audio/sound/SoundManager;I)V

    .line 52
    .local v0, sound:Lorg/anddev/andengine/audio/sound/Sound;
    invoke-virtual {p0, v0}, Lorg/anddev/andengine/audio/sound/SoundManager;->add(Lorg/anddev/andengine/audio/IAudioEntity;)V

    .line 53
    return-object v0
.end method

.method public static createSoundFromResource(Lorg/anddev/andengine/audio/sound/SoundManager;Landroid/content/Context;I)Lorg/anddev/andengine/audio/sound/Sound;
    .locals 4
    .parameter "pSoundManager"
    .parameter "pContext"
    .parameter "pSoundResID"

    .prologue
    .line 64
    invoke-virtual {p0}, Lorg/anddev/andengine/audio/sound/SoundManager;->getSoundPool()Landroid/media/SoundPool;

    move-result-object v2

    const/4 v3, 0x1

    invoke-virtual {v2, p1, p2, v3}, Landroid/media/SoundPool;->load(Landroid/content/Context;II)I

    move-result v1

    .line 65
    .local v1, soundID:I
    new-instance v0, Lorg/anddev/andengine/audio/sound/Sound;

    invoke-direct {v0, p0, v1}, Lorg/anddev/andengine/audio/sound/Sound;-><init>(Lorg/anddev/andengine/audio/sound/SoundManager;I)V

    .line 66
    .local v0, sound:Lorg/anddev/andengine/audio/sound/Sound;
    invoke-virtual {p0, v0}, Lorg/anddev/andengine/audio/sound/SoundManager;->add(Lorg/anddev/andengine/audio/IAudioEntity;)V

    .line 67
    return-object v0
.end method

.method public static setAssetBasePath(Ljava/lang/String;)V
    .locals 2
    .parameter "pAssetBasePath"

    .prologue
    .line 34
    const-string v0, "/"

    invoke-virtual {p0, v0}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_0

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v0

    if-nez v0, :cond_1

    .line 35
    :cond_0
    sput-object p0, Lorg/anddev/andengine/audio/sound/SoundFactory;->sAssetBasePath:Ljava/lang/String;

    .line 39
    return-void

    .line 37
    :cond_1
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "pAssetBasePath must end with \'/\' or be lenght zero."

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method
