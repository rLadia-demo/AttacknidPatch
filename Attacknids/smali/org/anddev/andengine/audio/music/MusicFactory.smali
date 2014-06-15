.class public Lorg/anddev/andengine/audio/music/MusicFactory;
.super Ljava/lang/Object;
.source "MusicFactory.java"


# static fields
.field private static sAssetBasePath:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 24
    const-string v0, ""

    sput-object v0, Lorg/anddev/andengine/audio/music/MusicFactory;->sAssetBasePath:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 15
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static createMusicFromAsset(Lorg/anddev/andengine/audio/music/MusicManager;Landroid/content/Context;Ljava/lang/String;)Lorg/anddev/andengine/audio/music/Music;
    .locals 8
    .parameter "pMusicManager"
    .parameter "pContext"
    .parameter "pAssetPath"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 66
    new-instance v0, Landroid/media/MediaPlayer;

    invoke-direct {v0}, Landroid/media/MediaPlayer;-><init>()V

    .line 68
    .local v0, mediaPlayer:Landroid/media/MediaPlayer;
    invoke-virtual {p1}, Landroid/content/Context;->getAssets()Landroid/content/res/AssetManager;

    move-result-object v1

    new-instance v2, Ljava/lang/StringBuilder;

    sget-object v3, Lorg/anddev/andengine/audio/music/MusicFactory;->sAssetBasePath:Ljava/lang/String;

    invoke-static {v3}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/content/res/AssetManager;->openFd(Ljava/lang/String;)Landroid/content/res/AssetFileDescriptor;

    move-result-object v6

    .line 69
    .local v6, assetFileDescritor:Landroid/content/res/AssetFileDescriptor;
    invoke-virtual {v6}, Landroid/content/res/AssetFileDescriptor;->getFileDescriptor()Ljava/io/FileDescriptor;

    move-result-object v1

    invoke-virtual {v6}, Landroid/content/res/AssetFileDescriptor;->getStartOffset()J

    move-result-wide v2

    invoke-virtual {v6}, Landroid/content/res/AssetFileDescriptor;->getLength()J

    move-result-wide v4

    invoke-virtual/range {v0 .. v5}, Landroid/media/MediaPlayer;->setDataSource(Ljava/io/FileDescriptor;JJ)V

    .line 70
    invoke-virtual {v0}, Landroid/media/MediaPlayer;->prepare()V

    .line 72
    new-instance v7, Lorg/anddev/andengine/audio/music/Music;

    invoke-direct {v7, p0, v0}, Lorg/anddev/andengine/audio/music/Music;-><init>(Lorg/anddev/andengine/audio/music/MusicManager;Landroid/media/MediaPlayer;)V

    .line 73
    .local v7, music:Lorg/anddev/andengine/audio/music/Music;
    invoke-virtual {p0, v7}, Lorg/anddev/andengine/audio/music/MusicManager;->add(Lorg/anddev/andengine/audio/IAudioEntity;)V

    .line 75
    return-object v7
.end method

.method public static createMusicFromFile(Lorg/anddev/andengine/audio/music/MusicManager;Landroid/content/Context;Ljava/io/File;)Lorg/anddev/andengine/audio/music/Music;
    .locals 3
    .parameter "pMusicManager"
    .parameter "pContext"
    .parameter "pFile"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 54
    new-instance v0, Landroid/media/MediaPlayer;

    invoke-direct {v0}, Landroid/media/MediaPlayer;-><init>()V

    .line 56
    .local v0, mediaPlayer:Landroid/media/MediaPlayer;
    new-instance v2, Ljava/io/FileInputStream;

    invoke-direct {v2, p2}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V

    invoke-virtual {v2}, Ljava/io/FileInputStream;->getFD()Ljava/io/FileDescriptor;

    move-result-object v2

    invoke-virtual {v0, v2}, Landroid/media/MediaPlayer;->setDataSource(Ljava/io/FileDescriptor;)V

    .line 57
    invoke-virtual {v0}, Landroid/media/MediaPlayer;->prepare()V

    .line 59
    new-instance v1, Lorg/anddev/andengine/audio/music/Music;

    invoke-direct {v1, p0, v0}, Lorg/anddev/andengine/audio/music/Music;-><init>(Lorg/anddev/andengine/audio/music/MusicManager;Landroid/media/MediaPlayer;)V

    .line 60
    .local v1, music:Lorg/anddev/andengine/audio/music/Music;
    invoke-virtual {p0, v1}, Lorg/anddev/andengine/audio/music/MusicManager;->add(Lorg/anddev/andengine/audio/IAudioEntity;)V

    .line 62
    return-object v1
.end method

.method public static createMusicFromResource(Lorg/anddev/andengine/audio/music/MusicManager;Landroid/content/Context;I)Lorg/anddev/andengine/audio/music/Music;
    .locals 2
    .parameter "pMusicManager"
    .parameter "pContext"
    .parameter "pMusicResID"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 79
    invoke-static {p1, p2}, Landroid/media/MediaPlayer;->create(Landroid/content/Context;I)Landroid/media/MediaPlayer;

    move-result-object v0

    .line 80
    .local v0, mediaPlayer:Landroid/media/MediaPlayer;
    invoke-virtual {v0}, Landroid/media/MediaPlayer;->prepare()V

    .line 82
    new-instance v1, Lorg/anddev/andengine/audio/music/Music;

    invoke-direct {v1, p0, v0}, Lorg/anddev/andengine/audio/music/Music;-><init>(Lorg/anddev/andengine/audio/music/MusicManager;Landroid/media/MediaPlayer;)V

    .line 83
    .local v1, music:Lorg/anddev/andengine/audio/music/Music;
    invoke-virtual {p0, v1}, Lorg/anddev/andengine/audio/music/MusicManager;->add(Lorg/anddev/andengine/audio/IAudioEntity;)V

    .line 85
    return-object v1
.end method

.method public static setAssetBasePath(Ljava/lang/String;)V
    .locals 2
    .parameter "pAssetBasePath"

    .prologue
    .line 38
    const-string v0, "/"

    invoke-virtual {p0, v0}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_0

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v0

    if-nez v0, :cond_1

    .line 39
    :cond_0
    sput-object p0, Lorg/anddev/andengine/audio/music/MusicFactory;->sAssetBasePath:Ljava/lang/String;

    .line 43
    return-void

    .line 41
    :cond_1
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "pAssetBasePath must end with \'/\' or be lenght zero."

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method
