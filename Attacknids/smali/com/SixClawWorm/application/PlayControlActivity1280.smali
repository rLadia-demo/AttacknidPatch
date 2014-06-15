.class public Lcom/SixClawWorm/application/PlayControlActivity1280;
.super Lorg/anddev/andengine/ui/activity/BaseGameActivity;
.source "PlayControlActivity1280.java"


# static fields
.field private static final DIR_DOWN:I = 0x3

.field private static final DIR_LEFT:I = 0x0

.field private static final DIR_LEFT_DOWN:I = 0x5

.field private static final DIR_LEFT_UP:I = 0x4

.field private static final DIR_PRESSED:I = -0x1

.field private static final DIR_RELEASE:I = -0x2

.field private static final DIR_RIGHT:I = 0x1

.field private static final DIR_RIGHT_DOWN:I = 0x7

.field private static final DIR_RIGHT_UP:I = 0x6

.field private static final DIR_UP:I = 0x2

.field public static blueOnclock:Z

.field public static down:Z

.field public static greenOnclock:Z

.field public static ifPlayControlActivity:Z

.field public static left:Z

.field public static leftDown:Z

.field public static leftUp:Z

.field public static redOnclock:Z

.field public static right:Z

.field public static rightDown:Z

.field public static rightUp:Z

.field public static up:Z

.field public static yellowOnclock:Z


# instance fields
.field private CAMERA_HEIGHT:I

.field private CAMERA_WIDTH:I

.field private RockerCircleR:I

.field private RockerCircleX:I

.field private RockerCircleY:I

.field private StartStr:Ljava/lang/String;

.field UpSongkai:Z

.field private aboutButton:Lcom/SixClawWorm/utils/GButton;

.field private aboutButtonRegion:Lorg/anddev/andengine/opengl/texture/region/TiledTextureRegion;

.field private backButton:Lcom/SixClawWorm/utils/GButton;

.field private backButtonRegion:Lorg/anddev/andengine/opengl/texture/region/TiledTextureRegion;

.field private blueButton:Lcom/SixClawWorm/utils/GButton;

.field private blueButtonRegion:Lorg/anddev/andengine/opengl/texture/region/TiledTextureRegion;

.field firstOnclock:I

.field private greenButton:Lcom/SixClawWorm/utils/GButton;

.field private greenButtonRegion:Lorg/anddev/andengine/opengl/texture/region/TiledTextureRegion;

.field handler:Landroid/os/Handler;

.field private mBackgroundSprite:Lorg/anddev/andengine/entity/sprite/Sprite;

.field private mBackgroundTextureRegion:Lorg/anddev/andengine/opengl/texture/region/TextureRegion;

.field private mCamera:Lorg/anddev/andengine/engine/camera/Camera;

.field private mChatService:Lcom/SixClawWorm/application/BluetoothChatService;

.field private mControlButtonTexture:Lorg/anddev/andengine/opengl/texture/Texture;

.field private mHudScene:Lorg/anddev/andengine/engine/camera/hud/HUD;

.field private mOnScreenControlBaseTextureRegion:Lorg/anddev/andengine/opengl/texture/region/TextureRegion;

.field private mOnScreenControlKnobTextureRegion:Lorg/anddev/andengine/opengl/texture/region/TextureRegion;

.field private mOnScreenControlTexture:Lorg/anddev/andengine/opengl/texture/Texture;

.field private mOutStringBuffer:Ljava/lang/StringBuffer;

.field private mTexture:Lorg/anddev/andengine/opengl/texture/Texture;

.field private mhandler:Landroid/os/Handler;

.field private redButton:Lcom/SixClawWorm/utils/GButton;

.field private redButtonRegion:Lorg/anddev/andengine/opengl/texture/region/TiledTextureRegion;

.field runnable:Ljava/lang/Runnable;

.field sencondOnclock:I

.field private singalSprite:Lorg/anddev/andengine/entity/sprite/AnimatedSprite;

.field private singalSpriteRegion:Lorg/anddev/andengine/opengl/texture/region/TiledTextureRegion;

.field private startPauseTime:J

.field stopThread:Z

.field stopTime:J

.field private yellowButton:Lcom/SixClawWorm/utils/GButton;

.field private yellowButtonRegion:Lorg/anddev/andengine/opengl/texture/region/TiledTextureRegion;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    const/4 v0, 0x0

    .line 109
    sput-boolean v0, Lcom/SixClawWorm/application/PlayControlActivity1280;->redOnclock:Z

    .line 110
    sput-boolean v0, Lcom/SixClawWorm/application/PlayControlActivity1280;->yellowOnclock:Z

    .line 111
    sput-boolean v0, Lcom/SixClawWorm/application/PlayControlActivity1280;->blueOnclock:Z

    .line 112
    sput-boolean v0, Lcom/SixClawWorm/application/PlayControlActivity1280;->greenOnclock:Z

    .line 113
    sput-boolean v0, Lcom/SixClawWorm/application/PlayControlActivity1280;->left:Z

    .line 114
    sput-boolean v0, Lcom/SixClawWorm/application/PlayControlActivity1280;->right:Z

    .line 115
    sput-boolean v0, Lcom/SixClawWorm/application/PlayControlActivity1280;->up:Z

    .line 116
    sput-boolean v0, Lcom/SixClawWorm/application/PlayControlActivity1280;->down:Z

    .line 117
    sput-boolean v0, Lcom/SixClawWorm/application/PlayControlActivity1280;->leftUp:Z

    .line 118
    sput-boolean v0, Lcom/SixClawWorm/application/PlayControlActivity1280;->leftDown:Z

    .line 119
    sput-boolean v0, Lcom/SixClawWorm/application/PlayControlActivity1280;->rightUp:Z

    .line 120
    sput-boolean v0, Lcom/SixClawWorm/application/PlayControlActivity1280;->rightDown:Z

    .line 127
    sput-boolean v0, Lcom/SixClawWorm/application/PlayControlActivity1280;->ifPlayControlActivity:Z

    return-void
.end method

.method public constructor <init>()V
    .locals 3

    .prologue
    const/4 v2, 0x0

    .line 48
    invoke-direct {p0}, Lorg/anddev/andengine/ui/activity/BaseGameActivity;-><init>()V

    .line 60
    const/16 v0, 0x1e0

    iput v0, p0, Lcom/SixClawWorm/application/PlayControlActivity1280;->CAMERA_WIDTH:I

    .line 61
    const/16 v0, 0x320

    iput v0, p0, Lcom/SixClawWorm/application/PlayControlActivity1280;->CAMERA_HEIGHT:I

    .line 64
    iput v2, p0, Lcom/SixClawWorm/application/PlayControlActivity1280;->RockerCircleX:I

    .line 65
    const/16 v0, 0x80

    iput v0, p0, Lcom/SixClawWorm/application/PlayControlActivity1280;->RockerCircleY:I

    .line 66
    const/16 v0, 0x32

    iput v0, p0, Lcom/SixClawWorm/application/PlayControlActivity1280;->RockerCircleR:I

    .line 106
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/SixClawWorm/application/PlayControlActivity1280;->mChatService:Lcom/SixClawWorm/application/BluetoothChatService;

    .line 108
    const-string v0, "7104808080808001"

    iput-object v0, p0, Lcom/SixClawWorm/application/PlayControlActivity1280;->StartStr:Ljava/lang/String;

    .line 121
    iput v2, p0, Lcom/SixClawWorm/application/PlayControlActivity1280;->firstOnclock:I

    .line 122
    iput v2, p0, Lcom/SixClawWorm/application/PlayControlActivity1280;->sencondOnclock:I

    .line 124
    iput-boolean v2, p0, Lcom/SixClawWorm/application/PlayControlActivity1280;->stopThread:Z

    .line 125
    const-wide/16 v0, 0x0

    iput-wide v0, p0, Lcom/SixClawWorm/application/PlayControlActivity1280;->stopTime:J

    .line 126
    iput-boolean v2, p0, Lcom/SixClawWorm/application/PlayControlActivity1280;->UpSongkai:Z

    .line 218
    new-instance v0, Landroid/os/Handler;

    invoke-direct {v0}, Landroid/os/Handler;-><init>()V

    iput-object v0, p0, Lcom/SixClawWorm/application/PlayControlActivity1280;->handler:Landroid/os/Handler;

    .line 219
    new-instance v0, Lcom/SixClawWorm/application/PlayControlActivity1280$1;

    invoke-direct {v0, p0}, Lcom/SixClawWorm/application/PlayControlActivity1280$1;-><init>(Lcom/SixClawWorm/application/PlayControlActivity1280;)V

    iput-object v0, p0, Lcom/SixClawWorm/application/PlayControlActivity1280;->runnable:Ljava/lang/Runnable;

    .line 242
    new-instance v0, Lcom/SixClawWorm/application/PlayControlActivity1280$2;

    invoke-direct {v0, p0}, Lcom/SixClawWorm/application/PlayControlActivity1280$2;-><init>(Lcom/SixClawWorm/application/PlayControlActivity1280;)V

    iput-object v0, p0, Lcom/SixClawWorm/application/PlayControlActivity1280;->mhandler:Landroid/os/Handler;

    .line 48
    return-void
.end method

.method private TsendMessage([B)V
    .locals 4
    .parameter "sendMessage"

    .prologue
    const/4 v3, 0x0

    .line 314
    iput-boolean v3, p0, Lcom/SixClawWorm/application/PlayControlActivity1280;->stopThread:Z

    .line 315
    sget-object v1, Lcom/SixClawWorm/utils/Param;->ChatService:Lcom/SixClawWorm/application/BluetoothChatService;

    iput-object v1, p0, Lcom/SixClawWorm/application/PlayControlActivity1280;->mChatService:Lcom/SixClawWorm/application/BluetoothChatService;

    .line 316
    new-instance v1, Ljava/lang/StringBuffer;

    const-string v2, ""

    invoke-direct {v1, v2}, Ljava/lang/StringBuffer;-><init>(Ljava/lang/String;)V

    iput-object v1, p0, Lcom/SixClawWorm/application/PlayControlActivity1280;->mOutStringBuffer:Ljava/lang/StringBuffer;

    .line 317
    iget-object v1, p0, Lcom/SixClawWorm/application/PlayControlActivity1280;->mChatService:Lcom/SixClawWorm/application/BluetoothChatService;

    if-eqz v1, :cond_2

    .line 318
    iget-object v1, p0, Lcom/SixClawWorm/application/PlayControlActivity1280;->mChatService:Lcom/SixClawWorm/application/BluetoothChatService;

    invoke-virtual {v1}, Lcom/SixClawWorm/application/BluetoothChatService;->getState()I

    move-result v1

    const/4 v2, 0x3

    if-eq v1, v2, :cond_1

    .line 320
    sput-boolean v3, Lcom/SixClawWorm/utils/Param;->ConntectSucceed:Z

    .line 341
    :cond_0
    :goto_0
    return-void

    .line 326
    :cond_1
    const-wide/16 v1, 0x62

    :try_start_0
    invoke-static {v1, v2}, Ljava/lang/Thread;->sleep(J)V
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    .line 335
    :cond_2
    :goto_1
    array-length v1, p1

    if-lez v1, :cond_0

    .line 336
    iget-object v1, p0, Lcom/SixClawWorm/application/PlayControlActivity1280;->mChatService:Lcom/SixClawWorm/application/BluetoothChatService;

    invoke-virtual {v1, p1}, Lcom/SixClawWorm/application/BluetoothChatService;->write([B)V

    .line 337
    iget-object v1, p0, Lcom/SixClawWorm/application/PlayControlActivity1280;->mOutStringBuffer:Ljava/lang/StringBuffer;

    invoke-virtual {v1, v3}, Ljava/lang/StringBuffer;->setLength(I)V

    goto :goto_0

    .line 327
    :catch_0
    move-exception v0

    .line 329
    .local v0, e:Ljava/lang/InterruptedException;
    invoke-virtual {v0}, Ljava/lang/InterruptedException;->printStackTrace()V

    goto :goto_1
.end method

.method static synthetic access$0(Lcom/SixClawWorm/application/PlayControlActivity1280;)I
    .locals 1
    .parameter

    .prologue
    .line 66
    iget v0, p0, Lcom/SixClawWorm/application/PlayControlActivity1280;->RockerCircleR:I

    return v0
.end method

.method static synthetic access$1(Lcom/SixClawWorm/application/PlayControlActivity1280;I)V
    .locals 0
    .parameter
    .parameter

    .prologue
    .line 703
    invoke-direct {p0, p1}, Lcom/SixClawWorm/application/PlayControlActivity1280;->onKnobDirectionChange(I)V

    return-void
.end method

.method static synthetic access$2(Ljava/lang/String;)[B
    .locals 1
    .parameter

    .prologue
    .line 690
    invoke-static {p0}, Lcom/SixClawWorm/application/PlayControlActivity1280;->string2Bytes(Ljava/lang/String;)[B

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$3(Lcom/SixClawWorm/application/PlayControlActivity1280;[B)V
    .locals 0
    .parameter
    .parameter

    .prologue
    .line 256
    invoke-direct {p0, p1}, Lcom/SixClawWorm/application/PlayControlActivity1280;->sendMessage([B)V

    return-void
.end method

.method private gotoAbout()V
    .locals 2

    .prologue
    .line 675
    new-instance v0, Landroid/content/Intent;

    const-class v1, Lcom/SixClawWorm/application/inTrodutionActivity;

    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 676
    .local v0, about:Landroid/content/Intent;
    invoke-virtual {p0, v0}, Lcom/SixClawWorm/application/PlayControlActivity1280;->startActivity(Landroid/content/Intent;)V

    .line 677
    return-void
.end method

.method private onKnobDirectionChange(I)V
    .locals 14
    .parameter "direction"

    .prologue
    const/4 v13, 0x0

    const/4 v12, 0x1

    .line 706
    packed-switch p1, :pswitch_data_0

    .line 984
    :cond_0
    :goto_0
    iput-boolean v12, p0, Lcom/SixClawWorm/application/PlayControlActivity1280;->stopThread:Z

    .line 985
    return-void

    .line 710
    :pswitch_0
    const-string v9, "SJF"

    const-string v10, "\u3010\u5de6\u3011 "

    invoke-static {v9, v10}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 711
    sput-boolean v12, Lcom/SixClawWorm/application/PlayControlActivity1280;->left:Z

    .line 712
    sget-boolean v9, Lcom/SixClawWorm/application/PlayControlActivity1280;->greenOnclock:Z

    if-eqz v9, :cond_1

    .line 713
    const-string v4, "7100808280800248"

    .line 714
    .local v4, leftUp:Ljava/lang/String;
    invoke-static {v4}, Lcom/SixClawWorm/application/PlayControlActivity1280;->string2Bytes(Ljava/lang/String;)[B

    move-result-object v8

    .line 715
    .local v8, message4:[B
    invoke-direct {p0, v8}, Lcom/SixClawWorm/application/PlayControlActivity1280;->sendMessage([B)V

    goto :goto_0

    .line 717
    .end local v4           #leftUp:Ljava/lang/String;
    .end local v8           #message4:[B
    :cond_1
    sget-boolean v9, Lcom/SixClawWorm/application/PlayControlActivity1280;->blueOnclock:Z

    if-eqz v9, :cond_2

    .line 718
    const-string v4, "7100808282808028"

    .line 719
    .restart local v4       #leftUp:Ljava/lang/String;
    invoke-static {v4}, Lcom/SixClawWorm/application/PlayControlActivity1280;->string2Bytes(Ljava/lang/String;)[B

    move-result-object v8

    .line 720
    .restart local v8       #message4:[B
    invoke-direct {p0, v8}, Lcom/SixClawWorm/application/PlayControlActivity1280;->sendMessage([B)V

    goto :goto_0

    .line 722
    .end local v4           #leftUp:Ljava/lang/String;
    .end local v8           #message4:[B
    :cond_2
    sget-boolean v9, Lcom/SixClawWorm/application/PlayControlActivity1280;->yellowOnclock:Z

    if-eqz v9, :cond_3

    .line 723
    const-string v4, "7100808202808018"

    .line 724
    .restart local v4       #leftUp:Ljava/lang/String;
    invoke-static {v4}, Lcom/SixClawWorm/application/PlayControlActivity1280;->string2Bytes(Ljava/lang/String;)[B

    move-result-object v8

    .line 725
    .restart local v8       #message4:[B
    invoke-direct {p0, v8}, Lcom/SixClawWorm/application/PlayControlActivity1280;->sendMessage([B)V

    goto :goto_0

    .line 727
    .end local v4           #leftUp:Ljava/lang/String;
    .end local v8           #message4:[B
    :cond_3
    sget-boolean v9, Lcom/SixClawWorm/application/PlayControlActivity1280;->redOnclock:Z

    if-eqz v9, :cond_4

    .line 728
    const-string v4, "7100808280808288"

    .line 729
    .restart local v4       #leftUp:Ljava/lang/String;
    invoke-static {v4}, Lcom/SixClawWorm/application/PlayControlActivity1280;->string2Bytes(Ljava/lang/String;)[B

    move-result-object v8

    .line 730
    .restart local v8       #message4:[B
    invoke-direct {p0, v8}, Lcom/SixClawWorm/application/PlayControlActivity1280;->sendMessage([B)V

    goto :goto_0

    .line 733
    .end local v4           #leftUp:Ljava/lang/String;
    .end local v8           #message4:[B
    :cond_4
    const-string v4, "7100808280808008"

    .line 734
    .restart local v4       #leftUp:Ljava/lang/String;
    invoke-static {v4}, Lcom/SixClawWorm/application/PlayControlActivity1280;->string2Bytes(Ljava/lang/String;)[B

    move-result-object v7

    .line 735
    .local v7, message1:[B
    invoke-direct {p0, v7}, Lcom/SixClawWorm/application/PlayControlActivity1280;->sendMessage([B)V

    goto :goto_0

    .line 740
    .end local v4           #leftUp:Ljava/lang/String;
    .end local v7           #message1:[B
    :pswitch_1
    const-string v9, "SJF"

    const-string v10, "\u3010\u53f3\u3011 "

    invoke-static {v9, v10}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 741
    sput-boolean v12, Lcom/SixClawWorm/application/PlayControlActivity1280;->right:Z

    .line 742
    sget-boolean v9, Lcom/SixClawWorm/application/PlayControlActivity1280;->redOnclock:Z

    if-eqz v9, :cond_5

    .line 743
    const-string v4, "7100800280808284"

    .line 744
    .restart local v4       #leftUp:Ljava/lang/String;
    invoke-static {v4}, Lcom/SixClawWorm/application/PlayControlActivity1280;->string2Bytes(Ljava/lang/String;)[B

    move-result-object v6

    .line 745
    .local v6, message:[B
    invoke-direct {p0, v6}, Lcom/SixClawWorm/application/PlayControlActivity1280;->sendMessage([B)V

    goto :goto_0

    .line 747
    .end local v4           #leftUp:Ljava/lang/String;
    .end local v6           #message:[B
    :cond_5
    sget-boolean v9, Lcom/SixClawWorm/application/PlayControlActivity1280;->greenOnclock:Z

    if-eqz v9, :cond_6

    .line 748
    const-string v4, "7100800280800244"

    .line 749
    .restart local v4       #leftUp:Ljava/lang/String;
    invoke-static {v4}, Lcom/SixClawWorm/application/PlayControlActivity1280;->string2Bytes(Ljava/lang/String;)[B

    move-result-object v6

    .line 750
    .restart local v6       #message:[B
    invoke-direct {p0, v6}, Lcom/SixClawWorm/application/PlayControlActivity1280;->sendMessage([B)V

    goto :goto_0

    .line 752
    .end local v4           #leftUp:Ljava/lang/String;
    .end local v6           #message:[B
    :cond_6
    sget-boolean v9, Lcom/SixClawWorm/application/PlayControlActivity1280;->yellowOnclock:Z

    if-eqz v9, :cond_7

    .line 753
    const-string v4, "7100800202808014"

    .line 754
    .restart local v4       #leftUp:Ljava/lang/String;
    invoke-static {v4}, Lcom/SixClawWorm/application/PlayControlActivity1280;->string2Bytes(Ljava/lang/String;)[B

    move-result-object v6

    .line 755
    .restart local v6       #message:[B
    invoke-direct {p0, v6}, Lcom/SixClawWorm/application/PlayControlActivity1280;->sendMessage([B)V

    goto :goto_0

    .line 757
    .end local v4           #leftUp:Ljava/lang/String;
    .end local v6           #message:[B
    :cond_7
    sget-boolean v9, Lcom/SixClawWorm/application/PlayControlActivity1280;->blueOnclock:Z

    if-eqz v9, :cond_8

    .line 758
    const-string v4, "7100800282808024"

    .line 759
    .restart local v4       #leftUp:Ljava/lang/String;
    invoke-static {v4}, Lcom/SixClawWorm/application/PlayControlActivity1280;->string2Bytes(Ljava/lang/String;)[B

    move-result-object v6

    .line 760
    .restart local v6       #message:[B
    invoke-direct {p0, v6}, Lcom/SixClawWorm/application/PlayControlActivity1280;->sendMessage([B)V

    goto/16 :goto_0

    .line 763
    .end local v4           #leftUp:Ljava/lang/String;
    .end local v6           #message:[B
    :cond_8
    const-string v5, "7100800280808004"

    .line 764
    .local v5, leftUp1:Ljava/lang/String;
    invoke-static {v5}, Lcom/SixClawWorm/application/PlayControlActivity1280;->string2Bytes(Ljava/lang/String;)[B

    move-result-object v6

    .line 765
    .restart local v6       #message:[B
    invoke-direct {p0, v6}, Lcom/SixClawWorm/application/PlayControlActivity1280;->sendMessage([B)V

    goto/16 :goto_0

    .line 770
    .end local v5           #leftUp1:Ljava/lang/String;
    .end local v6           #message:[B
    :pswitch_2
    const-string v9, "SJF"

    const-string v10, "\u3010\u4e0a\u3011 "

    invoke-static {v9, v10}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 771
    sput-boolean v12, Lcom/SixClawWorm/application/PlayControlActivity1280;->up:Z

    .line 772
    sget-boolean v9, Lcom/SixClawWorm/application/PlayControlActivity1280;->redOnclock:Z

    if-eqz v9, :cond_9

    .line 773
    const-string v4, "7100028080808241"

    .line 774
    .restart local v4       #leftUp:Ljava/lang/String;
    invoke-static {v4}, Lcom/SixClawWorm/application/PlayControlActivity1280;->string2Bytes(Ljava/lang/String;)[B

    move-result-object v6

    .line 775
    .restart local v6       #message:[B
    invoke-direct {p0, v6}, Lcom/SixClawWorm/application/PlayControlActivity1280;->sendMessage([B)V

    goto/16 :goto_0

    .line 777
    .end local v4           #leftUp:Ljava/lang/String;
    .end local v6           #message:[B
    :cond_9
    sget-boolean v9, Lcom/SixClawWorm/application/PlayControlActivity1280;->greenOnclock:Z

    if-eqz v9, :cond_a

    .line 779
    const-string v4, "7100028080800241"

    .line 780
    .restart local v4       #leftUp:Ljava/lang/String;
    invoke-static {v4}, Lcom/SixClawWorm/application/PlayControlActivity1280;->string2Bytes(Ljava/lang/String;)[B

    move-result-object v6

    .line 781
    .restart local v6       #message:[B
    invoke-direct {p0, v6}, Lcom/SixClawWorm/application/PlayControlActivity1280;->sendMessage([B)V

    goto/16 :goto_0

    .line 783
    .end local v4           #leftUp:Ljava/lang/String;
    .end local v6           #message:[B
    :cond_a
    sget-boolean v9, Lcom/SixClawWorm/application/PlayControlActivity1280;->yellowOnclock:Z

    if-eqz v9, :cond_b

    .line 784
    const-string v4, "7100028002808011"

    .line 785
    .restart local v4       #leftUp:Ljava/lang/String;
    invoke-static {v4}, Lcom/SixClawWorm/application/PlayControlActivity1280;->string2Bytes(Ljava/lang/String;)[B

    move-result-object v6

    .line 786
    .restart local v6       #message:[B
    invoke-direct {p0, v6}, Lcom/SixClawWorm/application/PlayControlActivity1280;->sendMessage([B)V

    goto/16 :goto_0

    .line 788
    .end local v4           #leftUp:Ljava/lang/String;
    .end local v6           #message:[B
    :cond_b
    sget-boolean v9, Lcom/SixClawWorm/application/PlayControlActivity1280;->blueOnclock:Z

    if-eqz v9, :cond_c

    .line 789
    const-string v4, "7100028082808021"

    .line 790
    .restart local v4       #leftUp:Ljava/lang/String;
    invoke-static {v4}, Lcom/SixClawWorm/application/PlayControlActivity1280;->string2Bytes(Ljava/lang/String;)[B

    move-result-object v6

    .line 791
    .restart local v6       #message:[B
    invoke-direct {p0, v6}, Lcom/SixClawWorm/application/PlayControlActivity1280;->sendMessage([B)V

    goto/16 :goto_0

    .line 795
    .end local v4           #leftUp:Ljava/lang/String;
    .end local v6           #message:[B
    :cond_c
    const-string v4, "7100028080808001"

    .line 796
    .restart local v4       #leftUp:Ljava/lang/String;
    invoke-static {v4}, Lcom/SixClawWorm/application/PlayControlActivity1280;->string2Bytes(Ljava/lang/String;)[B

    move-result-object v6

    .line 797
    .restart local v6       #message:[B
    invoke-direct {p0, v6}, Lcom/SixClawWorm/application/PlayControlActivity1280;->sendMessage([B)V

    goto/16 :goto_0

    .line 802
    .end local v4           #leftUp:Ljava/lang/String;
    .end local v6           #message:[B
    :pswitch_3
    const-string v9, "SJF"

    const-string v10, "\u3010\u4e0b\u3011 "

    invoke-static {v9, v10}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 803
    sput-boolean v12, Lcom/SixClawWorm/application/PlayControlActivity1280;->down:Z

    .line 804
    sget-boolean v9, Lcom/SixClawWorm/application/PlayControlActivity1280;->redOnclock:Z

    if-eqz v9, :cond_d

    .line 805
    const-string v4, "7100828080808282"

    .line 806
    .restart local v4       #leftUp:Ljava/lang/String;
    invoke-static {v4}, Lcom/SixClawWorm/application/PlayControlActivity1280;->string2Bytes(Ljava/lang/String;)[B

    move-result-object v6

    .line 807
    .restart local v6       #message:[B
    invoke-direct {p0, v6}, Lcom/SixClawWorm/application/PlayControlActivity1280;->sendMessage([B)V

    goto/16 :goto_0

    .line 809
    .end local v4           #leftUp:Ljava/lang/String;
    .end local v6           #message:[B
    :cond_d
    sget-boolean v9, Lcom/SixClawWorm/application/PlayControlActivity1280;->greenOnclock:Z

    if-eqz v9, :cond_e

    .line 810
    const-string v4, "7100828080800242"

    .line 811
    .restart local v4       #leftUp:Ljava/lang/String;
    invoke-static {v4}, Lcom/SixClawWorm/application/PlayControlActivity1280;->string2Bytes(Ljava/lang/String;)[B

    move-result-object v6

    .line 812
    .restart local v6       #message:[B
    invoke-direct {p0, v6}, Lcom/SixClawWorm/application/PlayControlActivity1280;->sendMessage([B)V

    goto/16 :goto_0

    .line 814
    .end local v4           #leftUp:Ljava/lang/String;
    .end local v6           #message:[B
    :cond_e
    sget-boolean v9, Lcom/SixClawWorm/application/PlayControlActivity1280;->yellowOnclock:Z

    if-eqz v9, :cond_f

    .line 815
    const-string v4, "7100828002808012"

    .line 816
    .restart local v4       #leftUp:Ljava/lang/String;
    invoke-static {v4}, Lcom/SixClawWorm/application/PlayControlActivity1280;->string2Bytes(Ljava/lang/String;)[B

    move-result-object v6

    .line 817
    .restart local v6       #message:[B
    invoke-direct {p0, v6}, Lcom/SixClawWorm/application/PlayControlActivity1280;->sendMessage([B)V

    goto/16 :goto_0

    .line 819
    .end local v4           #leftUp:Ljava/lang/String;
    .end local v6           #message:[B
    :cond_f
    sget-boolean v9, Lcom/SixClawWorm/application/PlayControlActivity1280;->blueOnclock:Z

    if-eqz v9, :cond_10

    .line 820
    const-string v4, "7100828082808022"

    .line 821
    .restart local v4       #leftUp:Ljava/lang/String;
    invoke-static {v4}, Lcom/SixClawWorm/application/PlayControlActivity1280;->string2Bytes(Ljava/lang/String;)[B

    move-result-object v6

    .line 822
    .restart local v6       #message:[B
    invoke-direct {p0, v6}, Lcom/SixClawWorm/application/PlayControlActivity1280;->sendMessage([B)V

    goto/16 :goto_0

    .line 826
    .end local v4           #leftUp:Ljava/lang/String;
    .end local v6           #message:[B
    :cond_10
    const-string v4, "7100828080808002"

    .line 827
    .restart local v4       #leftUp:Ljava/lang/String;
    invoke-static {v4}, Lcom/SixClawWorm/application/PlayControlActivity1280;->string2Bytes(Ljava/lang/String;)[B

    move-result-object v6

    .line 828
    .restart local v6       #message:[B
    invoke-direct {p0, v6}, Lcom/SixClawWorm/application/PlayControlActivity1280;->sendMessage([B)V

    goto/16 :goto_0

    .line 833
    .end local v4           #leftUp:Ljava/lang/String;
    .end local v6           #message:[B
    :pswitch_4
    const-string v9, "SJF"

    const-string v10, "\u3010\u5de6\u4e0a\u3011 "

    invoke-static {v9, v10}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 834
    sput-boolean v12, Lcom/SixClawWorm/application/PlayControlActivity1280;->leftUp:Z

    .line 835
    sget-boolean v9, Lcom/SixClawWorm/application/PlayControlActivity1280;->redOnclock:Z

    if-eqz v9, :cond_11

    .line 836
    const-string v4, "7100028280808289"

    .line 837
    .restart local v4       #leftUp:Ljava/lang/String;
    invoke-static {v4}, Lcom/SixClawWorm/application/PlayControlActivity1280;->string2Bytes(Ljava/lang/String;)[B

    move-result-object v6

    .line 838
    .restart local v6       #message:[B
    invoke-direct {p0, v6}, Lcom/SixClawWorm/application/PlayControlActivity1280;->sendMessage([B)V

    goto/16 :goto_0

    .line 840
    .end local v4           #leftUp:Ljava/lang/String;
    .end local v6           #message:[B
    :cond_11
    sget-boolean v9, Lcom/SixClawWorm/application/PlayControlActivity1280;->greenOnclock:Z

    if-eqz v9, :cond_12

    .line 841
    const-string v4, "7100028280800249"

    .line 842
    .restart local v4       #leftUp:Ljava/lang/String;
    invoke-static {v4}, Lcom/SixClawWorm/application/PlayControlActivity1280;->string2Bytes(Ljava/lang/String;)[B

    move-result-object v6

    .line 843
    .restart local v6       #message:[B
    invoke-direct {p0, v6}, Lcom/SixClawWorm/application/PlayControlActivity1280;->sendMessage([B)V

    goto/16 :goto_0

    .line 845
    .end local v4           #leftUp:Ljava/lang/String;
    .end local v6           #message:[B
    :cond_12
    sget-boolean v9, Lcom/SixClawWorm/application/PlayControlActivity1280;->yellowOnclock:Z

    if-eqz v9, :cond_13

    .line 846
    const-string v4, "7100028202808019"

    .line 847
    .restart local v4       #leftUp:Ljava/lang/String;
    invoke-static {v4}, Lcom/SixClawWorm/application/PlayControlActivity1280;->string2Bytes(Ljava/lang/String;)[B

    move-result-object v6

    .line 848
    .restart local v6       #message:[B
    invoke-direct {p0, v6}, Lcom/SixClawWorm/application/PlayControlActivity1280;->sendMessage([B)V

    goto/16 :goto_0

    .line 850
    .end local v4           #leftUp:Ljava/lang/String;
    .end local v6           #message:[B
    :cond_13
    sget-boolean v9, Lcom/SixClawWorm/application/PlayControlActivity1280;->blueOnclock:Z

    if-eqz v9, :cond_14

    .line 851
    const-string v4, "7100028282808029"

    .line 852
    .restart local v4       #leftUp:Ljava/lang/String;
    invoke-static {v4}, Lcom/SixClawWorm/application/PlayControlActivity1280;->string2Bytes(Ljava/lang/String;)[B

    move-result-object v6

    .line 853
    .restart local v6       #message:[B
    invoke-direct {p0, v6}, Lcom/SixClawWorm/application/PlayControlActivity1280;->sendMessage([B)V

    goto/16 :goto_0

    .line 856
    .end local v4           #leftUp:Ljava/lang/String;
    .end local v6           #message:[B
    :cond_14
    const-string v4, "7100028280808009"

    .line 857
    .restart local v4       #leftUp:Ljava/lang/String;
    invoke-static {v4}, Lcom/SixClawWorm/application/PlayControlActivity1280;->string2Bytes(Ljava/lang/String;)[B

    move-result-object v8

    .line 858
    .restart local v8       #message4:[B
    invoke-direct {p0, v8}, Lcom/SixClawWorm/application/PlayControlActivity1280;->sendMessage([B)V

    goto/16 :goto_0

    .line 862
    .end local v4           #leftUp:Ljava/lang/String;
    .end local v8           #message4:[B
    :pswitch_5
    const-string v9, "SJF"

    const-string v10, "\u3010\u5de6\u4e0b\u3011 "

    invoke-static {v9, v10}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 863
    sput-boolean v12, Lcom/SixClawWorm/application/PlayControlActivity1280;->leftDown:Z

    .line 864
    sget-boolean v9, Lcom/SixClawWorm/application/PlayControlActivity1280;->redOnclock:Z

    if-eqz v9, :cond_15

    .line 865
    const-string v4, "7100828280808290"

    .line 866
    .restart local v4       #leftUp:Ljava/lang/String;
    invoke-static {v4}, Lcom/SixClawWorm/application/PlayControlActivity1280;->string2Bytes(Ljava/lang/String;)[B

    move-result-object v6

    .line 867
    .restart local v6       #message:[B
    invoke-direct {p0, v6}, Lcom/SixClawWorm/application/PlayControlActivity1280;->sendMessage([B)V

    goto/16 :goto_0

    .line 869
    .end local v4           #leftUp:Ljava/lang/String;
    .end local v6           #message:[B
    :cond_15
    sget-boolean v9, Lcom/SixClawWorm/application/PlayControlActivity1280;->greenOnclock:Z

    if-eqz v9, :cond_16

    .line 870
    const-string v4, "7100828280800250"

    .line 871
    .restart local v4       #leftUp:Ljava/lang/String;
    invoke-static {v4}, Lcom/SixClawWorm/application/PlayControlActivity1280;->string2Bytes(Ljava/lang/String;)[B

    move-result-object v6

    .line 872
    .restart local v6       #message:[B
    invoke-direct {p0, v6}, Lcom/SixClawWorm/application/PlayControlActivity1280;->sendMessage([B)V

    goto/16 :goto_0

    .line 874
    .end local v4           #leftUp:Ljava/lang/String;
    .end local v6           #message:[B
    :cond_16
    sget-boolean v9, Lcom/SixClawWorm/application/PlayControlActivity1280;->yellowOnclock:Z

    if-eqz v9, :cond_17

    .line 875
    const-string v4, "7100828202808020"

    .line 876
    .restart local v4       #leftUp:Ljava/lang/String;
    invoke-static {v4}, Lcom/SixClawWorm/application/PlayControlActivity1280;->string2Bytes(Ljava/lang/String;)[B

    move-result-object v6

    .line 877
    .restart local v6       #message:[B
    invoke-direct {p0, v6}, Lcom/SixClawWorm/application/PlayControlActivity1280;->sendMessage([B)V

    goto/16 :goto_0

    .line 879
    .end local v4           #leftUp:Ljava/lang/String;
    .end local v6           #message:[B
    :cond_17
    sget-boolean v9, Lcom/SixClawWorm/application/PlayControlActivity1280;->blueOnclock:Z

    if-eqz v9, :cond_18

    .line 880
    const-string v4, "7100828282808030"

    .line 881
    .restart local v4       #leftUp:Ljava/lang/String;
    invoke-static {v4}, Lcom/SixClawWorm/application/PlayControlActivity1280;->string2Bytes(Ljava/lang/String;)[B

    move-result-object v6

    .line 882
    .restart local v6       #message:[B
    invoke-direct {p0, v6}, Lcom/SixClawWorm/application/PlayControlActivity1280;->sendMessage([B)V

    goto/16 :goto_0

    .line 886
    .end local v4           #leftUp:Ljava/lang/String;
    .end local v6           #message:[B
    :cond_18
    const-string v4, "7100828280808010"

    .line 887
    .restart local v4       #leftUp:Ljava/lang/String;
    invoke-static {v4}, Lcom/SixClawWorm/application/PlayControlActivity1280;->string2Bytes(Ljava/lang/String;)[B

    move-result-object v8

    .line 888
    .restart local v8       #message4:[B
    invoke-direct {p0, v8}, Lcom/SixClawWorm/application/PlayControlActivity1280;->sendMessage([B)V

    goto/16 :goto_0

    .line 893
    .end local v4           #leftUp:Ljava/lang/String;
    .end local v8           #message4:[B
    :pswitch_6
    const-string v9, "SJF"

    const-string v10, "\u3010\u53f3\u4e0a\u3011 "

    invoke-static {v9, v10}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 894
    sput-boolean v12, Lcom/SixClawWorm/application/PlayControlActivity1280;->rightUp:Z

    .line 895
    sget-boolean v9, Lcom/SixClawWorm/application/PlayControlActivity1280;->redOnclock:Z

    if-eqz v9, :cond_19

    .line 896
    const-string v4, "7100020280808285"

    .line 897
    .restart local v4       #leftUp:Ljava/lang/String;
    invoke-static {v4}, Lcom/SixClawWorm/application/PlayControlActivity1280;->string2Bytes(Ljava/lang/String;)[B

    move-result-object v6

    .line 898
    .restart local v6       #message:[B
    invoke-direct {p0, v6}, Lcom/SixClawWorm/application/PlayControlActivity1280;->sendMessage([B)V

    goto/16 :goto_0

    .line 900
    .end local v4           #leftUp:Ljava/lang/String;
    .end local v6           #message:[B
    :cond_19
    sget-boolean v9, Lcom/SixClawWorm/application/PlayControlActivity1280;->greenOnclock:Z

    if-eqz v9, :cond_1a

    .line 901
    const-string v4, "7100020280800245"

    .line 902
    .restart local v4       #leftUp:Ljava/lang/String;
    invoke-static {v4}, Lcom/SixClawWorm/application/PlayControlActivity1280;->string2Bytes(Ljava/lang/String;)[B

    move-result-object v6

    .line 903
    .restart local v6       #message:[B
    invoke-direct {p0, v6}, Lcom/SixClawWorm/application/PlayControlActivity1280;->sendMessage([B)V

    goto/16 :goto_0

    .line 905
    .end local v4           #leftUp:Ljava/lang/String;
    .end local v6           #message:[B
    :cond_1a
    sget-boolean v9, Lcom/SixClawWorm/application/PlayControlActivity1280;->yellowOnclock:Z

    if-eqz v9, :cond_1b

    .line 906
    const-string v4, "7100020202808015"

    .line 907
    .restart local v4       #leftUp:Ljava/lang/String;
    invoke-static {v4}, Lcom/SixClawWorm/application/PlayControlActivity1280;->string2Bytes(Ljava/lang/String;)[B

    move-result-object v6

    .line 908
    .restart local v6       #message:[B
    invoke-direct {p0, v6}, Lcom/SixClawWorm/application/PlayControlActivity1280;->sendMessage([B)V

    goto/16 :goto_0

    .line 910
    .end local v4           #leftUp:Ljava/lang/String;
    .end local v6           #message:[B
    :cond_1b
    sget-boolean v9, Lcom/SixClawWorm/application/PlayControlActivity1280;->blueOnclock:Z

    if-eqz v9, :cond_1c

    .line 911
    const-string v4, "7100020282808025"

    .line 912
    .restart local v4       #leftUp:Ljava/lang/String;
    invoke-static {v4}, Lcom/SixClawWorm/application/PlayControlActivity1280;->string2Bytes(Ljava/lang/String;)[B

    move-result-object v6

    .line 913
    .restart local v6       #message:[B
    invoke-direct {p0, v6}, Lcom/SixClawWorm/application/PlayControlActivity1280;->sendMessage([B)V

    goto/16 :goto_0

    .line 917
    .end local v4           #leftUp:Ljava/lang/String;
    .end local v6           #message:[B
    :cond_1c
    const-string v4, "7100020280808005"

    .line 918
    .restart local v4       #leftUp:Ljava/lang/String;
    invoke-static {v4}, Lcom/SixClawWorm/application/PlayControlActivity1280;->string2Bytes(Ljava/lang/String;)[B

    move-result-object v8

    .line 919
    .restart local v8       #message4:[B
    invoke-direct {p0, v8}, Lcom/SixClawWorm/application/PlayControlActivity1280;->sendMessage([B)V

    goto/16 :goto_0

    .line 924
    .end local v4           #leftUp:Ljava/lang/String;
    .end local v8           #message4:[B
    :pswitch_7
    const-string v9, "SJF"

    const-string v10, "\u3010\u53f3\u4e0b\u3011 "

    invoke-static {v9, v10}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 925
    sput-boolean v12, Lcom/SixClawWorm/application/PlayControlActivity1280;->rightDown:Z

    .line 926
    sget-boolean v9, Lcom/SixClawWorm/application/PlayControlActivity1280;->redOnclock:Z

    if-eqz v9, :cond_1d

    .line 927
    const-string v4, "7100820280808286"

    .line 928
    .restart local v4       #leftUp:Ljava/lang/String;
    invoke-static {v4}, Lcom/SixClawWorm/application/PlayControlActivity1280;->string2Bytes(Ljava/lang/String;)[B

    move-result-object v6

    .line 929
    .restart local v6       #message:[B
    invoke-direct {p0, v6}, Lcom/SixClawWorm/application/PlayControlActivity1280;->sendMessage([B)V

    goto/16 :goto_0

    .line 931
    .end local v4           #leftUp:Ljava/lang/String;
    .end local v6           #message:[B
    :cond_1d
    sget-boolean v9, Lcom/SixClawWorm/application/PlayControlActivity1280;->greenOnclock:Z

    if-eqz v9, :cond_1e

    .line 932
    const-string v4, "7100820280800246"

    .line 933
    .restart local v4       #leftUp:Ljava/lang/String;
    invoke-static {v4}, Lcom/SixClawWorm/application/PlayControlActivity1280;->string2Bytes(Ljava/lang/String;)[B

    move-result-object v6

    .line 934
    .restart local v6       #message:[B
    invoke-direct {p0, v6}, Lcom/SixClawWorm/application/PlayControlActivity1280;->sendMessage([B)V

    goto/16 :goto_0

    .line 936
    .end local v4           #leftUp:Ljava/lang/String;
    .end local v6           #message:[B
    :cond_1e
    sget-boolean v9, Lcom/SixClawWorm/application/PlayControlActivity1280;->yellowOnclock:Z

    if-eqz v9, :cond_1f

    .line 937
    const-string v4, "7100820202808016"

    .line 938
    .restart local v4       #leftUp:Ljava/lang/String;
    invoke-static {v4}, Lcom/SixClawWorm/application/PlayControlActivity1280;->string2Bytes(Ljava/lang/String;)[B

    move-result-object v6

    .line 939
    .restart local v6       #message:[B
    invoke-direct {p0, v6}, Lcom/SixClawWorm/application/PlayControlActivity1280;->sendMessage([B)V

    goto/16 :goto_0

    .line 941
    .end local v4           #leftUp:Ljava/lang/String;
    .end local v6           #message:[B
    :cond_1f
    sget-boolean v9, Lcom/SixClawWorm/application/PlayControlActivity1280;->blueOnclock:Z

    if-eqz v9, :cond_20

    .line 942
    const-string v4, "7100820282808026"

    .line 943
    .restart local v4       #leftUp:Ljava/lang/String;
    invoke-static {v4}, Lcom/SixClawWorm/application/PlayControlActivity1280;->string2Bytes(Ljava/lang/String;)[B

    move-result-object v6

    .line 944
    .restart local v6       #message:[B
    invoke-direct {p0, v6}, Lcom/SixClawWorm/application/PlayControlActivity1280;->sendMessage([B)V

    goto/16 :goto_0

    .line 948
    .end local v4           #leftUp:Ljava/lang/String;
    .end local v6           #message:[B
    :cond_20
    const-string v4, "7100820280808006"

    .line 949
    .restart local v4       #leftUp:Ljava/lang/String;
    invoke-static {v4}, Lcom/SixClawWorm/application/PlayControlActivity1280;->string2Bytes(Ljava/lang/String;)[B

    move-result-object v8

    .line 950
    .restart local v8       #message4:[B
    invoke-direct {p0, v8}, Lcom/SixClawWorm/application/PlayControlActivity1280;->sendMessage([B)V

    goto/16 :goto_0

    .line 955
    .end local v4           #leftUp:Ljava/lang/String;
    .end local v8           #message4:[B
    :pswitch_8
    const-string v9, "SJF"

    const-string v10, "\u3010\u6447\u6746\u6309\u4e0b\u3011 "

    invoke-static {v9, v10}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 956
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v9

    iput-wide v9, p0, Lcom/SixClawWorm/application/PlayControlActivity1280;->startPauseTime:J

    .line 957
    iput-boolean v13, p0, Lcom/SixClawWorm/application/PlayControlActivity1280;->UpSongkai:Z

    goto/16 :goto_0

    .line 960
    :pswitch_9
    iget-wide v0, p0, Lcom/SixClawWorm/application/PlayControlActivity1280;->startPauseTime:J

    .line 961
    .local v0, MstartPauseTime:J
    iput-boolean v12, p0, Lcom/SixClawWorm/application/PlayControlActivity1280;->UpSongkai:Z

    .line 962
    sget-object v9, Ljava/lang/System;->out:Ljava/io/PrintStream;

    invoke-virtual {v9, v0, v1}, Ljava/io/PrintStream;->println(J)V

    .line 963
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    .line 964
    .local v2, endPauseTime:J
    sub-long v9, v2, v0

    iput-wide v9, p0, Lcom/SixClawWorm/application/PlayControlActivity1280;->stopTime:J

    .line 965
    sget-object v9, Ljava/lang/System;->out:Ljava/io/PrintStream;

    iget-wide v10, p0, Lcom/SixClawWorm/application/PlayControlActivity1280;->stopTime:J

    invoke-virtual {v9, v10, v11}, Ljava/io/PrintStream;->println(J)V

    .line 966
    const-string v9, "SJF"

    const-string v10, "\u3010\u6447\u6746\u677e\u5f00\u3011 "

    invoke-static {v9, v10}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 967
    sput-boolean v13, Lcom/SixClawWorm/application/PlayControlActivity1280;->left:Z

    .line 968
    sput-boolean v13, Lcom/SixClawWorm/application/PlayControlActivity1280;->right:Z

    .line 969
    sput-boolean v13, Lcom/SixClawWorm/application/PlayControlActivity1280;->leftDown:Z

    .line 970
    sput-boolean v13, Lcom/SixClawWorm/application/PlayControlActivity1280;->leftUp:Z

    .line 971
    sput-boolean v13, Lcom/SixClawWorm/application/PlayControlActivity1280;->rightDown:Z

    .line 972
    sput-boolean v13, Lcom/SixClawWorm/application/PlayControlActivity1280;->rightUp:Z

    .line 973
    sput-boolean v13, Lcom/SixClawWorm/application/PlayControlActivity1280;->up:Z

    .line 974
    sput-boolean v13, Lcom/SixClawWorm/application/PlayControlActivity1280;->down:Z

    .line 975
    sget-boolean v9, Lcom/SixClawWorm/application/PlayControlActivity1280;->right:Z

    if-nez v9, :cond_0

    goto/16 :goto_0

    .line 706
    :pswitch_data_0
    .packed-switch -0x2
        :pswitch_9
        :pswitch_8
        :pswitch_0
        :pswitch_1
        :pswitch_2
        :pswitch_3
        :pswitch_4
        :pswitch_5
        :pswitch_6
        :pswitch_7
    .end packed-switch
.end method

.method private sendMessage([B)V
    .locals 8
    .parameter "sendMessage"

    .prologue
    const/4 v4, 0x0

    const-wide/16 v6, 0x1f4

    .line 257
    sget-object v2, Lcom/SixClawWorm/utils/Param;->ChatService:Lcom/SixClawWorm/application/BluetoothChatService;

    iput-object v2, p0, Lcom/SixClawWorm/application/PlayControlActivity1280;->mChatService:Lcom/SixClawWorm/application/BluetoothChatService;

    .line 258
    new-instance v2, Ljava/lang/StringBuffer;

    const-string v3, ""

    invoke-direct {v2, v3}, Ljava/lang/StringBuffer;-><init>(Ljava/lang/String;)V

    iput-object v2, p0, Lcom/SixClawWorm/application/PlayControlActivity1280;->mOutStringBuffer:Ljava/lang/StringBuffer;

    .line 259
    iget-object v2, p0, Lcom/SixClawWorm/application/PlayControlActivity1280;->mChatService:Lcom/SixClawWorm/application/BluetoothChatService;

    if-eqz v2, :cond_0

    .line 260
    iget-object v2, p0, Lcom/SixClawWorm/application/PlayControlActivity1280;->mChatService:Lcom/SixClawWorm/application/BluetoothChatService;

    invoke-virtual {v2}, Lcom/SixClawWorm/application/BluetoothChatService;->getState()I

    move-result v2

    const/4 v3, 0x3

    if-eq v2, v3, :cond_1

    .line 262
    sput-boolean v4, Lcom/SixClawWorm/utils/Param;->ConntectSucceed:Z

    .line 312
    :cond_0
    :goto_0
    return-void

    .line 266
    :cond_1
    new-instance v2, Lcom/SixClawWorm/application/PlayControlActivity1280$3;

    invoke-direct {v2, p0}, Lcom/SixClawWorm/application/PlayControlActivity1280$3;-><init>(Lcom/SixClawWorm/application/PlayControlActivity1280;)V

    .line 279
    invoke-virtual {v2}, Lcom/SixClawWorm/application/PlayControlActivity1280$3;->start()V

    .line 281
    array-length v2, p1

    if-lez v2, :cond_4

    .line 282
    iget-object v2, p0, Lcom/SixClawWorm/application/PlayControlActivity1280;->mChatService:Lcom/SixClawWorm/application/BluetoothChatService;

    invoke-virtual {v2, p1}, Lcom/SixClawWorm/application/BluetoothChatService;->write([B)V

    .line 283
    iget-object v2, p0, Lcom/SixClawWorm/application/PlayControlActivity1280;->mOutStringBuffer:Ljava/lang/StringBuffer;

    invoke-virtual {v2, v4}, Ljava/lang/StringBuffer;->setLength(I)V

    .line 284
    sget-boolean v2, Lcom/SixClawWorm/application/PlayControlActivity1280;->left:Z

    if-nez v2, :cond_2

    sget-boolean v2, Lcom/SixClawWorm/application/PlayControlActivity1280;->right:Z

    if-nez v2, :cond_2

    sget-boolean v2, Lcom/SixClawWorm/application/PlayControlActivity1280;->blueOnclock:Z

    if-nez v2, :cond_2

    sget-boolean v2, Lcom/SixClawWorm/application/PlayControlActivity1280;->yellowOnclock:Z

    if-eqz v2, :cond_5

    :cond_2
    iget-wide v2, p0, Lcom/SixClawWorm/application/PlayControlActivity1280;->stopTime:J

    cmp-long v2, v2, v6

    if-ltz v2, :cond_3

    sget-wide v2, Lcom/SixClawWorm/utils/GButton;->stopTime:J

    cmp-long v2, v2, v6

    if-gez v2, :cond_5

    :cond_3
    iget-wide v2, p0, Lcom/SixClawWorm/application/PlayControlActivity1280;->startPauseTime:J

    iget-wide v4, p0, Lcom/SixClawWorm/application/PlayControlActivity1280;->stopTime:J

    cmp-long v2, v2, v4

    if-eqz v2, :cond_5

    .line 285
    sget-boolean v2, Lcom/SixClawWorm/application/PlayControlActivity1280;->redOnclock:Z

    if-nez v2, :cond_5

    sget-boolean v2, Lcom/SixClawWorm/application/PlayControlActivity1280;->blueOnclock:Z

    if-nez v2, :cond_5

    sget-boolean v2, Lcom/SixClawWorm/application/PlayControlActivity1280;->yellowOnclock:Z

    if-nez v2, :cond_5

    .line 286
    sget-boolean v2, Lcom/SixClawWorm/application/PlayControlActivity1280;->greenOnclock:Z

    if-nez v2, :cond_5

    .line 287
    const-string v0, "7100808080808001"

    .line 288
    .local v0, leftUp2:Ljava/lang/String;
    invoke-static {v0}, Lcom/SixClawWorm/application/PlayControlActivity1280;->string2Bytes(Ljava/lang/String;)[B

    move-result-object v1

    .line 289
    .local v1, message2:[B
    invoke-direct {p0, v1}, Lcom/SixClawWorm/application/PlayControlActivity1280;->TsendMessage([B)V

    .line 290
    iget-wide v2, p0, Lcom/SixClawWorm/application/PlayControlActivity1280;->stopTime:J

    iput-wide v2, p0, Lcom/SixClawWorm/application/PlayControlActivity1280;->startPauseTime:J

    .line 309
    .end local v0           #leftUp2:Ljava/lang/String;
    .end local v1           #message2:[B
    :cond_4
    :goto_1
    const/4 v2, 0x1

    iput-boolean v2, p0, Lcom/SixClawWorm/application/PlayControlActivity1280;->stopThread:Z

    goto :goto_0

    .line 292
    :cond_5
    sget-boolean v2, Lcom/SixClawWorm/application/PlayControlActivity1280;->blueOnclock:Z

    if-nez v2, :cond_6

    sget-boolean v2, Lcom/SixClawWorm/application/PlayControlActivity1280;->yellowOnclock:Z

    if-eqz v2, :cond_4

    :cond_6
    sget-wide v2, Lcom/SixClawWorm/utils/GButton;->stopTime:J

    cmp-long v2, v2, v6

    if-gez v2, :cond_4

    sget-wide v2, Lcom/SixClawWorm/utils/GButton;->startPauseTime:J

    sget-wide v4, Lcom/SixClawWorm/utils/GButton;->stopTime:J

    cmp-long v2, v2, v4

    if-eqz v2, :cond_4

    .line 293
    sget-boolean v2, Lcom/SixClawWorm/application/PlayControlActivity1280;->up:Z

    if-nez v2, :cond_4

    .line 294
    sget-boolean v2, Lcom/SixClawWorm/application/PlayControlActivity1280;->down:Z

    if-nez v2, :cond_4

    .line 295
    sget-boolean v2, Lcom/SixClawWorm/application/PlayControlActivity1280;->left:Z

    if-nez v2, :cond_4

    .line 296
    sget-boolean v2, Lcom/SixClawWorm/application/PlayControlActivity1280;->leftDown:Z

    if-nez v2, :cond_4

    .line 297
    sget-boolean v2, Lcom/SixClawWorm/application/PlayControlActivity1280;->leftUp:Z

    if-nez v2, :cond_4

    .line 298
    sget-boolean v2, Lcom/SixClawWorm/application/PlayControlActivity1280;->right:Z

    if-nez v2, :cond_4

    .line 299
    sget-boolean v2, Lcom/SixClawWorm/application/PlayControlActivity1280;->rightDown:Z

    if-nez v2, :cond_4

    .line 300
    sget-boolean v2, Lcom/SixClawWorm/application/PlayControlActivity1280;->rightUp:Z

    if-nez v2, :cond_4

    .line 301
    const-string v0, "7100808080808001"

    .line 302
    .restart local v0       #leftUp2:Ljava/lang/String;
    invoke-static {v0}, Lcom/SixClawWorm/application/PlayControlActivity1280;->string2Bytes(Ljava/lang/String;)[B

    move-result-object v1

    .line 303
    .restart local v1       #message2:[B
    invoke-direct {p0, v1}, Lcom/SixClawWorm/application/PlayControlActivity1280;->TsendMessage([B)V

    .line 304
    const-wide/16 v2, 0x258

    sput-wide v2, Lcom/SixClawWorm/utils/GButton;->stopTime:J

    goto :goto_1
.end method

.method private static string2Bytes(Ljava/lang/String;)[B
    .locals 6
    .parameter "str"

    .prologue
    .line 692
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v4

    div-int/lit8 v1, v4, 0x2

    .line 693
    .local v1, blen:I
    new-array v2, v1, [B

    .line 694
    .local v2, data:[B
    const/4 v3, 0x0

    .local v3, i:I
    :goto_0
    if-lt v3, v1, :cond_0

    .line 699
    return-object v2

    .line 696
    :cond_0
    mul-int/lit8 v4, v3, 0x2

    add-int/lit8 v5, v3, 0x1

    mul-int/lit8 v5, v5, 0x2

    invoke-virtual {p0, v4, v5}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v0

    .line 697
    .local v0, bStr:Ljava/lang/String;
    const/16 v4, 0x10

    invoke-static {v0, v4}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;I)I

    move-result v4

    int-to-byte v4, v4

    aput-byte v4, v2, v3

    .line 694
    add-int/lit8 v3, v3, 0x1

    goto :goto_0
.end method


# virtual methods
.method protected onCreate(Landroid/os/Bundle;)V
    .locals 1
    .parameter "pSavedInstanceState"

    .prologue
    .line 1020
    invoke-static {}, Lcom/SixClawWorm/utils/ExitApplication;->getInstance()Lcom/SixClawWorm/utils/ExitApplication;

    move-result-object v0

    invoke-virtual {v0, p0}, Lcom/SixClawWorm/utils/ExitApplication;->addActivity(Landroid/app/Activity;)V

    .line 1021
    invoke-super {p0, p1}, Lorg/anddev/andengine/ui/activity/BaseGameActivity;->onCreate(Landroid/os/Bundle;)V

    .line 1022
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/SixClawWorm/application/PlayControlActivity1280;->stopThread:Z

    .line 1024
    return-void
.end method

.method protected onDestroy()V
    .locals 2

    .prologue
    .line 1027
    iget-object v0, p0, Lcom/SixClawWorm/application/PlayControlActivity1280;->handler:Landroid/os/Handler;

    iget-object v1, p0, Lcom/SixClawWorm/application/PlayControlActivity1280;->runnable:Ljava/lang/Runnable;

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 1028
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/SixClawWorm/application/PlayControlActivity1280;->stopThread:Z

    .line 1029
    const/4 v0, 0x0

    sput-boolean v0, Lcom/SixClawWorm/utils/GButton;->isPlayControl:Z

    .line 1030
    iget-object v0, p0, Lcom/SixClawWorm/application/PlayControlActivity1280;->mEngine:Lorg/anddev/andengine/engine/Engine;

    invoke-virtual {v0}, Lorg/anddev/andengine/engine/Engine;->getTextureManager()Lorg/anddev/andengine/opengl/texture/TextureManager;

    move-result-object v0

    iget-object v1, p0, Lcom/SixClawWorm/application/PlayControlActivity1280;->mTexture:Lorg/anddev/andengine/opengl/texture/Texture;

    invoke-virtual {v0, v1}, Lorg/anddev/andengine/opengl/texture/TextureManager;->unloadTexture(Lorg/anddev/andengine/opengl/texture/Texture;)Z

    .line 1031
    iget-object v0, p0, Lcom/SixClawWorm/application/PlayControlActivity1280;->mEngine:Lorg/anddev/andengine/engine/Engine;

    invoke-virtual {v0}, Lorg/anddev/andengine/engine/Engine;->getTextureManager()Lorg/anddev/andengine/opengl/texture/TextureManager;

    move-result-object v0

    iget-object v1, p0, Lcom/SixClawWorm/application/PlayControlActivity1280;->mOnScreenControlTexture:Lorg/anddev/andengine/opengl/texture/Texture;

    invoke-virtual {v0, v1}, Lorg/anddev/andengine/opengl/texture/TextureManager;->unloadTexture(Lorg/anddev/andengine/opengl/texture/Texture;)Z

    .line 1032
    iget-object v0, p0, Lcom/SixClawWorm/application/PlayControlActivity1280;->mEngine:Lorg/anddev/andengine/engine/Engine;

    invoke-virtual {v0}, Lorg/anddev/andengine/engine/Engine;->getTextureManager()Lorg/anddev/andengine/opengl/texture/TextureManager;

    move-result-object v0

    iget-object v1, p0, Lcom/SixClawWorm/application/PlayControlActivity1280;->mControlButtonTexture:Lorg/anddev/andengine/opengl/texture/Texture;

    invoke-virtual {v0, v1}, Lorg/anddev/andengine/opengl/texture/TextureManager;->unloadTexture(Lorg/anddev/andengine/opengl/texture/Texture;)Z

    .line 1033
    invoke-super {p0}, Lorg/anddev/andengine/ui/activity/BaseGameActivity;->onDestroy()V

    .line 1034
    return-void
.end method

.method public onKeyDown(ILandroid/view/KeyEvent;)Z
    .locals 3
    .parameter "keyCode"
    .parameter "event"

    .prologue
    const/4 v2, 0x1

    .line 988
    const/4 v0, 0x4

    if-ne p1, v0, :cond_0

    .line 989
    iput-boolean v2, p0, Lcom/SixClawWorm/application/PlayControlActivity1280;->stopThread:Z

    .line 990
    iget-object v0, p0, Lcom/SixClawWorm/application/PlayControlActivity1280;->handler:Landroid/os/Handler;

    iget-object v1, p0, Lcom/SixClawWorm/application/PlayControlActivity1280;->runnable:Ljava/lang/Runnable;

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 991
    sput-boolean v2, Lcom/SixClawWorm/application/PlayControlActivity1280;->ifPlayControlActivity:Z

    .line 992
    invoke-virtual {p0}, Lcom/SixClawWorm/application/PlayControlActivity1280;->finish()V

    .line 998
    :cond_0
    invoke-super {p0, p1, p2}, Lorg/anddev/andengine/ui/activity/BaseGameActivity;->onKeyDown(ILandroid/view/KeyEvent;)Z

    move-result v0

    return v0
.end method

.method public onLoadComplete()V
    .locals 0

    .prologue
    .line 683
    return-void
.end method

.method public onLoadEngine()Lorg/anddev/andengine/engine/Engine;
    .locals 7

    .prologue
    const/4 v5, 0x0

    .line 131
    invoke-static {p0}, Lcom/SixClawWorm/utils/PlatformScreen;->GetWidth(Landroid/app/Activity;)I

    move-result v1

    iput v1, p0, Lcom/SixClawWorm/application/PlayControlActivity1280;->CAMERA_WIDTH:I

    .line 132
    invoke-static {p0}, Lcom/SixClawWorm/utils/PlatformScreen;->GetHeight(Landroid/app/Activity;)I

    move-result v1

    iput v1, p0, Lcom/SixClawWorm/application/PlayControlActivity1280;->CAMERA_HEIGHT:I

    .line 133
    invoke-static {}, Lcom/SixClawWorm/utils/ExitApplication;->getInstance()Lcom/SixClawWorm/utils/ExitApplication;

    move-result-object v1

    invoke-virtual {v1, p0}, Lcom/SixClawWorm/utils/ExitApplication;->addActivity(Landroid/app/Activity;)V

    .line 134
    iget-object v1, p0, Lcom/SixClawWorm/application/PlayControlActivity1280;->handler:Landroid/os/Handler;

    iget-object v2, p0, Lcom/SixClawWorm/application/PlayControlActivity1280;->runnable:Ljava/lang/Runnable;

    const-wide/16 v3, 0x64

    invoke-virtual {v1, v2, v3, v4}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 135
    new-instance v1, Lorg/anddev/andengine/engine/camera/Camera;

    iget v2, p0, Lcom/SixClawWorm/application/PlayControlActivity1280;->CAMERA_WIDTH:I

    int-to-float v2, v2

    iget v3, p0, Lcom/SixClawWorm/application/PlayControlActivity1280;->CAMERA_HEIGHT:I

    int-to-float v3, v3

    invoke-direct {v1, v5, v5, v2, v3}, Lorg/anddev/andengine/engine/camera/Camera;-><init>(FFFF)V

    iput-object v1, p0, Lcom/SixClawWorm/application/PlayControlActivity1280;->mCamera:Lorg/anddev/andengine/engine/camera/Camera;

    .line 139
    new-instance v0, Lorg/anddev/andengine/engine/Engine;

    new-instance v1, Lorg/anddev/andengine/engine/options/EngineOptions;

    const/4 v2, 0x1

    sget-object v3, Lorg/anddev/andengine/engine/options/EngineOptions$ScreenOrientation;->LANDSCAPE:Lorg/anddev/andengine/engine/options/EngineOptions$ScreenOrientation;

    .line 140
    new-instance v4, Lorg/anddev/andengine/engine/options/resolutionpolicy/RatioResolutionPolicy;

    iget v5, p0, Lcom/SixClawWorm/application/PlayControlActivity1280;->CAMERA_WIDTH:I

    int-to-float v5, v5

    iget v6, p0, Lcom/SixClawWorm/application/PlayControlActivity1280;->CAMERA_HEIGHT:I

    int-to-float v6, v6

    invoke-direct {v4, v5, v6}, Lorg/anddev/andengine/engine/options/resolutionpolicy/RatioResolutionPolicy;-><init>(FF)V

    iget-object v5, p0, Lcom/SixClawWorm/application/PlayControlActivity1280;->mCamera:Lorg/anddev/andengine/engine/camera/Camera;

    invoke-direct {v1, v2, v3, v4, v5}, Lorg/anddev/andengine/engine/options/EngineOptions;-><init>(ZLorg/anddev/andengine/engine/options/EngineOptions$ScreenOrientation;Lorg/anddev/andengine/engine/options/resolutionpolicy/IResolutionPolicy;Lorg/anddev/andengine/engine/camera/Camera;)V

    .line 139
    invoke-direct {v0, v1}, Lorg/anddev/andengine/engine/Engine;-><init>(Lorg/anddev/andengine/engine/options/EngineOptions;)V

    .line 142
    .local v0, engine:Lorg/anddev/andengine/engine/Engine;
    :try_start_0
    invoke-static {p0}, Lorg/anddev/andengine/extension/input/touch/controller/MultiTouch;->isSupported(Landroid/content/Context;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 143
    new-instance v1, Lorg/anddev/andengine/extension/input/touch/controller/MultiTouchController;

    invoke-direct {v1}, Lorg/anddev/andengine/extension/input/touch/controller/MultiTouchController;-><init>()V

    invoke-virtual {v0, v1}, Lorg/anddev/andengine/engine/Engine;->setTouchController(Lorg/anddev/andengine/input/touch/controller/ITouchController;)V

    .line 144
    invoke-static {p0}, Lorg/anddev/andengine/extension/input/touch/controller/MultiTouch;->isSupportedDistinct(Landroid/content/Context;)Z
    :try_end_0
    .catch Lorg/anddev/andengine/extension/input/touch/controller/MultiTouchException; {:try_start_0 .. :try_end_0} :catch_0

    .line 156
    :cond_0
    :goto_0
    return-object v0

    .line 152
    :catch_0
    move-exception v1

    goto :goto_0
.end method

.method public onLoadResources()V
    .locals 7

    .prologue
    .line 163
    const-string v0, "gfx/"

    invoke-static {v0}, Lorg/anddev/andengine/opengl/texture/region/TextureRegionFactory;->setAssetBasePath(Ljava/lang/String;)V

    .line 166
    new-instance v0, Lorg/anddev/andengine/engine/camera/hud/HUD;

    invoke-direct {v0}, Lorg/anddev/andengine/engine/camera/hud/HUD;-><init>()V

    iput-object v0, p0, Lcom/SixClawWorm/application/PlayControlActivity1280;->mHudScene:Lorg/anddev/andengine/engine/camera/hud/HUD;

    .line 167
    invoke-static {p0}, Lcom/SixClawWorm/utils/PlatformScreen;->GetWidth(Landroid/app/Activity;)I

    move-result v0

    iput v0, p0, Lcom/SixClawWorm/application/PlayControlActivity1280;->CAMERA_WIDTH:I

    .line 168
    invoke-static {p0}, Lcom/SixClawWorm/utils/PlatformScreen;->GetHeight(Landroid/app/Activity;)I

    move-result v0

    iput v0, p0, Lcom/SixClawWorm/application/PlayControlActivity1280;->CAMERA_HEIGHT:I

    .line 171
    new-instance v0, Lorg/anddev/andengine/opengl/texture/Texture;

    const/16 v1, 0x800

    const/16 v2, 0x800

    .line 172
    sget-object v3, Lorg/anddev/andengine/opengl/texture/TextureOptions;->BILINEAR_PREMULTIPLYALPHA:Lorg/anddev/andengine/opengl/texture/TextureOptions;

    invoke-direct {v0, v1, v2, v3}, Lorg/anddev/andengine/opengl/texture/Texture;-><init>(IILorg/anddev/andengine/opengl/texture/TextureOptions;)V

    .line 171
    iput-object v0, p0, Lcom/SixClawWorm/application/PlayControlActivity1280;->mTexture:Lorg/anddev/andengine/opengl/texture/Texture;

    .line 174
    iget-object v0, p0, Lcom/SixClawWorm/application/PlayControlActivity1280;->mTexture:Lorg/anddev/andengine/opengl/texture/Texture;

    const-string v1, "background-1280.jpg"

    const/4 v2, 0x0

    const/4 v3, 0x0

    .line 173
    invoke-static {v0, p0, v1, v2, v3}, Lorg/anddev/andengine/opengl/texture/region/TextureRegionFactory;->createFromAsset(Lorg/anddev/andengine/opengl/texture/Texture;Landroid/content/Context;Ljava/lang/String;II)Lorg/anddev/andengine/opengl/texture/region/TextureRegion;

    move-result-object v0

    iput-object v0, p0, Lcom/SixClawWorm/application/PlayControlActivity1280;->mBackgroundTextureRegion:Lorg/anddev/andengine/opengl/texture/region/TextureRegion;

    .line 176
    iget-object v0, p0, Lcom/SixClawWorm/application/PlayControlActivity1280;->mTexture:Lorg/anddev/andengine/opengl/texture/Texture;

    .line 177
    const-string v2, "signal.png"

    const/4 v3, 0x0

    const/16 v4, 0x47e

    const/4 v5, 0x4

    const/4 v6, 0x1

    move-object v1, p0

    .line 176
    invoke-static/range {v0 .. v6}, Lorg/anddev/andengine/opengl/texture/region/TextureRegionFactory;->createTiledFromAsset(Lorg/anddev/andengine/opengl/texture/Texture;Landroid/content/Context;Ljava/lang/String;IIII)Lorg/anddev/andengine/opengl/texture/region/TiledTextureRegion;

    move-result-object v0

    iput-object v0, p0, Lcom/SixClawWorm/application/PlayControlActivity1280;->singalSpriteRegion:Lorg/anddev/andengine/opengl/texture/region/TiledTextureRegion;

    .line 180
    iget-object v0, p0, Lcom/SixClawWorm/application/PlayControlActivity1280;->mTexture:Lorg/anddev/andengine/opengl/texture/Texture;

    .line 181
    const-string v2, "btn_back1280.png"

    iget v3, p0, Lcom/SixClawWorm/application/PlayControlActivity1280;->CAMERA_WIDTH:I

    const/4 v4, 0x0

    const/4 v5, 0x2

    const/4 v6, 0x1

    move-object v1, p0

    .line 180
    invoke-static/range {v0 .. v6}, Lorg/anddev/andengine/opengl/texture/region/TextureRegionFactory;->createTiledFromAsset(Lorg/anddev/andengine/opengl/texture/Texture;Landroid/content/Context;Ljava/lang/String;IIII)Lorg/anddev/andengine/opengl/texture/region/TiledTextureRegion;

    move-result-object v0

    iput-object v0, p0, Lcom/SixClawWorm/application/PlayControlActivity1280;->backButtonRegion:Lorg/anddev/andengine/opengl/texture/region/TiledTextureRegion;

    .line 183
    iget-object v0, p0, Lcom/SixClawWorm/application/PlayControlActivity1280;->mTexture:Lorg/anddev/andengine/opengl/texture/Texture;

    .line 184
    const-string v2, "btn_about1280.png"

    iget v3, p0, Lcom/SixClawWorm/application/PlayControlActivity1280;->CAMERA_WIDTH:I

    const/16 v4, 0x501

    const/4 v5, 0x2

    const/4 v6, 0x1

    move-object v1, p0

    .line 183
    invoke-static/range {v0 .. v6}, Lorg/anddev/andengine/opengl/texture/region/TextureRegionFactory;->createTiledFromAsset(Lorg/anddev/andengine/opengl/texture/Texture;Landroid/content/Context;Ljava/lang/String;IIII)Lorg/anddev/andengine/opengl/texture/region/TiledTextureRegion;

    move-result-object v0

    iput-object v0, p0, Lcom/SixClawWorm/application/PlayControlActivity1280;->aboutButtonRegion:Lorg/anddev/andengine/opengl/texture/region/TiledTextureRegion;

    .line 186
    new-instance v0, Lorg/anddev/andengine/opengl/texture/Texture;

    const/16 v1, 0x400

    const/16 v2, 0x400

    .line 187
    sget-object v3, Lorg/anddev/andengine/opengl/texture/TextureOptions;->BILINEAR_PREMULTIPLYALPHA:Lorg/anddev/andengine/opengl/texture/TextureOptions;

    invoke-direct {v0, v1, v2, v3}, Lorg/anddev/andengine/opengl/texture/Texture;-><init>(IILorg/anddev/andengine/opengl/texture/TextureOptions;)V

    .line 186
    iput-object v0, p0, Lcom/SixClawWorm/application/PlayControlActivity1280;->mOnScreenControlTexture:Lorg/anddev/andengine/opengl/texture/Texture;

    .line 191
    iget-object v0, p0, Lcom/SixClawWorm/application/PlayControlActivity1280;->mOnScreenControlTexture:Lorg/anddev/andengine/opengl/texture/Texture;

    .line 192
    const-string v1, "control_base1280.png"

    const/16 v2, 0x78

    const/16 v3, 0x78

    .line 191
    invoke-static {v0, p0, v1, v2, v3}, Lorg/anddev/andengine/opengl/texture/region/TextureRegionFactory;->createFromAsset(Lorg/anddev/andengine/opengl/texture/Texture;Landroid/content/Context;Ljava/lang/String;II)Lorg/anddev/andengine/opengl/texture/region/TextureRegion;

    move-result-object v0

    .line 190
    iput-object v0, p0, Lcom/SixClawWorm/application/PlayControlActivity1280;->mOnScreenControlBaseTextureRegion:Lorg/anddev/andengine/opengl/texture/region/TextureRegion;

    .line 195
    iget-object v0, p0, Lcom/SixClawWorm/application/PlayControlActivity1280;->mOnScreenControlTexture:Lorg/anddev/andengine/opengl/texture/Texture;

    .line 196
    const-string v1, "control_knob1280.png"

    const/16 v2, 0x226

    const/4 v3, 0x0

    .line 195
    invoke-static {v0, p0, v1, v2, v3}, Lorg/anddev/andengine/opengl/texture/region/TextureRegionFactory;->createFromAsset(Lorg/anddev/andengine/opengl/texture/Texture;Landroid/content/Context;Ljava/lang/String;II)Lorg/anddev/andengine/opengl/texture/region/TextureRegion;

    move-result-object v0

    .line 194
    iput-object v0, p0, Lcom/SixClawWorm/application/PlayControlActivity1280;->mOnScreenControlKnobTextureRegion:Lorg/anddev/andengine/opengl/texture/region/TextureRegion;

    .line 199
    new-instance v0, Lorg/anddev/andengine/opengl/texture/Texture;

    const/16 v1, 0x400

    const/16 v2, 0x200

    .line 200
    sget-object v3, Lorg/anddev/andengine/opengl/texture/TextureOptions;->BILINEAR_PREMULTIPLYALPHA:Lorg/anddev/andengine/opengl/texture/TextureOptions;

    invoke-direct {v0, v1, v2, v3}, Lorg/anddev/andengine/opengl/texture/Texture;-><init>(IILorg/anddev/andengine/opengl/texture/TextureOptions;)V

    .line 199
    iput-object v0, p0, Lcom/SixClawWorm/application/PlayControlActivity1280;->mControlButtonTexture:Lorg/anddev/andengine/opengl/texture/Texture;

    .line 202
    iget-object v0, p0, Lcom/SixClawWorm/application/PlayControlActivity1280;->mControlButtonTexture:Lorg/anddev/andengine/opengl/texture/Texture;

    .line 203
    const-string v2, "btn_green1280.png"

    const/4 v3, 0x0

    const/4 v4, 0x0

    const/4 v5, 0x2

    const/4 v6, 0x1

    move-object v1, p0

    .line 202
    invoke-static/range {v0 .. v6}, Lorg/anddev/andengine/opengl/texture/region/TextureRegionFactory;->createTiledFromAsset(Lorg/anddev/andengine/opengl/texture/Texture;Landroid/content/Context;Ljava/lang/String;IIII)Lorg/anddev/andengine/opengl/texture/region/TiledTextureRegion;

    move-result-object v0

    iput-object v0, p0, Lcom/SixClawWorm/application/PlayControlActivity1280;->greenButtonRegion:Lorg/anddev/andengine/opengl/texture/region/TiledTextureRegion;

    .line 205
    iget-object v0, p0, Lcom/SixClawWorm/application/PlayControlActivity1280;->mControlButtonTexture:Lorg/anddev/andengine/opengl/texture/Texture;

    .line 206
    const-string v2, "btn_red1280.png"

    const/16 v3, 0x118

    const/4 v4, 0x0

    const/4 v5, 0x2

    const/4 v6, 0x1

    move-object v1, p0

    .line 205
    invoke-static/range {v0 .. v6}, Lorg/anddev/andengine/opengl/texture/region/TextureRegionFactory;->createTiledFromAsset(Lorg/anddev/andengine/opengl/texture/Texture;Landroid/content/Context;Ljava/lang/String;IIII)Lorg/anddev/andengine/opengl/texture/region/TiledTextureRegion;

    move-result-object v0

    iput-object v0, p0, Lcom/SixClawWorm/application/PlayControlActivity1280;->redButtonRegion:Lorg/anddev/andengine/opengl/texture/region/TiledTextureRegion;

    .line 208
    iget-object v0, p0, Lcom/SixClawWorm/application/PlayControlActivity1280;->mControlButtonTexture:Lorg/anddev/andengine/opengl/texture/Texture;

    .line 209
    const-string v2, "btn_blue1280.png"

    const/4 v3, 0x0

    const/16 v4, 0x8c

    const/4 v5, 0x2

    const/4 v6, 0x1

    move-object v1, p0

    .line 208
    invoke-static/range {v0 .. v6}, Lorg/anddev/andengine/opengl/texture/region/TextureRegionFactory;->createTiledFromAsset(Lorg/anddev/andengine/opengl/texture/Texture;Landroid/content/Context;Ljava/lang/String;IIII)Lorg/anddev/andengine/opengl/texture/region/TiledTextureRegion;

    move-result-object v0

    iput-object v0, p0, Lcom/SixClawWorm/application/PlayControlActivity1280;->blueButtonRegion:Lorg/anddev/andengine/opengl/texture/region/TiledTextureRegion;

    .line 211
    iget-object v0, p0, Lcom/SixClawWorm/application/PlayControlActivity1280;->mControlButtonTexture:Lorg/anddev/andengine/opengl/texture/Texture;

    .line 212
    const-string v2, "btn_yellow1280.png"

    const/16 v3, 0x118

    const/16 v4, 0x8c

    const/4 v5, 0x2

    const/4 v6, 0x1

    move-object v1, p0

    .line 211
    invoke-static/range {v0 .. v6}, Lorg/anddev/andengine/opengl/texture/region/TextureRegionFactory;->createTiledFromAsset(Lorg/anddev/andengine/opengl/texture/Texture;Landroid/content/Context;Ljava/lang/String;IIII)Lorg/anddev/andengine/opengl/texture/region/TiledTextureRegion;

    move-result-object v0

    iput-object v0, p0, Lcom/SixClawWorm/application/PlayControlActivity1280;->yellowButtonRegion:Lorg/anddev/andengine/opengl/texture/region/TiledTextureRegion;

    .line 215
    iget-object v0, p0, Lcom/SixClawWorm/application/PlayControlActivity1280;->mEngine:Lorg/anddev/andengine/engine/Engine;

    invoke-virtual {v0}, Lorg/anddev/andengine/engine/Engine;->getTextureManager()Lorg/anddev/andengine/opengl/texture/TextureManager;

    move-result-object v0

    const/4 v1, 0x3

    new-array v1, v1, [Lorg/anddev/andengine/opengl/texture/Texture;

    const/4 v2, 0x0

    iget-object v3, p0, Lcom/SixClawWorm/application/PlayControlActivity1280;->mTexture:Lorg/anddev/andengine/opengl/texture/Texture;

    aput-object v3, v1, v2

    const/4 v2, 0x1

    .line 216
    iget-object v3, p0, Lcom/SixClawWorm/application/PlayControlActivity1280;->mOnScreenControlTexture:Lorg/anddev/andengine/opengl/texture/Texture;

    aput-object v3, v1, v2

    const/4 v2, 0x2

    iget-object v3, p0, Lcom/SixClawWorm/application/PlayControlActivity1280;->mControlButtonTexture:Lorg/anddev/andengine/opengl/texture/Texture;

    aput-object v3, v1, v2

    .line 215
    invoke-virtual {v0, v1}, Lorg/anddev/andengine/opengl/texture/TextureManager;->loadTextures([Lorg/anddev/andengine/opengl/texture/Texture;)V

    .line 217
    return-void
.end method

.method public onLoadScene()Lorg/anddev/andengine/entity/scene/Scene;
    .locals 11

    .prologue
    .line 344
    iget-object v1, p0, Lcom/SixClawWorm/application/PlayControlActivity1280;->mEngine:Lorg/anddev/andengine/engine/Engine;

    new-instance v2, Lorg/anddev/andengine/entity/util/FPSLogger;

    invoke-direct {v2}, Lorg/anddev/andengine/entity/util/FPSLogger;-><init>()V

    invoke-virtual {v1, v2}, Lorg/anddev/andengine/engine/Engine;->registerUpdateHandler(Lorg/anddev/andengine/engine/handler/IUpdateHandler;)V

    .line 345
    new-instance v10, Lorg/anddev/andengine/entity/scene/Scene;

    const/4 v1, 0x1

    invoke-direct {v10, v1}, Lorg/anddev/andengine/entity/scene/Scene;-><init>(I)V

    .line 346
    .local v10, scene:Lorg/anddev/andengine/entity/scene/Scene;
    iget-object v1, p0, Lcom/SixClawWorm/application/PlayControlActivity1280;->mCamera:Lorg/anddev/andengine/engine/camera/Camera;

    iget-object v2, p0, Lcom/SixClawWorm/application/PlayControlActivity1280;->mHudScene:Lorg/anddev/andengine/engine/camera/hud/HUD;

    invoke-virtual {v1, v2}, Lorg/anddev/andengine/engine/camera/Camera;->setHUD(Lorg/anddev/andengine/engine/camera/hud/HUD;)V

    .line 347
    invoke-static {p0}, Lcom/SixClawWorm/utils/PlatformScreen;->GetWidth(Landroid/app/Activity;)I

    move-result v1

    iput v1, p0, Lcom/SixClawWorm/application/PlayControlActivity1280;->CAMERA_WIDTH:I

    .line 348
    invoke-static {p0}, Lcom/SixClawWorm/utils/PlatformScreen;->GetHeight(Landroid/app/Activity;)I

    move-result v1

    iput v1, p0, Lcom/SixClawWorm/application/PlayControlActivity1280;->CAMERA_HEIGHT:I

    .line 350
    new-instance v1, Lorg/anddev/andengine/entity/sprite/Sprite;

    const/4 v2, 0x0

    const/4 v3, 0x0

    iget-object v4, p0, Lcom/SixClawWorm/application/PlayControlActivity1280;->mBackgroundTextureRegion:Lorg/anddev/andengine/opengl/texture/region/TextureRegion;

    invoke-direct {v1, v2, v3, v4}, Lorg/anddev/andengine/entity/sprite/Sprite;-><init>(FFLorg/anddev/andengine/opengl/texture/region/TextureRegion;)V

    iput-object v1, p0, Lcom/SixClawWorm/application/PlayControlActivity1280;->mBackgroundSprite:Lorg/anddev/andengine/entity/sprite/Sprite;

    .line 351
    iget-object v1, p0, Lcom/SixClawWorm/application/PlayControlActivity1280;->mHudScene:Lorg/anddev/andengine/engine/camera/hud/HUD;

    invoke-virtual {v1}, Lorg/anddev/andengine/engine/camera/hud/HUD;->getTopLayer()Lorg/anddev/andengine/entity/layer/ILayer;

    move-result-object v1

    iget-object v2, p0, Lcom/SixClawWorm/application/PlayControlActivity1280;->mBackgroundSprite:Lorg/anddev/andengine/entity/sprite/Sprite;

    invoke-interface {v1, v2}, Lorg/anddev/andengine/entity/layer/ILayer;->addEntity(Lorg/anddev/andengine/entity/IEntity;)V

    .line 354
    new-instance v0, Lcom/SixClawWorm/utils/GButton;

    const/16 v1, 0x1e

    const/16 v2, 0xa

    iget-object v3, p0, Lcom/SixClawWorm/application/PlayControlActivity1280;->mCamera:Lorg/anddev/andengine/engine/camera/Camera;

    iget-object v4, p0, Lcom/SixClawWorm/application/PlayControlActivity1280;->mEngine:Lorg/anddev/andengine/engine/Engine;

    iget-object v5, p0, Lcom/SixClawWorm/application/PlayControlActivity1280;->backButtonRegion:Lorg/anddev/andengine/opengl/texture/region/TiledTextureRegion;

    new-instance v6, Lcom/SixClawWorm/application/PlayControlActivity1280$4;

    invoke-direct {v6, p0}, Lcom/SixClawWorm/application/PlayControlActivity1280$4;-><init>(Lcom/SixClawWorm/application/PlayControlActivity1280;)V

    .line 369
    const/4 v7, 0x0

    invoke-direct/range {v0 .. v7}, Lcom/SixClawWorm/utils/GButton;-><init>(IILorg/anddev/andengine/engine/camera/Camera;Lorg/anddev/andengine/engine/Engine;Lorg/anddev/andengine/opengl/texture/region/TiledTextureRegion;Lcom/SixClawWorm/utils/GButton$GButtonClickListener;Ljava/lang/String;)V

    .line 354
    iput-object v0, p0, Lcom/SixClawWorm/application/PlayControlActivity1280;->backButton:Lcom/SixClawWorm/utils/GButton;

    .line 370
    iget-object v1, p0, Lcom/SixClawWorm/application/PlayControlActivity1280;->mHudScene:Lorg/anddev/andengine/engine/camera/hud/HUD;

    invoke-virtual {v1}, Lorg/anddev/andengine/engine/camera/hud/HUD;->getTopLayer()Lorg/anddev/andengine/entity/layer/ILayer;

    move-result-object v1

    iget-object v2, p0, Lcom/SixClawWorm/application/PlayControlActivity1280;->backButton:Lcom/SixClawWorm/utils/GButton;

    invoke-interface {v1, v2}, Lorg/anddev/andengine/entity/layer/ILayer;->addEntity(Lorg/anddev/andengine/entity/IEntity;)V

    .line 372
    new-instance v0, Lcom/SixClawWorm/utils/GButton;

    const/16 v1, 0x501

    const/16 v2, 0x299

    iget-object v3, p0, Lcom/SixClawWorm/application/PlayControlActivity1280;->mCamera:Lorg/anddev/andengine/engine/camera/Camera;

    iget-object v4, p0, Lcom/SixClawWorm/application/PlayControlActivity1280;->mEngine:Lorg/anddev/andengine/engine/Engine;

    iget-object v5, p0, Lcom/SixClawWorm/application/PlayControlActivity1280;->aboutButtonRegion:Lorg/anddev/andengine/opengl/texture/region/TiledTextureRegion;

    new-instance v6, Lcom/SixClawWorm/application/PlayControlActivity1280$5;

    invoke-direct {v6, p0}, Lcom/SixClawWorm/application/PlayControlActivity1280$5;-><init>(Lcom/SixClawWorm/application/PlayControlActivity1280;)V

    .line 383
    const/4 v7, 0x0

    invoke-direct/range {v0 .. v7}, Lcom/SixClawWorm/utils/GButton;-><init>(IILorg/anddev/andengine/engine/camera/Camera;Lorg/anddev/andengine/engine/Engine;Lorg/anddev/andengine/opengl/texture/region/TiledTextureRegion;Lcom/SixClawWorm/utils/GButton$GButtonClickListener;Ljava/lang/String;)V

    .line 372
    iput-object v0, p0, Lcom/SixClawWorm/application/PlayControlActivity1280;->aboutButton:Lcom/SixClawWorm/utils/GButton;

    .line 384
    iget-object v1, p0, Lcom/SixClawWorm/application/PlayControlActivity1280;->mHudScene:Lorg/anddev/andengine/engine/camera/hud/HUD;

    invoke-virtual {v1}, Lorg/anddev/andengine/engine/camera/hud/HUD;->getTopLayer()Lorg/anddev/andengine/entity/layer/ILayer;

    move-result-object v1

    iget-object v2, p0, Lcom/SixClawWorm/application/PlayControlActivity1280;->aboutButton:Lcom/SixClawWorm/utils/GButton;

    invoke-interface {v1, v2}, Lorg/anddev/andengine/entity/layer/ILayer;->addEntity(Lorg/anddev/andengine/entity/IEntity;)V

    .line 386
    new-instance v1, Lorg/anddev/andengine/entity/sprite/AnimatedSprite;

    const/high16 v2, 0x4496

    const/high16 v3, 0x4140

    iget-object v4, p0, Lcom/SixClawWorm/application/PlayControlActivity1280;->singalSpriteRegion:Lorg/anddev/andengine/opengl/texture/region/TiledTextureRegion;

    invoke-direct {v1, v2, v3, v4}, Lorg/anddev/andengine/entity/sprite/AnimatedSprite;-><init>(FFLorg/anddev/andengine/opengl/texture/region/TiledTextureRegion;)V

    iput-object v1, p0, Lcom/SixClawWorm/application/PlayControlActivity1280;->singalSprite:Lorg/anddev/andengine/entity/sprite/AnimatedSprite;

    .line 388
    iget-object v1, p0, Lcom/SixClawWorm/application/PlayControlActivity1280;->mHudScene:Lorg/anddev/andengine/engine/camera/hud/HUD;

    invoke-virtual {v1}, Lorg/anddev/andengine/engine/camera/hud/HUD;->getTopLayer()Lorg/anddev/andengine/entity/layer/ILayer;

    move-result-object v1

    iget-object v2, p0, Lcom/SixClawWorm/application/PlayControlActivity1280;->singalSprite:Lorg/anddev/andengine/entity/sprite/AnimatedSprite;

    invoke-interface {v1, v2}, Lorg/anddev/andengine/entity/layer/ILayer;->addEntity(Lorg/anddev/andengine/entity/IEntity;)V

    .line 389
    iget-object v1, p0, Lcom/SixClawWorm/application/PlayControlActivity1280;->singalSprite:Lorg/anddev/andengine/entity/sprite/AnimatedSprite;

    const/4 v2, 0x3

    invoke-virtual {v1, v2}, Lorg/anddev/andengine/entity/sprite/AnimatedSprite;->setCurrentTileIndex(I)V

    .line 391
    new-instance v0, Lorg/anddev/andengine/engine/camera/hud/controls/AnalogOnScreenControl;

    .line 392
    const/16 v1, 0x8c

    .line 393
    const/16 v2, 0xa0

    .line 394
    iget-object v3, p0, Lcom/SixClawWorm/application/PlayControlActivity1280;->mCamera:Lorg/anddev/andengine/engine/camera/Camera;

    iget-object v4, p0, Lcom/SixClawWorm/application/PlayControlActivity1280;->mOnScreenControlBaseTextureRegion:Lorg/anddev/andengine/opengl/texture/region/TextureRegion;

    .line 395
    iget-object v5, p0, Lcom/SixClawWorm/application/PlayControlActivity1280;->mOnScreenControlKnobTextureRegion:Lorg/anddev/andengine/opengl/texture/region/TextureRegion;

    const v6, 0x3dcccccd

    const-wide/16 v7, 0x15e

    .line 396
    new-instance v9, Lcom/SixClawWorm/application/PlayControlActivity1280$6;

    invoke-direct {v9, p0}, Lcom/SixClawWorm/application/PlayControlActivity1280$6;-><init>(Lcom/SixClawWorm/application/PlayControlActivity1280;)V

    .line 391
    invoke-direct/range {v0 .. v9}, Lorg/anddev/andengine/engine/camera/hud/controls/AnalogOnScreenControl;-><init>(IILorg/anddev/andengine/engine/camera/Camera;Lorg/anddev/andengine/opengl/texture/region/TextureRegion;Lorg/anddev/andengine/opengl/texture/region/TextureRegion;FJLorg/anddev/andengine/engine/camera/hud/controls/AnalogOnScreenControl$IAnalogOnScreenControlListener;)V

    .line 498
    .local v0, analogOnScreenControl:Lorg/anddev/andengine/engine/camera/hud/controls/AnalogOnScreenControl;
    invoke-virtual {v0}, Lorg/anddev/andengine/engine/camera/hud/controls/AnalogOnScreenControl;->getControlBase()Lorg/anddev/andengine/entity/sprite/Sprite;

    move-result-object v1

    .line 499
    const/16 v2, 0x302

    const/16 v3, 0x303

    .line 498
    invoke-virtual {v1, v2, v3}, Lorg/anddev/andengine/entity/sprite/Sprite;->setBlendFunction(II)V

    .line 500
    invoke-virtual {v0}, Lorg/anddev/andengine/engine/camera/hud/controls/AnalogOnScreenControl;->getControlBase()Lorg/anddev/andengine/entity/sprite/Sprite;

    move-result-object v1

    const/high16 v2, 0x3f80

    invoke-virtual {v1, v2}, Lorg/anddev/andengine/entity/sprite/Sprite;->setAlpha(F)V

    .line 501
    invoke-virtual {v0}, Lorg/anddev/andengine/engine/camera/hud/controls/AnalogOnScreenControl;->getControlBase()Lorg/anddev/andengine/entity/sprite/Sprite;

    move-result-object v1

    const/4 v2, 0x0

    const/high16 v3, 0x4300

    invoke-virtual {v1, v2, v3}, Lorg/anddev/andengine/entity/sprite/Sprite;->setScaleCenter(FF)V

    .line 502
    invoke-virtual {v0}, Lorg/anddev/andengine/engine/camera/hud/controls/AnalogOnScreenControl;->getControlBase()Lorg/anddev/andengine/entity/sprite/Sprite;

    move-result-object v1

    const/high16 v2, 0x3fa0

    invoke-virtual {v1, v2}, Lorg/anddev/andengine/entity/sprite/Sprite;->setScale(F)V

    .line 503
    invoke-virtual {v0}, Lorg/anddev/andengine/engine/camera/hud/controls/AnalogOnScreenControl;->getControlKnob()Lorg/anddev/andengine/entity/sprite/Sprite;

    move-result-object v1

    const/high16 v2, 0x3fa0

    invoke-virtual {v1, v2}, Lorg/anddev/andengine/entity/sprite/Sprite;->setScale(F)V

    .line 504
    invoke-virtual {v0}, Lorg/anddev/andengine/engine/camera/hud/controls/AnalogOnScreenControl;->refreshControlKnobPosition()V

    .line 505
    iget-object v1, p0, Lcom/SixClawWorm/application/PlayControlActivity1280;->mHudScene:Lorg/anddev/andengine/engine/camera/hud/HUD;

    invoke-virtual {v1, v0}, Lorg/anddev/andengine/engine/camera/hud/HUD;->setChildScene(Lorg/anddev/andengine/entity/scene/Scene;)V

    .line 510
    new-instance v1, Lcom/SixClawWorm/utils/GButton;

    const/16 v2, 0x36b

    const/16 v3, 0x7d

    iget-object v4, p0, Lcom/SixClawWorm/application/PlayControlActivity1280;->mCamera:Lorg/anddev/andengine/engine/camera/Camera;

    iget-object v5, p0, Lcom/SixClawWorm/application/PlayControlActivity1280;->mEngine:Lorg/anddev/andengine/engine/Engine;

    iget-object v6, p0, Lcom/SixClawWorm/application/PlayControlActivity1280;->greenButtonRegion:Lorg/anddev/andengine/opengl/texture/region/TiledTextureRegion;

    new-instance v7, Lcom/SixClawWorm/application/PlayControlActivity1280$7;

    invoke-direct {v7, p0}, Lcom/SixClawWorm/application/PlayControlActivity1280$7;-><init>(Lcom/SixClawWorm/application/PlayControlActivity1280;)V

    .line 549
    const/4 v8, 0x0

    invoke-direct/range {v1 .. v8}, Lcom/SixClawWorm/utils/GButton;-><init>(IILorg/anddev/andengine/engine/camera/Camera;Lorg/anddev/andengine/engine/Engine;Lorg/anddev/andengine/opengl/texture/region/TiledTextureRegion;Lcom/SixClawWorm/utils/GButton$GButtonClickListener;Ljava/lang/String;)V

    .line 510
    iput-object v1, p0, Lcom/SixClawWorm/application/PlayControlActivity1280;->greenButton:Lcom/SixClawWorm/utils/GButton;

    .line 550
    iget-object v1, p0, Lcom/SixClawWorm/application/PlayControlActivity1280;->mHudScene:Lorg/anddev/andengine/engine/camera/hud/HUD;

    invoke-virtual {v1}, Lorg/anddev/andengine/engine/camera/hud/HUD;->getTopLayer()Lorg/anddev/andengine/entity/layer/ILayer;

    move-result-object v1

    iget-object v2, p0, Lcom/SixClawWorm/application/PlayControlActivity1280;->greenButton:Lcom/SixClawWorm/utils/GButton;

    invoke-interface {v1, v2}, Lorg/anddev/andengine/entity/layer/ILayer;->addEntity(Lorg/anddev/andengine/entity/IEntity;)V

    .line 553
    new-instance v1, Lcom/SixClawWorm/utils/GButton;

    const/16 v2, 0x41a

    const/16 v3, 0x136

    iget-object v4, p0, Lcom/SixClawWorm/application/PlayControlActivity1280;->mCamera:Lorg/anddev/andengine/engine/camera/Camera;

    iget-object v5, p0, Lcom/SixClawWorm/application/PlayControlActivity1280;->mEngine:Lorg/anddev/andengine/engine/Engine;

    iget-object v6, p0, Lcom/SixClawWorm/application/PlayControlActivity1280;->blueButtonRegion:Lorg/anddev/andengine/opengl/texture/region/TiledTextureRegion;

    new-instance v7, Lcom/SixClawWorm/application/PlayControlActivity1280$8;

    invoke-direct {v7, p0}, Lcom/SixClawWorm/application/PlayControlActivity1280$8;-><init>(Lcom/SixClawWorm/application/PlayControlActivity1280;)V

    .line 588
    const/4 v8, 0x0

    invoke-direct/range {v1 .. v8}, Lcom/SixClawWorm/utils/GButton;-><init>(IILorg/anddev/andengine/engine/camera/Camera;Lorg/anddev/andengine/engine/Engine;Lorg/anddev/andengine/opengl/texture/region/TiledTextureRegion;Lcom/SixClawWorm/utils/GButton$GButtonClickListener;Ljava/lang/String;)V

    .line 553
    iput-object v1, p0, Lcom/SixClawWorm/application/PlayControlActivity1280;->blueButton:Lcom/SixClawWorm/utils/GButton;

    .line 589
    iget-object v1, p0, Lcom/SixClawWorm/application/PlayControlActivity1280;->mHudScene:Lorg/anddev/andengine/engine/camera/hud/HUD;

    invoke-virtual {v1}, Lorg/anddev/andengine/engine/camera/hud/HUD;->getTopLayer()Lorg/anddev/andengine/entity/layer/ILayer;

    move-result-object v1

    iget-object v2, p0, Lcom/SixClawWorm/application/PlayControlActivity1280;->blueButton:Lcom/SixClawWorm/utils/GButton;

    invoke-interface {v1, v2}, Lorg/anddev/andengine/entity/layer/ILayer;->addEntity(Lorg/anddev/andengine/entity/IEntity;)V

    .line 592
    new-instance v1, Lcom/SixClawWorm/utils/GButton;

    const/16 v2, 0x2bc

    const/16 v3, 0x131

    iget-object v4, p0, Lcom/SixClawWorm/application/PlayControlActivity1280;->mCamera:Lorg/anddev/andengine/engine/camera/Camera;

    iget-object v5, p0, Lcom/SixClawWorm/application/PlayControlActivity1280;->mEngine:Lorg/anddev/andengine/engine/Engine;

    iget-object v6, p0, Lcom/SixClawWorm/application/PlayControlActivity1280;->redButtonRegion:Lorg/anddev/andengine/opengl/texture/region/TiledTextureRegion;

    new-instance v7, Lcom/SixClawWorm/application/PlayControlActivity1280$9;

    invoke-direct {v7, p0}, Lcom/SixClawWorm/application/PlayControlActivity1280$9;-><init>(Lcom/SixClawWorm/application/PlayControlActivity1280;)V

    .line 629
    const/4 v8, 0x0

    invoke-direct/range {v1 .. v8}, Lcom/SixClawWorm/utils/GButton;-><init>(IILorg/anddev/andengine/engine/camera/Camera;Lorg/anddev/andengine/engine/Engine;Lorg/anddev/andengine/opengl/texture/region/TiledTextureRegion;Lcom/SixClawWorm/utils/GButton$GButtonClickListener;Ljava/lang/String;)V

    .line 592
    iput-object v1, p0, Lcom/SixClawWorm/application/PlayControlActivity1280;->redButton:Lcom/SixClawWorm/utils/GButton;

    .line 630
    iget-object v1, p0, Lcom/SixClawWorm/application/PlayControlActivity1280;->mHudScene:Lorg/anddev/andengine/engine/camera/hud/HUD;

    invoke-virtual {v1}, Lorg/anddev/andengine/engine/camera/hud/HUD;->getTopLayer()Lorg/anddev/andengine/entity/layer/ILayer;

    move-result-object v1

    iget-object v2, p0, Lcom/SixClawWorm/application/PlayControlActivity1280;->redButton:Lcom/SixClawWorm/utils/GButton;

    invoke-interface {v1, v2}, Lorg/anddev/andengine/entity/layer/ILayer;->addEntity(Lorg/anddev/andengine/entity/IEntity;)V

    .line 633
    new-instance v1, Lcom/SixClawWorm/utils/GButton;

    const/16 v2, 0x36b

    const/16 v3, 0x1d6

    iget-object v4, p0, Lcom/SixClawWorm/application/PlayControlActivity1280;->mCamera:Lorg/anddev/andengine/engine/camera/Camera;

    iget-object v5, p0, Lcom/SixClawWorm/application/PlayControlActivity1280;->mEngine:Lorg/anddev/andengine/engine/Engine;

    iget-object v6, p0, Lcom/SixClawWorm/application/PlayControlActivity1280;->yellowButtonRegion:Lorg/anddev/andengine/opengl/texture/region/TiledTextureRegion;

    new-instance v7, Lcom/SixClawWorm/application/PlayControlActivity1280$10;

    invoke-direct {v7, p0}, Lcom/SixClawWorm/application/PlayControlActivity1280$10;-><init>(Lcom/SixClawWorm/application/PlayControlActivity1280;)V

    .line 665
    const/4 v8, 0x0

    invoke-direct/range {v1 .. v8}, Lcom/SixClawWorm/utils/GButton;-><init>(IILorg/anddev/andengine/engine/camera/Camera;Lorg/anddev/andengine/engine/Engine;Lorg/anddev/andengine/opengl/texture/region/TiledTextureRegion;Lcom/SixClawWorm/utils/GButton$GButtonClickListener;Ljava/lang/String;)V

    .line 633
    iput-object v1, p0, Lcom/SixClawWorm/application/PlayControlActivity1280;->yellowButton:Lcom/SixClawWorm/utils/GButton;

    .line 666
    iget-object v1, p0, Lcom/SixClawWorm/application/PlayControlActivity1280;->mHudScene:Lorg/anddev/andengine/engine/camera/hud/HUD;

    invoke-virtual {v1}, Lorg/anddev/andengine/engine/camera/hud/HUD;->getTopLayer()Lorg/anddev/andengine/entity/layer/ILayer;

    move-result-object v1

    iget-object v2, p0, Lcom/SixClawWorm/application/PlayControlActivity1280;->yellowButton:Lcom/SixClawWorm/utils/GButton;

    invoke-interface {v1, v2}, Lorg/anddev/andengine/entity/layer/ILayer;->addEntity(Lorg/anddev/andengine/entity/IEntity;)V

    .line 670
    iget-object v1, p0, Lcom/SixClawWorm/application/PlayControlActivity1280;->mHudScene:Lorg/anddev/andengine/engine/camera/hud/HUD;

    return-object v1
.end method

.method protected onResume()V
    .locals 1

    .prologue
    const/4 v0, 0x0

    .line 1002
    sput-boolean v0, Lcom/SixClawWorm/application/PlayControlActivity1280;->left:Z

    .line 1003
    sput-boolean v0, Lcom/SixClawWorm/application/PlayControlActivity1280;->right:Z

    .line 1004
    sput-boolean v0, Lcom/SixClawWorm/application/PlayControlActivity1280;->leftDown:Z

    .line 1005
    sput-boolean v0, Lcom/SixClawWorm/application/PlayControlActivity1280;->leftUp:Z

    .line 1006
    sput-boolean v0, Lcom/SixClawWorm/application/PlayControlActivity1280;->rightDown:Z

    .line 1007
    sput-boolean v0, Lcom/SixClawWorm/application/PlayControlActivity1280;->rightUp:Z

    .line 1008
    sput-boolean v0, Lcom/SixClawWorm/application/PlayControlActivity1280;->up:Z

    .line 1009
    sput-boolean v0, Lcom/SixClawWorm/application/PlayControlActivity1280;->down:Z

    .line 1010
    sput-boolean v0, Lcom/SixClawWorm/application/PlayControlActivity1280;->greenOnclock:Z

    .line 1011
    sput-boolean v0, Lcom/SixClawWorm/application/PlayControlActivity1280;->yellowOnclock:Z

    .line 1012
    sput-boolean v0, Lcom/SixClawWorm/application/PlayControlActivity1280;->redOnclock:Z

    .line 1013
    sput-boolean v0, Lcom/SixClawWorm/application/PlayControlActivity1280;->blueOnclock:Z

    .line 1014
    iput-boolean v0, p0, Lcom/SixClawWorm/application/PlayControlActivity1280;->stopThread:Z

    .line 1015
    const/4 v0, 0x1

    sput-boolean v0, Lcom/SixClawWorm/utils/GButton;->isPlayControl:Z

    .line 1016
    invoke-super {p0}, Lorg/anddev/andengine/ui/activity/BaseGameActivity;->onResume()V

    .line 1017
    return-void
.end method
