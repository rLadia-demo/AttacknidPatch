.class public Lcom/SixClawWorm/application/PlayControlActivity;
.super Lorg/anddev/andengine/ui/activity/BaseGameActivity;
.source "PlayControlActivity.java"


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

    .line 110
    sput-boolean v0, Lcom/SixClawWorm/application/PlayControlActivity;->redOnclock:Z

    .line 111
    sput-boolean v0, Lcom/SixClawWorm/application/PlayControlActivity;->yellowOnclock:Z

    .line 112
    sput-boolean v0, Lcom/SixClawWorm/application/PlayControlActivity;->blueOnclock:Z

    .line 113
    sput-boolean v0, Lcom/SixClawWorm/application/PlayControlActivity;->greenOnclock:Z

    .line 114
    sput-boolean v0, Lcom/SixClawWorm/application/PlayControlActivity;->left:Z

    .line 115
    sput-boolean v0, Lcom/SixClawWorm/application/PlayControlActivity;->right:Z

    .line 116
    sput-boolean v0, Lcom/SixClawWorm/application/PlayControlActivity;->up:Z

    .line 117
    sput-boolean v0, Lcom/SixClawWorm/application/PlayControlActivity;->down:Z

    .line 118
    sput-boolean v0, Lcom/SixClawWorm/application/PlayControlActivity;->leftUp:Z

    .line 119
    sput-boolean v0, Lcom/SixClawWorm/application/PlayControlActivity;->leftDown:Z

    .line 120
    sput-boolean v0, Lcom/SixClawWorm/application/PlayControlActivity;->rightUp:Z

    .line 121
    sput-boolean v0, Lcom/SixClawWorm/application/PlayControlActivity;->rightDown:Z

    .line 128
    sput-boolean v0, Lcom/SixClawWorm/application/PlayControlActivity;->ifPlayControlActivity:Z

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

    iput v0, p0, Lcom/SixClawWorm/application/PlayControlActivity;->CAMERA_WIDTH:I

    .line 61
    const/16 v0, 0x320

    iput v0, p0, Lcom/SixClawWorm/application/PlayControlActivity;->CAMERA_HEIGHT:I

    .line 64
    iput v2, p0, Lcom/SixClawWorm/application/PlayControlActivity;->RockerCircleX:I

    .line 65
    const/16 v0, 0x80

    iput v0, p0, Lcom/SixClawWorm/application/PlayControlActivity;->RockerCircleY:I

    .line 66
    const/16 v0, 0x32

    iput v0, p0, Lcom/SixClawWorm/application/PlayControlActivity;->RockerCircleR:I

    .line 106
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/SixClawWorm/application/PlayControlActivity;->mChatService:Lcom/SixClawWorm/application/BluetoothChatService;

    .line 108
    const-string v0, "7104808080808001"

    iput-object v0, p0, Lcom/SixClawWorm/application/PlayControlActivity;->StartStr:Ljava/lang/String;

    .line 122
    iput v2, p0, Lcom/SixClawWorm/application/PlayControlActivity;->firstOnclock:I

    .line 123
    iput v2, p0, Lcom/SixClawWorm/application/PlayControlActivity;->sencondOnclock:I

    .line 125
    iput-boolean v2, p0, Lcom/SixClawWorm/application/PlayControlActivity;->stopThread:Z

    .line 126
    const-wide/16 v0, 0x0

    iput-wide v0, p0, Lcom/SixClawWorm/application/PlayControlActivity;->stopTime:J

    .line 127
    iput-boolean v2, p0, Lcom/SixClawWorm/application/PlayControlActivity;->UpSongkai:Z

    .line 221
    new-instance v0, Landroid/os/Handler;

    invoke-direct {v0}, Landroid/os/Handler;-><init>()V

    iput-object v0, p0, Lcom/SixClawWorm/application/PlayControlActivity;->handler:Landroid/os/Handler;

    .line 222
    new-instance v0, Lcom/SixClawWorm/application/PlayControlActivity$1;

    invoke-direct {v0, p0}, Lcom/SixClawWorm/application/PlayControlActivity$1;-><init>(Lcom/SixClawWorm/application/PlayControlActivity;)V

    iput-object v0, p0, Lcom/SixClawWorm/application/PlayControlActivity;->runnable:Ljava/lang/Runnable;

    .line 243
    new-instance v0, Lcom/SixClawWorm/application/PlayControlActivity$2;

    invoke-direct {v0, p0}, Lcom/SixClawWorm/application/PlayControlActivity$2;-><init>(Lcom/SixClawWorm/application/PlayControlActivity;)V

    iput-object v0, p0, Lcom/SixClawWorm/application/PlayControlActivity;->mhandler:Landroid/os/Handler;

    .line 48
    return-void
.end method

.method private TsendMessage([B)V
    .locals 4
    .parameter "sendMessage"

    .prologue
    const/4 v3, 0x0

    .line 316
    iput-boolean v3, p0, Lcom/SixClawWorm/application/PlayControlActivity;->stopThread:Z

    .line 317
    sget-object v1, Lcom/SixClawWorm/utils/Param;->ChatService:Lcom/SixClawWorm/application/BluetoothChatService;

    iput-object v1, p0, Lcom/SixClawWorm/application/PlayControlActivity;->mChatService:Lcom/SixClawWorm/application/BluetoothChatService;

    .line 318
    new-instance v1, Ljava/lang/StringBuffer;

    const-string v2, ""

    invoke-direct {v1, v2}, Ljava/lang/StringBuffer;-><init>(Ljava/lang/String;)V

    iput-object v1, p0, Lcom/SixClawWorm/application/PlayControlActivity;->mOutStringBuffer:Ljava/lang/StringBuffer;

    .line 319
    iget-object v1, p0, Lcom/SixClawWorm/application/PlayControlActivity;->mChatService:Lcom/SixClawWorm/application/BluetoothChatService;

    if-eqz v1, :cond_2

    .line 320
    iget-object v1, p0, Lcom/SixClawWorm/application/PlayControlActivity;->mChatService:Lcom/SixClawWorm/application/BluetoothChatService;

    invoke-virtual {v1}, Lcom/SixClawWorm/application/BluetoothChatService;->getState()I

    move-result v1

    const/4 v2, 0x3

    if-eq v1, v2, :cond_1

    .line 322
    sput-boolean v3, Lcom/SixClawWorm/utils/Param;->ConntectSucceed:Z

    .line 344
    :cond_0
    :goto_0
    return-void

    .line 328
    :cond_1
    const-wide/16 v1, 0x62

    :try_start_0
    invoke-static {v1, v2}, Ljava/lang/Thread;->sleep(J)V
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    .line 337
    :cond_2
    :goto_1
    array-length v1, p1

    if-lez v1, :cond_0

    .line 339
    iget-object v1, p0, Lcom/SixClawWorm/application/PlayControlActivity;->mChatService:Lcom/SixClawWorm/application/BluetoothChatService;

    invoke-virtual {v1, p1}, Lcom/SixClawWorm/application/BluetoothChatService;->write([B)V

    .line 340
    iget-object v1, p0, Lcom/SixClawWorm/application/PlayControlActivity;->mOutStringBuffer:Ljava/lang/StringBuffer;

    invoke-virtual {v1, v3}, Ljava/lang/StringBuffer;->setLength(I)V

    goto :goto_0

    .line 329
    :catch_0
    move-exception v0

    .line 331
    .local v0, e:Ljava/lang/InterruptedException;
    invoke-virtual {v0}, Ljava/lang/InterruptedException;->printStackTrace()V

    goto :goto_1
.end method

.method static synthetic access$0(Lcom/SixClawWorm/application/PlayControlActivity;)I
    .locals 1
    .parameter

    .prologue
    .line 66
    iget v0, p0, Lcom/SixClawWorm/application/PlayControlActivity;->RockerCircleR:I

    return v0
.end method

.method static synthetic access$1(Lcom/SixClawWorm/application/PlayControlActivity;I)V
    .locals 0
    .parameter
    .parameter

    .prologue
    .line 704
    invoke-direct {p0, p1}, Lcom/SixClawWorm/application/PlayControlActivity;->onKnobDirectionChange(I)V

    return-void
.end method

.method static synthetic access$2(Ljava/lang/String;)[B
    .locals 1
    .parameter

    .prologue
    .line 691
    invoke-static {p0}, Lcom/SixClawWorm/application/PlayControlActivity;->string2Bytes(Ljava/lang/String;)[B

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$3(Lcom/SixClawWorm/application/PlayControlActivity;[B)V
    .locals 0
    .parameter
    .parameter

    .prologue
    .line 257
    invoke-direct {p0, p1}, Lcom/SixClawWorm/application/PlayControlActivity;->sendMessage([B)V

    return-void
.end method

.method private gotoAbout()V
    .locals 2

    .prologue
    .line 676
    new-instance v0, Landroid/content/Intent;

    const-class v1, Lcom/SixClawWorm/application/inTrodutionActivity;

    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 677
    .local v0, about:Landroid/content/Intent;
    invoke-virtual {p0, v0}, Lcom/SixClawWorm/application/PlayControlActivity;->startActivity(Landroid/content/Intent;)V

    .line 678
    return-void
.end method

.method private onKnobDirectionChange(I)V
    .locals 14
    .parameter "direction"

    .prologue
    const/4 v13, 0x0

    const/4 v12, 0x1

    .line 707
    packed-switch p1, :pswitch_data_0

    .line 985
    :cond_0
    :goto_0
    iput-boolean v12, p0, Lcom/SixClawWorm/application/PlayControlActivity;->stopThread:Z

    .line 986
    return-void

    .line 711
    :pswitch_0
    const-string v9, "SJF"

    const-string v10, "\u3010\u5de6\u3011 "

    invoke-static {v9, v10}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 712
    sput-boolean v12, Lcom/SixClawWorm/application/PlayControlActivity;->left:Z

    .line 713
    sget-boolean v9, Lcom/SixClawWorm/application/PlayControlActivity;->greenOnclock:Z

    if-eqz v9, :cond_1

    .line 714
    const-string v4, "7100808280800248"

    .line 715
    .local v4, leftUp:Ljava/lang/String;
    invoke-static {v4}, Lcom/SixClawWorm/application/PlayControlActivity;->string2Bytes(Ljava/lang/String;)[B

    move-result-object v8

    .line 716
    .local v8, message4:[B
    invoke-direct {p0, v8}, Lcom/SixClawWorm/application/PlayControlActivity;->sendMessage([B)V

    goto :goto_0

    .line 718
    .end local v4           #leftUp:Ljava/lang/String;
    .end local v8           #message4:[B
    :cond_1
    sget-boolean v9, Lcom/SixClawWorm/application/PlayControlActivity;->blueOnclock:Z

    if-eqz v9, :cond_2

    .line 719
    const-string v4, "7100808282808028"

    .line 720
    .restart local v4       #leftUp:Ljava/lang/String;
    invoke-static {v4}, Lcom/SixClawWorm/application/PlayControlActivity;->string2Bytes(Ljava/lang/String;)[B

    move-result-object v8

    .line 721
    .restart local v8       #message4:[B
    invoke-direct {p0, v8}, Lcom/SixClawWorm/application/PlayControlActivity;->sendMessage([B)V

    goto :goto_0

    .line 723
    .end local v4           #leftUp:Ljava/lang/String;
    .end local v8           #message4:[B
    :cond_2
    sget-boolean v9, Lcom/SixClawWorm/application/PlayControlActivity;->yellowOnclock:Z

    if-eqz v9, :cond_3

    .line 724
    const-string v4, "7100808202808018"

    .line 725
    .restart local v4       #leftUp:Ljava/lang/String;
    invoke-static {v4}, Lcom/SixClawWorm/application/PlayControlActivity;->string2Bytes(Ljava/lang/String;)[B

    move-result-object v8

    .line 726
    .restart local v8       #message4:[B
    invoke-direct {p0, v8}, Lcom/SixClawWorm/application/PlayControlActivity;->sendMessage([B)V

    goto :goto_0

    .line 728
    .end local v4           #leftUp:Ljava/lang/String;
    .end local v8           #message4:[B
    :cond_3
    sget-boolean v9, Lcom/SixClawWorm/application/PlayControlActivity;->redOnclock:Z

    if-eqz v9, :cond_4

    .line 729
    const-string v4, "7100808280808288"

    .line 730
    .restart local v4       #leftUp:Ljava/lang/String;
    invoke-static {v4}, Lcom/SixClawWorm/application/PlayControlActivity;->string2Bytes(Ljava/lang/String;)[B

    move-result-object v8

    .line 731
    .restart local v8       #message4:[B
    invoke-direct {p0, v8}, Lcom/SixClawWorm/application/PlayControlActivity;->sendMessage([B)V

    goto :goto_0

    .line 734
    .end local v4           #leftUp:Ljava/lang/String;
    .end local v8           #message4:[B
    :cond_4
    const-string v4, "7100808280808008"

    .line 735
    .restart local v4       #leftUp:Ljava/lang/String;
    invoke-static {v4}, Lcom/SixClawWorm/application/PlayControlActivity;->string2Bytes(Ljava/lang/String;)[B

    move-result-object v7

    .line 736
    .local v7, message1:[B
    invoke-direct {p0, v7}, Lcom/SixClawWorm/application/PlayControlActivity;->sendMessage([B)V

    goto :goto_0

    .line 741
    .end local v4           #leftUp:Ljava/lang/String;
    .end local v7           #message1:[B
    :pswitch_1
    const-string v9, "SJF"

    const-string v10, "\u3010\u53f3\u3011 "

    invoke-static {v9, v10}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 742
    sput-boolean v12, Lcom/SixClawWorm/application/PlayControlActivity;->right:Z

    .line 743
    sget-boolean v9, Lcom/SixClawWorm/application/PlayControlActivity;->redOnclock:Z

    if-eqz v9, :cond_5

    .line 744
    const-string v4, "7100800280808284"

    .line 745
    .restart local v4       #leftUp:Ljava/lang/String;
    invoke-static {v4}, Lcom/SixClawWorm/application/PlayControlActivity;->string2Bytes(Ljava/lang/String;)[B

    move-result-object v6

    .line 746
    .local v6, message:[B
    invoke-direct {p0, v6}, Lcom/SixClawWorm/application/PlayControlActivity;->sendMessage([B)V

    goto :goto_0

    .line 748
    .end local v4           #leftUp:Ljava/lang/String;
    .end local v6           #message:[B
    :cond_5
    sget-boolean v9, Lcom/SixClawWorm/application/PlayControlActivity;->greenOnclock:Z

    if-eqz v9, :cond_6

    .line 749
    const-string v4, "7100800280800244"

    .line 750
    .restart local v4       #leftUp:Ljava/lang/String;
    invoke-static {v4}, Lcom/SixClawWorm/application/PlayControlActivity;->string2Bytes(Ljava/lang/String;)[B

    move-result-object v6

    .line 751
    .restart local v6       #message:[B
    invoke-direct {p0, v6}, Lcom/SixClawWorm/application/PlayControlActivity;->sendMessage([B)V

    goto :goto_0

    .line 753
    .end local v4           #leftUp:Ljava/lang/String;
    .end local v6           #message:[B
    :cond_6
    sget-boolean v9, Lcom/SixClawWorm/application/PlayControlActivity;->yellowOnclock:Z

    if-eqz v9, :cond_7

    .line 754
    const-string v4, "7100800202808014"

    .line 755
    .restart local v4       #leftUp:Ljava/lang/String;
    invoke-static {v4}, Lcom/SixClawWorm/application/PlayControlActivity;->string2Bytes(Ljava/lang/String;)[B

    move-result-object v6

    .line 756
    .restart local v6       #message:[B
    invoke-direct {p0, v6}, Lcom/SixClawWorm/application/PlayControlActivity;->sendMessage([B)V

    goto :goto_0

    .line 758
    .end local v4           #leftUp:Ljava/lang/String;
    .end local v6           #message:[B
    :cond_7
    sget-boolean v9, Lcom/SixClawWorm/application/PlayControlActivity;->blueOnclock:Z

    if-eqz v9, :cond_8

    .line 759
    const-string v4, "7100800282808024"

    .line 760
    .restart local v4       #leftUp:Ljava/lang/String;
    invoke-static {v4}, Lcom/SixClawWorm/application/PlayControlActivity;->string2Bytes(Ljava/lang/String;)[B

    move-result-object v6

    .line 761
    .restart local v6       #message:[B
    invoke-direct {p0, v6}, Lcom/SixClawWorm/application/PlayControlActivity;->sendMessage([B)V

    goto/16 :goto_0

    .line 764
    .end local v4           #leftUp:Ljava/lang/String;
    .end local v6           #message:[B
    :cond_8
    const-string v5, "7100800280808004"

    .line 765
    .local v5, leftUp1:Ljava/lang/String;
    invoke-static {v5}, Lcom/SixClawWorm/application/PlayControlActivity;->string2Bytes(Ljava/lang/String;)[B

    move-result-object v6

    .line 766
    .restart local v6       #message:[B
    invoke-direct {p0, v6}, Lcom/SixClawWorm/application/PlayControlActivity;->sendMessage([B)V

    goto/16 :goto_0

    .line 771
    .end local v5           #leftUp1:Ljava/lang/String;
    .end local v6           #message:[B
    :pswitch_2
    const-string v9, "SJF"

    const-string v10, "\u3010\u4e0a\u3011 "

    invoke-static {v9, v10}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 772
    sput-boolean v12, Lcom/SixClawWorm/application/PlayControlActivity;->up:Z

    .line 773
    sget-boolean v9, Lcom/SixClawWorm/application/PlayControlActivity;->redOnclock:Z

    if-eqz v9, :cond_9

    .line 774
    const-string v4, "7100028080808241"

    .line 775
    .restart local v4       #leftUp:Ljava/lang/String;
    invoke-static {v4}, Lcom/SixClawWorm/application/PlayControlActivity;->string2Bytes(Ljava/lang/String;)[B

    move-result-object v6

    .line 776
    .restart local v6       #message:[B
    invoke-direct {p0, v6}, Lcom/SixClawWorm/application/PlayControlActivity;->sendMessage([B)V

    goto/16 :goto_0

    .line 778
    .end local v4           #leftUp:Ljava/lang/String;
    .end local v6           #message:[B
    :cond_9
    sget-boolean v9, Lcom/SixClawWorm/application/PlayControlActivity;->greenOnclock:Z

    if-eqz v9, :cond_a

    .line 780
    const-string v4, "7100028080800241"

    .line 781
    .restart local v4       #leftUp:Ljava/lang/String;
    invoke-static {v4}, Lcom/SixClawWorm/application/PlayControlActivity;->string2Bytes(Ljava/lang/String;)[B

    move-result-object v6

    .line 782
    .restart local v6       #message:[B
    invoke-direct {p0, v6}, Lcom/SixClawWorm/application/PlayControlActivity;->sendMessage([B)V

    goto/16 :goto_0

    .line 784
    .end local v4           #leftUp:Ljava/lang/String;
    .end local v6           #message:[B
    :cond_a
    sget-boolean v9, Lcom/SixClawWorm/application/PlayControlActivity;->yellowOnclock:Z

    if-eqz v9, :cond_b

    .line 785
    const-string v4, "7100028002808011"

    .line 786
    .restart local v4       #leftUp:Ljava/lang/String;
    invoke-static {v4}, Lcom/SixClawWorm/application/PlayControlActivity;->string2Bytes(Ljava/lang/String;)[B

    move-result-object v6

    .line 787
    .restart local v6       #message:[B
    invoke-direct {p0, v6}, Lcom/SixClawWorm/application/PlayControlActivity;->sendMessage([B)V

    goto/16 :goto_0

    .line 789
    .end local v4           #leftUp:Ljava/lang/String;
    .end local v6           #message:[B
    :cond_b
    sget-boolean v9, Lcom/SixClawWorm/application/PlayControlActivity;->blueOnclock:Z

    if-eqz v9, :cond_c

    .line 790
    const-string v4, "7100028082808021"

    .line 791
    .restart local v4       #leftUp:Ljava/lang/String;
    invoke-static {v4}, Lcom/SixClawWorm/application/PlayControlActivity;->string2Bytes(Ljava/lang/String;)[B

    move-result-object v6

    .line 792
    .restart local v6       #message:[B
    invoke-direct {p0, v6}, Lcom/SixClawWorm/application/PlayControlActivity;->sendMessage([B)V

    goto/16 :goto_0

    .line 796
    .end local v4           #leftUp:Ljava/lang/String;
    .end local v6           #message:[B
    :cond_c
    const-string v4, "7100028080808001"

    .line 797
    .restart local v4       #leftUp:Ljava/lang/String;
    invoke-static {v4}, Lcom/SixClawWorm/application/PlayControlActivity;->string2Bytes(Ljava/lang/String;)[B

    move-result-object v6

    .line 798
    .restart local v6       #message:[B
    invoke-direct {p0, v6}, Lcom/SixClawWorm/application/PlayControlActivity;->sendMessage([B)V

    goto/16 :goto_0

    .line 803
    .end local v4           #leftUp:Ljava/lang/String;
    .end local v6           #message:[B
    :pswitch_3
    const-string v9, "SJF"

    const-string v10, "\u3010\u4e0b\u3011 "

    invoke-static {v9, v10}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 804
    sput-boolean v12, Lcom/SixClawWorm/application/PlayControlActivity;->down:Z

    .line 805
    sget-boolean v9, Lcom/SixClawWorm/application/PlayControlActivity;->redOnclock:Z

    if-eqz v9, :cond_d

    .line 806
    const-string v4, "7100828080808282"

    .line 807
    .restart local v4       #leftUp:Ljava/lang/String;
    invoke-static {v4}, Lcom/SixClawWorm/application/PlayControlActivity;->string2Bytes(Ljava/lang/String;)[B

    move-result-object v6

    .line 808
    .restart local v6       #message:[B
    invoke-direct {p0, v6}, Lcom/SixClawWorm/application/PlayControlActivity;->sendMessage([B)V

    goto/16 :goto_0

    .line 810
    .end local v4           #leftUp:Ljava/lang/String;
    .end local v6           #message:[B
    :cond_d
    sget-boolean v9, Lcom/SixClawWorm/application/PlayControlActivity;->greenOnclock:Z

    if-eqz v9, :cond_e

    .line 811
    const-string v4, "7100828080800242"

    .line 812
    .restart local v4       #leftUp:Ljava/lang/String;
    invoke-static {v4}, Lcom/SixClawWorm/application/PlayControlActivity;->string2Bytes(Ljava/lang/String;)[B

    move-result-object v6

    .line 813
    .restart local v6       #message:[B
    invoke-direct {p0, v6}, Lcom/SixClawWorm/application/PlayControlActivity;->sendMessage([B)V

    goto/16 :goto_0

    .line 815
    .end local v4           #leftUp:Ljava/lang/String;
    .end local v6           #message:[B
    :cond_e
    sget-boolean v9, Lcom/SixClawWorm/application/PlayControlActivity;->yellowOnclock:Z

    if-eqz v9, :cond_f

    .line 816
    const-string v4, "7100828002808012"

    .line 817
    .restart local v4       #leftUp:Ljava/lang/String;
    invoke-static {v4}, Lcom/SixClawWorm/application/PlayControlActivity;->string2Bytes(Ljava/lang/String;)[B

    move-result-object v6

    .line 818
    .restart local v6       #message:[B
    invoke-direct {p0, v6}, Lcom/SixClawWorm/application/PlayControlActivity;->sendMessage([B)V

    goto/16 :goto_0

    .line 820
    .end local v4           #leftUp:Ljava/lang/String;
    .end local v6           #message:[B
    :cond_f
    sget-boolean v9, Lcom/SixClawWorm/application/PlayControlActivity;->blueOnclock:Z

    if-eqz v9, :cond_10

    .line 821
    const-string v4, "7100828082808022"

    .line 822
    .restart local v4       #leftUp:Ljava/lang/String;
    invoke-static {v4}, Lcom/SixClawWorm/application/PlayControlActivity;->string2Bytes(Ljava/lang/String;)[B

    move-result-object v6

    .line 823
    .restart local v6       #message:[B
    invoke-direct {p0, v6}, Lcom/SixClawWorm/application/PlayControlActivity;->sendMessage([B)V

    goto/16 :goto_0

    .line 827
    .end local v4           #leftUp:Ljava/lang/String;
    .end local v6           #message:[B
    :cond_10
    const-string v4, "7100828080808002"

    .line 828
    .restart local v4       #leftUp:Ljava/lang/String;
    invoke-static {v4}, Lcom/SixClawWorm/application/PlayControlActivity;->string2Bytes(Ljava/lang/String;)[B

    move-result-object v6

    .line 829
    .restart local v6       #message:[B
    invoke-direct {p0, v6}, Lcom/SixClawWorm/application/PlayControlActivity;->sendMessage([B)V

    goto/16 :goto_0

    .line 834
    .end local v4           #leftUp:Ljava/lang/String;
    .end local v6           #message:[B
    :pswitch_4
    const-string v9, "SJF"

    const-string v10, "\u3010\u5de6\u4e0a\u3011 "

    invoke-static {v9, v10}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 835
    sput-boolean v12, Lcom/SixClawWorm/application/PlayControlActivity;->leftUp:Z

    .line 836
    sget-boolean v9, Lcom/SixClawWorm/application/PlayControlActivity;->redOnclock:Z

    if-eqz v9, :cond_11

    .line 837
    const-string v4, "7100028280808289"

    .line 838
    .restart local v4       #leftUp:Ljava/lang/String;
    invoke-static {v4}, Lcom/SixClawWorm/application/PlayControlActivity;->string2Bytes(Ljava/lang/String;)[B

    move-result-object v6

    .line 839
    .restart local v6       #message:[B
    invoke-direct {p0, v6}, Lcom/SixClawWorm/application/PlayControlActivity;->sendMessage([B)V

    goto/16 :goto_0

    .line 841
    .end local v4           #leftUp:Ljava/lang/String;
    .end local v6           #message:[B
    :cond_11
    sget-boolean v9, Lcom/SixClawWorm/application/PlayControlActivity;->greenOnclock:Z

    if-eqz v9, :cond_12

    .line 842
    const-string v4, "7100028280800249"

    .line 843
    .restart local v4       #leftUp:Ljava/lang/String;
    invoke-static {v4}, Lcom/SixClawWorm/application/PlayControlActivity;->string2Bytes(Ljava/lang/String;)[B

    move-result-object v6

    .line 844
    .restart local v6       #message:[B
    invoke-direct {p0, v6}, Lcom/SixClawWorm/application/PlayControlActivity;->sendMessage([B)V

    goto/16 :goto_0

    .line 846
    .end local v4           #leftUp:Ljava/lang/String;
    .end local v6           #message:[B
    :cond_12
    sget-boolean v9, Lcom/SixClawWorm/application/PlayControlActivity;->yellowOnclock:Z

    if-eqz v9, :cond_13

    .line 847
    const-string v4, "7100028202808019"

    .line 848
    .restart local v4       #leftUp:Ljava/lang/String;
    invoke-static {v4}, Lcom/SixClawWorm/application/PlayControlActivity;->string2Bytes(Ljava/lang/String;)[B

    move-result-object v6

    .line 849
    .restart local v6       #message:[B
    invoke-direct {p0, v6}, Lcom/SixClawWorm/application/PlayControlActivity;->sendMessage([B)V

    goto/16 :goto_0

    .line 851
    .end local v4           #leftUp:Ljava/lang/String;
    .end local v6           #message:[B
    :cond_13
    sget-boolean v9, Lcom/SixClawWorm/application/PlayControlActivity;->blueOnclock:Z

    if-eqz v9, :cond_14

    .line 852
    const-string v4, "7100028282808029"

    .line 853
    .restart local v4       #leftUp:Ljava/lang/String;
    invoke-static {v4}, Lcom/SixClawWorm/application/PlayControlActivity;->string2Bytes(Ljava/lang/String;)[B

    move-result-object v6

    .line 854
    .restart local v6       #message:[B
    invoke-direct {p0, v6}, Lcom/SixClawWorm/application/PlayControlActivity;->sendMessage([B)V

    goto/16 :goto_0

    .line 857
    .end local v4           #leftUp:Ljava/lang/String;
    .end local v6           #message:[B
    :cond_14
    const-string v4, "7100028280808009"

    .line 858
    .restart local v4       #leftUp:Ljava/lang/String;
    invoke-static {v4}, Lcom/SixClawWorm/application/PlayControlActivity;->string2Bytes(Ljava/lang/String;)[B

    move-result-object v8

    .line 859
    .restart local v8       #message4:[B
    invoke-direct {p0, v8}, Lcom/SixClawWorm/application/PlayControlActivity;->sendMessage([B)V

    goto/16 :goto_0

    .line 863
    .end local v4           #leftUp:Ljava/lang/String;
    .end local v8           #message4:[B
    :pswitch_5
    const-string v9, "SJF"

    const-string v10, "\u3010\u5de6\u4e0b\u3011 "

    invoke-static {v9, v10}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 864
    sput-boolean v12, Lcom/SixClawWorm/application/PlayControlActivity;->leftDown:Z

    .line 865
    sget-boolean v9, Lcom/SixClawWorm/application/PlayControlActivity;->redOnclock:Z

    if-eqz v9, :cond_15

    .line 866
    const-string v4, "7100828280808290"

    .line 867
    .restart local v4       #leftUp:Ljava/lang/String;
    invoke-static {v4}, Lcom/SixClawWorm/application/PlayControlActivity;->string2Bytes(Ljava/lang/String;)[B

    move-result-object v6

    .line 868
    .restart local v6       #message:[B
    invoke-direct {p0, v6}, Lcom/SixClawWorm/application/PlayControlActivity;->sendMessage([B)V

    goto/16 :goto_0

    .line 870
    .end local v4           #leftUp:Ljava/lang/String;
    .end local v6           #message:[B
    :cond_15
    sget-boolean v9, Lcom/SixClawWorm/application/PlayControlActivity;->greenOnclock:Z

    if-eqz v9, :cond_16

    .line 871
    const-string v4, "7100828280800250"

    .line 872
    .restart local v4       #leftUp:Ljava/lang/String;
    invoke-static {v4}, Lcom/SixClawWorm/application/PlayControlActivity;->string2Bytes(Ljava/lang/String;)[B

    move-result-object v6

    .line 873
    .restart local v6       #message:[B
    invoke-direct {p0, v6}, Lcom/SixClawWorm/application/PlayControlActivity;->sendMessage([B)V

    goto/16 :goto_0

    .line 875
    .end local v4           #leftUp:Ljava/lang/String;
    .end local v6           #message:[B
    :cond_16
    sget-boolean v9, Lcom/SixClawWorm/application/PlayControlActivity;->yellowOnclock:Z

    if-eqz v9, :cond_17

    .line 876
    const-string v4, "7100828202808020"

    .line 877
    .restart local v4       #leftUp:Ljava/lang/String;
    invoke-static {v4}, Lcom/SixClawWorm/application/PlayControlActivity;->string2Bytes(Ljava/lang/String;)[B

    move-result-object v6

    .line 878
    .restart local v6       #message:[B
    invoke-direct {p0, v6}, Lcom/SixClawWorm/application/PlayControlActivity;->sendMessage([B)V

    goto/16 :goto_0

    .line 880
    .end local v4           #leftUp:Ljava/lang/String;
    .end local v6           #message:[B
    :cond_17
    sget-boolean v9, Lcom/SixClawWorm/application/PlayControlActivity;->blueOnclock:Z

    if-eqz v9, :cond_18

    .line 881
    const-string v4, "7100828282808030"

    .line 882
    .restart local v4       #leftUp:Ljava/lang/String;
    invoke-static {v4}, Lcom/SixClawWorm/application/PlayControlActivity;->string2Bytes(Ljava/lang/String;)[B

    move-result-object v6

    .line 883
    .restart local v6       #message:[B
    invoke-direct {p0, v6}, Lcom/SixClawWorm/application/PlayControlActivity;->sendMessage([B)V

    goto/16 :goto_0

    .line 887
    .end local v4           #leftUp:Ljava/lang/String;
    .end local v6           #message:[B
    :cond_18
    const-string v4, "7100828280808010"

    .line 888
    .restart local v4       #leftUp:Ljava/lang/String;
    invoke-static {v4}, Lcom/SixClawWorm/application/PlayControlActivity;->string2Bytes(Ljava/lang/String;)[B

    move-result-object v8

    .line 889
    .restart local v8       #message4:[B
    invoke-direct {p0, v8}, Lcom/SixClawWorm/application/PlayControlActivity;->sendMessage([B)V

    goto/16 :goto_0

    .line 894
    .end local v4           #leftUp:Ljava/lang/String;
    .end local v8           #message4:[B
    :pswitch_6
    const-string v9, "SJF"

    const-string v10, "\u3010\u53f3\u4e0a\u3011 "

    invoke-static {v9, v10}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 895
    sput-boolean v12, Lcom/SixClawWorm/application/PlayControlActivity;->rightUp:Z

    .line 896
    sget-boolean v9, Lcom/SixClawWorm/application/PlayControlActivity;->redOnclock:Z

    if-eqz v9, :cond_19

    .line 897
    const-string v4, "7100020280808285"

    .line 898
    .restart local v4       #leftUp:Ljava/lang/String;
    invoke-static {v4}, Lcom/SixClawWorm/application/PlayControlActivity;->string2Bytes(Ljava/lang/String;)[B

    move-result-object v6

    .line 899
    .restart local v6       #message:[B
    invoke-direct {p0, v6}, Lcom/SixClawWorm/application/PlayControlActivity;->sendMessage([B)V

    goto/16 :goto_0

    .line 901
    .end local v4           #leftUp:Ljava/lang/String;
    .end local v6           #message:[B
    :cond_19
    sget-boolean v9, Lcom/SixClawWorm/application/PlayControlActivity;->greenOnclock:Z

    if-eqz v9, :cond_1a

    .line 902
    const-string v4, "7100020280800245"

    .line 903
    .restart local v4       #leftUp:Ljava/lang/String;
    invoke-static {v4}, Lcom/SixClawWorm/application/PlayControlActivity;->string2Bytes(Ljava/lang/String;)[B

    move-result-object v6

    .line 904
    .restart local v6       #message:[B
    invoke-direct {p0, v6}, Lcom/SixClawWorm/application/PlayControlActivity;->sendMessage([B)V

    goto/16 :goto_0

    .line 906
    .end local v4           #leftUp:Ljava/lang/String;
    .end local v6           #message:[B
    :cond_1a
    sget-boolean v9, Lcom/SixClawWorm/application/PlayControlActivity;->yellowOnclock:Z

    if-eqz v9, :cond_1b

    .line 907
    const-string v4, "7100020202808015"

    .line 908
    .restart local v4       #leftUp:Ljava/lang/String;
    invoke-static {v4}, Lcom/SixClawWorm/application/PlayControlActivity;->string2Bytes(Ljava/lang/String;)[B

    move-result-object v6

    .line 909
    .restart local v6       #message:[B
    invoke-direct {p0, v6}, Lcom/SixClawWorm/application/PlayControlActivity;->sendMessage([B)V

    goto/16 :goto_0

    .line 911
    .end local v4           #leftUp:Ljava/lang/String;
    .end local v6           #message:[B
    :cond_1b
    sget-boolean v9, Lcom/SixClawWorm/application/PlayControlActivity;->blueOnclock:Z

    if-eqz v9, :cond_1c

    .line 912
    const-string v4, "7100020282808025"

    .line 913
    .restart local v4       #leftUp:Ljava/lang/String;
    invoke-static {v4}, Lcom/SixClawWorm/application/PlayControlActivity;->string2Bytes(Ljava/lang/String;)[B

    move-result-object v6

    .line 914
    .restart local v6       #message:[B
    invoke-direct {p0, v6}, Lcom/SixClawWorm/application/PlayControlActivity;->sendMessage([B)V

    goto/16 :goto_0

    .line 918
    .end local v4           #leftUp:Ljava/lang/String;
    .end local v6           #message:[B
    :cond_1c
    const-string v4, "7100020280808005"

    .line 919
    .restart local v4       #leftUp:Ljava/lang/String;
    invoke-static {v4}, Lcom/SixClawWorm/application/PlayControlActivity;->string2Bytes(Ljava/lang/String;)[B

    move-result-object v8

    .line 920
    .restart local v8       #message4:[B
    invoke-direct {p0, v8}, Lcom/SixClawWorm/application/PlayControlActivity;->sendMessage([B)V

    goto/16 :goto_0

    .line 925
    .end local v4           #leftUp:Ljava/lang/String;
    .end local v8           #message4:[B
    :pswitch_7
    const-string v9, "SJF"

    const-string v10, "\u3010\u53f3\u4e0b\u3011 "

    invoke-static {v9, v10}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 926
    sput-boolean v12, Lcom/SixClawWorm/application/PlayControlActivity;->rightDown:Z

    .line 927
    sget-boolean v9, Lcom/SixClawWorm/application/PlayControlActivity;->redOnclock:Z

    if-eqz v9, :cond_1d

    .line 928
    const-string v4, "7100820280808286"

    .line 929
    .restart local v4       #leftUp:Ljava/lang/String;
    invoke-static {v4}, Lcom/SixClawWorm/application/PlayControlActivity;->string2Bytes(Ljava/lang/String;)[B

    move-result-object v6

    .line 930
    .restart local v6       #message:[B
    invoke-direct {p0, v6}, Lcom/SixClawWorm/application/PlayControlActivity;->sendMessage([B)V

    goto/16 :goto_0

    .line 932
    .end local v4           #leftUp:Ljava/lang/String;
    .end local v6           #message:[B
    :cond_1d
    sget-boolean v9, Lcom/SixClawWorm/application/PlayControlActivity;->greenOnclock:Z

    if-eqz v9, :cond_1e

    .line 933
    const-string v4, "7100820280800246"

    .line 934
    .restart local v4       #leftUp:Ljava/lang/String;
    invoke-static {v4}, Lcom/SixClawWorm/application/PlayControlActivity;->string2Bytes(Ljava/lang/String;)[B

    move-result-object v6

    .line 935
    .restart local v6       #message:[B
    invoke-direct {p0, v6}, Lcom/SixClawWorm/application/PlayControlActivity;->sendMessage([B)V

    goto/16 :goto_0

    .line 937
    .end local v4           #leftUp:Ljava/lang/String;
    .end local v6           #message:[B
    :cond_1e
    sget-boolean v9, Lcom/SixClawWorm/application/PlayControlActivity;->yellowOnclock:Z

    if-eqz v9, :cond_1f

    .line 938
    const-string v4, "7100820202808016"

    .line 939
    .restart local v4       #leftUp:Ljava/lang/String;
    invoke-static {v4}, Lcom/SixClawWorm/application/PlayControlActivity;->string2Bytes(Ljava/lang/String;)[B

    move-result-object v6

    .line 940
    .restart local v6       #message:[B
    invoke-direct {p0, v6}, Lcom/SixClawWorm/application/PlayControlActivity;->sendMessage([B)V

    goto/16 :goto_0

    .line 942
    .end local v4           #leftUp:Ljava/lang/String;
    .end local v6           #message:[B
    :cond_1f
    sget-boolean v9, Lcom/SixClawWorm/application/PlayControlActivity;->blueOnclock:Z

    if-eqz v9, :cond_20

    .line 943
    const-string v4, "7100820282808026"

    .line 944
    .restart local v4       #leftUp:Ljava/lang/String;
    invoke-static {v4}, Lcom/SixClawWorm/application/PlayControlActivity;->string2Bytes(Ljava/lang/String;)[B

    move-result-object v6

    .line 945
    .restart local v6       #message:[B
    invoke-direct {p0, v6}, Lcom/SixClawWorm/application/PlayControlActivity;->sendMessage([B)V

    goto/16 :goto_0

    .line 949
    .end local v4           #leftUp:Ljava/lang/String;
    .end local v6           #message:[B
    :cond_20
    const-string v4, "7100820280808006"

    .line 950
    .restart local v4       #leftUp:Ljava/lang/String;
    invoke-static {v4}, Lcom/SixClawWorm/application/PlayControlActivity;->string2Bytes(Ljava/lang/String;)[B

    move-result-object v8

    .line 951
    .restart local v8       #message4:[B
    invoke-direct {p0, v8}, Lcom/SixClawWorm/application/PlayControlActivity;->sendMessage([B)V

    goto/16 :goto_0

    .line 956
    .end local v4           #leftUp:Ljava/lang/String;
    .end local v8           #message4:[B
    :pswitch_8
    const-string v9, "SJF"

    const-string v10, "\u3010\u6447\u6746\u6309\u4e0b\u3011 "

    invoke-static {v9, v10}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 957
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v9

    iput-wide v9, p0, Lcom/SixClawWorm/application/PlayControlActivity;->startPauseTime:J

    .line 958
    iput-boolean v13, p0, Lcom/SixClawWorm/application/PlayControlActivity;->UpSongkai:Z

    goto/16 :goto_0

    .line 961
    :pswitch_9
    iget-wide v0, p0, Lcom/SixClawWorm/application/PlayControlActivity;->startPauseTime:J

    .line 962
    .local v0, MstartPauseTime:J
    iput-boolean v12, p0, Lcom/SixClawWorm/application/PlayControlActivity;->UpSongkai:Z

    .line 963
    sget-object v9, Ljava/lang/System;->out:Ljava/io/PrintStream;

    invoke-virtual {v9, v0, v1}, Ljava/io/PrintStream;->println(J)V

    .line 964
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    .line 965
    .local v2, endPauseTime:J
    sub-long v9, v2, v0

    iput-wide v9, p0, Lcom/SixClawWorm/application/PlayControlActivity;->stopTime:J

    .line 966
    sget-object v9, Ljava/lang/System;->out:Ljava/io/PrintStream;

    iget-wide v10, p0, Lcom/SixClawWorm/application/PlayControlActivity;->stopTime:J

    invoke-virtual {v9, v10, v11}, Ljava/io/PrintStream;->println(J)V

    .line 967
    const-string v9, "SJF"

    const-string v10, "\u3010\u6447\u6746\u677e\u5f00\u3011 "

    invoke-static {v9, v10}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 968
    sput-boolean v13, Lcom/SixClawWorm/application/PlayControlActivity;->left:Z

    .line 969
    sput-boolean v13, Lcom/SixClawWorm/application/PlayControlActivity;->right:Z

    .line 970
    sput-boolean v13, Lcom/SixClawWorm/application/PlayControlActivity;->leftDown:Z

    .line 971
    sput-boolean v13, Lcom/SixClawWorm/application/PlayControlActivity;->leftUp:Z

    .line 972
    sput-boolean v13, Lcom/SixClawWorm/application/PlayControlActivity;->rightDown:Z

    .line 973
    sput-boolean v13, Lcom/SixClawWorm/application/PlayControlActivity;->rightUp:Z

    .line 974
    sput-boolean v13, Lcom/SixClawWorm/application/PlayControlActivity;->up:Z

    .line 975
    sput-boolean v13, Lcom/SixClawWorm/application/PlayControlActivity;->down:Z

    .line 976
    sget-boolean v9, Lcom/SixClawWorm/application/PlayControlActivity;->right:Z

    if-nez v9, :cond_0

    goto/16 :goto_0

    .line 707
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

    .line 258
    sget-object v2, Lcom/SixClawWorm/utils/Param;->ChatService:Lcom/SixClawWorm/application/BluetoothChatService;

    iput-object v2, p0, Lcom/SixClawWorm/application/PlayControlActivity;->mChatService:Lcom/SixClawWorm/application/BluetoothChatService;

    .line 259
    new-instance v2, Ljava/lang/StringBuffer;

    const-string v3, ""

    invoke-direct {v2, v3}, Ljava/lang/StringBuffer;-><init>(Ljava/lang/String;)V

    iput-object v2, p0, Lcom/SixClawWorm/application/PlayControlActivity;->mOutStringBuffer:Ljava/lang/StringBuffer;

    .line 260
    iget-object v2, p0, Lcom/SixClawWorm/application/PlayControlActivity;->mChatService:Lcom/SixClawWorm/application/BluetoothChatService;

    if-eqz v2, :cond_0

    .line 261
    iget-object v2, p0, Lcom/SixClawWorm/application/PlayControlActivity;->mChatService:Lcom/SixClawWorm/application/BluetoothChatService;

    invoke-virtual {v2}, Lcom/SixClawWorm/application/BluetoothChatService;->getState()I

    move-result v2

    const/4 v3, 0x3

    if-eq v2, v3, :cond_1

    .line 263
    sput-boolean v4, Lcom/SixClawWorm/utils/Param;->ConntectSucceed:Z

    .line 314
    :cond_0
    :goto_0
    return-void

    .line 267
    :cond_1
    new-instance v2, Lcom/SixClawWorm/application/PlayControlActivity$3;

    invoke-direct {v2, p0}, Lcom/SixClawWorm/application/PlayControlActivity$3;-><init>(Lcom/SixClawWorm/application/PlayControlActivity;)V

    .line 280
    invoke-virtual {v2}, Lcom/SixClawWorm/application/PlayControlActivity$3;->start()V

    .line 282
    array-length v2, p1

    if-lez v2, :cond_4

    .line 284
    iget-object v2, p0, Lcom/SixClawWorm/application/PlayControlActivity;->mChatService:Lcom/SixClawWorm/application/BluetoothChatService;

    invoke-virtual {v2, p1}, Lcom/SixClawWorm/application/BluetoothChatService;->write([B)V

    .line 285
    iget-object v2, p0, Lcom/SixClawWorm/application/PlayControlActivity;->mOutStringBuffer:Ljava/lang/StringBuffer;

    invoke-virtual {v2, v4}, Ljava/lang/StringBuffer;->setLength(I)V

    .line 286
    sget-boolean v2, Lcom/SixClawWorm/application/PlayControlActivity;->left:Z

    if-nez v2, :cond_2

    sget-boolean v2, Lcom/SixClawWorm/application/PlayControlActivity;->right:Z

    if-nez v2, :cond_2

    sget-boolean v2, Lcom/SixClawWorm/application/PlayControlActivity;->blueOnclock:Z

    if-nez v2, :cond_2

    sget-boolean v2, Lcom/SixClawWorm/application/PlayControlActivity;->yellowOnclock:Z

    if-eqz v2, :cond_5

    :cond_2
    iget-wide v2, p0, Lcom/SixClawWorm/application/PlayControlActivity;->stopTime:J

    cmp-long v2, v2, v6

    if-ltz v2, :cond_3

    sget-wide v2, Lcom/SixClawWorm/utils/GButton;->stopTime:J

    cmp-long v2, v2, v6

    if-gez v2, :cond_5

    :cond_3
    iget-wide v2, p0, Lcom/SixClawWorm/application/PlayControlActivity;->startPauseTime:J

    iget-wide v4, p0, Lcom/SixClawWorm/application/PlayControlActivity;->stopTime:J

    cmp-long v2, v2, v4

    if-eqz v2, :cond_5

    .line 287
    sget-boolean v2, Lcom/SixClawWorm/application/PlayControlActivity;->redOnclock:Z

    if-nez v2, :cond_5

    sget-boolean v2, Lcom/SixClawWorm/application/PlayControlActivity;->blueOnclock:Z

    if-nez v2, :cond_5

    sget-boolean v2, Lcom/SixClawWorm/application/PlayControlActivity;->yellowOnclock:Z

    if-nez v2, :cond_5

    .line 288
    sget-boolean v2, Lcom/SixClawWorm/application/PlayControlActivity;->greenOnclock:Z

    if-nez v2, :cond_5

    .line 289
    const-string v0, "7100808080808001"

    .line 290
    .local v0, leftUp2:Ljava/lang/String;
    invoke-static {v0}, Lcom/SixClawWorm/application/PlayControlActivity;->string2Bytes(Ljava/lang/String;)[B

    move-result-object v1

    .line 291
    .local v1, message2:[B
    invoke-direct {p0, v1}, Lcom/SixClawWorm/application/PlayControlActivity;->TsendMessage([B)V

    .line 292
    iget-wide v2, p0, Lcom/SixClawWorm/application/PlayControlActivity;->stopTime:J

    iput-wide v2, p0, Lcom/SixClawWorm/application/PlayControlActivity;->startPauseTime:J

    .line 311
    .end local v0           #leftUp2:Ljava/lang/String;
    .end local v1           #message2:[B
    :cond_4
    :goto_1
    const/4 v2, 0x1

    iput-boolean v2, p0, Lcom/SixClawWorm/application/PlayControlActivity;->stopThread:Z

    goto :goto_0

    .line 294
    :cond_5
    sget-boolean v2, Lcom/SixClawWorm/application/PlayControlActivity;->blueOnclock:Z

    if-nez v2, :cond_6

    sget-boolean v2, Lcom/SixClawWorm/application/PlayControlActivity;->yellowOnclock:Z

    if-eqz v2, :cond_4

    :cond_6
    sget-wide v2, Lcom/SixClawWorm/utils/GButton;->stopTime:J

    cmp-long v2, v2, v6

    if-gez v2, :cond_4

    sget-wide v2, Lcom/SixClawWorm/utils/GButton;->startPauseTime:J

    sget-wide v4, Lcom/SixClawWorm/utils/GButton;->stopTime:J

    cmp-long v2, v2, v4

    if-eqz v2, :cond_4

    .line 295
    sget-boolean v2, Lcom/SixClawWorm/application/PlayControlActivity;->up:Z

    if-nez v2, :cond_4

    .line 296
    sget-boolean v2, Lcom/SixClawWorm/application/PlayControlActivity;->down:Z

    if-nez v2, :cond_4

    .line 297
    sget-boolean v2, Lcom/SixClawWorm/application/PlayControlActivity;->left:Z

    if-nez v2, :cond_4

    .line 298
    sget-boolean v2, Lcom/SixClawWorm/application/PlayControlActivity;->leftDown:Z

    if-nez v2, :cond_4

    .line 299
    sget-boolean v2, Lcom/SixClawWorm/application/PlayControlActivity;->leftUp:Z

    if-nez v2, :cond_4

    .line 300
    sget-boolean v2, Lcom/SixClawWorm/application/PlayControlActivity;->right:Z

    if-nez v2, :cond_4

    .line 301
    sget-boolean v2, Lcom/SixClawWorm/application/PlayControlActivity;->rightDown:Z

    if-nez v2, :cond_4

    .line 302
    sget-boolean v2, Lcom/SixClawWorm/application/PlayControlActivity;->rightUp:Z

    if-nez v2, :cond_4

    .line 303
    const-string v0, "7100808080808001"

    .line 304
    .restart local v0       #leftUp2:Ljava/lang/String;
    invoke-static {v0}, Lcom/SixClawWorm/application/PlayControlActivity;->string2Bytes(Ljava/lang/String;)[B

    move-result-object v1

    .line 305
    .restart local v1       #message2:[B
    invoke-direct {p0, v1}, Lcom/SixClawWorm/application/PlayControlActivity;->TsendMessage([B)V

    .line 306
    const-wide/16 v2, 0x258

    sput-wide v2, Lcom/SixClawWorm/utils/GButton;->stopTime:J

    goto :goto_1
.end method

.method private static string2Bytes(Ljava/lang/String;)[B
    .locals 6
    .parameter "str"

    .prologue
    .line 693
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v4

    div-int/lit8 v1, v4, 0x2

    .line 694
    .local v1, blen:I
    new-array v2, v1, [B

    .line 695
    .local v2, data:[B
    const/4 v3, 0x0

    .local v3, i:I
    :goto_0
    if-lt v3, v1, :cond_0

    .line 700
    return-object v2

    .line 697
    :cond_0
    mul-int/lit8 v4, v3, 0x2

    add-int/lit8 v5, v3, 0x1

    mul-int/lit8 v5, v5, 0x2

    invoke-virtual {p0, v4, v5}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v0

    .line 698
    .local v0, bStr:Ljava/lang/String;
    const/16 v4, 0x10

    invoke-static {v0, v4}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;I)I

    move-result v4

    int-to-byte v4, v4

    aput-byte v4, v2, v3

    .line 695
    add-int/lit8 v3, v3, 0x1

    goto :goto_0
.end method


# virtual methods
.method protected onCreate(Landroid/os/Bundle;)V
    .locals 1
    .parameter "pSavedInstanceState"

    .prologue
    .line 1003
    invoke-static {}, Lcom/SixClawWorm/utils/ExitApplication;->getInstance()Lcom/SixClawWorm/utils/ExitApplication;

    move-result-object v0

    invoke-virtual {v0, p0}, Lcom/SixClawWorm/utils/ExitApplication;->addActivity(Landroid/app/Activity;)V

    .line 1004
    invoke-super {p0, p1}, Lorg/anddev/andengine/ui/activity/BaseGameActivity;->onCreate(Landroid/os/Bundle;)V

    .line 1006
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/SixClawWorm/application/PlayControlActivity;->stopThread:Z

    .line 1007
    return-void
.end method

.method protected onDestroy()V
    .locals 2

    .prologue
    .line 1028
    iget-object v0, p0, Lcom/SixClawWorm/application/PlayControlActivity;->handler:Landroid/os/Handler;

    iget-object v1, p0, Lcom/SixClawWorm/application/PlayControlActivity;->runnable:Ljava/lang/Runnable;

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 1029
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/SixClawWorm/application/PlayControlActivity;->stopThread:Z

    .line 1030
    const/4 v0, 0x0

    sput-boolean v0, Lcom/SixClawWorm/utils/GButton;->isPlayControl:Z

    .line 1031
    iget-object v0, p0, Lcom/SixClawWorm/application/PlayControlActivity;->mEngine:Lorg/anddev/andengine/engine/Engine;

    invoke-virtual {v0}, Lorg/anddev/andengine/engine/Engine;->getTextureManager()Lorg/anddev/andengine/opengl/texture/TextureManager;

    move-result-object v0

    iget-object v1, p0, Lcom/SixClawWorm/application/PlayControlActivity;->mTexture:Lorg/anddev/andengine/opengl/texture/Texture;

    invoke-virtual {v0, v1}, Lorg/anddev/andengine/opengl/texture/TextureManager;->unloadTexture(Lorg/anddev/andengine/opengl/texture/Texture;)Z

    .line 1032
    iget-object v0, p0, Lcom/SixClawWorm/application/PlayControlActivity;->mEngine:Lorg/anddev/andengine/engine/Engine;

    invoke-virtual {v0}, Lorg/anddev/andengine/engine/Engine;->getTextureManager()Lorg/anddev/andengine/opengl/texture/TextureManager;

    move-result-object v0

    iget-object v1, p0, Lcom/SixClawWorm/application/PlayControlActivity;->mOnScreenControlTexture:Lorg/anddev/andengine/opengl/texture/Texture;

    invoke-virtual {v0, v1}, Lorg/anddev/andengine/opengl/texture/TextureManager;->unloadTexture(Lorg/anddev/andengine/opengl/texture/Texture;)Z

    .line 1033
    iget-object v0, p0, Lcom/SixClawWorm/application/PlayControlActivity;->mEngine:Lorg/anddev/andengine/engine/Engine;

    invoke-virtual {v0}, Lorg/anddev/andengine/engine/Engine;->getTextureManager()Lorg/anddev/andengine/opengl/texture/TextureManager;

    move-result-object v0

    iget-object v1, p0, Lcom/SixClawWorm/application/PlayControlActivity;->mControlButtonTexture:Lorg/anddev/andengine/opengl/texture/Texture;

    invoke-virtual {v0, v1}, Lorg/anddev/andengine/opengl/texture/TextureManager;->unloadTexture(Lorg/anddev/andengine/opengl/texture/Texture;)Z

    .line 1034
    invoke-super {p0}, Lorg/anddev/andengine/ui/activity/BaseGameActivity;->onDestroy()V

    .line 1035
    return-void
.end method

.method public onKeyDown(ILandroid/view/KeyEvent;)Z
    .locals 3
    .parameter "keyCode"
    .parameter "event"

    .prologue
    const/4 v2, 0x1

    .line 989
    const/4 v0, 0x4

    if-ne p1, v0, :cond_0

    .line 990
    iput-boolean v2, p0, Lcom/SixClawWorm/application/PlayControlActivity;->stopThread:Z

    .line 991
    iget-object v0, p0, Lcom/SixClawWorm/application/PlayControlActivity;->handler:Landroid/os/Handler;

    iget-object v1, p0, Lcom/SixClawWorm/application/PlayControlActivity;->runnable:Ljava/lang/Runnable;

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 992
    sput-boolean v2, Lcom/SixClawWorm/application/PlayControlActivity;->ifPlayControlActivity:Z

    .line 993
    invoke-virtual {p0}, Lcom/SixClawWorm/application/PlayControlActivity;->finish()V

    .line 999
    :cond_0
    invoke-super {p0, p1, p2}, Lorg/anddev/andengine/ui/activity/BaseGameActivity;->onKeyDown(ILandroid/view/KeyEvent;)Z

    move-result v0

    return v0
.end method

.method public onLoadComplete()V
    .locals 0

    .prologue
    .line 684
    return-void
.end method

.method public onLoadEngine()Lorg/anddev/andengine/engine/Engine;
    .locals 7

    .prologue
    const/4 v5, 0x0

    .line 132
    invoke-static {p0}, Lcom/SixClawWorm/utils/PlatformScreen;->GetWidth(Landroid/app/Activity;)I

    move-result v1

    iput v1, p0, Lcom/SixClawWorm/application/PlayControlActivity;->CAMERA_WIDTH:I

    .line 133
    invoke-static {p0}, Lcom/SixClawWorm/utils/PlatformScreen;->GetHeight(Landroid/app/Activity;)I

    move-result v1

    iput v1, p0, Lcom/SixClawWorm/application/PlayControlActivity;->CAMERA_HEIGHT:I

    .line 134
    invoke-static {}, Lcom/SixClawWorm/utils/ExitApplication;->getInstance()Lcom/SixClawWorm/utils/ExitApplication;

    move-result-object v1

    invoke-virtual {v1, p0}, Lcom/SixClawWorm/utils/ExitApplication;->addActivity(Landroid/app/Activity;)V

    .line 135
    iget-object v1, p0, Lcom/SixClawWorm/application/PlayControlActivity;->handler:Landroid/os/Handler;

    iget-object v2, p0, Lcom/SixClawWorm/application/PlayControlActivity;->runnable:Ljava/lang/Runnable;

    const-wide/16 v3, 0x64

    invoke-virtual {v1, v2, v3, v4}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 136
    new-instance v1, Lorg/anddev/andengine/engine/camera/Camera;

    iget v2, p0, Lcom/SixClawWorm/application/PlayControlActivity;->CAMERA_WIDTH:I

    int-to-float v2, v2

    iget v3, p0, Lcom/SixClawWorm/application/PlayControlActivity;->CAMERA_HEIGHT:I

    int-to-float v3, v3

    invoke-direct {v1, v5, v5, v2, v3}, Lorg/anddev/andengine/engine/camera/Camera;-><init>(FFFF)V

    iput-object v1, p0, Lcom/SixClawWorm/application/PlayControlActivity;->mCamera:Lorg/anddev/andengine/engine/camera/Camera;

    .line 140
    new-instance v0, Lorg/anddev/andengine/engine/Engine;

    new-instance v1, Lorg/anddev/andengine/engine/options/EngineOptions;

    const/4 v2, 0x1

    sget-object v3, Lorg/anddev/andengine/engine/options/EngineOptions$ScreenOrientation;->LANDSCAPE:Lorg/anddev/andengine/engine/options/EngineOptions$ScreenOrientation;

    .line 141
    new-instance v4, Lorg/anddev/andengine/engine/options/resolutionpolicy/RatioResolutionPolicy;

    iget v5, p0, Lcom/SixClawWorm/application/PlayControlActivity;->CAMERA_WIDTH:I

    int-to-float v5, v5

    iget v6, p0, Lcom/SixClawWorm/application/PlayControlActivity;->CAMERA_HEIGHT:I

    int-to-float v6, v6

    invoke-direct {v4, v5, v6}, Lorg/anddev/andengine/engine/options/resolutionpolicy/RatioResolutionPolicy;-><init>(FF)V

    iget-object v5, p0, Lcom/SixClawWorm/application/PlayControlActivity;->mCamera:Lorg/anddev/andengine/engine/camera/Camera;

    invoke-direct {v1, v2, v3, v4, v5}, Lorg/anddev/andengine/engine/options/EngineOptions;-><init>(ZLorg/anddev/andengine/engine/options/EngineOptions$ScreenOrientation;Lorg/anddev/andengine/engine/options/resolutionpolicy/IResolutionPolicy;Lorg/anddev/andengine/engine/camera/Camera;)V

    .line 140
    invoke-direct {v0, v1}, Lorg/anddev/andengine/engine/Engine;-><init>(Lorg/anddev/andengine/engine/options/EngineOptions;)V

    .line 143
    .local v0, engine:Lorg/anddev/andengine/engine/Engine;
    :try_start_0
    invoke-static {p0}, Lorg/anddev/andengine/extension/input/touch/controller/MultiTouch;->isSupported(Landroid/content/Context;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 144
    new-instance v1, Lorg/anddev/andengine/extension/input/touch/controller/MultiTouchController;

    invoke-direct {v1}, Lorg/anddev/andengine/extension/input/touch/controller/MultiTouchController;-><init>()V

    invoke-virtual {v0, v1}, Lorg/anddev/andengine/engine/Engine;->setTouchController(Lorg/anddev/andengine/input/touch/controller/ITouchController;)V

    .line 145
    invoke-static {p0}, Lorg/anddev/andengine/extension/input/touch/controller/MultiTouch;->isSupportedDistinct(Landroid/content/Context;)Z
    :try_end_0
    .catch Lorg/anddev/andengine/extension/input/touch/controller/MultiTouchException; {:try_start_0 .. :try_end_0} :catch_0

    .line 157
    :cond_0
    :goto_0
    return-object v0

    .line 153
    :catch_0
    move-exception v1

    goto :goto_0
.end method

.method public onLoadResources()V
    .locals 7

    .prologue
    .line 164
    const-string v0, "gfx/"

    invoke-static {v0}, Lorg/anddev/andengine/opengl/texture/region/TextureRegionFactory;->setAssetBasePath(Ljava/lang/String;)V

    .line 167
    new-instance v0, Lorg/anddev/andengine/engine/camera/hud/HUD;

    invoke-direct {v0}, Lorg/anddev/andengine/engine/camera/hud/HUD;-><init>()V

    iput-object v0, p0, Lcom/SixClawWorm/application/PlayControlActivity;->mHudScene:Lorg/anddev/andengine/engine/camera/hud/HUD;

    .line 168
    invoke-static {p0}, Lcom/SixClawWorm/utils/PlatformScreen;->GetWidth(Landroid/app/Activity;)I

    move-result v0

    iput v0, p0, Lcom/SixClawWorm/application/PlayControlActivity;->CAMERA_WIDTH:I

    .line 169
    invoke-static {p0}, Lcom/SixClawWorm/utils/PlatformScreen;->GetHeight(Landroid/app/Activity;)I

    move-result v0

    iput v0, p0, Lcom/SixClawWorm/application/PlayControlActivity;->CAMERA_HEIGHT:I

    .line 172
    new-instance v0, Lorg/anddev/andengine/opengl/texture/Texture;

    const/16 v1, 0x400

    const/16 v2, 0x400

    .line 173
    sget-object v3, Lorg/anddev/andengine/opengl/texture/TextureOptions;->BILINEAR_PREMULTIPLYALPHA:Lorg/anddev/andengine/opengl/texture/TextureOptions;

    invoke-direct {v0, v1, v2, v3}, Lorg/anddev/andengine/opengl/texture/Texture;-><init>(IILorg/anddev/andengine/opengl/texture/TextureOptions;)V

    .line 172
    iput-object v0, p0, Lcom/SixClawWorm/application/PlayControlActivity;->mTexture:Lorg/anddev/andengine/opengl/texture/Texture;

    .line 175
    iget-object v0, p0, Lcom/SixClawWorm/application/PlayControlActivity;->mTexture:Lorg/anddev/andengine/opengl/texture/Texture;

    const-string v1, "background.jpg"

    const/4 v2, 0x0

    const/4 v3, 0x0

    .line 174
    invoke-static {v0, p0, v1, v2, v3}, Lorg/anddev/andengine/opengl/texture/region/TextureRegionFactory;->createFromAsset(Lorg/anddev/andengine/opengl/texture/Texture;Landroid/content/Context;Ljava/lang/String;II)Lorg/anddev/andengine/opengl/texture/region/TextureRegion;

    move-result-object v0

    iput-object v0, p0, Lcom/SixClawWorm/application/PlayControlActivity;->mBackgroundTextureRegion:Lorg/anddev/andengine/opengl/texture/region/TextureRegion;

    .line 177
    iget-object v0, p0, Lcom/SixClawWorm/application/PlayControlActivity;->mTexture:Lorg/anddev/andengine/opengl/texture/Texture;

    .line 178
    const-string v2, "signal.png"

    const/4 v3, 0x0

    const/16 v4, 0x1e1

    const/4 v5, 0x4

    const/4 v6, 0x1

    move-object v1, p0

    .line 177
    invoke-static/range {v0 .. v6}, Lorg/anddev/andengine/opengl/texture/region/TextureRegionFactory;->createTiledFromAsset(Lorg/anddev/andengine/opengl/texture/Texture;Landroid/content/Context;Ljava/lang/String;IIII)Lorg/anddev/andengine/opengl/texture/region/TiledTextureRegion;

    move-result-object v0

    iput-object v0, p0, Lcom/SixClawWorm/application/PlayControlActivity;->singalSpriteRegion:Lorg/anddev/andengine/opengl/texture/region/TiledTextureRegion;

    .line 181
    iget-object v0, p0, Lcom/SixClawWorm/application/PlayControlActivity;->mTexture:Lorg/anddev/andengine/opengl/texture/Texture;

    .line 182
    const-string v2, "btn_back.png"

    iget v3, p0, Lcom/SixClawWorm/application/PlayControlActivity;->CAMERA_WIDTH:I

    const/4 v4, 0x0

    const/4 v5, 0x2

    const/4 v6, 0x1

    move-object v1, p0

    .line 181
    invoke-static/range {v0 .. v6}, Lorg/anddev/andengine/opengl/texture/region/TextureRegionFactory;->createTiledFromAsset(Lorg/anddev/andengine/opengl/texture/Texture;Landroid/content/Context;Ljava/lang/String;IIII)Lorg/anddev/andengine/opengl/texture/region/TiledTextureRegion;

    move-result-object v0

    iput-object v0, p0, Lcom/SixClawWorm/application/PlayControlActivity;->backButtonRegion:Lorg/anddev/andengine/opengl/texture/region/TiledTextureRegion;

    .line 184
    iget-object v0, p0, Lcom/SixClawWorm/application/PlayControlActivity;->mTexture:Lorg/anddev/andengine/opengl/texture/Texture;

    .line 185
    const-string v2, "btn_about.png"

    iget v3, p0, Lcom/SixClawWorm/application/PlayControlActivity;->CAMERA_WIDTH:I

    const/16 v4, 0x50

    const/4 v5, 0x2

    const/4 v6, 0x1

    move-object v1, p0

    .line 184
    invoke-static/range {v0 .. v6}, Lorg/anddev/andengine/opengl/texture/region/TextureRegionFactory;->createTiledFromAsset(Lorg/anddev/andengine/opengl/texture/Texture;Landroid/content/Context;Ljava/lang/String;IIII)Lorg/anddev/andengine/opengl/texture/region/TiledTextureRegion;

    move-result-object v0

    iput-object v0, p0, Lcom/SixClawWorm/application/PlayControlActivity;->aboutButtonRegion:Lorg/anddev/andengine/opengl/texture/region/TiledTextureRegion;

    .line 189
    new-instance v0, Lorg/anddev/andengine/opengl/texture/Texture;

    const/16 v1, 0x200

    const/16 v2, 0x200

    .line 190
    sget-object v3, Lorg/anddev/andengine/opengl/texture/TextureOptions;->BILINEAR_PREMULTIPLYALPHA:Lorg/anddev/andengine/opengl/texture/TextureOptions;

    invoke-direct {v0, v1, v2, v3}, Lorg/anddev/andengine/opengl/texture/Texture;-><init>(IILorg/anddev/andengine/opengl/texture/TextureOptions;)V

    .line 189
    iput-object v0, p0, Lcom/SixClawWorm/application/PlayControlActivity;->mOnScreenControlTexture:Lorg/anddev/andengine/opengl/texture/Texture;

    .line 194
    iget-object v0, p0, Lcom/SixClawWorm/application/PlayControlActivity;->mOnScreenControlTexture:Lorg/anddev/andengine/opengl/texture/Texture;

    .line 195
    const-string v1, "control_base.png"

    const/4 v2, 0x0

    const/4 v3, 0x0

    .line 194
    invoke-static {v0, p0, v1, v2, v3}, Lorg/anddev/andengine/opengl/texture/region/TextureRegionFactory;->createFromAsset(Lorg/anddev/andengine/opengl/texture/Texture;Landroid/content/Context;Ljava/lang/String;II)Lorg/anddev/andengine/opengl/texture/region/TextureRegion;

    move-result-object v0

    .line 193
    iput-object v0, p0, Lcom/SixClawWorm/application/PlayControlActivity;->mOnScreenControlBaseTextureRegion:Lorg/anddev/andengine/opengl/texture/region/TextureRegion;

    .line 198
    iget-object v0, p0, Lcom/SixClawWorm/application/PlayControlActivity;->mOnScreenControlTexture:Lorg/anddev/andengine/opengl/texture/Texture;

    .line 199
    const-string v1, "control_knob.png"

    const/16 v2, 0x106

    const/4 v3, 0x0

    .line 198
    invoke-static {v0, p0, v1, v2, v3}, Lorg/anddev/andengine/opengl/texture/region/TextureRegionFactory;->createFromAsset(Lorg/anddev/andengine/opengl/texture/Texture;Landroid/content/Context;Ljava/lang/String;II)Lorg/anddev/andengine/opengl/texture/region/TextureRegion;

    move-result-object v0

    .line 197
    iput-object v0, p0, Lcom/SixClawWorm/application/PlayControlActivity;->mOnScreenControlKnobTextureRegion:Lorg/anddev/andengine/opengl/texture/region/TextureRegion;

    .line 202
    new-instance v0, Lorg/anddev/andengine/opengl/texture/Texture;

    const/16 v1, 0x200

    const/16 v2, 0x200

    .line 203
    sget-object v3, Lorg/anddev/andengine/opengl/texture/TextureOptions;->BILINEAR_PREMULTIPLYALPHA:Lorg/anddev/andengine/opengl/texture/TextureOptions;

    invoke-direct {v0, v1, v2, v3}, Lorg/anddev/andengine/opengl/texture/Texture;-><init>(IILorg/anddev/andengine/opengl/texture/TextureOptions;)V

    .line 202
    iput-object v0, p0, Lcom/SixClawWorm/application/PlayControlActivity;->mControlButtonTexture:Lorg/anddev/andengine/opengl/texture/Texture;

    .line 205
    iget-object v0, p0, Lcom/SixClawWorm/application/PlayControlActivity;->mControlButtonTexture:Lorg/anddev/andengine/opengl/texture/Texture;

    .line 206
    const-string v2, "btn_green.png"

    const/4 v3, 0x0

    const/4 v4, 0x0

    const/4 v5, 0x2

    const/4 v6, 0x1

    move-object v1, p0

    .line 205
    invoke-static/range {v0 .. v6}, Lorg/anddev/andengine/opengl/texture/region/TextureRegionFactory;->createTiledFromAsset(Lorg/anddev/andengine/opengl/texture/Texture;Landroid/content/Context;Ljava/lang/String;IIII)Lorg/anddev/andengine/opengl/texture/region/TiledTextureRegion;

    move-result-object v0

    iput-object v0, p0, Lcom/SixClawWorm/application/PlayControlActivity;->greenButtonRegion:Lorg/anddev/andengine/opengl/texture/region/TiledTextureRegion;

    .line 208
    iget-object v0, p0, Lcom/SixClawWorm/application/PlayControlActivity;->mControlButtonTexture:Lorg/anddev/andengine/opengl/texture/Texture;

    .line 209
    const-string v2, "btn_red.png"

    const/16 v3, 0xe4

    const/4 v4, 0x0

    const/4 v5, 0x2

    const/4 v6, 0x1

    move-object v1, p0

    .line 208
    invoke-static/range {v0 .. v6}, Lorg/anddev/andengine/opengl/texture/region/TextureRegionFactory;->createTiledFromAsset(Lorg/anddev/andengine/opengl/texture/Texture;Landroid/content/Context;Ljava/lang/String;IIII)Lorg/anddev/andengine/opengl/texture/region/TiledTextureRegion;

    move-result-object v0

    iput-object v0, p0, Lcom/SixClawWorm/application/PlayControlActivity;->redButtonRegion:Lorg/anddev/andengine/opengl/texture/region/TiledTextureRegion;

    .line 211
    iget-object v0, p0, Lcom/SixClawWorm/application/PlayControlActivity;->mControlButtonTexture:Lorg/anddev/andengine/opengl/texture/Texture;

    .line 212
    const-string v2, "btn_blue.png"

    const/4 v3, 0x0

    const/16 v4, 0xe4

    const/4 v5, 0x2

    const/4 v6, 0x1

    move-object v1, p0

    .line 211
    invoke-static/range {v0 .. v6}, Lorg/anddev/andengine/opengl/texture/region/TextureRegionFactory;->createTiledFromAsset(Lorg/anddev/andengine/opengl/texture/Texture;Landroid/content/Context;Ljava/lang/String;IIII)Lorg/anddev/andengine/opengl/texture/region/TiledTextureRegion;

    move-result-object v0

    iput-object v0, p0, Lcom/SixClawWorm/application/PlayControlActivity;->blueButtonRegion:Lorg/anddev/andengine/opengl/texture/region/TiledTextureRegion;

    .line 214
    iget-object v0, p0, Lcom/SixClawWorm/application/PlayControlActivity;->mControlButtonTexture:Lorg/anddev/andengine/opengl/texture/Texture;

    .line 215
    const-string v2, "btn_yellow.png"

    const/16 v3, 0xe4

    const/16 v4, 0xe4

    const/4 v5, 0x2

    const/4 v6, 0x1

    move-object v1, p0

    .line 214
    invoke-static/range {v0 .. v6}, Lorg/anddev/andengine/opengl/texture/region/TextureRegionFactory;->createTiledFromAsset(Lorg/anddev/andengine/opengl/texture/Texture;Landroid/content/Context;Ljava/lang/String;IIII)Lorg/anddev/andengine/opengl/texture/region/TiledTextureRegion;

    move-result-object v0

    iput-object v0, p0, Lcom/SixClawWorm/application/PlayControlActivity;->yellowButtonRegion:Lorg/anddev/andengine/opengl/texture/region/TiledTextureRegion;

    .line 218
    iget-object v0, p0, Lcom/SixClawWorm/application/PlayControlActivity;->mEngine:Lorg/anddev/andengine/engine/Engine;

    invoke-virtual {v0}, Lorg/anddev/andengine/engine/Engine;->getTextureManager()Lorg/anddev/andengine/opengl/texture/TextureManager;

    move-result-object v0

    const/4 v1, 0x3

    new-array v1, v1, [Lorg/anddev/andengine/opengl/texture/Texture;

    const/4 v2, 0x0

    iget-object v3, p0, Lcom/SixClawWorm/application/PlayControlActivity;->mTexture:Lorg/anddev/andengine/opengl/texture/Texture;

    aput-object v3, v1, v2

    const/4 v2, 0x1

    .line 219
    iget-object v3, p0, Lcom/SixClawWorm/application/PlayControlActivity;->mOnScreenControlTexture:Lorg/anddev/andengine/opengl/texture/Texture;

    aput-object v3, v1, v2

    const/4 v2, 0x2

    iget-object v3, p0, Lcom/SixClawWorm/application/PlayControlActivity;->mControlButtonTexture:Lorg/anddev/andengine/opengl/texture/Texture;

    aput-object v3, v1, v2

    .line 218
    invoke-virtual {v0, v1}, Lorg/anddev/andengine/opengl/texture/TextureManager;->loadTextures([Lorg/anddev/andengine/opengl/texture/Texture;)V

    .line 220
    return-void
.end method

.method public onLoadScene()Lorg/anddev/andengine/entity/scene/Scene;
    .locals 11

    .prologue
    .line 347
    iget-object v1, p0, Lcom/SixClawWorm/application/PlayControlActivity;->mEngine:Lorg/anddev/andengine/engine/Engine;

    new-instance v2, Lorg/anddev/andengine/entity/util/FPSLogger;

    invoke-direct {v2}, Lorg/anddev/andengine/entity/util/FPSLogger;-><init>()V

    invoke-virtual {v1, v2}, Lorg/anddev/andengine/engine/Engine;->registerUpdateHandler(Lorg/anddev/andengine/engine/handler/IUpdateHandler;)V

    .line 348
    new-instance v10, Lorg/anddev/andengine/entity/scene/Scene;

    const/4 v1, 0x1

    invoke-direct {v10, v1}, Lorg/anddev/andengine/entity/scene/Scene;-><init>(I)V

    .line 349
    .local v10, scene:Lorg/anddev/andengine/entity/scene/Scene;
    iget-object v1, p0, Lcom/SixClawWorm/application/PlayControlActivity;->mCamera:Lorg/anddev/andengine/engine/camera/Camera;

    iget-object v2, p0, Lcom/SixClawWorm/application/PlayControlActivity;->mHudScene:Lorg/anddev/andengine/engine/camera/hud/HUD;

    invoke-virtual {v1, v2}, Lorg/anddev/andengine/engine/camera/Camera;->setHUD(Lorg/anddev/andengine/engine/camera/hud/HUD;)V

    .line 350
    invoke-static {p0}, Lcom/SixClawWorm/utils/PlatformScreen;->GetWidth(Landroid/app/Activity;)I

    move-result v1

    iput v1, p0, Lcom/SixClawWorm/application/PlayControlActivity;->CAMERA_WIDTH:I

    .line 351
    invoke-static {p0}, Lcom/SixClawWorm/utils/PlatformScreen;->GetHeight(Landroid/app/Activity;)I

    move-result v1

    iput v1, p0, Lcom/SixClawWorm/application/PlayControlActivity;->CAMERA_HEIGHT:I

    .line 353
    new-instance v1, Lorg/anddev/andengine/entity/sprite/Sprite;

    const/4 v2, 0x0

    const/4 v3, 0x0

    iget-object v4, p0, Lcom/SixClawWorm/application/PlayControlActivity;->mBackgroundTextureRegion:Lorg/anddev/andengine/opengl/texture/region/TextureRegion;

    invoke-direct {v1, v2, v3, v4}, Lorg/anddev/andengine/entity/sprite/Sprite;-><init>(FFLorg/anddev/andengine/opengl/texture/region/TextureRegion;)V

    iput-object v1, p0, Lcom/SixClawWorm/application/PlayControlActivity;->mBackgroundSprite:Lorg/anddev/andengine/entity/sprite/Sprite;

    .line 354
    iget-object v1, p0, Lcom/SixClawWorm/application/PlayControlActivity;->mHudScene:Lorg/anddev/andengine/engine/camera/hud/HUD;

    invoke-virtual {v1}, Lorg/anddev/andengine/engine/camera/hud/HUD;->getTopLayer()Lorg/anddev/andengine/entity/layer/ILayer;

    move-result-object v1

    iget-object v2, p0, Lcom/SixClawWorm/application/PlayControlActivity;->mBackgroundSprite:Lorg/anddev/andengine/entity/sprite/Sprite;

    invoke-interface {v1, v2}, Lorg/anddev/andengine/entity/layer/ILayer;->addEntity(Lorg/anddev/andengine/entity/IEntity;)V

    .line 357
    new-instance v0, Lcom/SixClawWorm/utils/GButton;

    const/16 v1, 0x1e

    const/16 v2, 0xa

    iget-object v3, p0, Lcom/SixClawWorm/application/PlayControlActivity;->mCamera:Lorg/anddev/andengine/engine/camera/Camera;

    iget-object v4, p0, Lcom/SixClawWorm/application/PlayControlActivity;->mEngine:Lorg/anddev/andengine/engine/Engine;

    iget-object v5, p0, Lcom/SixClawWorm/application/PlayControlActivity;->backButtonRegion:Lorg/anddev/andengine/opengl/texture/region/TiledTextureRegion;

    new-instance v6, Lcom/SixClawWorm/application/PlayControlActivity$4;

    invoke-direct {v6, p0}, Lcom/SixClawWorm/application/PlayControlActivity$4;-><init>(Lcom/SixClawWorm/application/PlayControlActivity;)V

    .line 372
    const/4 v7, 0x0

    invoke-direct/range {v0 .. v7}, Lcom/SixClawWorm/utils/GButton;-><init>(IILorg/anddev/andengine/engine/camera/Camera;Lorg/anddev/andengine/engine/Engine;Lorg/anddev/andengine/opengl/texture/region/TiledTextureRegion;Lcom/SixClawWorm/utils/GButton$GButtonClickListener;Ljava/lang/String;)V

    .line 357
    iput-object v0, p0, Lcom/SixClawWorm/application/PlayControlActivity;->backButton:Lcom/SixClawWorm/utils/GButton;

    .line 373
    iget-object v1, p0, Lcom/SixClawWorm/application/PlayControlActivity;->mHudScene:Lorg/anddev/andengine/engine/camera/hud/HUD;

    invoke-virtual {v1}, Lorg/anddev/andengine/engine/camera/hud/HUD;->getTopLayer()Lorg/anddev/andengine/entity/layer/ILayer;

    move-result-object v1

    iget-object v2, p0, Lcom/SixClawWorm/application/PlayControlActivity;->backButton:Lcom/SixClawWorm/utils/GButton;

    invoke-interface {v1, v2}, Lorg/anddev/andengine/entity/layer/ILayer;->addEntity(Lorg/anddev/andengine/entity/IEntity;)V

    .line 375
    new-instance v0, Lcom/SixClawWorm/utils/GButton;

    const/16 v1, 0x321

    const/16 v2, 0x1b8

    iget-object v3, p0, Lcom/SixClawWorm/application/PlayControlActivity;->mCamera:Lorg/anddev/andengine/engine/camera/Camera;

    iget-object v4, p0, Lcom/SixClawWorm/application/PlayControlActivity;->mEngine:Lorg/anddev/andengine/engine/Engine;

    iget-object v5, p0, Lcom/SixClawWorm/application/PlayControlActivity;->aboutButtonRegion:Lorg/anddev/andengine/opengl/texture/region/TiledTextureRegion;

    new-instance v6, Lcom/SixClawWorm/application/PlayControlActivity$5;

    invoke-direct {v6, p0}, Lcom/SixClawWorm/application/PlayControlActivity$5;-><init>(Lcom/SixClawWorm/application/PlayControlActivity;)V

    .line 386
    const/4 v7, 0x0

    invoke-direct/range {v0 .. v7}, Lcom/SixClawWorm/utils/GButton;-><init>(IILorg/anddev/andengine/engine/camera/Camera;Lorg/anddev/andengine/engine/Engine;Lorg/anddev/andengine/opengl/texture/region/TiledTextureRegion;Lcom/SixClawWorm/utils/GButton$GButtonClickListener;Ljava/lang/String;)V

    .line 375
    iput-object v0, p0, Lcom/SixClawWorm/application/PlayControlActivity;->aboutButton:Lcom/SixClawWorm/utils/GButton;

    .line 387
    iget-object v1, p0, Lcom/SixClawWorm/application/PlayControlActivity;->mHudScene:Lorg/anddev/andengine/engine/camera/hud/HUD;

    invoke-virtual {v1}, Lorg/anddev/andengine/engine/camera/hud/HUD;->getTopLayer()Lorg/anddev/andengine/entity/layer/ILayer;

    move-result-object v1

    iget-object v2, p0, Lcom/SixClawWorm/application/PlayControlActivity;->aboutButton:Lcom/SixClawWorm/utils/GButton;

    invoke-interface {v1, v2}, Lorg/anddev/andengine/entity/layer/ILayer;->addEntity(Lorg/anddev/andengine/entity/IEntity;)V

    .line 389
    new-instance v1, Lorg/anddev/andengine/entity/sprite/AnimatedSprite;

    const/high16 v2, 0x442f

    const/high16 v3, 0x4140

    iget-object v4, p0, Lcom/SixClawWorm/application/PlayControlActivity;->singalSpriteRegion:Lorg/anddev/andengine/opengl/texture/region/TiledTextureRegion;

    invoke-direct {v1, v2, v3, v4}, Lorg/anddev/andengine/entity/sprite/AnimatedSprite;-><init>(FFLorg/anddev/andengine/opengl/texture/region/TiledTextureRegion;)V

    iput-object v1, p0, Lcom/SixClawWorm/application/PlayControlActivity;->singalSprite:Lorg/anddev/andengine/entity/sprite/AnimatedSprite;

    .line 391
    iget-object v1, p0, Lcom/SixClawWorm/application/PlayControlActivity;->mHudScene:Lorg/anddev/andengine/engine/camera/hud/HUD;

    invoke-virtual {v1}, Lorg/anddev/andengine/engine/camera/hud/HUD;->getTopLayer()Lorg/anddev/andengine/entity/layer/ILayer;

    move-result-object v1

    iget-object v2, p0, Lcom/SixClawWorm/application/PlayControlActivity;->singalSprite:Lorg/anddev/andengine/entity/sprite/AnimatedSprite;

    invoke-interface {v1, v2}, Lorg/anddev/andengine/entity/layer/ILayer;->addEntity(Lorg/anddev/andengine/entity/IEntity;)V

    .line 392
    iget-object v1, p0, Lcom/SixClawWorm/application/PlayControlActivity;->singalSprite:Lorg/anddev/andengine/entity/sprite/AnimatedSprite;

    const/4 v2, 0x3

    invoke-virtual {v1, v2}, Lorg/anddev/andengine/entity/sprite/AnimatedSprite;->setCurrentTileIndex(I)V

    .line 394
    new-instance v0, Lorg/anddev/andengine/engine/camera/hud/controls/AnalogOnScreenControl;

    .line 395
    const/16 v1, 0x58

    .line 396
    const/16 v2, 0x64

    .line 397
    iget-object v3, p0, Lcom/SixClawWorm/application/PlayControlActivity;->mCamera:Lorg/anddev/andengine/engine/camera/Camera;

    iget-object v4, p0, Lcom/SixClawWorm/application/PlayControlActivity;->mOnScreenControlBaseTextureRegion:Lorg/anddev/andengine/opengl/texture/region/TextureRegion;

    .line 398
    iget-object v5, p0, Lcom/SixClawWorm/application/PlayControlActivity;->mOnScreenControlKnobTextureRegion:Lorg/anddev/andengine/opengl/texture/region/TextureRegion;

    const v6, 0x3dcccccd

    const-wide/16 v7, 0x15e

    .line 399
    new-instance v9, Lcom/SixClawWorm/application/PlayControlActivity$6;

    invoke-direct {v9, p0}, Lcom/SixClawWorm/application/PlayControlActivity$6;-><init>(Lcom/SixClawWorm/application/PlayControlActivity;)V

    .line 394
    invoke-direct/range {v0 .. v9}, Lorg/anddev/andengine/engine/camera/hud/controls/AnalogOnScreenControl;-><init>(IILorg/anddev/andengine/engine/camera/Camera;Lorg/anddev/andengine/opengl/texture/region/TextureRegion;Lorg/anddev/andengine/opengl/texture/region/TextureRegion;FJLorg/anddev/andengine/engine/camera/hud/controls/AnalogOnScreenControl$IAnalogOnScreenControlListener;)V

    .line 501
    .local v0, analogOnScreenControl:Lorg/anddev/andengine/engine/camera/hud/controls/AnalogOnScreenControl;
    invoke-virtual {v0}, Lorg/anddev/andengine/engine/camera/hud/controls/AnalogOnScreenControl;->getControlBase()Lorg/anddev/andengine/entity/sprite/Sprite;

    move-result-object v1

    .line 502
    const/16 v2, 0x302

    const/16 v3, 0x303

    .line 501
    invoke-virtual {v1, v2, v3}, Lorg/anddev/andengine/entity/sprite/Sprite;->setBlendFunction(II)V

    .line 503
    invoke-virtual {v0}, Lorg/anddev/andengine/engine/camera/hud/controls/AnalogOnScreenControl;->getControlBase()Lorg/anddev/andengine/entity/sprite/Sprite;

    move-result-object v1

    const/high16 v2, 0x3f80

    invoke-virtual {v1, v2}, Lorg/anddev/andengine/entity/sprite/Sprite;->setAlpha(F)V

    .line 504
    invoke-virtual {v0}, Lorg/anddev/andengine/engine/camera/hud/controls/AnalogOnScreenControl;->getControlBase()Lorg/anddev/andengine/entity/sprite/Sprite;

    move-result-object v1

    const/4 v2, 0x0

    const/4 v3, 0x0

    invoke-virtual {v1, v2, v3}, Lorg/anddev/andengine/entity/sprite/Sprite;->setScaleCenter(FF)V

    .line 505
    invoke-virtual {v0}, Lorg/anddev/andengine/engine/camera/hud/controls/AnalogOnScreenControl;->getControlBase()Lorg/anddev/andengine/entity/sprite/Sprite;

    move-result-object v1

    const/high16 v2, 0x3fa0

    invoke-virtual {v1, v2}, Lorg/anddev/andengine/entity/sprite/Sprite;->setScale(F)V

    .line 506
    invoke-virtual {v0}, Lorg/anddev/andengine/engine/camera/hud/controls/AnalogOnScreenControl;->getControlKnob()Lorg/anddev/andengine/entity/sprite/Sprite;

    move-result-object v1

    const/high16 v2, 0x3fa0

    invoke-virtual {v1, v2}, Lorg/anddev/andengine/entity/sprite/Sprite;->setScale(F)V

    .line 507
    invoke-virtual {v0}, Lorg/anddev/andengine/engine/camera/hud/controls/AnalogOnScreenControl;->refreshControlKnobPosition()V

    .line 508
    iget-object v1, p0, Lcom/SixClawWorm/application/PlayControlActivity;->mHudScene:Lorg/anddev/andengine/engine/camera/hud/HUD;

    invoke-virtual {v1, v0}, Lorg/anddev/andengine/engine/camera/hud/HUD;->setChildScene(Lorg/anddev/andengine/entity/scene/Scene;)V

    .line 513
    new-instance v1, Lcom/SixClawWorm/utils/GButton;

    const/16 v2, 0x217

    const/16 v3, 0x55

    iget-object v4, p0, Lcom/SixClawWorm/application/PlayControlActivity;->mCamera:Lorg/anddev/andengine/engine/camera/Camera;

    iget-object v5, p0, Lcom/SixClawWorm/application/PlayControlActivity;->mEngine:Lorg/anddev/andengine/engine/Engine;

    iget-object v6, p0, Lcom/SixClawWorm/application/PlayControlActivity;->greenButtonRegion:Lorg/anddev/andengine/opengl/texture/region/TiledTextureRegion;

    new-instance v7, Lcom/SixClawWorm/application/PlayControlActivity$7;

    invoke-direct {v7, p0}, Lcom/SixClawWorm/application/PlayControlActivity$7;-><init>(Lcom/SixClawWorm/application/PlayControlActivity;)V

    .line 552
    const/4 v8, 0x0

    invoke-direct/range {v1 .. v8}, Lcom/SixClawWorm/utils/GButton;-><init>(IILorg/anddev/andengine/engine/camera/Camera;Lorg/anddev/andengine/engine/Engine;Lorg/anddev/andengine/opengl/texture/region/TiledTextureRegion;Lcom/SixClawWorm/utils/GButton$GButtonClickListener;Ljava/lang/String;)V

    .line 513
    iput-object v1, p0, Lcom/SixClawWorm/application/PlayControlActivity;->greenButton:Lcom/SixClawWorm/utils/GButton;

    .line 553
    iget-object v1, p0, Lcom/SixClawWorm/application/PlayControlActivity;->mHudScene:Lorg/anddev/andengine/engine/camera/hud/HUD;

    invoke-virtual {v1}, Lorg/anddev/andengine/engine/camera/hud/HUD;->getTopLayer()Lorg/anddev/andengine/entity/layer/ILayer;

    move-result-object v1

    iget-object v2, p0, Lcom/SixClawWorm/application/PlayControlActivity;->greenButton:Lcom/SixClawWorm/utils/GButton;

    invoke-interface {v1, v2}, Lorg/anddev/andengine/entity/layer/ILayer;->addEntity(Lorg/anddev/andengine/entity/IEntity;)V

    .line 556
    new-instance v1, Lcom/SixClawWorm/utils/GButton;

    const/16 v2, 0x276

    const/16 v3, 0xba

    iget-object v4, p0, Lcom/SixClawWorm/application/PlayControlActivity;->mCamera:Lorg/anddev/andengine/engine/camera/Camera;

    iget-object v5, p0, Lcom/SixClawWorm/application/PlayControlActivity;->mEngine:Lorg/anddev/andengine/engine/Engine;

    iget-object v6, p0, Lcom/SixClawWorm/application/PlayControlActivity;->blueButtonRegion:Lorg/anddev/andengine/opengl/texture/region/TiledTextureRegion;

    new-instance v7, Lcom/SixClawWorm/application/PlayControlActivity$8;

    invoke-direct {v7, p0}, Lcom/SixClawWorm/application/PlayControlActivity$8;-><init>(Lcom/SixClawWorm/application/PlayControlActivity;)V

    .line 591
    const/4 v8, 0x0

    invoke-direct/range {v1 .. v8}, Lcom/SixClawWorm/utils/GButton;-><init>(IILorg/anddev/andengine/engine/camera/Camera;Lorg/anddev/andengine/engine/Engine;Lorg/anddev/andengine/opengl/texture/region/TiledTextureRegion;Lcom/SixClawWorm/utils/GButton$GButtonClickListener;Ljava/lang/String;)V

    .line 556
    iput-object v1, p0, Lcom/SixClawWorm/application/PlayControlActivity;->blueButton:Lcom/SixClawWorm/utils/GButton;

    .line 592
    iget-object v1, p0, Lcom/SixClawWorm/application/PlayControlActivity;->mHudScene:Lorg/anddev/andengine/engine/camera/hud/HUD;

    invoke-virtual {v1}, Lorg/anddev/andengine/engine/camera/hud/HUD;->getTopLayer()Lorg/anddev/andengine/entity/layer/ILayer;

    move-result-object v1

    iget-object v2, p0, Lcom/SixClawWorm/application/PlayControlActivity;->blueButton:Lcom/SixClawWorm/utils/GButton;

    invoke-interface {v1, v2}, Lorg/anddev/andengine/entity/layer/ILayer;->addEntity(Lorg/anddev/andengine/entity/IEntity;)V

    .line 595
    new-instance v1, Lcom/SixClawWorm/utils/GButton;

    const/16 v2, 0x1b3

    const/16 v3, 0xbe

    iget-object v4, p0, Lcom/SixClawWorm/application/PlayControlActivity;->mCamera:Lorg/anddev/andengine/engine/camera/Camera;

    iget-object v5, p0, Lcom/SixClawWorm/application/PlayControlActivity;->mEngine:Lorg/anddev/andengine/engine/Engine;

    iget-object v6, p0, Lcom/SixClawWorm/application/PlayControlActivity;->redButtonRegion:Lorg/anddev/andengine/opengl/texture/region/TiledTextureRegion;

    new-instance v7, Lcom/SixClawWorm/application/PlayControlActivity$9;

    invoke-direct {v7, p0}, Lcom/SixClawWorm/application/PlayControlActivity$9;-><init>(Lcom/SixClawWorm/application/PlayControlActivity;)V

    .line 632
    const/4 v8, 0x0

    invoke-direct/range {v1 .. v8}, Lcom/SixClawWorm/utils/GButton;-><init>(IILorg/anddev/andengine/engine/camera/Camera;Lorg/anddev/andengine/engine/Engine;Lorg/anddev/andengine/opengl/texture/region/TiledTextureRegion;Lcom/SixClawWorm/utils/GButton$GButtonClickListener;Ljava/lang/String;)V

    .line 595
    iput-object v1, p0, Lcom/SixClawWorm/application/PlayControlActivity;->redButton:Lcom/SixClawWorm/utils/GButton;

    .line 633
    iget-object v1, p0, Lcom/SixClawWorm/application/PlayControlActivity;->mHudScene:Lorg/anddev/andengine/engine/camera/hud/HUD;

    invoke-virtual {v1}, Lorg/anddev/andengine/engine/camera/hud/HUD;->getTopLayer()Lorg/anddev/andengine/entity/layer/ILayer;

    move-result-object v1

    iget-object v2, p0, Lcom/SixClawWorm/application/PlayControlActivity;->redButton:Lcom/SixClawWorm/utils/GButton;

    invoke-interface {v1, v2}, Lorg/anddev/andengine/entity/layer/ILayer;->addEntity(Lorg/anddev/andengine/entity/IEntity;)V

    .line 636
    new-instance v1, Lcom/SixClawWorm/utils/GButton;

    const/16 v2, 0x212

    const/16 v3, 0x118

    iget-object v4, p0, Lcom/SixClawWorm/application/PlayControlActivity;->mCamera:Lorg/anddev/andengine/engine/camera/Camera;

    iget-object v5, p0, Lcom/SixClawWorm/application/PlayControlActivity;->mEngine:Lorg/anddev/andengine/engine/Engine;

    iget-object v6, p0, Lcom/SixClawWorm/application/PlayControlActivity;->yellowButtonRegion:Lorg/anddev/andengine/opengl/texture/region/TiledTextureRegion;

    new-instance v7, Lcom/SixClawWorm/application/PlayControlActivity$10;

    invoke-direct {v7, p0}, Lcom/SixClawWorm/application/PlayControlActivity$10;-><init>(Lcom/SixClawWorm/application/PlayControlActivity;)V

    .line 669
    const/4 v8, 0x0

    invoke-direct/range {v1 .. v8}, Lcom/SixClawWorm/utils/GButton;-><init>(IILorg/anddev/andengine/engine/camera/Camera;Lorg/anddev/andengine/engine/Engine;Lorg/anddev/andengine/opengl/texture/region/TiledTextureRegion;Lcom/SixClawWorm/utils/GButton$GButtonClickListener;Ljava/lang/String;)V

    .line 636
    iput-object v1, p0, Lcom/SixClawWorm/application/PlayControlActivity;->yellowButton:Lcom/SixClawWorm/utils/GButton;

    .line 670
    iget-object v1, p0, Lcom/SixClawWorm/application/PlayControlActivity;->mHudScene:Lorg/anddev/andengine/engine/camera/hud/HUD;

    invoke-virtual {v1}, Lorg/anddev/andengine/engine/camera/hud/HUD;->getTopLayer()Lorg/anddev/andengine/entity/layer/ILayer;

    move-result-object v1

    iget-object v2, p0, Lcom/SixClawWorm/application/PlayControlActivity;->yellowButton:Lcom/SixClawWorm/utils/GButton;

    invoke-interface {v1, v2}, Lorg/anddev/andengine/entity/layer/ILayer;->addEntity(Lorg/anddev/andengine/entity/IEntity;)V

    .line 671
    iget-object v1, p0, Lcom/SixClawWorm/application/PlayControlActivity;->mHudScene:Lorg/anddev/andengine/engine/camera/hud/HUD;

    return-object v1
.end method

.method protected onResume()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 1010
    sput-boolean v1, Lcom/SixClawWorm/application/PlayControlActivity;->left:Z

    .line 1011
    sput-boolean v1, Lcom/SixClawWorm/application/PlayControlActivity;->right:Z

    .line 1012
    sput-boolean v1, Lcom/SixClawWorm/application/PlayControlActivity;->leftDown:Z

    .line 1013
    sput-boolean v1, Lcom/SixClawWorm/application/PlayControlActivity;->leftUp:Z

    .line 1014
    sput-boolean v1, Lcom/SixClawWorm/application/PlayControlActivity;->rightDown:Z

    .line 1015
    sput-boolean v1, Lcom/SixClawWorm/application/PlayControlActivity;->rightUp:Z

    .line 1016
    sput-boolean v1, Lcom/SixClawWorm/application/PlayControlActivity;->up:Z

    .line 1017
    sput-boolean v1, Lcom/SixClawWorm/application/PlayControlActivity;->down:Z

    .line 1018
    sput-boolean v1, Lcom/SixClawWorm/application/PlayControlActivity;->greenOnclock:Z

    .line 1019
    sput-boolean v1, Lcom/SixClawWorm/application/PlayControlActivity;->yellowOnclock:Z

    .line 1020
    sput-boolean v1, Lcom/SixClawWorm/application/PlayControlActivity;->redOnclock:Z

    .line 1021
    sput-boolean v1, Lcom/SixClawWorm/application/PlayControlActivity;->blueOnclock:Z

    .line 1022
    const/4 v0, 0x1

    sput-boolean v0, Lcom/SixClawWorm/utils/GButton;->isPlayControl:Z

    .line 1023
    iput-boolean v1, p0, Lcom/SixClawWorm/application/PlayControlActivity;->stopThread:Z

    .line 1024
    invoke-super {p0}, Lorg/anddev/andengine/ui/activity/BaseGameActivity;->onResume()V

    .line 1025
    return-void
.end method
