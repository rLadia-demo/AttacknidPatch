.class public Lcom/SixClawWorm/application/PlayControlActivity1920;
.super Lorg/anddev/andengine/ui/activity/BaseGameActivity;
.source "PlayControlActivity1920.java"


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

.field private mBTexture:Lorg/anddev/andengine/opengl/texture/Texture;

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

    .line 111
    sput-boolean v0, Lcom/SixClawWorm/application/PlayControlActivity1920;->redOnclock:Z

    .line 112
    sput-boolean v0, Lcom/SixClawWorm/application/PlayControlActivity1920;->yellowOnclock:Z

    .line 113
    sput-boolean v0, Lcom/SixClawWorm/application/PlayControlActivity1920;->blueOnclock:Z

    .line 114
    sput-boolean v0, Lcom/SixClawWorm/application/PlayControlActivity1920;->greenOnclock:Z

    .line 115
    sput-boolean v0, Lcom/SixClawWorm/application/PlayControlActivity1920;->left:Z

    .line 116
    sput-boolean v0, Lcom/SixClawWorm/application/PlayControlActivity1920;->right:Z

    .line 117
    sput-boolean v0, Lcom/SixClawWorm/application/PlayControlActivity1920;->up:Z

    .line 118
    sput-boolean v0, Lcom/SixClawWorm/application/PlayControlActivity1920;->down:Z

    .line 119
    sput-boolean v0, Lcom/SixClawWorm/application/PlayControlActivity1920;->leftUp:Z

    .line 120
    sput-boolean v0, Lcom/SixClawWorm/application/PlayControlActivity1920;->leftDown:Z

    .line 121
    sput-boolean v0, Lcom/SixClawWorm/application/PlayControlActivity1920;->rightUp:Z

    .line 122
    sput-boolean v0, Lcom/SixClawWorm/application/PlayControlActivity1920;->rightDown:Z

    .line 129
    sput-boolean v0, Lcom/SixClawWorm/application/PlayControlActivity1920;->ifPlayControlActivity:Z

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

    iput v0, p0, Lcom/SixClawWorm/application/PlayControlActivity1920;->CAMERA_WIDTH:I

    .line 61
    const/16 v0, 0x320

    iput v0, p0, Lcom/SixClawWorm/application/PlayControlActivity1920;->CAMERA_HEIGHT:I

    .line 64
    iput v2, p0, Lcom/SixClawWorm/application/PlayControlActivity1920;->RockerCircleX:I

    .line 65
    const/16 v0, 0x80

    iput v0, p0, Lcom/SixClawWorm/application/PlayControlActivity1920;->RockerCircleY:I

    .line 66
    const/16 v0, 0x32

    iput v0, p0, Lcom/SixClawWorm/application/PlayControlActivity1920;->RockerCircleR:I

    .line 107
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/SixClawWorm/application/PlayControlActivity1920;->mChatService:Lcom/SixClawWorm/application/BluetoothChatService;

    .line 109
    const-string v0, "7104808080808001"

    iput-object v0, p0, Lcom/SixClawWorm/application/PlayControlActivity1920;->StartStr:Ljava/lang/String;

    .line 123
    iput v2, p0, Lcom/SixClawWorm/application/PlayControlActivity1920;->firstOnclock:I

    .line 124
    iput v2, p0, Lcom/SixClawWorm/application/PlayControlActivity1920;->sencondOnclock:I

    .line 126
    iput-boolean v2, p0, Lcom/SixClawWorm/application/PlayControlActivity1920;->stopThread:Z

    .line 127
    const-wide/16 v0, 0x0

    iput-wide v0, p0, Lcom/SixClawWorm/application/PlayControlActivity1920;->stopTime:J

    .line 128
    iput-boolean v2, p0, Lcom/SixClawWorm/application/PlayControlActivity1920;->UpSongkai:Z

    .line 223
    new-instance v0, Landroid/os/Handler;

    invoke-direct {v0}, Landroid/os/Handler;-><init>()V

    iput-object v0, p0, Lcom/SixClawWorm/application/PlayControlActivity1920;->handler:Landroid/os/Handler;

    .line 224
    new-instance v0, Lcom/SixClawWorm/application/PlayControlActivity1920$1;

    invoke-direct {v0, p0}, Lcom/SixClawWorm/application/PlayControlActivity1920$1;-><init>(Lcom/SixClawWorm/application/PlayControlActivity1920;)V

    iput-object v0, p0, Lcom/SixClawWorm/application/PlayControlActivity1920;->runnable:Ljava/lang/Runnable;

    .line 247
    new-instance v0, Lcom/SixClawWorm/application/PlayControlActivity1920$2;

    invoke-direct {v0, p0}, Lcom/SixClawWorm/application/PlayControlActivity1920$2;-><init>(Lcom/SixClawWorm/application/PlayControlActivity1920;)V

    iput-object v0, p0, Lcom/SixClawWorm/application/PlayControlActivity1920;->mhandler:Landroid/os/Handler;

    .line 48
    return-void
.end method

.method private TsendMessage([B)V
    .locals 4
    .parameter "sendMessage"

    .prologue
    const/4 v3, 0x0

    .line 320
    iput-boolean v3, p0, Lcom/SixClawWorm/application/PlayControlActivity1920;->stopThread:Z

    .line 321
    sget-object v1, Lcom/SixClawWorm/utils/Param;->ChatService:Lcom/SixClawWorm/application/BluetoothChatService;

    iput-object v1, p0, Lcom/SixClawWorm/application/PlayControlActivity1920;->mChatService:Lcom/SixClawWorm/application/BluetoothChatService;

    .line 322
    new-instance v1, Ljava/lang/StringBuffer;

    const-string v2, ""

    invoke-direct {v1, v2}, Ljava/lang/StringBuffer;-><init>(Ljava/lang/String;)V

    iput-object v1, p0, Lcom/SixClawWorm/application/PlayControlActivity1920;->mOutStringBuffer:Ljava/lang/StringBuffer;

    .line 323
    iget-object v1, p0, Lcom/SixClawWorm/application/PlayControlActivity1920;->mChatService:Lcom/SixClawWorm/application/BluetoothChatService;

    if-eqz v1, :cond_2

    .line 324
    iget-object v1, p0, Lcom/SixClawWorm/application/PlayControlActivity1920;->mChatService:Lcom/SixClawWorm/application/BluetoothChatService;

    invoke-virtual {v1}, Lcom/SixClawWorm/application/BluetoothChatService;->getState()I

    move-result v1

    const/4 v2, 0x3

    if-eq v1, v2, :cond_1

    .line 326
    sput-boolean v3, Lcom/SixClawWorm/utils/Param;->ConntectSucceed:Z

    .line 347
    :cond_0
    :goto_0
    return-void

    .line 332
    :cond_1
    const-wide/16 v1, 0x62

    :try_start_0
    invoke-static {v1, v2}, Ljava/lang/Thread;->sleep(J)V
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    .line 341
    :cond_2
    :goto_1
    array-length v1, p1

    if-lez v1, :cond_0

    .line 342
    iget-object v1, p0, Lcom/SixClawWorm/application/PlayControlActivity1920;->mChatService:Lcom/SixClawWorm/application/BluetoothChatService;

    invoke-virtual {v1, p1}, Lcom/SixClawWorm/application/BluetoothChatService;->write([B)V

    .line 343
    iget-object v1, p0, Lcom/SixClawWorm/application/PlayControlActivity1920;->mOutStringBuffer:Ljava/lang/StringBuffer;

    invoke-virtual {v1, v3}, Ljava/lang/StringBuffer;->setLength(I)V

    goto :goto_0

    .line 333
    :catch_0
    move-exception v0

    .line 335
    .local v0, e:Ljava/lang/InterruptedException;
    invoke-virtual {v0}, Ljava/lang/InterruptedException;->printStackTrace()V

    goto :goto_1
.end method

.method static synthetic access$0(Lcom/SixClawWorm/application/PlayControlActivity1920;)I
    .locals 1
    .parameter

    .prologue
    .line 66
    iget v0, p0, Lcom/SixClawWorm/application/PlayControlActivity1920;->RockerCircleR:I

    return v0
.end method

.method static synthetic access$1(Lcom/SixClawWorm/application/PlayControlActivity1920;I)V
    .locals 0
    .parameter
    .parameter

    .prologue
    .line 709
    invoke-direct {p0, p1}, Lcom/SixClawWorm/application/PlayControlActivity1920;->onKnobDirectionChange(I)V

    return-void
.end method

.method static synthetic access$2(Ljava/lang/String;)[B
    .locals 1
    .parameter

    .prologue
    .line 696
    invoke-static {p0}, Lcom/SixClawWorm/application/PlayControlActivity1920;->string2Bytes(Ljava/lang/String;)[B

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$3(Lcom/SixClawWorm/application/PlayControlActivity1920;[B)V
    .locals 0
    .parameter
    .parameter

    .prologue
    .line 262
    invoke-direct {p0, p1}, Lcom/SixClawWorm/application/PlayControlActivity1920;->sendMessage([B)V

    return-void
.end method

.method private gotoAbout()V
    .locals 2

    .prologue
    .line 682
    new-instance v0, Landroid/content/Intent;

    const-class v1, Lcom/SixClawWorm/application/inTrodutionActivity;

    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 683
    .local v0, about:Landroid/content/Intent;
    invoke-virtual {p0, v0}, Lcom/SixClawWorm/application/PlayControlActivity1920;->startActivity(Landroid/content/Intent;)V

    .line 684
    return-void
.end method

.method private onKnobDirectionChange(I)V
    .locals 14
    .parameter "direction"

    .prologue
    const/4 v13, 0x0

    const/4 v12, 0x1

    .line 712
    packed-switch p1, :pswitch_data_0

    .line 991
    :cond_0
    :goto_0
    iput-boolean v12, p0, Lcom/SixClawWorm/application/PlayControlActivity1920;->stopThread:Z

    .line 992
    return-void

    .line 716
    :pswitch_0
    const-string v9, "SJF"

    const-string v10, "\u3010\u5de6\u3011 "

    invoke-static {v9, v10}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 717
    sput-boolean v12, Lcom/SixClawWorm/application/PlayControlActivity1920;->left:Z

    .line 718
    sget-boolean v9, Lcom/SixClawWorm/application/PlayControlActivity1920;->greenOnclock:Z

    if-eqz v9, :cond_1

    .line 719
    const-string v4, "7100808280800248"

    .line 720
    .local v4, leftUp:Ljava/lang/String;
    invoke-static {v4}, Lcom/SixClawWorm/application/PlayControlActivity1920;->string2Bytes(Ljava/lang/String;)[B

    move-result-object v8

    .line 721
    .local v8, message4:[B
    invoke-direct {p0, v8}, Lcom/SixClawWorm/application/PlayControlActivity1920;->sendMessage([B)V

    goto :goto_0

    .line 723
    .end local v4           #leftUp:Ljava/lang/String;
    .end local v8           #message4:[B
    :cond_1
    sget-boolean v9, Lcom/SixClawWorm/application/PlayControlActivity1920;->blueOnclock:Z

    if-eqz v9, :cond_2

    .line 724
    const-string v4, "7100808282808028"

    .line 725
    .restart local v4       #leftUp:Ljava/lang/String;
    invoke-static {v4}, Lcom/SixClawWorm/application/PlayControlActivity1920;->string2Bytes(Ljava/lang/String;)[B

    move-result-object v8

    .line 726
    .restart local v8       #message4:[B
    invoke-direct {p0, v8}, Lcom/SixClawWorm/application/PlayControlActivity1920;->sendMessage([B)V

    goto :goto_0

    .line 728
    .end local v4           #leftUp:Ljava/lang/String;
    .end local v8           #message4:[B
    :cond_2
    sget-boolean v9, Lcom/SixClawWorm/application/PlayControlActivity1920;->yellowOnclock:Z

    if-eqz v9, :cond_3

    .line 730
    const-string v4, "7100808202808018"

    .line 731
    .restart local v4       #leftUp:Ljava/lang/String;
    invoke-static {v4}, Lcom/SixClawWorm/application/PlayControlActivity1920;->string2Bytes(Ljava/lang/String;)[B

    move-result-object v8

    .line 732
    .restart local v8       #message4:[B
    invoke-direct {p0, v8}, Lcom/SixClawWorm/application/PlayControlActivity1920;->sendMessage([B)V

    goto :goto_0

    .line 734
    .end local v4           #leftUp:Ljava/lang/String;
    .end local v8           #message4:[B
    :cond_3
    sget-boolean v9, Lcom/SixClawWorm/application/PlayControlActivity1920;->redOnclock:Z

    if-eqz v9, :cond_4

    .line 735
    const-string v4, "7100808280808288"

    .line 736
    .restart local v4       #leftUp:Ljava/lang/String;
    invoke-static {v4}, Lcom/SixClawWorm/application/PlayControlActivity1920;->string2Bytes(Ljava/lang/String;)[B

    move-result-object v8

    .line 737
    .restart local v8       #message4:[B
    invoke-direct {p0, v8}, Lcom/SixClawWorm/application/PlayControlActivity1920;->sendMessage([B)V

    goto :goto_0

    .line 740
    .end local v4           #leftUp:Ljava/lang/String;
    .end local v8           #message4:[B
    :cond_4
    const-string v4, "7100808280808008"

    .line 741
    .restart local v4       #leftUp:Ljava/lang/String;
    invoke-static {v4}, Lcom/SixClawWorm/application/PlayControlActivity1920;->string2Bytes(Ljava/lang/String;)[B

    move-result-object v7

    .line 742
    .local v7, message1:[B
    invoke-direct {p0, v7}, Lcom/SixClawWorm/application/PlayControlActivity1920;->sendMessage([B)V

    goto :goto_0

    .line 747
    .end local v4           #leftUp:Ljava/lang/String;
    .end local v7           #message1:[B
    :pswitch_1
    const-string v9, "SJF"

    const-string v10, "\u3010\u53f3\u3011 "

    invoke-static {v9, v10}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 748
    sput-boolean v12, Lcom/SixClawWorm/application/PlayControlActivity1920;->right:Z

    .line 749
    sget-boolean v9, Lcom/SixClawWorm/application/PlayControlActivity1920;->redOnclock:Z

    if-eqz v9, :cond_5

    .line 750
    const-string v4, "7100800280808284"

    .line 751
    .restart local v4       #leftUp:Ljava/lang/String;
    invoke-static {v4}, Lcom/SixClawWorm/application/PlayControlActivity1920;->string2Bytes(Ljava/lang/String;)[B

    move-result-object v6

    .line 752
    .local v6, message:[B
    invoke-direct {p0, v6}, Lcom/SixClawWorm/application/PlayControlActivity1920;->sendMessage([B)V

    goto :goto_0

    .line 754
    .end local v4           #leftUp:Ljava/lang/String;
    .end local v6           #message:[B
    :cond_5
    sget-boolean v9, Lcom/SixClawWorm/application/PlayControlActivity1920;->greenOnclock:Z

    if-eqz v9, :cond_6

    .line 755
    const-string v4, "7100800280800244"

    .line 756
    .restart local v4       #leftUp:Ljava/lang/String;
    invoke-static {v4}, Lcom/SixClawWorm/application/PlayControlActivity1920;->string2Bytes(Ljava/lang/String;)[B

    move-result-object v6

    .line 757
    .restart local v6       #message:[B
    invoke-direct {p0, v6}, Lcom/SixClawWorm/application/PlayControlActivity1920;->sendMessage([B)V

    goto :goto_0

    .line 759
    .end local v4           #leftUp:Ljava/lang/String;
    .end local v6           #message:[B
    :cond_6
    sget-boolean v9, Lcom/SixClawWorm/application/PlayControlActivity1920;->yellowOnclock:Z

    if-eqz v9, :cond_7

    .line 760
    const-string v4, "7100800202808014"

    .line 761
    .restart local v4       #leftUp:Ljava/lang/String;
    invoke-static {v4}, Lcom/SixClawWorm/application/PlayControlActivity1920;->string2Bytes(Ljava/lang/String;)[B

    move-result-object v6

    .line 762
    .restart local v6       #message:[B
    invoke-direct {p0, v6}, Lcom/SixClawWorm/application/PlayControlActivity1920;->sendMessage([B)V

    goto :goto_0

    .line 764
    .end local v4           #leftUp:Ljava/lang/String;
    .end local v6           #message:[B
    :cond_7
    sget-boolean v9, Lcom/SixClawWorm/application/PlayControlActivity1920;->blueOnclock:Z

    if-eqz v9, :cond_8

    .line 765
    const-string v4, "7100800282808024"

    .line 766
    .restart local v4       #leftUp:Ljava/lang/String;
    invoke-static {v4}, Lcom/SixClawWorm/application/PlayControlActivity1920;->string2Bytes(Ljava/lang/String;)[B

    move-result-object v6

    .line 767
    .restart local v6       #message:[B
    invoke-direct {p0, v6}, Lcom/SixClawWorm/application/PlayControlActivity1920;->sendMessage([B)V

    goto/16 :goto_0

    .line 770
    .end local v4           #leftUp:Ljava/lang/String;
    .end local v6           #message:[B
    :cond_8
    const-string v5, "7100800280808004"

    .line 771
    .local v5, leftUp1:Ljava/lang/String;
    invoke-static {v5}, Lcom/SixClawWorm/application/PlayControlActivity1920;->string2Bytes(Ljava/lang/String;)[B

    move-result-object v6

    .line 772
    .restart local v6       #message:[B
    invoke-direct {p0, v6}, Lcom/SixClawWorm/application/PlayControlActivity1920;->sendMessage([B)V

    goto/16 :goto_0

    .line 777
    .end local v5           #leftUp1:Ljava/lang/String;
    .end local v6           #message:[B
    :pswitch_2
    const-string v9, "SJF"

    const-string v10, "\u3010\u4e0a\u3011 "

    invoke-static {v9, v10}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 778
    sput-boolean v12, Lcom/SixClawWorm/application/PlayControlActivity1920;->up:Z

    .line 779
    sget-boolean v9, Lcom/SixClawWorm/application/PlayControlActivity1920;->redOnclock:Z

    if-eqz v9, :cond_9

    .line 780
    const-string v4, "7100028080808241"

    .line 781
    .restart local v4       #leftUp:Ljava/lang/String;
    invoke-static {v4}, Lcom/SixClawWorm/application/PlayControlActivity1920;->string2Bytes(Ljava/lang/String;)[B

    move-result-object v6

    .line 782
    .restart local v6       #message:[B
    invoke-direct {p0, v6}, Lcom/SixClawWorm/application/PlayControlActivity1920;->sendMessage([B)V

    goto/16 :goto_0

    .line 784
    .end local v4           #leftUp:Ljava/lang/String;
    .end local v6           #message:[B
    :cond_9
    sget-boolean v9, Lcom/SixClawWorm/application/PlayControlActivity1920;->greenOnclock:Z

    if-eqz v9, :cond_a

    .line 786
    const-string v4, "7100028080800241"

    .line 787
    .restart local v4       #leftUp:Ljava/lang/String;
    invoke-static {v4}, Lcom/SixClawWorm/application/PlayControlActivity1920;->string2Bytes(Ljava/lang/String;)[B

    move-result-object v6

    .line 788
    .restart local v6       #message:[B
    invoke-direct {p0, v6}, Lcom/SixClawWorm/application/PlayControlActivity1920;->sendMessage([B)V

    goto/16 :goto_0

    .line 790
    .end local v4           #leftUp:Ljava/lang/String;
    .end local v6           #message:[B
    :cond_a
    sget-boolean v9, Lcom/SixClawWorm/application/PlayControlActivity1920;->yellowOnclock:Z

    if-eqz v9, :cond_b

    .line 791
    const-string v4, "7100028002808011"

    .line 792
    .restart local v4       #leftUp:Ljava/lang/String;
    invoke-static {v4}, Lcom/SixClawWorm/application/PlayControlActivity1920;->string2Bytes(Ljava/lang/String;)[B

    move-result-object v6

    .line 793
    .restart local v6       #message:[B
    invoke-direct {p0, v6}, Lcom/SixClawWorm/application/PlayControlActivity1920;->sendMessage([B)V

    goto/16 :goto_0

    .line 795
    .end local v4           #leftUp:Ljava/lang/String;
    .end local v6           #message:[B
    :cond_b
    sget-boolean v9, Lcom/SixClawWorm/application/PlayControlActivity1920;->blueOnclock:Z

    if-eqz v9, :cond_c

    .line 796
    const-string v4, "7100028082808021"

    .line 797
    .restart local v4       #leftUp:Ljava/lang/String;
    invoke-static {v4}, Lcom/SixClawWorm/application/PlayControlActivity1920;->string2Bytes(Ljava/lang/String;)[B

    move-result-object v6

    .line 798
    .restart local v6       #message:[B
    invoke-direct {p0, v6}, Lcom/SixClawWorm/application/PlayControlActivity1920;->sendMessage([B)V

    goto/16 :goto_0

    .line 802
    .end local v4           #leftUp:Ljava/lang/String;
    .end local v6           #message:[B
    :cond_c
    const-string v4, "7100028080808001"

    .line 803
    .restart local v4       #leftUp:Ljava/lang/String;
    invoke-static {v4}, Lcom/SixClawWorm/application/PlayControlActivity1920;->string2Bytes(Ljava/lang/String;)[B

    move-result-object v6

    .line 804
    .restart local v6       #message:[B
    invoke-direct {p0, v6}, Lcom/SixClawWorm/application/PlayControlActivity1920;->sendMessage([B)V

    goto/16 :goto_0

    .line 809
    .end local v4           #leftUp:Ljava/lang/String;
    .end local v6           #message:[B
    :pswitch_3
    const-string v9, "SJF"

    const-string v10, "\u3010\u4e0b\u3011 "

    invoke-static {v9, v10}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 810
    sput-boolean v12, Lcom/SixClawWorm/application/PlayControlActivity1920;->down:Z

    .line 811
    sget-boolean v9, Lcom/SixClawWorm/application/PlayControlActivity1920;->redOnclock:Z

    if-eqz v9, :cond_d

    .line 812
    const-string v4, "7100828080808282"

    .line 813
    .restart local v4       #leftUp:Ljava/lang/String;
    invoke-static {v4}, Lcom/SixClawWorm/application/PlayControlActivity1920;->string2Bytes(Ljava/lang/String;)[B

    move-result-object v6

    .line 814
    .restart local v6       #message:[B
    invoke-direct {p0, v6}, Lcom/SixClawWorm/application/PlayControlActivity1920;->sendMessage([B)V

    goto/16 :goto_0

    .line 816
    .end local v4           #leftUp:Ljava/lang/String;
    .end local v6           #message:[B
    :cond_d
    sget-boolean v9, Lcom/SixClawWorm/application/PlayControlActivity1920;->greenOnclock:Z

    if-eqz v9, :cond_e

    .line 817
    const-string v4, "7100828080800242"

    .line 818
    .restart local v4       #leftUp:Ljava/lang/String;
    invoke-static {v4}, Lcom/SixClawWorm/application/PlayControlActivity1920;->string2Bytes(Ljava/lang/String;)[B

    move-result-object v6

    .line 819
    .restart local v6       #message:[B
    invoke-direct {p0, v6}, Lcom/SixClawWorm/application/PlayControlActivity1920;->sendMessage([B)V

    goto/16 :goto_0

    .line 821
    .end local v4           #leftUp:Ljava/lang/String;
    .end local v6           #message:[B
    :cond_e
    sget-boolean v9, Lcom/SixClawWorm/application/PlayControlActivity1920;->yellowOnclock:Z

    if-eqz v9, :cond_f

    .line 822
    const-string v4, "7100828002808012"

    .line 823
    .restart local v4       #leftUp:Ljava/lang/String;
    invoke-static {v4}, Lcom/SixClawWorm/application/PlayControlActivity1920;->string2Bytes(Ljava/lang/String;)[B

    move-result-object v6

    .line 824
    .restart local v6       #message:[B
    invoke-direct {p0, v6}, Lcom/SixClawWorm/application/PlayControlActivity1920;->sendMessage([B)V

    goto/16 :goto_0

    .line 826
    .end local v4           #leftUp:Ljava/lang/String;
    .end local v6           #message:[B
    :cond_f
    sget-boolean v9, Lcom/SixClawWorm/application/PlayControlActivity1920;->blueOnclock:Z

    if-eqz v9, :cond_10

    .line 827
    const-string v4, "7100828082808022"

    .line 828
    .restart local v4       #leftUp:Ljava/lang/String;
    invoke-static {v4}, Lcom/SixClawWorm/application/PlayControlActivity1920;->string2Bytes(Ljava/lang/String;)[B

    move-result-object v6

    .line 829
    .restart local v6       #message:[B
    invoke-direct {p0, v6}, Lcom/SixClawWorm/application/PlayControlActivity1920;->sendMessage([B)V

    goto/16 :goto_0

    .line 833
    .end local v4           #leftUp:Ljava/lang/String;
    .end local v6           #message:[B
    :cond_10
    const-string v4, "7100828080808002"

    .line 834
    .restart local v4       #leftUp:Ljava/lang/String;
    invoke-static {v4}, Lcom/SixClawWorm/application/PlayControlActivity1920;->string2Bytes(Ljava/lang/String;)[B

    move-result-object v6

    .line 835
    .restart local v6       #message:[B
    invoke-direct {p0, v6}, Lcom/SixClawWorm/application/PlayControlActivity1920;->sendMessage([B)V

    goto/16 :goto_0

    .line 840
    .end local v4           #leftUp:Ljava/lang/String;
    .end local v6           #message:[B
    :pswitch_4
    const-string v9, "SJF"

    const-string v10, "\u3010\u5de6\u4e0a\u3011 "

    invoke-static {v9, v10}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 841
    sput-boolean v12, Lcom/SixClawWorm/application/PlayControlActivity1920;->leftUp:Z

    .line 842
    sget-boolean v9, Lcom/SixClawWorm/application/PlayControlActivity1920;->redOnclock:Z

    if-eqz v9, :cond_11

    .line 843
    const-string v4, "7100028280808289"

    .line 844
    .restart local v4       #leftUp:Ljava/lang/String;
    invoke-static {v4}, Lcom/SixClawWorm/application/PlayControlActivity1920;->string2Bytes(Ljava/lang/String;)[B

    move-result-object v6

    .line 845
    .restart local v6       #message:[B
    invoke-direct {p0, v6}, Lcom/SixClawWorm/application/PlayControlActivity1920;->sendMessage([B)V

    goto/16 :goto_0

    .line 847
    .end local v4           #leftUp:Ljava/lang/String;
    .end local v6           #message:[B
    :cond_11
    sget-boolean v9, Lcom/SixClawWorm/application/PlayControlActivity1920;->greenOnclock:Z

    if-eqz v9, :cond_12

    .line 848
    const-string v4, "7100028280800249"

    .line 849
    .restart local v4       #leftUp:Ljava/lang/String;
    invoke-static {v4}, Lcom/SixClawWorm/application/PlayControlActivity1920;->string2Bytes(Ljava/lang/String;)[B

    move-result-object v6

    .line 850
    .restart local v6       #message:[B
    invoke-direct {p0, v6}, Lcom/SixClawWorm/application/PlayControlActivity1920;->sendMessage([B)V

    goto/16 :goto_0

    .line 852
    .end local v4           #leftUp:Ljava/lang/String;
    .end local v6           #message:[B
    :cond_12
    sget-boolean v9, Lcom/SixClawWorm/application/PlayControlActivity1920;->yellowOnclock:Z

    if-eqz v9, :cond_13

    .line 853
    const-string v4, "7100028202808019"

    .line 854
    .restart local v4       #leftUp:Ljava/lang/String;
    invoke-static {v4}, Lcom/SixClawWorm/application/PlayControlActivity1920;->string2Bytes(Ljava/lang/String;)[B

    move-result-object v6

    .line 855
    .restart local v6       #message:[B
    invoke-direct {p0, v6}, Lcom/SixClawWorm/application/PlayControlActivity1920;->sendMessage([B)V

    goto/16 :goto_0

    .line 857
    .end local v4           #leftUp:Ljava/lang/String;
    .end local v6           #message:[B
    :cond_13
    sget-boolean v9, Lcom/SixClawWorm/application/PlayControlActivity1920;->blueOnclock:Z

    if-eqz v9, :cond_14

    .line 858
    const-string v4, "7100028282808029"

    .line 859
    .restart local v4       #leftUp:Ljava/lang/String;
    invoke-static {v4}, Lcom/SixClawWorm/application/PlayControlActivity1920;->string2Bytes(Ljava/lang/String;)[B

    move-result-object v6

    .line 860
    .restart local v6       #message:[B
    invoke-direct {p0, v6}, Lcom/SixClawWorm/application/PlayControlActivity1920;->sendMessage([B)V

    goto/16 :goto_0

    .line 863
    .end local v4           #leftUp:Ljava/lang/String;
    .end local v6           #message:[B
    :cond_14
    const-string v4, "7100028280808009"

    .line 864
    .restart local v4       #leftUp:Ljava/lang/String;
    invoke-static {v4}, Lcom/SixClawWorm/application/PlayControlActivity1920;->string2Bytes(Ljava/lang/String;)[B

    move-result-object v8

    .line 865
    .restart local v8       #message4:[B
    invoke-direct {p0, v8}, Lcom/SixClawWorm/application/PlayControlActivity1920;->sendMessage([B)V

    goto/16 :goto_0

    .line 869
    .end local v4           #leftUp:Ljava/lang/String;
    .end local v8           #message4:[B
    :pswitch_5
    const-string v9, "SJF"

    const-string v10, "\u3010\u5de6\u4e0b\u3011 "

    invoke-static {v9, v10}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 870
    sput-boolean v12, Lcom/SixClawWorm/application/PlayControlActivity1920;->leftDown:Z

    .line 871
    sget-boolean v9, Lcom/SixClawWorm/application/PlayControlActivity1920;->redOnclock:Z

    if-eqz v9, :cond_15

    .line 872
    const-string v4, "7100828280808290"

    .line 873
    .restart local v4       #leftUp:Ljava/lang/String;
    invoke-static {v4}, Lcom/SixClawWorm/application/PlayControlActivity1920;->string2Bytes(Ljava/lang/String;)[B

    move-result-object v6

    .line 874
    .restart local v6       #message:[B
    invoke-direct {p0, v6}, Lcom/SixClawWorm/application/PlayControlActivity1920;->sendMessage([B)V

    goto/16 :goto_0

    .line 876
    .end local v4           #leftUp:Ljava/lang/String;
    .end local v6           #message:[B
    :cond_15
    sget-boolean v9, Lcom/SixClawWorm/application/PlayControlActivity1920;->greenOnclock:Z

    if-eqz v9, :cond_16

    .line 877
    const-string v4, "7100828280800250"

    .line 878
    .restart local v4       #leftUp:Ljava/lang/String;
    invoke-static {v4}, Lcom/SixClawWorm/application/PlayControlActivity1920;->string2Bytes(Ljava/lang/String;)[B

    move-result-object v6

    .line 879
    .restart local v6       #message:[B
    invoke-direct {p0, v6}, Lcom/SixClawWorm/application/PlayControlActivity1920;->sendMessage([B)V

    goto/16 :goto_0

    .line 881
    .end local v4           #leftUp:Ljava/lang/String;
    .end local v6           #message:[B
    :cond_16
    sget-boolean v9, Lcom/SixClawWorm/application/PlayControlActivity1920;->yellowOnclock:Z

    if-eqz v9, :cond_17

    .line 882
    const-string v4, "7100828202808020"

    .line 883
    .restart local v4       #leftUp:Ljava/lang/String;
    invoke-static {v4}, Lcom/SixClawWorm/application/PlayControlActivity1920;->string2Bytes(Ljava/lang/String;)[B

    move-result-object v6

    .line 884
    .restart local v6       #message:[B
    invoke-direct {p0, v6}, Lcom/SixClawWorm/application/PlayControlActivity1920;->sendMessage([B)V

    goto/16 :goto_0

    .line 886
    .end local v4           #leftUp:Ljava/lang/String;
    .end local v6           #message:[B
    :cond_17
    sget-boolean v9, Lcom/SixClawWorm/application/PlayControlActivity1920;->blueOnclock:Z

    if-eqz v9, :cond_18

    .line 887
    const-string v4, "7100828282808030"

    .line 888
    .restart local v4       #leftUp:Ljava/lang/String;
    invoke-static {v4}, Lcom/SixClawWorm/application/PlayControlActivity1920;->string2Bytes(Ljava/lang/String;)[B

    move-result-object v6

    .line 889
    .restart local v6       #message:[B
    invoke-direct {p0, v6}, Lcom/SixClawWorm/application/PlayControlActivity1920;->sendMessage([B)V

    goto/16 :goto_0

    .line 893
    .end local v4           #leftUp:Ljava/lang/String;
    .end local v6           #message:[B
    :cond_18
    const-string v4, "7100828280808010"

    .line 894
    .restart local v4       #leftUp:Ljava/lang/String;
    invoke-static {v4}, Lcom/SixClawWorm/application/PlayControlActivity1920;->string2Bytes(Ljava/lang/String;)[B

    move-result-object v8

    .line 895
    .restart local v8       #message4:[B
    invoke-direct {p0, v8}, Lcom/SixClawWorm/application/PlayControlActivity1920;->sendMessage([B)V

    goto/16 :goto_0

    .line 900
    .end local v4           #leftUp:Ljava/lang/String;
    .end local v8           #message4:[B
    :pswitch_6
    const-string v9, "SJF"

    const-string v10, "\u3010\u53f3\u4e0a\u3011 "

    invoke-static {v9, v10}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 901
    sput-boolean v12, Lcom/SixClawWorm/application/PlayControlActivity1920;->rightUp:Z

    .line 902
    sget-boolean v9, Lcom/SixClawWorm/application/PlayControlActivity1920;->redOnclock:Z

    if-eqz v9, :cond_19

    .line 903
    const-string v4, "7100020280808285"

    .line 904
    .restart local v4       #leftUp:Ljava/lang/String;
    invoke-static {v4}, Lcom/SixClawWorm/application/PlayControlActivity1920;->string2Bytes(Ljava/lang/String;)[B

    move-result-object v6

    .line 905
    .restart local v6       #message:[B
    invoke-direct {p0, v6}, Lcom/SixClawWorm/application/PlayControlActivity1920;->sendMessage([B)V

    goto/16 :goto_0

    .line 907
    .end local v4           #leftUp:Ljava/lang/String;
    .end local v6           #message:[B
    :cond_19
    sget-boolean v9, Lcom/SixClawWorm/application/PlayControlActivity1920;->greenOnclock:Z

    if-eqz v9, :cond_1a

    .line 908
    const-string v4, "7100020280800245"

    .line 909
    .restart local v4       #leftUp:Ljava/lang/String;
    invoke-static {v4}, Lcom/SixClawWorm/application/PlayControlActivity1920;->string2Bytes(Ljava/lang/String;)[B

    move-result-object v6

    .line 910
    .restart local v6       #message:[B
    invoke-direct {p0, v6}, Lcom/SixClawWorm/application/PlayControlActivity1920;->sendMessage([B)V

    goto/16 :goto_0

    .line 912
    .end local v4           #leftUp:Ljava/lang/String;
    .end local v6           #message:[B
    :cond_1a
    sget-boolean v9, Lcom/SixClawWorm/application/PlayControlActivity1920;->yellowOnclock:Z

    if-eqz v9, :cond_1b

    .line 913
    const-string v4, "7100020202808015"

    .line 914
    .restart local v4       #leftUp:Ljava/lang/String;
    invoke-static {v4}, Lcom/SixClawWorm/application/PlayControlActivity1920;->string2Bytes(Ljava/lang/String;)[B

    move-result-object v6

    .line 915
    .restart local v6       #message:[B
    invoke-direct {p0, v6}, Lcom/SixClawWorm/application/PlayControlActivity1920;->sendMessage([B)V

    goto/16 :goto_0

    .line 917
    .end local v4           #leftUp:Ljava/lang/String;
    .end local v6           #message:[B
    :cond_1b
    sget-boolean v9, Lcom/SixClawWorm/application/PlayControlActivity1920;->blueOnclock:Z

    if-eqz v9, :cond_1c

    .line 918
    const-string v4, "7100020282808025"

    .line 919
    .restart local v4       #leftUp:Ljava/lang/String;
    invoke-static {v4}, Lcom/SixClawWorm/application/PlayControlActivity1920;->string2Bytes(Ljava/lang/String;)[B

    move-result-object v6

    .line 920
    .restart local v6       #message:[B
    invoke-direct {p0, v6}, Lcom/SixClawWorm/application/PlayControlActivity1920;->sendMessage([B)V

    goto/16 :goto_0

    .line 924
    .end local v4           #leftUp:Ljava/lang/String;
    .end local v6           #message:[B
    :cond_1c
    const-string v4, "7100020280808005"

    .line 925
    .restart local v4       #leftUp:Ljava/lang/String;
    invoke-static {v4}, Lcom/SixClawWorm/application/PlayControlActivity1920;->string2Bytes(Ljava/lang/String;)[B

    move-result-object v8

    .line 926
    .restart local v8       #message4:[B
    invoke-direct {p0, v8}, Lcom/SixClawWorm/application/PlayControlActivity1920;->sendMessage([B)V

    goto/16 :goto_0

    .line 931
    .end local v4           #leftUp:Ljava/lang/String;
    .end local v8           #message4:[B
    :pswitch_7
    const-string v9, "SJF"

    const-string v10, "\u3010\u53f3\u4e0b\u3011 "

    invoke-static {v9, v10}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 932
    sput-boolean v12, Lcom/SixClawWorm/application/PlayControlActivity1920;->rightDown:Z

    .line 933
    sget-boolean v9, Lcom/SixClawWorm/application/PlayControlActivity1920;->redOnclock:Z

    if-eqz v9, :cond_1d

    .line 934
    const-string v4, "7100820280808286"

    .line 935
    .restart local v4       #leftUp:Ljava/lang/String;
    invoke-static {v4}, Lcom/SixClawWorm/application/PlayControlActivity1920;->string2Bytes(Ljava/lang/String;)[B

    move-result-object v6

    .line 936
    .restart local v6       #message:[B
    invoke-direct {p0, v6}, Lcom/SixClawWorm/application/PlayControlActivity1920;->sendMessage([B)V

    goto/16 :goto_0

    .line 938
    .end local v4           #leftUp:Ljava/lang/String;
    .end local v6           #message:[B
    :cond_1d
    sget-boolean v9, Lcom/SixClawWorm/application/PlayControlActivity1920;->greenOnclock:Z

    if-eqz v9, :cond_1e

    .line 939
    const-string v4, "7100820280800246"

    .line 940
    .restart local v4       #leftUp:Ljava/lang/String;
    invoke-static {v4}, Lcom/SixClawWorm/application/PlayControlActivity1920;->string2Bytes(Ljava/lang/String;)[B

    move-result-object v6

    .line 941
    .restart local v6       #message:[B
    invoke-direct {p0, v6}, Lcom/SixClawWorm/application/PlayControlActivity1920;->sendMessage([B)V

    goto/16 :goto_0

    .line 943
    .end local v4           #leftUp:Ljava/lang/String;
    .end local v6           #message:[B
    :cond_1e
    sget-boolean v9, Lcom/SixClawWorm/application/PlayControlActivity1920;->yellowOnclock:Z

    if-eqz v9, :cond_1f

    .line 944
    const-string v4, "7100820202808016"

    .line 945
    .restart local v4       #leftUp:Ljava/lang/String;
    invoke-static {v4}, Lcom/SixClawWorm/application/PlayControlActivity1920;->string2Bytes(Ljava/lang/String;)[B

    move-result-object v6

    .line 946
    .restart local v6       #message:[B
    invoke-direct {p0, v6}, Lcom/SixClawWorm/application/PlayControlActivity1920;->sendMessage([B)V

    goto/16 :goto_0

    .line 948
    .end local v4           #leftUp:Ljava/lang/String;
    .end local v6           #message:[B
    :cond_1f
    sget-boolean v9, Lcom/SixClawWorm/application/PlayControlActivity1920;->blueOnclock:Z

    if-eqz v9, :cond_20

    .line 949
    const-string v4, "7100820282808026"

    .line 950
    .restart local v4       #leftUp:Ljava/lang/String;
    invoke-static {v4}, Lcom/SixClawWorm/application/PlayControlActivity1920;->string2Bytes(Ljava/lang/String;)[B

    move-result-object v6

    .line 951
    .restart local v6       #message:[B
    invoke-direct {p0, v6}, Lcom/SixClawWorm/application/PlayControlActivity1920;->sendMessage([B)V

    goto/16 :goto_0

    .line 955
    .end local v4           #leftUp:Ljava/lang/String;
    .end local v6           #message:[B
    :cond_20
    const-string v4, "7100820280808006"

    .line 956
    .restart local v4       #leftUp:Ljava/lang/String;
    invoke-static {v4}, Lcom/SixClawWorm/application/PlayControlActivity1920;->string2Bytes(Ljava/lang/String;)[B

    move-result-object v8

    .line 957
    .restart local v8       #message4:[B
    invoke-direct {p0, v8}, Lcom/SixClawWorm/application/PlayControlActivity1920;->sendMessage([B)V

    goto/16 :goto_0

    .line 962
    .end local v4           #leftUp:Ljava/lang/String;
    .end local v8           #message4:[B
    :pswitch_8
    const-string v9, "SJF"

    const-string v10, "\u3010\u6447\u6746\u6309\u4e0b\u3011 "

    invoke-static {v9, v10}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 963
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v9

    iput-wide v9, p0, Lcom/SixClawWorm/application/PlayControlActivity1920;->startPauseTime:J

    .line 964
    iput-boolean v13, p0, Lcom/SixClawWorm/application/PlayControlActivity1920;->UpSongkai:Z

    goto/16 :goto_0

    .line 967
    :pswitch_9
    iget-wide v0, p0, Lcom/SixClawWorm/application/PlayControlActivity1920;->startPauseTime:J

    .line 968
    .local v0, MstartPauseTime:J
    iput-boolean v12, p0, Lcom/SixClawWorm/application/PlayControlActivity1920;->UpSongkai:Z

    .line 969
    sget-object v9, Ljava/lang/System;->out:Ljava/io/PrintStream;

    invoke-virtual {v9, v0, v1}, Ljava/io/PrintStream;->println(J)V

    .line 970
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    .line 971
    .local v2, endPauseTime:J
    sub-long v9, v2, v0

    iput-wide v9, p0, Lcom/SixClawWorm/application/PlayControlActivity1920;->stopTime:J

    .line 972
    sget-object v9, Ljava/lang/System;->out:Ljava/io/PrintStream;

    iget-wide v10, p0, Lcom/SixClawWorm/application/PlayControlActivity1920;->stopTime:J

    invoke-virtual {v9, v10, v11}, Ljava/io/PrintStream;->println(J)V

    .line 973
    const-string v9, "SJF"

    const-string v10, "\u3010\u6447\u6746\u677e\u5f00\u3011 "

    invoke-static {v9, v10}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 974
    sput-boolean v13, Lcom/SixClawWorm/application/PlayControlActivity1920;->left:Z

    .line 975
    sput-boolean v13, Lcom/SixClawWorm/application/PlayControlActivity1920;->right:Z

    .line 976
    sput-boolean v13, Lcom/SixClawWorm/application/PlayControlActivity1920;->leftDown:Z

    .line 977
    sput-boolean v13, Lcom/SixClawWorm/application/PlayControlActivity1920;->leftUp:Z

    .line 978
    sput-boolean v13, Lcom/SixClawWorm/application/PlayControlActivity1920;->rightDown:Z

    .line 979
    sput-boolean v13, Lcom/SixClawWorm/application/PlayControlActivity1920;->rightUp:Z

    .line 980
    sput-boolean v13, Lcom/SixClawWorm/application/PlayControlActivity1920;->up:Z

    .line 981
    sput-boolean v13, Lcom/SixClawWorm/application/PlayControlActivity1920;->down:Z

    .line 982
    sget-boolean v9, Lcom/SixClawWorm/application/PlayControlActivity1920;->right:Z

    if-nez v9, :cond_0

    goto/16 :goto_0

    .line 712
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

    .line 263
    sget-object v2, Lcom/SixClawWorm/utils/Param;->ChatService:Lcom/SixClawWorm/application/BluetoothChatService;

    iput-object v2, p0, Lcom/SixClawWorm/application/PlayControlActivity1920;->mChatService:Lcom/SixClawWorm/application/BluetoothChatService;

    .line 264
    new-instance v2, Ljava/lang/StringBuffer;

    const-string v3, ""

    invoke-direct {v2, v3}, Ljava/lang/StringBuffer;-><init>(Ljava/lang/String;)V

    iput-object v2, p0, Lcom/SixClawWorm/application/PlayControlActivity1920;->mOutStringBuffer:Ljava/lang/StringBuffer;

    .line 265
    iget-object v2, p0, Lcom/SixClawWorm/application/PlayControlActivity1920;->mChatService:Lcom/SixClawWorm/application/BluetoothChatService;

    if-eqz v2, :cond_0

    .line 266
    iget-object v2, p0, Lcom/SixClawWorm/application/PlayControlActivity1920;->mChatService:Lcom/SixClawWorm/application/BluetoothChatService;

    invoke-virtual {v2}, Lcom/SixClawWorm/application/BluetoothChatService;->getState()I

    move-result v2

    const/4 v3, 0x3

    if-eq v2, v3, :cond_1

    .line 268
    sput-boolean v4, Lcom/SixClawWorm/utils/Param;->ConntectSucceed:Z

    .line 318
    :cond_0
    :goto_0
    return-void

    .line 272
    :cond_1
    new-instance v2, Lcom/SixClawWorm/application/PlayControlActivity1920$3;

    invoke-direct {v2, p0}, Lcom/SixClawWorm/application/PlayControlActivity1920$3;-><init>(Lcom/SixClawWorm/application/PlayControlActivity1920;)V

    .line 285
    invoke-virtual {v2}, Lcom/SixClawWorm/application/PlayControlActivity1920$3;->start()V

    .line 287
    array-length v2, p1

    if-lez v2, :cond_4

    .line 288
    iget-object v2, p0, Lcom/SixClawWorm/application/PlayControlActivity1920;->mChatService:Lcom/SixClawWorm/application/BluetoothChatService;

    invoke-virtual {v2, p1}, Lcom/SixClawWorm/application/BluetoothChatService;->write([B)V

    .line 289
    iget-object v2, p0, Lcom/SixClawWorm/application/PlayControlActivity1920;->mOutStringBuffer:Ljava/lang/StringBuffer;

    invoke-virtual {v2, v4}, Ljava/lang/StringBuffer;->setLength(I)V

    .line 290
    sget-boolean v2, Lcom/SixClawWorm/application/PlayControlActivity1920;->left:Z

    if-nez v2, :cond_2

    sget-boolean v2, Lcom/SixClawWorm/application/PlayControlActivity1920;->right:Z

    if-nez v2, :cond_2

    sget-boolean v2, Lcom/SixClawWorm/application/PlayControlActivity1920;->blueOnclock:Z

    if-nez v2, :cond_2

    sget-boolean v2, Lcom/SixClawWorm/application/PlayControlActivity1920;->yellowOnclock:Z

    if-eqz v2, :cond_5

    :cond_2
    iget-wide v2, p0, Lcom/SixClawWorm/application/PlayControlActivity1920;->stopTime:J

    cmp-long v2, v2, v6

    if-ltz v2, :cond_3

    sget-wide v2, Lcom/SixClawWorm/utils/GButton;->stopTime:J

    cmp-long v2, v2, v6

    if-gez v2, :cond_5

    :cond_3
    iget-wide v2, p0, Lcom/SixClawWorm/application/PlayControlActivity1920;->startPauseTime:J

    iget-wide v4, p0, Lcom/SixClawWorm/application/PlayControlActivity1920;->stopTime:J

    cmp-long v2, v2, v4

    if-eqz v2, :cond_5

    .line 291
    sget-boolean v2, Lcom/SixClawWorm/application/PlayControlActivity1920;->redOnclock:Z

    if-nez v2, :cond_5

    sget-boolean v2, Lcom/SixClawWorm/application/PlayControlActivity1920;->blueOnclock:Z

    if-nez v2, :cond_5

    sget-boolean v2, Lcom/SixClawWorm/application/PlayControlActivity1920;->yellowOnclock:Z

    if-nez v2, :cond_5

    .line 292
    sget-boolean v2, Lcom/SixClawWorm/application/PlayControlActivity1920;->greenOnclock:Z

    if-nez v2, :cond_5

    .line 293
    const-string v0, "7100808080808001"

    .line 294
    .local v0, leftUp2:Ljava/lang/String;
    invoke-static {v0}, Lcom/SixClawWorm/application/PlayControlActivity1920;->string2Bytes(Ljava/lang/String;)[B

    move-result-object v1

    .line 295
    .local v1, message2:[B
    invoke-direct {p0, v1}, Lcom/SixClawWorm/application/PlayControlActivity1920;->TsendMessage([B)V

    .line 296
    iget-wide v2, p0, Lcom/SixClawWorm/application/PlayControlActivity1920;->stopTime:J

    iput-wide v2, p0, Lcom/SixClawWorm/application/PlayControlActivity1920;->startPauseTime:J

    .line 315
    .end local v0           #leftUp2:Ljava/lang/String;
    .end local v1           #message2:[B
    :cond_4
    :goto_1
    const/4 v2, 0x1

    iput-boolean v2, p0, Lcom/SixClawWorm/application/PlayControlActivity1920;->stopThread:Z

    goto :goto_0

    .line 298
    :cond_5
    sget-boolean v2, Lcom/SixClawWorm/application/PlayControlActivity1920;->blueOnclock:Z

    if-nez v2, :cond_6

    sget-boolean v2, Lcom/SixClawWorm/application/PlayControlActivity1920;->yellowOnclock:Z

    if-eqz v2, :cond_4

    :cond_6
    sget-wide v2, Lcom/SixClawWorm/utils/GButton;->stopTime:J

    cmp-long v2, v2, v6

    if-gez v2, :cond_4

    sget-wide v2, Lcom/SixClawWorm/utils/GButton;->startPauseTime:J

    sget-wide v4, Lcom/SixClawWorm/utils/GButton;->stopTime:J

    cmp-long v2, v2, v4

    if-eqz v2, :cond_4

    .line 299
    sget-boolean v2, Lcom/SixClawWorm/application/PlayControlActivity1920;->up:Z

    if-nez v2, :cond_4

    .line 300
    sget-boolean v2, Lcom/SixClawWorm/application/PlayControlActivity1920;->down:Z

    if-nez v2, :cond_4

    .line 301
    sget-boolean v2, Lcom/SixClawWorm/application/PlayControlActivity1920;->left:Z

    if-nez v2, :cond_4

    .line 302
    sget-boolean v2, Lcom/SixClawWorm/application/PlayControlActivity1920;->leftDown:Z

    if-nez v2, :cond_4

    .line 303
    sget-boolean v2, Lcom/SixClawWorm/application/PlayControlActivity1920;->leftUp:Z

    if-nez v2, :cond_4

    .line 304
    sget-boolean v2, Lcom/SixClawWorm/application/PlayControlActivity1920;->right:Z

    if-nez v2, :cond_4

    .line 305
    sget-boolean v2, Lcom/SixClawWorm/application/PlayControlActivity1920;->rightDown:Z

    if-nez v2, :cond_4

    .line 306
    sget-boolean v2, Lcom/SixClawWorm/application/PlayControlActivity1920;->rightUp:Z

    if-nez v2, :cond_4

    .line 307
    const-string v0, "7100808080808001"

    .line 308
    .restart local v0       #leftUp2:Ljava/lang/String;
    invoke-static {v0}, Lcom/SixClawWorm/application/PlayControlActivity1920;->string2Bytes(Ljava/lang/String;)[B

    move-result-object v1

    .line 309
    .restart local v1       #message2:[B
    invoke-direct {p0, v1}, Lcom/SixClawWorm/application/PlayControlActivity1920;->TsendMessage([B)V

    .line 310
    const-wide/16 v2, 0x258

    sput-wide v2, Lcom/SixClawWorm/utils/GButton;->stopTime:J

    goto :goto_1
.end method

.method private static string2Bytes(Ljava/lang/String;)[B
    .locals 6
    .parameter "str"

    .prologue
    .line 698
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v4

    div-int/lit8 v1, v4, 0x2

    .line 699
    .local v1, blen:I
    new-array v2, v1, [B

    .line 700
    .local v2, data:[B
    const/4 v3, 0x0

    .local v3, i:I
    :goto_0
    if-lt v3, v1, :cond_0

    .line 705
    return-object v2

    .line 702
    :cond_0
    mul-int/lit8 v4, v3, 0x2

    add-int/lit8 v5, v3, 0x1

    mul-int/lit8 v5, v5, 0x2

    invoke-virtual {p0, v4, v5}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v0

    .line 703
    .local v0, bStr:Ljava/lang/String;
    const/16 v4, 0x10

    invoke-static {v0, v4}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;I)I

    move-result v4

    int-to-byte v4, v4

    aput-byte v4, v2, v3

    .line 700
    add-int/lit8 v3, v3, 0x1

    goto :goto_0
.end method


# virtual methods
.method protected onCreate(Landroid/os/Bundle;)V
    .locals 1
    .parameter "pSavedInstanceState"

    .prologue
    .line 1009
    invoke-static {}, Lcom/SixClawWorm/utils/ExitApplication;->getInstance()Lcom/SixClawWorm/utils/ExitApplication;

    move-result-object v0

    invoke-virtual {v0, p0}, Lcom/SixClawWorm/utils/ExitApplication;->addActivity(Landroid/app/Activity;)V

    .line 1010
    invoke-super {p0, p1}, Lorg/anddev/andengine/ui/activity/BaseGameActivity;->onCreate(Landroid/os/Bundle;)V

    .line 1012
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/SixClawWorm/application/PlayControlActivity1920;->stopThread:Z

    .line 1013
    return-void
.end method

.method protected onDestroy()V
    .locals 2

    .prologue
    .line 1034
    iget-object v0, p0, Lcom/SixClawWorm/application/PlayControlActivity1920;->handler:Landroid/os/Handler;

    iget-object v1, p0, Lcom/SixClawWorm/application/PlayControlActivity1920;->runnable:Ljava/lang/Runnable;

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 1035
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/SixClawWorm/application/PlayControlActivity1920;->stopThread:Z

    .line 1036
    const/4 v0, 0x0

    sput-boolean v0, Lcom/SixClawWorm/utils/GButton;->isPlayControl:Z

    .line 1037
    iget-object v0, p0, Lcom/SixClawWorm/application/PlayControlActivity1920;->mEngine:Lorg/anddev/andengine/engine/Engine;

    invoke-virtual {v0}, Lorg/anddev/andengine/engine/Engine;->getTextureManager()Lorg/anddev/andengine/opengl/texture/TextureManager;

    move-result-object v0

    iget-object v1, p0, Lcom/SixClawWorm/application/PlayControlActivity1920;->mTexture:Lorg/anddev/andengine/opengl/texture/Texture;

    invoke-virtual {v0, v1}, Lorg/anddev/andengine/opengl/texture/TextureManager;->unloadTexture(Lorg/anddev/andengine/opengl/texture/Texture;)Z

    .line 1038
    iget-object v0, p0, Lcom/SixClawWorm/application/PlayControlActivity1920;->mEngine:Lorg/anddev/andengine/engine/Engine;

    invoke-virtual {v0}, Lorg/anddev/andengine/engine/Engine;->getTextureManager()Lorg/anddev/andengine/opengl/texture/TextureManager;

    move-result-object v0

    iget-object v1, p0, Lcom/SixClawWorm/application/PlayControlActivity1920;->mOnScreenControlTexture:Lorg/anddev/andengine/opengl/texture/Texture;

    invoke-virtual {v0, v1}, Lorg/anddev/andengine/opengl/texture/TextureManager;->unloadTexture(Lorg/anddev/andengine/opengl/texture/Texture;)Z

    .line 1039
    iget-object v0, p0, Lcom/SixClawWorm/application/PlayControlActivity1920;->mEngine:Lorg/anddev/andengine/engine/Engine;

    invoke-virtual {v0}, Lorg/anddev/andengine/engine/Engine;->getTextureManager()Lorg/anddev/andengine/opengl/texture/TextureManager;

    move-result-object v0

    iget-object v1, p0, Lcom/SixClawWorm/application/PlayControlActivity1920;->mControlButtonTexture:Lorg/anddev/andengine/opengl/texture/Texture;

    invoke-virtual {v0, v1}, Lorg/anddev/andengine/opengl/texture/TextureManager;->unloadTexture(Lorg/anddev/andengine/opengl/texture/Texture;)Z

    .line 1040
    invoke-super {p0}, Lorg/anddev/andengine/ui/activity/BaseGameActivity;->onDestroy()V

    .line 1041
    return-void
.end method

.method public onKeyDown(ILandroid/view/KeyEvent;)Z
    .locals 3
    .parameter "keyCode"
    .parameter "event"

    .prologue
    const/4 v2, 0x1

    .line 995
    const/4 v0, 0x4

    if-ne p1, v0, :cond_0

    .line 996
    iput-boolean v2, p0, Lcom/SixClawWorm/application/PlayControlActivity1920;->stopThread:Z

    .line 997
    iget-object v0, p0, Lcom/SixClawWorm/application/PlayControlActivity1920;->handler:Landroid/os/Handler;

    iget-object v1, p0, Lcom/SixClawWorm/application/PlayControlActivity1920;->runnable:Ljava/lang/Runnable;

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 998
    sput-boolean v2, Lcom/SixClawWorm/application/PlayControlActivity1920;->ifPlayControlActivity:Z

    .line 999
    invoke-virtual {p0}, Lcom/SixClawWorm/application/PlayControlActivity1920;->finish()V

    .line 1005
    :cond_0
    invoke-super {p0, p1, p2}, Lorg/anddev/andengine/ui/activity/BaseGameActivity;->onKeyDown(ILandroid/view/KeyEvent;)Z

    move-result v0

    return v0
.end method

.method public onLoadComplete()V
    .locals 0

    .prologue
    .line 689
    return-void
.end method

.method public onLoadEngine()Lorg/anddev/andengine/engine/Engine;
    .locals 7

    .prologue
    const/4 v5, 0x0

    .line 133
    invoke-static {p0}, Lcom/SixClawWorm/utils/PlatformScreen;->GetWidth(Landroid/app/Activity;)I

    move-result v1

    iput v1, p0, Lcom/SixClawWorm/application/PlayControlActivity1920;->CAMERA_WIDTH:I

    .line 134
    invoke-static {p0}, Lcom/SixClawWorm/utils/PlatformScreen;->GetHeight(Landroid/app/Activity;)I

    move-result v1

    iput v1, p0, Lcom/SixClawWorm/application/PlayControlActivity1920;->CAMERA_HEIGHT:I

    .line 135
    invoke-static {}, Lcom/SixClawWorm/utils/ExitApplication;->getInstance()Lcom/SixClawWorm/utils/ExitApplication;

    move-result-object v1

    invoke-virtual {v1, p0}, Lcom/SixClawWorm/utils/ExitApplication;->addActivity(Landroid/app/Activity;)V

    .line 136
    iget-object v1, p0, Lcom/SixClawWorm/application/PlayControlActivity1920;->handler:Landroid/os/Handler;

    iget-object v2, p0, Lcom/SixClawWorm/application/PlayControlActivity1920;->runnable:Ljava/lang/Runnable;

    const-wide/16 v3, 0x64

    invoke-virtual {v1, v2, v3, v4}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 137
    new-instance v1, Lorg/anddev/andengine/engine/camera/Camera;

    iget v2, p0, Lcom/SixClawWorm/application/PlayControlActivity1920;->CAMERA_WIDTH:I

    int-to-float v2, v2

    iget v3, p0, Lcom/SixClawWorm/application/PlayControlActivity1920;->CAMERA_HEIGHT:I

    int-to-float v3, v3

    invoke-direct {v1, v5, v5, v2, v3}, Lorg/anddev/andengine/engine/camera/Camera;-><init>(FFFF)V

    iput-object v1, p0, Lcom/SixClawWorm/application/PlayControlActivity1920;->mCamera:Lorg/anddev/andengine/engine/camera/Camera;

    .line 141
    new-instance v0, Lorg/anddev/andengine/engine/Engine;

    new-instance v1, Lorg/anddev/andengine/engine/options/EngineOptions;

    const/4 v2, 0x1

    sget-object v3, Lorg/anddev/andengine/engine/options/EngineOptions$ScreenOrientation;->LANDSCAPE:Lorg/anddev/andengine/engine/options/EngineOptions$ScreenOrientation;

    .line 142
    new-instance v4, Lorg/anddev/andengine/engine/options/resolutionpolicy/RatioResolutionPolicy;

    iget v5, p0, Lcom/SixClawWorm/application/PlayControlActivity1920;->CAMERA_WIDTH:I

    int-to-float v5, v5

    iget v6, p0, Lcom/SixClawWorm/application/PlayControlActivity1920;->CAMERA_HEIGHT:I

    int-to-float v6, v6

    invoke-direct {v4, v5, v6}, Lorg/anddev/andengine/engine/options/resolutionpolicy/RatioResolutionPolicy;-><init>(FF)V

    iget-object v5, p0, Lcom/SixClawWorm/application/PlayControlActivity1920;->mCamera:Lorg/anddev/andengine/engine/camera/Camera;

    invoke-direct {v1, v2, v3, v4, v5}, Lorg/anddev/andengine/engine/options/EngineOptions;-><init>(ZLorg/anddev/andengine/engine/options/EngineOptions$ScreenOrientation;Lorg/anddev/andengine/engine/options/resolutionpolicy/IResolutionPolicy;Lorg/anddev/andengine/engine/camera/Camera;)V

    .line 141
    invoke-direct {v0, v1}, Lorg/anddev/andengine/engine/Engine;-><init>(Lorg/anddev/andengine/engine/options/EngineOptions;)V

    .line 144
    .local v0, engine:Lorg/anddev/andengine/engine/Engine;
    :try_start_0
    invoke-static {p0}, Lorg/anddev/andengine/extension/input/touch/controller/MultiTouch;->isSupported(Landroid/content/Context;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 145
    new-instance v1, Lorg/anddev/andengine/extension/input/touch/controller/MultiTouchController;

    invoke-direct {v1}, Lorg/anddev/andengine/extension/input/touch/controller/MultiTouchController;-><init>()V

    invoke-virtual {v0, v1}, Lorg/anddev/andengine/engine/Engine;->setTouchController(Lorg/anddev/andengine/input/touch/controller/ITouchController;)V

    .line 146
    invoke-static {p0}, Lorg/anddev/andengine/extension/input/touch/controller/MultiTouch;->isSupportedDistinct(Landroid/content/Context;)Z
    :try_end_0
    .catch Lorg/anddev/andengine/extension/input/touch/controller/MultiTouchException; {:try_start_0 .. :try_end_0} :catch_0

    .line 158
    :cond_0
    :goto_0
    return-object v0

    .line 154
    :catch_0
    move-exception v1

    goto :goto_0
.end method

.method public onLoadResources()V
    .locals 14

    .prologue
    const/16 v4, 0x438

    const/16 v13, 0x400

    const/4 v11, 0x2

    const/4 v5, 0x1

    const/4 v3, 0x0

    .line 165
    const-string v0, "gfx/"

    invoke-static {v0}, Lorg/anddev/andengine/opengl/texture/region/TextureRegionFactory;->setAssetBasePath(Ljava/lang/String;)V

    .line 168
    new-instance v0, Lorg/anddev/andengine/engine/camera/hud/HUD;

    invoke-direct {v0}, Lorg/anddev/andengine/engine/camera/hud/HUD;-><init>()V

    iput-object v0, p0, Lcom/SixClawWorm/application/PlayControlActivity1920;->mHudScene:Lorg/anddev/andengine/engine/camera/hud/HUD;

    .line 169
    invoke-static {p0}, Lcom/SixClawWorm/utils/PlatformScreen;->GetWidth(Landroid/app/Activity;)I

    move-result v0

    iput v0, p0, Lcom/SixClawWorm/application/PlayControlActivity1920;->CAMERA_WIDTH:I

    .line 170
    invoke-static {p0}, Lcom/SixClawWorm/utils/PlatformScreen;->GetHeight(Landroid/app/Activity;)I

    move-result v0

    iput v0, p0, Lcom/SixClawWorm/application/PlayControlActivity1920;->CAMERA_HEIGHT:I

    .line 173
    new-instance v0, Lorg/anddev/andengine/opengl/texture/Texture;

    const/16 v1, 0x800

    const/16 v2, 0x800

    .line 174
    sget-object v6, Lorg/anddev/andengine/opengl/texture/TextureOptions;->BILINEAR_PREMULTIPLYALPHA:Lorg/anddev/andengine/opengl/texture/TextureOptions;

    invoke-direct {v0, v1, v2, v6}, Lorg/anddev/andengine/opengl/texture/Texture;-><init>(IILorg/anddev/andengine/opengl/texture/TextureOptions;)V

    .line 173
    iput-object v0, p0, Lcom/SixClawWorm/application/PlayControlActivity1920;->mTexture:Lorg/anddev/andengine/opengl/texture/Texture;

    .line 176
    iget-object v0, p0, Lcom/SixClawWorm/application/PlayControlActivity1920;->mTexture:Lorg/anddev/andengine/opengl/texture/Texture;

    const-string v1, "background-1920.jpg"

    .line 175
    invoke-static {v0, p0, v1, v3, v3}, Lorg/anddev/andengine/opengl/texture/region/TextureRegionFactory;->createFromAsset(Lorg/anddev/andengine/opengl/texture/Texture;Landroid/content/Context;Ljava/lang/String;II)Lorg/anddev/andengine/opengl/texture/region/TextureRegion;

    move-result-object v0

    iput-object v0, p0, Lcom/SixClawWorm/application/PlayControlActivity1920;->mBackgroundTextureRegion:Lorg/anddev/andengine/opengl/texture/region/TextureRegion;

    .line 178
    iget-object v0, p0, Lcom/SixClawWorm/application/PlayControlActivity1920;->mTexture:Lorg/anddev/andengine/opengl/texture/Texture;

    .line 179
    const-string v2, "signal41920.png"

    move-object v1, p0

    move v6, v5

    .line 178
    invoke-static/range {v0 .. v6}, Lorg/anddev/andengine/opengl/texture/region/TextureRegionFactory;->createTiledFromAsset(Lorg/anddev/andengine/opengl/texture/Texture;Landroid/content/Context;Ljava/lang/String;IIII)Lorg/anddev/andengine/opengl/texture/region/TiledTextureRegion;

    move-result-object v0

    iput-object v0, p0, Lcom/SixClawWorm/application/PlayControlActivity1920;->singalSpriteRegion:Lorg/anddev/andengine/opengl/texture/region/TiledTextureRegion;

    .line 185
    iget-object v6, p0, Lcom/SixClawWorm/application/PlayControlActivity1920;->mTexture:Lorg/anddev/andengine/opengl/texture/Texture;

    .line 186
    const-string v8, "btn_back1920.png"

    const/16 v9, 0x5d

    move-object v7, p0

    move v10, v4

    move v12, v5

    .line 185
    invoke-static/range {v6 .. v12}, Lorg/anddev/andengine/opengl/texture/region/TextureRegionFactory;->createTiledFromAsset(Lorg/anddev/andengine/opengl/texture/Texture;Landroid/content/Context;Ljava/lang/String;IIII)Lorg/anddev/andengine/opengl/texture/region/TiledTextureRegion;

    move-result-object v0

    iput-object v0, p0, Lcom/SixClawWorm/application/PlayControlActivity1920;->backButtonRegion:Lorg/anddev/andengine/opengl/texture/region/TiledTextureRegion;

    .line 188
    iget-object v6, p0, Lcom/SixClawWorm/application/PlayControlActivity1920;->mTexture:Lorg/anddev/andengine/opengl/texture/Texture;

    .line 189
    const-string v8, "btn_about1920.png"

    const/16 v9, 0x1d3

    move-object v7, p0

    move v10, v4

    move v12, v5

    .line 188
    invoke-static/range {v6 .. v12}, Lorg/anddev/andengine/opengl/texture/region/TextureRegionFactory;->createTiledFromAsset(Lorg/anddev/andengine/opengl/texture/Texture;Landroid/content/Context;Ljava/lang/String;IIII)Lorg/anddev/andengine/opengl/texture/region/TiledTextureRegion;

    move-result-object v0

    iput-object v0, p0, Lcom/SixClawWorm/application/PlayControlActivity1920;->aboutButtonRegion:Lorg/anddev/andengine/opengl/texture/region/TiledTextureRegion;

    .line 191
    new-instance v0, Lorg/anddev/andengine/opengl/texture/Texture;

    .line 192
    sget-object v1, Lorg/anddev/andengine/opengl/texture/TextureOptions;->BILINEAR_PREMULTIPLYALPHA:Lorg/anddev/andengine/opengl/texture/TextureOptions;

    invoke-direct {v0, v13, v13, v1}, Lorg/anddev/andengine/opengl/texture/Texture;-><init>(IILorg/anddev/andengine/opengl/texture/TextureOptions;)V

    .line 191
    iput-object v0, p0, Lcom/SixClawWorm/application/PlayControlActivity1920;->mOnScreenControlTexture:Lorg/anddev/andengine/opengl/texture/Texture;

    .line 196
    iget-object v0, p0, Lcom/SixClawWorm/application/PlayControlActivity1920;->mOnScreenControlTexture:Lorg/anddev/andengine/opengl/texture/Texture;

    .line 197
    const-string v1, "control_base1920.png"

    const/16 v2, 0xc8

    .line 196
    invoke-static {v0, p0, v1, v2, v3}, Lorg/anddev/andengine/opengl/texture/region/TextureRegionFactory;->createFromAsset(Lorg/anddev/andengine/opengl/texture/Texture;Landroid/content/Context;Ljava/lang/String;II)Lorg/anddev/andengine/opengl/texture/region/TextureRegion;

    move-result-object v0

    .line 195
    iput-object v0, p0, Lcom/SixClawWorm/application/PlayControlActivity1920;->mOnScreenControlBaseTextureRegion:Lorg/anddev/andengine/opengl/texture/region/TextureRegion;

    .line 200
    iget-object v0, p0, Lcom/SixClawWorm/application/PlayControlActivity1920;->mOnScreenControlTexture:Lorg/anddev/andengine/opengl/texture/Texture;

    .line 201
    const-string v1, "control_knob1920.png"

    const/16 v2, 0xfa

    const/16 v4, 0x28a

    .line 200
    invoke-static {v0, p0, v1, v2, v4}, Lorg/anddev/andengine/opengl/texture/region/TextureRegionFactory;->createFromAsset(Lorg/anddev/andengine/opengl/texture/Texture;Landroid/content/Context;Ljava/lang/String;II)Lorg/anddev/andengine/opengl/texture/region/TextureRegion;

    move-result-object v0

    .line 199
    iput-object v0, p0, Lcom/SixClawWorm/application/PlayControlActivity1920;->mOnScreenControlKnobTextureRegion:Lorg/anddev/andengine/opengl/texture/region/TextureRegion;

    .line 204
    new-instance v0, Lorg/anddev/andengine/opengl/texture/Texture;

    const/16 v1, 0x200

    .line 205
    sget-object v2, Lorg/anddev/andengine/opengl/texture/TextureOptions;->BILINEAR_PREMULTIPLYALPHA:Lorg/anddev/andengine/opengl/texture/TextureOptions;

    invoke-direct {v0, v13, v1, v2}, Lorg/anddev/andengine/opengl/texture/Texture;-><init>(IILorg/anddev/andengine/opengl/texture/TextureOptions;)V

    .line 204
    iput-object v0, p0, Lcom/SixClawWorm/application/PlayControlActivity1920;->mControlButtonTexture:Lorg/anddev/andengine/opengl/texture/Texture;

    .line 207
    iget-object v6, p0, Lcom/SixClawWorm/application/PlayControlActivity1920;->mControlButtonTexture:Lorg/anddev/andengine/opengl/texture/Texture;

    .line 208
    const-string v8, "btn_green1920.png"

    move-object v7, p0

    move v9, v3

    move v10, v3

    move v12, v5

    .line 207
    invoke-static/range {v6 .. v12}, Lorg/anddev/andengine/opengl/texture/region/TextureRegionFactory;->createTiledFromAsset(Lorg/anddev/andengine/opengl/texture/Texture;Landroid/content/Context;Ljava/lang/String;IIII)Lorg/anddev/andengine/opengl/texture/region/TiledTextureRegion;

    move-result-object v0

    iput-object v0, p0, Lcom/SixClawWorm/application/PlayControlActivity1920;->greenButtonRegion:Lorg/anddev/andengine/opengl/texture/region/TiledTextureRegion;

    .line 210
    iget-object v6, p0, Lcom/SixClawWorm/application/PlayControlActivity1920;->mControlButtonTexture:Lorg/anddev/andengine/opengl/texture/Texture;

    .line 211
    const-string v8, "btn_red1920.png"

    const/16 v9, 0x1a4

    move-object v7, p0

    move v10, v3

    move v12, v5

    .line 210
    invoke-static/range {v6 .. v12}, Lorg/anddev/andengine/opengl/texture/region/TextureRegionFactory;->createTiledFromAsset(Lorg/anddev/andengine/opengl/texture/Texture;Landroid/content/Context;Ljava/lang/String;IIII)Lorg/anddev/andengine/opengl/texture/region/TiledTextureRegion;

    move-result-object v0

    iput-object v0, p0, Lcom/SixClawWorm/application/PlayControlActivity1920;->redButtonRegion:Lorg/anddev/andengine/opengl/texture/region/TiledTextureRegion;

    .line 213
    iget-object v6, p0, Lcom/SixClawWorm/application/PlayControlActivity1920;->mControlButtonTexture:Lorg/anddev/andengine/opengl/texture/Texture;

    .line 214
    const-string v8, "btn_blue1920.png"

    const/16 v10, 0xd2

    move-object v7, p0

    move v9, v3

    move v12, v5

    .line 213
    invoke-static/range {v6 .. v12}, Lorg/anddev/andengine/opengl/texture/region/TextureRegionFactory;->createTiledFromAsset(Lorg/anddev/andengine/opengl/texture/Texture;Landroid/content/Context;Ljava/lang/String;IIII)Lorg/anddev/andengine/opengl/texture/region/TiledTextureRegion;

    move-result-object v0

    iput-object v0, p0, Lcom/SixClawWorm/application/PlayControlActivity1920;->blueButtonRegion:Lorg/anddev/andengine/opengl/texture/region/TiledTextureRegion;

    .line 216
    iget-object v6, p0, Lcom/SixClawWorm/application/PlayControlActivity1920;->mControlButtonTexture:Lorg/anddev/andengine/opengl/texture/Texture;

    .line 217
    const-string v8, "btn_yellow1920.png"

    const/16 v9, 0x1a4

    const/16 v10, 0xd2

    move-object v7, p0

    move v12, v5

    .line 216
    invoke-static/range {v6 .. v12}, Lorg/anddev/andengine/opengl/texture/region/TextureRegionFactory;->createTiledFromAsset(Lorg/anddev/andengine/opengl/texture/Texture;Landroid/content/Context;Ljava/lang/String;IIII)Lorg/anddev/andengine/opengl/texture/region/TiledTextureRegion;

    move-result-object v0

    iput-object v0, p0, Lcom/SixClawWorm/application/PlayControlActivity1920;->yellowButtonRegion:Lorg/anddev/andengine/opengl/texture/region/TiledTextureRegion;

    .line 220
    iget-object v0, p0, Lcom/SixClawWorm/application/PlayControlActivity1920;->mEngine:Lorg/anddev/andengine/engine/Engine;

    invoke-virtual {v0}, Lorg/anddev/andengine/engine/Engine;->getTextureManager()Lorg/anddev/andengine/opengl/texture/TextureManager;

    move-result-object v0

    const/4 v1, 0x3

    new-array v1, v1, [Lorg/anddev/andengine/opengl/texture/Texture;

    iget-object v2, p0, Lcom/SixClawWorm/application/PlayControlActivity1920;->mTexture:Lorg/anddev/andengine/opengl/texture/Texture;

    aput-object v2, v1, v3

    .line 221
    iget-object v2, p0, Lcom/SixClawWorm/application/PlayControlActivity1920;->mOnScreenControlTexture:Lorg/anddev/andengine/opengl/texture/Texture;

    aput-object v2, v1, v5

    iget-object v2, p0, Lcom/SixClawWorm/application/PlayControlActivity1920;->mControlButtonTexture:Lorg/anddev/andengine/opengl/texture/Texture;

    aput-object v2, v1, v11

    .line 220
    invoke-virtual {v0, v1}, Lorg/anddev/andengine/opengl/texture/TextureManager;->loadTextures([Lorg/anddev/andengine/opengl/texture/Texture;)V

    .line 222
    return-void
.end method

.method public onLoadScene()Lorg/anddev/andengine/entity/scene/Scene;
    .locals 11

    .prologue
    .line 353
    iget-object v1, p0, Lcom/SixClawWorm/application/PlayControlActivity1920;->mEngine:Lorg/anddev/andengine/engine/Engine;

    new-instance v2, Lorg/anddev/andengine/entity/util/FPSLogger;

    invoke-direct {v2}, Lorg/anddev/andengine/entity/util/FPSLogger;-><init>()V

    invoke-virtual {v1, v2}, Lorg/anddev/andengine/engine/Engine;->registerUpdateHandler(Lorg/anddev/andengine/engine/handler/IUpdateHandler;)V

    .line 354
    new-instance v10, Lorg/anddev/andengine/entity/scene/Scene;

    const/4 v1, 0x1

    invoke-direct {v10, v1}, Lorg/anddev/andengine/entity/scene/Scene;-><init>(I)V

    .line 355
    .local v10, scene:Lorg/anddev/andengine/entity/scene/Scene;
    iget-object v1, p0, Lcom/SixClawWorm/application/PlayControlActivity1920;->mCamera:Lorg/anddev/andengine/engine/camera/Camera;

    iget-object v2, p0, Lcom/SixClawWorm/application/PlayControlActivity1920;->mHudScene:Lorg/anddev/andengine/engine/camera/hud/HUD;

    invoke-virtual {v1, v2}, Lorg/anddev/andengine/engine/camera/Camera;->setHUD(Lorg/anddev/andengine/engine/camera/hud/HUD;)V

    .line 356
    invoke-static {p0}, Lcom/SixClawWorm/utils/PlatformScreen;->GetWidth(Landroid/app/Activity;)I

    move-result v1

    iput v1, p0, Lcom/SixClawWorm/application/PlayControlActivity1920;->CAMERA_WIDTH:I

    .line 357
    invoke-static {p0}, Lcom/SixClawWorm/utils/PlatformScreen;->GetHeight(Landroid/app/Activity;)I

    move-result v1

    iput v1, p0, Lcom/SixClawWorm/application/PlayControlActivity1920;->CAMERA_HEIGHT:I

    .line 359
    new-instance v1, Lorg/anddev/andengine/entity/sprite/Sprite;

    const/4 v2, 0x0

    const/4 v3, 0x0

    iget-object v4, p0, Lcom/SixClawWorm/application/PlayControlActivity1920;->mBackgroundTextureRegion:Lorg/anddev/andengine/opengl/texture/region/TextureRegion;

    invoke-direct {v1, v2, v3, v4}, Lorg/anddev/andengine/entity/sprite/Sprite;-><init>(FFLorg/anddev/andengine/opengl/texture/region/TextureRegion;)V

    iput-object v1, p0, Lcom/SixClawWorm/application/PlayControlActivity1920;->mBackgroundSprite:Lorg/anddev/andengine/entity/sprite/Sprite;

    .line 360
    iget-object v1, p0, Lcom/SixClawWorm/application/PlayControlActivity1920;->mHudScene:Lorg/anddev/andengine/engine/camera/hud/HUD;

    invoke-virtual {v1}, Lorg/anddev/andengine/engine/camera/hud/HUD;->getTopLayer()Lorg/anddev/andengine/entity/layer/ILayer;

    move-result-object v1

    iget-object v2, p0, Lcom/SixClawWorm/application/PlayControlActivity1920;->mBackgroundSprite:Lorg/anddev/andengine/entity/sprite/Sprite;

    invoke-interface {v1, v2}, Lorg/anddev/andengine/entity/layer/ILayer;->addEntity(Lorg/anddev/andengine/entity/IEntity;)V

    .line 363
    new-instance v0, Lcom/SixClawWorm/utils/GButton;

    const/16 v1, 0x1e

    const/16 v2, 0xa

    iget-object v3, p0, Lcom/SixClawWorm/application/PlayControlActivity1920;->mCamera:Lorg/anddev/andengine/engine/camera/Camera;

    iget-object v4, p0, Lcom/SixClawWorm/application/PlayControlActivity1920;->mEngine:Lorg/anddev/andengine/engine/Engine;

    iget-object v5, p0, Lcom/SixClawWorm/application/PlayControlActivity1920;->backButtonRegion:Lorg/anddev/andengine/opengl/texture/region/TiledTextureRegion;

    new-instance v6, Lcom/SixClawWorm/application/PlayControlActivity1920$4;

    invoke-direct {v6, p0}, Lcom/SixClawWorm/application/PlayControlActivity1920$4;-><init>(Lcom/SixClawWorm/application/PlayControlActivity1920;)V

    .line 378
    const/4 v7, 0x0

    invoke-direct/range {v0 .. v7}, Lcom/SixClawWorm/utils/GButton;-><init>(IILorg/anddev/andengine/engine/camera/Camera;Lorg/anddev/andengine/engine/Engine;Lorg/anddev/andengine/opengl/texture/region/TiledTextureRegion;Lcom/SixClawWorm/utils/GButton$GButtonClickListener;Ljava/lang/String;)V

    .line 363
    iput-object v0, p0, Lcom/SixClawWorm/application/PlayControlActivity1920;->backButton:Lcom/SixClawWorm/utils/GButton;

    .line 379
    iget-object v1, p0, Lcom/SixClawWorm/application/PlayControlActivity1920;->mHudScene:Lorg/anddev/andengine/engine/camera/hud/HUD;

    invoke-virtual {v1}, Lorg/anddev/andengine/engine/camera/hud/HUD;->getTopLayer()Lorg/anddev/andengine/entity/layer/ILayer;

    move-result-object v1

    iget-object v2, p0, Lcom/SixClawWorm/application/PlayControlActivity1920;->backButton:Lcom/SixClawWorm/utils/GButton;

    invoke-interface {v1, v2}, Lorg/anddev/andengine/entity/layer/ILayer;->addEntity(Lorg/anddev/andengine/entity/IEntity;)V

    .line 381
    new-instance v0, Lcom/SixClawWorm/utils/GButton;

    const/16 v1, 0x781

    const/16 v2, 0x3ca

    iget-object v3, p0, Lcom/SixClawWorm/application/PlayControlActivity1920;->mCamera:Lorg/anddev/andengine/engine/camera/Camera;

    iget-object v4, p0, Lcom/SixClawWorm/application/PlayControlActivity1920;->mEngine:Lorg/anddev/andengine/engine/Engine;

    iget-object v5, p0, Lcom/SixClawWorm/application/PlayControlActivity1920;->aboutButtonRegion:Lorg/anddev/andengine/opengl/texture/region/TiledTextureRegion;

    new-instance v6, Lcom/SixClawWorm/application/PlayControlActivity1920$5;

    invoke-direct {v6, p0}, Lcom/SixClawWorm/application/PlayControlActivity1920$5;-><init>(Lcom/SixClawWorm/application/PlayControlActivity1920;)V

    .line 392
    const/4 v7, 0x0

    invoke-direct/range {v0 .. v7}, Lcom/SixClawWorm/utils/GButton;-><init>(IILorg/anddev/andengine/engine/camera/Camera;Lorg/anddev/andengine/engine/Engine;Lorg/anddev/andengine/opengl/texture/region/TiledTextureRegion;Lcom/SixClawWorm/utils/GButton$GButtonClickListener;Ljava/lang/String;)V

    .line 381
    iput-object v0, p0, Lcom/SixClawWorm/application/PlayControlActivity1920;->aboutButton:Lcom/SixClawWorm/utils/GButton;

    .line 393
    iget-object v1, p0, Lcom/SixClawWorm/application/PlayControlActivity1920;->mHudScene:Lorg/anddev/andengine/engine/camera/hud/HUD;

    invoke-virtual {v1}, Lorg/anddev/andengine/engine/camera/hud/HUD;->getTopLayer()Lorg/anddev/andengine/entity/layer/ILayer;

    move-result-object v1

    iget-object v2, p0, Lcom/SixClawWorm/application/PlayControlActivity1920;->aboutButton:Lcom/SixClawWorm/utils/GButton;

    invoke-interface {v1, v2}, Lorg/anddev/andengine/entity/layer/ILayer;->addEntity(Lorg/anddev/andengine/entity/IEntity;)V

    .line 395
    new-instance v1, Lorg/anddev/andengine/entity/sprite/AnimatedSprite;

    const v2, 0x44dac000

    const/high16 v3, 0x41a0

    iget-object v4, p0, Lcom/SixClawWorm/application/PlayControlActivity1920;->singalSpriteRegion:Lorg/anddev/andengine/opengl/texture/region/TiledTextureRegion;

    invoke-direct {v1, v2, v3, v4}, Lorg/anddev/andengine/entity/sprite/AnimatedSprite;-><init>(FFLorg/anddev/andengine/opengl/texture/region/TiledTextureRegion;)V

    iput-object v1, p0, Lcom/SixClawWorm/application/PlayControlActivity1920;->singalSprite:Lorg/anddev/andengine/entity/sprite/AnimatedSprite;

    .line 397
    iget-object v1, p0, Lcom/SixClawWorm/application/PlayControlActivity1920;->mHudScene:Lorg/anddev/andengine/engine/camera/hud/HUD;

    invoke-virtual {v1}, Lorg/anddev/andengine/engine/camera/hud/HUD;->getTopLayer()Lorg/anddev/andengine/entity/layer/ILayer;

    move-result-object v1

    iget-object v2, p0, Lcom/SixClawWorm/application/PlayControlActivity1920;->singalSprite:Lorg/anddev/andengine/entity/sprite/AnimatedSprite;

    invoke-interface {v1, v2}, Lorg/anddev/andengine/entity/layer/ILayer;->addEntity(Lorg/anddev/andengine/entity/IEntity;)V

    .line 398
    iget-object v1, p0, Lcom/SixClawWorm/application/PlayControlActivity1920;->singalSprite:Lorg/anddev/andengine/entity/sprite/AnimatedSprite;

    const/4 v2, 0x3

    invoke-virtual {v1, v2}, Lorg/anddev/andengine/entity/sprite/AnimatedSprite;->setCurrentTileIndex(I)V

    .line 400
    new-instance v0, Lorg/anddev/andengine/engine/camera/hud/controls/AnalogOnScreenControl;

    .line 401
    const/16 v1, 0xe6

    .line 402
    const/16 v2, 0xfa

    .line 403
    iget-object v3, p0, Lcom/SixClawWorm/application/PlayControlActivity1920;->mCamera:Lorg/anddev/andengine/engine/camera/Camera;

    iget-object v4, p0, Lcom/SixClawWorm/application/PlayControlActivity1920;->mOnScreenControlBaseTextureRegion:Lorg/anddev/andengine/opengl/texture/region/TextureRegion;

    .line 404
    iget-object v5, p0, Lcom/SixClawWorm/application/PlayControlActivity1920;->mOnScreenControlKnobTextureRegion:Lorg/anddev/andengine/opengl/texture/region/TextureRegion;

    const v6, 0x3dcccccd

    const-wide/16 v7, 0x15e

    .line 405
    new-instance v9, Lcom/SixClawWorm/application/PlayControlActivity1920$6;

    invoke-direct {v9, p0}, Lcom/SixClawWorm/application/PlayControlActivity1920$6;-><init>(Lcom/SixClawWorm/application/PlayControlActivity1920;)V

    .line 400
    invoke-direct/range {v0 .. v9}, Lorg/anddev/andengine/engine/camera/hud/controls/AnalogOnScreenControl;-><init>(IILorg/anddev/andengine/engine/camera/Camera;Lorg/anddev/andengine/opengl/texture/region/TextureRegion;Lorg/anddev/andengine/opengl/texture/region/TextureRegion;FJLorg/anddev/andengine/engine/camera/hud/controls/AnalogOnScreenControl$IAnalogOnScreenControlListener;)V

    .line 507
    .local v0, analogOnScreenControl:Lorg/anddev/andengine/engine/camera/hud/controls/AnalogOnScreenControl;
    invoke-virtual {v0}, Lorg/anddev/andengine/engine/camera/hud/controls/AnalogOnScreenControl;->getControlBase()Lorg/anddev/andengine/entity/sprite/Sprite;

    move-result-object v1

    .line 508
    const/16 v2, 0x302

    const/16 v3, 0x303

    .line 507
    invoke-virtual {v1, v2, v3}, Lorg/anddev/andengine/entity/sprite/Sprite;->setBlendFunction(II)V

    .line 509
    invoke-virtual {v0}, Lorg/anddev/andengine/engine/camera/hud/controls/AnalogOnScreenControl;->getControlBase()Lorg/anddev/andengine/entity/sprite/Sprite;

    move-result-object v1

    const/high16 v2, 0x3f80

    invoke-virtual {v1, v2}, Lorg/anddev/andengine/entity/sprite/Sprite;->setAlpha(F)V

    .line 510
    invoke-virtual {v0}, Lorg/anddev/andengine/engine/camera/hud/controls/AnalogOnScreenControl;->getControlBase()Lorg/anddev/andengine/entity/sprite/Sprite;

    move-result-object v1

    const/4 v2, 0x0

    const/high16 v3, 0x4300

    invoke-virtual {v1, v2, v3}, Lorg/anddev/andengine/entity/sprite/Sprite;->setScaleCenter(FF)V

    .line 511
    invoke-virtual {v0}, Lorg/anddev/andengine/engine/camera/hud/controls/AnalogOnScreenControl;->getControlBase()Lorg/anddev/andengine/entity/sprite/Sprite;

    move-result-object v1

    const/high16 v2, 0x3fa0

    invoke-virtual {v1, v2}, Lorg/anddev/andengine/entity/sprite/Sprite;->setScale(F)V

    .line 512
    invoke-virtual {v0}, Lorg/anddev/andengine/engine/camera/hud/controls/AnalogOnScreenControl;->getControlKnob()Lorg/anddev/andengine/entity/sprite/Sprite;

    move-result-object v1

    const/high16 v2, 0x3fa0

    invoke-virtual {v1, v2}, Lorg/anddev/andengine/entity/sprite/Sprite;->setScale(F)V

    .line 513
    invoke-virtual {v0}, Lorg/anddev/andengine/engine/camera/hud/controls/AnalogOnScreenControl;->refreshControlKnobPosition()V

    .line 514
    iget-object v1, p0, Lcom/SixClawWorm/application/PlayControlActivity1920;->mHudScene:Lorg/anddev/andengine/engine/camera/hud/HUD;

    invoke-virtual {v1, v0}, Lorg/anddev/andengine/engine/camera/hud/HUD;->setChildScene(Lorg/anddev/andengine/entity/scene/Scene;)V

    .line 519
    new-instance v1, Lcom/SixClawWorm/utils/GButton;

    const/16 v2, 0x514

    const/16 v3, 0xaa

    iget-object v4, p0, Lcom/SixClawWorm/application/PlayControlActivity1920;->mCamera:Lorg/anddev/andengine/engine/camera/Camera;

    iget-object v5, p0, Lcom/SixClawWorm/application/PlayControlActivity1920;->mEngine:Lorg/anddev/andengine/engine/Engine;

    iget-object v6, p0, Lcom/SixClawWorm/application/PlayControlActivity1920;->greenButtonRegion:Lorg/anddev/andengine/opengl/texture/region/TiledTextureRegion;

    new-instance v7, Lcom/SixClawWorm/application/PlayControlActivity1920$7;

    invoke-direct {v7, p0}, Lcom/SixClawWorm/application/PlayControlActivity1920$7;-><init>(Lcom/SixClawWorm/application/PlayControlActivity1920;)V

    .line 558
    const/4 v8, 0x0

    invoke-direct/range {v1 .. v8}, Lcom/SixClawWorm/utils/GButton;-><init>(IILorg/anddev/andengine/engine/camera/Camera;Lorg/anddev/andengine/engine/Engine;Lorg/anddev/andengine/opengl/texture/region/TiledTextureRegion;Lcom/SixClawWorm/utils/GButton$GButtonClickListener;Ljava/lang/String;)V

    .line 519
    iput-object v1, p0, Lcom/SixClawWorm/application/PlayControlActivity1920;->greenButton:Lcom/SixClawWorm/utils/GButton;

    .line 559
    iget-object v1, p0, Lcom/SixClawWorm/application/PlayControlActivity1920;->mHudScene:Lorg/anddev/andengine/engine/camera/hud/HUD;

    invoke-virtual {v1}, Lorg/anddev/andengine/engine/camera/hud/HUD;->getTopLayer()Lorg/anddev/andengine/entity/layer/ILayer;

    move-result-object v1

    iget-object v2, p0, Lcom/SixClawWorm/application/PlayControlActivity1920;->greenButton:Lcom/SixClawWorm/utils/GButton;

    invoke-interface {v1, v2}, Lorg/anddev/andengine/entity/layer/ILayer;->addEntity(Lorg/anddev/andengine/entity/IEntity;)V

    .line 562
    new-instance v1, Lcom/SixClawWorm/utils/GButton;

    const/16 v2, 0x60e

    const/16 v3, 0x1c2

    iget-object v4, p0, Lcom/SixClawWorm/application/PlayControlActivity1920;->mCamera:Lorg/anddev/andengine/engine/camera/Camera;

    iget-object v5, p0, Lcom/SixClawWorm/application/PlayControlActivity1920;->mEngine:Lorg/anddev/andengine/engine/Engine;

    iget-object v6, p0, Lcom/SixClawWorm/application/PlayControlActivity1920;->blueButtonRegion:Lorg/anddev/andengine/opengl/texture/region/TiledTextureRegion;

    new-instance v7, Lcom/SixClawWorm/application/PlayControlActivity1920$8;

    invoke-direct {v7, p0}, Lcom/SixClawWorm/application/PlayControlActivity1920$8;-><init>(Lcom/SixClawWorm/application/PlayControlActivity1920;)V

    .line 597
    const/4 v8, 0x0

    invoke-direct/range {v1 .. v8}, Lcom/SixClawWorm/utils/GButton;-><init>(IILorg/anddev/andengine/engine/camera/Camera;Lorg/anddev/andengine/engine/Engine;Lorg/anddev/andengine/opengl/texture/region/TiledTextureRegion;Lcom/SixClawWorm/utils/GButton$GButtonClickListener;Ljava/lang/String;)V

    .line 562
    iput-object v1, p0, Lcom/SixClawWorm/application/PlayControlActivity1920;->blueButton:Lcom/SixClawWorm/utils/GButton;

    .line 598
    iget-object v1, p0, Lcom/SixClawWorm/application/PlayControlActivity1920;->mHudScene:Lorg/anddev/andengine/engine/camera/hud/HUD;

    invoke-virtual {v1}, Lorg/anddev/andengine/engine/camera/hud/HUD;->getTopLayer()Lorg/anddev/andengine/entity/layer/ILayer;

    move-result-object v1

    iget-object v2, p0, Lcom/SixClawWorm/application/PlayControlActivity1920;->blueButton:Lcom/SixClawWorm/utils/GButton;

    invoke-interface {v1, v2}, Lorg/anddev/andengine/entity/layer/ILayer;->addEntity(Lorg/anddev/andengine/entity/IEntity;)V

    .line 601
    new-instance v1, Lcom/SixClawWorm/utils/GButton;

    const/16 v2, 0x41a

    const/16 v3, 0x1c2

    iget-object v4, p0, Lcom/SixClawWorm/application/PlayControlActivity1920;->mCamera:Lorg/anddev/andengine/engine/camera/Camera;

    iget-object v5, p0, Lcom/SixClawWorm/application/PlayControlActivity1920;->mEngine:Lorg/anddev/andengine/engine/Engine;

    iget-object v6, p0, Lcom/SixClawWorm/application/PlayControlActivity1920;->redButtonRegion:Lorg/anddev/andengine/opengl/texture/region/TiledTextureRegion;

    new-instance v7, Lcom/SixClawWorm/application/PlayControlActivity1920$9;

    invoke-direct {v7, p0}, Lcom/SixClawWorm/application/PlayControlActivity1920$9;-><init>(Lcom/SixClawWorm/application/PlayControlActivity1920;)V

    .line 636
    const/4 v8, 0x0

    invoke-direct/range {v1 .. v8}, Lcom/SixClawWorm/utils/GButton;-><init>(IILorg/anddev/andengine/engine/camera/Camera;Lorg/anddev/andengine/engine/Engine;Lorg/anddev/andengine/opengl/texture/region/TiledTextureRegion;Lcom/SixClawWorm/utils/GButton$GButtonClickListener;Ljava/lang/String;)V

    .line 601
    iput-object v1, p0, Lcom/SixClawWorm/application/PlayControlActivity1920;->redButton:Lcom/SixClawWorm/utils/GButton;

    .line 637
    iget-object v1, p0, Lcom/SixClawWorm/application/PlayControlActivity1920;->mHudScene:Lorg/anddev/andengine/engine/camera/hud/HUD;

    invoke-virtual {v1}, Lorg/anddev/andengine/engine/camera/hud/HUD;->getTopLayer()Lorg/anddev/andengine/entity/layer/ILayer;

    move-result-object v1

    iget-object v2, p0, Lcom/SixClawWorm/application/PlayControlActivity1920;->redButton:Lcom/SixClawWorm/utils/GButton;

    invoke-interface {v1, v2}, Lorg/anddev/andengine/entity/layer/ILayer;->addEntity(Lorg/anddev/andengine/entity/IEntity;)V

    .line 640
    new-instance v1, Lcom/SixClawWorm/utils/GButton;

    const/16 v2, 0x514

    const/16 v3, 0x294

    iget-object v4, p0, Lcom/SixClawWorm/application/PlayControlActivity1920;->mCamera:Lorg/anddev/andengine/engine/camera/Camera;

    iget-object v5, p0, Lcom/SixClawWorm/application/PlayControlActivity1920;->mEngine:Lorg/anddev/andengine/engine/Engine;

    iget-object v6, p0, Lcom/SixClawWorm/application/PlayControlActivity1920;->yellowButtonRegion:Lorg/anddev/andengine/opengl/texture/region/TiledTextureRegion;

    new-instance v7, Lcom/SixClawWorm/application/PlayControlActivity1920$10;

    invoke-direct {v7, p0}, Lcom/SixClawWorm/application/PlayControlActivity1920$10;-><init>(Lcom/SixClawWorm/application/PlayControlActivity1920;)V

    .line 672
    const/4 v8, 0x0

    invoke-direct/range {v1 .. v8}, Lcom/SixClawWorm/utils/GButton;-><init>(IILorg/anddev/andengine/engine/camera/Camera;Lorg/anddev/andengine/engine/Engine;Lorg/anddev/andengine/opengl/texture/region/TiledTextureRegion;Lcom/SixClawWorm/utils/GButton$GButtonClickListener;Ljava/lang/String;)V

    .line 640
    iput-object v1, p0, Lcom/SixClawWorm/application/PlayControlActivity1920;->yellowButton:Lcom/SixClawWorm/utils/GButton;

    .line 673
    iget-object v1, p0, Lcom/SixClawWorm/application/PlayControlActivity1920;->mHudScene:Lorg/anddev/andengine/engine/camera/hud/HUD;

    invoke-virtual {v1}, Lorg/anddev/andengine/engine/camera/hud/HUD;->getTopLayer()Lorg/anddev/andengine/entity/layer/ILayer;

    move-result-object v1

    iget-object v2, p0, Lcom/SixClawWorm/application/PlayControlActivity1920;->yellowButton:Lcom/SixClawWorm/utils/GButton;

    invoke-interface {v1, v2}, Lorg/anddev/andengine/entity/layer/ILayer;->addEntity(Lorg/anddev/andengine/entity/IEntity;)V

    .line 677
    iget-object v1, p0, Lcom/SixClawWorm/application/PlayControlActivity1920;->mHudScene:Lorg/anddev/andengine/engine/camera/hud/HUD;

    return-object v1
.end method

.method protected onResume()V
    .locals 1

    .prologue
    const/4 v0, 0x0

    .line 1016
    sput-boolean v0, Lcom/SixClawWorm/application/PlayControlActivity1920;->left:Z

    .line 1017
    sput-boolean v0, Lcom/SixClawWorm/application/PlayControlActivity1920;->right:Z

    .line 1018
    sput-boolean v0, Lcom/SixClawWorm/application/PlayControlActivity1920;->leftDown:Z

    .line 1019
    sput-boolean v0, Lcom/SixClawWorm/application/PlayControlActivity1920;->leftUp:Z

    .line 1020
    sput-boolean v0, Lcom/SixClawWorm/application/PlayControlActivity1920;->rightDown:Z

    .line 1021
    sput-boolean v0, Lcom/SixClawWorm/application/PlayControlActivity1920;->rightUp:Z

    .line 1022
    sput-boolean v0, Lcom/SixClawWorm/application/PlayControlActivity1920;->up:Z

    .line 1023
    sput-boolean v0, Lcom/SixClawWorm/application/PlayControlActivity1920;->down:Z

    .line 1024
    sput-boolean v0, Lcom/SixClawWorm/application/PlayControlActivity1920;->greenOnclock:Z

    .line 1025
    sput-boolean v0, Lcom/SixClawWorm/application/PlayControlActivity1920;->yellowOnclock:Z

    .line 1026
    sput-boolean v0, Lcom/SixClawWorm/application/PlayControlActivity1920;->redOnclock:Z

    .line 1027
    sput-boolean v0, Lcom/SixClawWorm/application/PlayControlActivity1920;->blueOnclock:Z

    .line 1028
    iput-boolean v0, p0, Lcom/SixClawWorm/application/PlayControlActivity1920;->stopThread:Z

    .line 1029
    const/4 v0, 0x1

    sput-boolean v0, Lcom/SixClawWorm/utils/GButton;->isPlayControl:Z

    .line 1030
    invoke-super {p0}, Lorg/anddev/andengine/ui/activity/BaseGameActivity;->onResume()V

    .line 1031
    return-void
.end method
