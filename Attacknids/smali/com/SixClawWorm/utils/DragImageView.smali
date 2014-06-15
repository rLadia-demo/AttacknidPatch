.class public Lcom/SixClawWorm/utils/DragImageView;
.super Landroid/widget/ImageView;
.source "DragImageView.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/SixClawWorm/utils/DragImageView$MODE;,
        Lcom/SixClawWorm/utils/DragImageView$MyAsyncTask;
    }
.end annotation


# instance fields
.field private MAX_H:I

.field private MAX_W:I

.field private MIN_H:I

.field private MIN_W:I

.field private afterLenght:F

.field private beforeLenght:F

.field private bitmap_H:I

.field private bitmap_W:I

.field private current_Bottom:I

.field private current_Left:I

.field private current_Right:I

.field private current_Top:I

.field private current_x:I

.field private current_y:I

.field private isControl_H:Z

.field private isControl_V:Z

.field private isScaleAnim:Z

.field private mActivity:Landroid/app/Activity;

.field private mode:Lcom/SixClawWorm/utils/DragImageView$MODE;

.field private myAsyncTask:Lcom/SixClawWorm/utils/DragImageView$MyAsyncTask;

.field private scaleAnimation:Landroid/view/animation/ScaleAnimation;

.field private scale_temp:F

.field private screen_H:I

.field private screen_W:I

.field private start_Bottom:I

.field private start_Left:I

.field private start_Right:I

.field private start_Top:I

.field private start_x:I

.field private start_y:I


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 2
    .parameter "context"

    .prologue
    const/4 v1, 0x0

    const/4 v0, -0x1

    .line 76
    invoke-direct {p0, p1}, Landroid/widget/ImageView;-><init>(Landroid/content/Context;)V

    .line 42
    iput v0, p0, Lcom/SixClawWorm/utils/DragImageView;->start_Top:I

    iput v0, p0, Lcom/SixClawWorm/utils/DragImageView;->start_Right:I

    iput v0, p0, Lcom/SixClawWorm/utils/DragImageView;->start_Bottom:I

    .line 43
    iput v0, p0, Lcom/SixClawWorm/utils/DragImageView;->start_Left:I

    .line 62
    sget-object v0, Lcom/SixClawWorm/utils/DragImageView$MODE;->NONE:Lcom/SixClawWorm/utils/DragImageView$MODE;

    iput-object v0, p0, Lcom/SixClawWorm/utils/DragImageView;->mode:Lcom/SixClawWorm/utils/DragImageView$MODE;

    .line 64
    iput-boolean v1, p0, Lcom/SixClawWorm/utils/DragImageView;->isControl_V:Z

    .line 66
    iput-boolean v1, p0, Lcom/SixClawWorm/utils/DragImageView;->isControl_H:Z

    .line 70
    iput-boolean v1, p0, Lcom/SixClawWorm/utils/DragImageView;->isScaleAnim:Z

    .line 77
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 2
    .parameter "context"
    .parameter "attrs"

    .prologue
    const/4 v1, 0x0

    const/4 v0, -0x1

    .line 94
    invoke-direct {p0, p1, p2}, Landroid/widget/ImageView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 42
    iput v0, p0, Lcom/SixClawWorm/utils/DragImageView;->start_Top:I

    iput v0, p0, Lcom/SixClawWorm/utils/DragImageView;->start_Right:I

    iput v0, p0, Lcom/SixClawWorm/utils/DragImageView;->start_Bottom:I

    .line 43
    iput v0, p0, Lcom/SixClawWorm/utils/DragImageView;->start_Left:I

    .line 62
    sget-object v0, Lcom/SixClawWorm/utils/DragImageView$MODE;->NONE:Lcom/SixClawWorm/utils/DragImageView$MODE;

    iput-object v0, p0, Lcom/SixClawWorm/utils/DragImageView;->mode:Lcom/SixClawWorm/utils/DragImageView$MODE;

    .line 64
    iput-boolean v1, p0, Lcom/SixClawWorm/utils/DragImageView;->isControl_V:Z

    .line 66
    iput-boolean v1, p0, Lcom/SixClawWorm/utils/DragImageView;->isControl_H:Z

    .line 70
    iput-boolean v1, p0, Lcom/SixClawWorm/utils/DragImageView;->isScaleAnim:Z

    .line 95
    return-void
.end method

.method static synthetic access$0(Lcom/SixClawWorm/utils/DragImageView;)I
    .locals 1
    .parameter

    .prologue
    .line 43
    iget v0, p0, Lcom/SixClawWorm/utils/DragImageView;->start_Left:I

    return v0
.end method

.method static synthetic access$1(Lcom/SixClawWorm/utils/DragImageView;)I
    .locals 1
    .parameter

    .prologue
    .line 42
    iget v0, p0, Lcom/SixClawWorm/utils/DragImageView;->start_Top:I

    return v0
.end method

.method static synthetic access$2(Lcom/SixClawWorm/utils/DragImageView;)I
    .locals 1
    .parameter

    .prologue
    .line 42
    iget v0, p0, Lcom/SixClawWorm/utils/DragImageView;->start_Right:I

    return v0
.end method

.method static synthetic access$3(Lcom/SixClawWorm/utils/DragImageView;)I
    .locals 1
    .parameter

    .prologue
    .line 42
    iget v0, p0, Lcom/SixClawWorm/utils/DragImageView;->start_Bottom:I

    return v0
.end method

.method static synthetic access$4(Lcom/SixClawWorm/utils/DragImageView;)Landroid/app/Activity;
    .locals 1
    .parameter

    .prologue
    .line 32
    iget-object v0, p0, Lcom/SixClawWorm/utils/DragImageView;->mActivity:Landroid/app/Activity;

    return-object v0
.end method

.method static synthetic access$5(Lcom/SixClawWorm/utils/DragImageView;IIII)Z
    .locals 1
    .parameter
    .parameter
    .parameter
    .parameter
    .parameter

    .prologue
    .line 1
    invoke-virtual {p0, p1, p2, p3, p4}, Lcom/SixClawWorm/utils/DragImageView;->setFrame(IIII)Z

    move-result v0

    return v0
.end method

.method private setPosition(IIII)V
    .locals 0
    .parameter "left"
    .parameter "top"
    .parameter "right"
    .parameter "bottom"

    .prologue
    .line 261
    invoke-virtual {p0, p1, p2, p3, p4}, Lcom/SixClawWorm/utils/DragImageView;->layout(IIII)V

    .line 262
    return-void
.end method


# virtual methods
.method public doScaleAnim()V
    .locals 6

    .prologue
    const/4 v5, 0x0

    .line 358
    new-instance v0, Lcom/SixClawWorm/utils/DragImageView$MyAsyncTask;

    iget v1, p0, Lcom/SixClawWorm/utils/DragImageView;->screen_W:I

    invoke-virtual {p0}, Lcom/SixClawWorm/utils/DragImageView;->getWidth()I

    move-result v2

    .line 359
    invoke-virtual {p0}, Lcom/SixClawWorm/utils/DragImageView;->getHeight()I

    move-result v3

    invoke-direct {v0, p0, v1, v2, v3}, Lcom/SixClawWorm/utils/DragImageView$MyAsyncTask;-><init>(Lcom/SixClawWorm/utils/DragImageView;III)V

    .line 358
    iput-object v0, p0, Lcom/SixClawWorm/utils/DragImageView;->myAsyncTask:Lcom/SixClawWorm/utils/DragImageView$MyAsyncTask;

    .line 360
    iget-object v0, p0, Lcom/SixClawWorm/utils/DragImageView;->myAsyncTask:Lcom/SixClawWorm/utils/DragImageView$MyAsyncTask;

    invoke-virtual {p0}, Lcom/SixClawWorm/utils/DragImageView;->getLeft()I

    move-result v1

    invoke-virtual {p0}, Lcom/SixClawWorm/utils/DragImageView;->getTop()I

    move-result v2

    invoke-virtual {p0}, Lcom/SixClawWorm/utils/DragImageView;->getRight()I

    move-result v3

    .line 361
    invoke-virtual {p0}, Lcom/SixClawWorm/utils/DragImageView;->getBottom()I

    move-result v4

    .line 360
    invoke-virtual {v0, v1, v2, v3, v4}, Lcom/SixClawWorm/utils/DragImageView$MyAsyncTask;->setLTRB(IIII)V

    .line 362
    iget-object v0, p0, Lcom/SixClawWorm/utils/DragImageView;->myAsyncTask:Lcom/SixClawWorm/utils/DragImageView$MyAsyncTask;

    new-array v1, v5, [Ljava/lang/Void;

    invoke-virtual {v0, v1}, Lcom/SixClawWorm/utils/DragImageView$MyAsyncTask;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;

    .line 363
    iput-boolean v5, p0, Lcom/SixClawWorm/utils/DragImageView;->isScaleAnim:Z

    .line 364
    return-void
.end method

.method getDistance(Landroid/view/MotionEvent;)F
    .locals 6
    .parameter "event"

    .prologue
    const/4 v5, 0x1

    const/4 v4, 0x0

    .line 253
    invoke-virtual {p1, v4}, Landroid/view/MotionEvent;->getX(I)F

    move-result v2

    invoke-virtual {p1, v5}, Landroid/view/MotionEvent;->getX(I)F

    move-result v3

    sub-float v0, v2, v3

    .line 254
    .local v0, x:F
    invoke-virtual {p1, v4}, Landroid/view/MotionEvent;->getY(I)F

    move-result v2

    invoke-virtual {p1, v5}, Landroid/view/MotionEvent;->getY(I)F

    move-result v3

    sub-float v1, v2, v3

    .line 256
    .local v1, y:F
    mul-float v2, v0, v0

    mul-float v3, v1, v1

    add-float/2addr v2, v3

    invoke-static {v2}, Landroid/util/FloatMath;->sqrt(F)F

    move-result v2

    return v2
.end method

.method protected onLayout(ZIIII)V
    .locals 2
    .parameter "changed"
    .parameter "left"
    .parameter "top"
    .parameter "right"
    .parameter "bottom"

    .prologue
    .line 118
    invoke-super/range {p0 .. p5}, Landroid/widget/ImageView;->onLayout(ZIIII)V

    .line 119
    iget v0, p0, Lcom/SixClawWorm/utils/DragImageView;->start_Top:I

    const/4 v1, -0x1

    if-ne v0, v1, :cond_0

    .line 120
    iput p3, p0, Lcom/SixClawWorm/utils/DragImageView;->start_Top:I

    .line 121
    iput p2, p0, Lcom/SixClawWorm/utils/DragImageView;->start_Left:I

    .line 122
    iput p5, p0, Lcom/SixClawWorm/utils/DragImageView;->start_Bottom:I

    .line 123
    iput p4, p0, Lcom/SixClawWorm/utils/DragImageView;->start_Right:I

    .line 126
    :cond_0
    return-void
.end method

.method onPointerDown(Landroid/view/MotionEvent;)V
    .locals 2
    .parameter "event"

    .prologue
    .line 177
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getPointerCount()I

    move-result v0

    const/4 v1, 0x2

    if-ne v0, v1, :cond_0

    .line 178
    sget-object v0, Lcom/SixClawWorm/utils/DragImageView$MODE;->ZOOM:Lcom/SixClawWorm/utils/DragImageView$MODE;

    iput-object v0, p0, Lcom/SixClawWorm/utils/DragImageView;->mode:Lcom/SixClawWorm/utils/DragImageView$MODE;

    .line 179
    invoke-virtual {p0, p1}, Lcom/SixClawWorm/utils/DragImageView;->getDistance(Landroid/view/MotionEvent;)F

    move-result v0

    iput v0, p0, Lcom/SixClawWorm/utils/DragImageView;->beforeLenght:F

    .line 181
    :cond_0
    return-void
.end method

.method onTouchDown(Landroid/view/MotionEvent;)V
    .locals 2
    .parameter "event"

    .prologue
    .line 165
    sget-object v0, Lcom/SixClawWorm/utils/DragImageView$MODE;->DRAG:Lcom/SixClawWorm/utils/DragImageView$MODE;

    iput-object v0, p0, Lcom/SixClawWorm/utils/DragImageView;->mode:Lcom/SixClawWorm/utils/DragImageView$MODE;

    .line 167
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getRawX()F

    move-result v0

    float-to-int v0, v0

    iput v0, p0, Lcom/SixClawWorm/utils/DragImageView;->current_x:I

    .line 168
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getRawY()F

    move-result v0

    float-to-int v0, v0

    iput v0, p0, Lcom/SixClawWorm/utils/DragImageView;->current_y:I

    .line 170
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v0

    float-to-int v0, v0

    iput v0, p0, Lcom/SixClawWorm/utils/DragImageView;->start_x:I

    .line 171
    iget v0, p0, Lcom/SixClawWorm/utils/DragImageView;->current_y:I

    invoke-virtual {p0}, Lcom/SixClawWorm/utils/DragImageView;->getTop()I

    move-result v1

    sub-int/2addr v0, v1

    iput v0, p0, Lcom/SixClawWorm/utils/DragImageView;->start_y:I

    .line 173
    return-void
.end method

.method public onTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 1
    .parameter "event"

    .prologue
    .line 134
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    move-result v0

    and-int/lit16 v0, v0, 0xff

    packed-switch v0, :pswitch_data_0

    .line 160
    :cond_0
    :goto_0
    :pswitch_0
    const/4 v0, 0x1

    return v0

    .line 136
    :pswitch_1
    invoke-virtual {p0, p1}, Lcom/SixClawWorm/utils/DragImageView;->onTouchDown(Landroid/view/MotionEvent;)V

    goto :goto_0

    .line 140
    :pswitch_2
    invoke-virtual {p0, p1}, Lcom/SixClawWorm/utils/DragImageView;->onPointerDown(Landroid/view/MotionEvent;)V

    goto :goto_0

    .line 144
    :pswitch_3
    invoke-virtual {p0, p1}, Lcom/SixClawWorm/utils/DragImageView;->onTouchMove(Landroid/view/MotionEvent;)V

    goto :goto_0

    .line 147
    :pswitch_4
    sget-object v0, Lcom/SixClawWorm/utils/DragImageView$MODE;->NONE:Lcom/SixClawWorm/utils/DragImageView$MODE;

    iput-object v0, p0, Lcom/SixClawWorm/utils/DragImageView;->mode:Lcom/SixClawWorm/utils/DragImageView$MODE;

    goto :goto_0

    .line 152
    :pswitch_5
    sget-object v0, Lcom/SixClawWorm/utils/DragImageView$MODE;->NONE:Lcom/SixClawWorm/utils/DragImageView$MODE;

    iput-object v0, p0, Lcom/SixClawWorm/utils/DragImageView;->mode:Lcom/SixClawWorm/utils/DragImageView$MODE;

    .line 154
    iget-boolean v0, p0, Lcom/SixClawWorm/utils/DragImageView;->isScaleAnim:Z

    if-eqz v0, :cond_0

    .line 155
    invoke-virtual {p0}, Lcom/SixClawWorm/utils/DragImageView;->doScaleAnim()V

    goto :goto_0

    .line 134
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_1
        :pswitch_4
        :pswitch_3
        :pswitch_0
        :pswitch_0
        :pswitch_2
        :pswitch_5
    .end packed-switch
.end method

.method onTouchMove(Landroid/view/MotionEvent;)V
    .locals 7
    .parameter "event"

    .prologue
    .line 185
    const/4 v2, 0x0

    .local v2, left:I
    const/4 v4, 0x0

    .local v4, top:I
    const/4 v3, 0x0

    .local v3, right:I
    const/4 v0, 0x0

    .line 187
    .local v0, bottom:I
    iget-object v5, p0, Lcom/SixClawWorm/utils/DragImageView;->mode:Lcom/SixClawWorm/utils/DragImageView$MODE;

    sget-object v6, Lcom/SixClawWorm/utils/DragImageView$MODE;->DRAG:Lcom/SixClawWorm/utils/DragImageView$MODE;

    if-ne v5, v6, :cond_9

    .line 192
    iget v5, p0, Lcom/SixClawWorm/utils/DragImageView;->current_x:I

    iget v6, p0, Lcom/SixClawWorm/utils/DragImageView;->start_x:I

    sub-int v2, v5, v6

    .line 193
    iget v5, p0, Lcom/SixClawWorm/utils/DragImageView;->current_x:I

    invoke-virtual {p0}, Lcom/SixClawWorm/utils/DragImageView;->getWidth()I

    move-result v6

    add-int/2addr v5, v6

    iget v6, p0, Lcom/SixClawWorm/utils/DragImageView;->start_x:I

    sub-int v3, v5, v6

    .line 194
    iget v5, p0, Lcom/SixClawWorm/utils/DragImageView;->current_y:I

    iget v6, p0, Lcom/SixClawWorm/utils/DragImageView;->start_y:I

    sub-int v4, v5, v6

    .line 195
    iget v5, p0, Lcom/SixClawWorm/utils/DragImageView;->current_y:I

    iget v6, p0, Lcom/SixClawWorm/utils/DragImageView;->start_y:I

    sub-int/2addr v5, v6

    invoke-virtual {p0}, Lcom/SixClawWorm/utils/DragImageView;->getHeight()I

    move-result v6

    add-int v0, v5, v6

    .line 198
    iget-boolean v5, p0, Lcom/SixClawWorm/utils/DragImageView;->isControl_H:Z

    if-eqz v5, :cond_7

    .line 199
    if-ltz v2, :cond_0

    .line 200
    const/4 v2, 0x0

    .line 201
    invoke-virtual {p0}, Lcom/SixClawWorm/utils/DragImageView;->getWidth()I

    move-result v3

    .line 203
    :cond_0
    iget v5, p0, Lcom/SixClawWorm/utils/DragImageView;->screen_W:I

    if-gt v3, v5, :cond_1

    .line 204
    iget v5, p0, Lcom/SixClawWorm/utils/DragImageView;->screen_W:I

    invoke-virtual {p0}, Lcom/SixClawWorm/utils/DragImageView;->getWidth()I

    move-result v6

    sub-int v2, v5, v6

    .line 205
    iget v3, p0, Lcom/SixClawWorm/utils/DragImageView;->screen_W:I

    .line 212
    :cond_1
    :goto_0
    iget-boolean v5, p0, Lcom/SixClawWorm/utils/DragImageView;->isControl_V:Z

    if-eqz v5, :cond_8

    .line 213
    if-ltz v4, :cond_2

    .line 214
    const/4 v4, 0x0

    .line 215
    invoke-virtual {p0}, Lcom/SixClawWorm/utils/DragImageView;->getHeight()I

    move-result v0

    .line 218
    :cond_2
    iget v5, p0, Lcom/SixClawWorm/utils/DragImageView;->screen_H:I

    if-gt v0, v5, :cond_3

    .line 219
    iget v5, p0, Lcom/SixClawWorm/utils/DragImageView;->screen_H:I

    invoke-virtual {p0}, Lcom/SixClawWorm/utils/DragImageView;->getHeight()I

    move-result v6

    sub-int v4, v5, v6

    .line 220
    iget v0, p0, Lcom/SixClawWorm/utils/DragImageView;->screen_H:I

    .line 226
    :cond_3
    :goto_1
    iget-boolean v5, p0, Lcom/SixClawWorm/utils/DragImageView;->isControl_H:Z

    if-nez v5, :cond_4

    iget-boolean v5, p0, Lcom/SixClawWorm/utils/DragImageView;->isControl_V:Z

    if-eqz v5, :cond_5

    .line 227
    :cond_4
    invoke-direct {p0, v2, v4, v3, v0}, Lcom/SixClawWorm/utils/DragImageView;->setPosition(IIII)V

    .line 229
    :cond_5
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getRawX()F

    move-result v5

    float-to-int v5, v5

    iput v5, p0, Lcom/SixClawWorm/utils/DragImageView;->current_x:I

    .line 230
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getRawY()F

    move-result v5

    float-to-int v5, v5

    iput v5, p0, Lcom/SixClawWorm/utils/DragImageView;->current_y:I

    .line 249
    :cond_6
    :goto_2
    return-void

    .line 208
    :cond_7
    invoke-virtual {p0}, Lcom/SixClawWorm/utils/DragImageView;->getLeft()I

    move-result v2

    .line 209
    invoke-virtual {p0}, Lcom/SixClawWorm/utils/DragImageView;->getRight()I

    move-result v3

    goto :goto_0

    .line 223
    :cond_8
    invoke-virtual {p0}, Lcom/SixClawWorm/utils/DragImageView;->getTop()I

    move-result v4

    .line 224
    invoke-virtual {p0}, Lcom/SixClawWorm/utils/DragImageView;->getBottom()I

    move-result v0

    goto :goto_1

    .line 234
    :cond_9
    iget-object v5, p0, Lcom/SixClawWorm/utils/DragImageView;->mode:Lcom/SixClawWorm/utils/DragImageView$MODE;

    sget-object v6, Lcom/SixClawWorm/utils/DragImageView$MODE;->ZOOM:Lcom/SixClawWorm/utils/DragImageView$MODE;

    if-ne v5, v6, :cond_6

    .line 236
    invoke-virtual {p0, p1}, Lcom/SixClawWorm/utils/DragImageView;->getDistance(Landroid/view/MotionEvent;)F

    move-result v5

    iput v5, p0, Lcom/SixClawWorm/utils/DragImageView;->afterLenght:F

    .line 238
    iget v5, p0, Lcom/SixClawWorm/utils/DragImageView;->afterLenght:F

    iget v6, p0, Lcom/SixClawWorm/utils/DragImageView;->beforeLenght:F

    sub-float v1, v5, v6

    .line 240
    .local v1, gapLenght:F
    invoke-static {v1}, Ljava/lang/Math;->abs(F)F

    move-result v5

    const/high16 v6, 0x40a0

    cmpl-float v5, v5, v6

    if-lez v5, :cond_6

    .line 241
    iget v5, p0, Lcom/SixClawWorm/utils/DragImageView;->afterLenght:F

    iget v6, p0, Lcom/SixClawWorm/utils/DragImageView;->beforeLenght:F

    div-float/2addr v5, v6

    iput v5, p0, Lcom/SixClawWorm/utils/DragImageView;->scale_temp:F

    .line 243
    iget v5, p0, Lcom/SixClawWorm/utils/DragImageView;->scale_temp:F

    invoke-virtual {p0, v5}, Lcom/SixClawWorm/utils/DragImageView;->setScale(F)V

    .line 245
    iget v5, p0, Lcom/SixClawWorm/utils/DragImageView;->afterLenght:F

    iput v5, p0, Lcom/SixClawWorm/utils/DragImageView;->beforeLenght:F

    goto :goto_2
.end method

.method public setImageBitmap(Landroid/graphics/Bitmap;)V
    .locals 1
    .parameter "bm"

    .prologue
    .line 102
    invoke-super {p0, p1}, Landroid/widget/ImageView;->setImageBitmap(Landroid/graphics/Bitmap;)V

    .line 104
    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v0

    iput v0, p0, Lcom/SixClawWorm/utils/DragImageView;->bitmap_W:I

    .line 105
    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v0

    iput v0, p0, Lcom/SixClawWorm/utils/DragImageView;->bitmap_H:I

    .line 107
    iget v0, p0, Lcom/SixClawWorm/utils/DragImageView;->bitmap_W:I

    mul-int/lit8 v0, v0, 0x5

    iput v0, p0, Lcom/SixClawWorm/utils/DragImageView;->MAX_W:I

    .line 108
    iget v0, p0, Lcom/SixClawWorm/utils/DragImageView;->bitmap_H:I

    mul-int/lit8 v0, v0, 0x5

    iput v0, p0, Lcom/SixClawWorm/utils/DragImageView;->MAX_H:I

    .line 110
    iget v0, p0, Lcom/SixClawWorm/utils/DragImageView;->bitmap_W:I

    div-int/lit8 v0, v0, 0x7

    mul-int/lit8 v0, v0, 0x2

    iput v0, p0, Lcom/SixClawWorm/utils/DragImageView;->MIN_W:I

    .line 111
    iget v0, p0, Lcom/SixClawWorm/utils/DragImageView;->bitmap_H:I

    div-int/lit8 v0, v0, 0x7

    mul-int/lit8 v0, v0, 0x2

    iput v0, p0, Lcom/SixClawWorm/utils/DragImageView;->MIN_H:I

    .line 113
    return-void
.end method

.method setScale(F)V
    .locals 8
    .parameter "scale"

    .prologue
    const/4 v7, 0x1

    const/high16 v4, 0x3f80

    const/4 v6, 0x0

    .line 266
    invoke-virtual {p0}, Lcom/SixClawWorm/utils/DragImageView;->getWidth()I

    move-result v2

    int-to-float v2, v2

    sub-float v3, v4, p1

    invoke-static {v3}, Ljava/lang/Math;->abs(F)F

    move-result v3

    mul-float/2addr v2, v3

    float-to-int v2, v2

    mul-int/lit8 v2, v2, 0x5

    div-int/lit8 v0, v2, 0x2

    .line 267
    .local v0, disX:I
    invoke-virtual {p0}, Lcom/SixClawWorm/utils/DragImageView;->getHeight()I

    move-result v2

    int-to-float v2, v2

    sub-float v3, v4, p1

    invoke-static {v3}, Ljava/lang/Math;->abs(F)F

    move-result v3

    mul-float/2addr v2, v3

    float-to-int v2, v2

    mul-int/lit8 v2, v2, 0x3

    div-int/lit8 v1, v2, 0x2

    .line 270
    .local v1, disY:I
    cmpl-float v2, p1, v4

    if-lez v2, :cond_3

    invoke-virtual {p0}, Lcom/SixClawWorm/utils/DragImageView;->getWidth()I

    move-result v2

    iget v3, p0, Lcom/SixClawWorm/utils/DragImageView;->MAX_W:I

    if-gt v2, v3, :cond_3

    .line 271
    invoke-virtual {p0}, Lcom/SixClawWorm/utils/DragImageView;->getLeft()I

    move-result v2

    sub-int/2addr v2, v0

    iput v2, p0, Lcom/SixClawWorm/utils/DragImageView;->current_Left:I

    .line 272
    invoke-virtual {p0}, Lcom/SixClawWorm/utils/DragImageView;->getTop()I

    move-result v2

    sub-int/2addr v2, v1

    iput v2, p0, Lcom/SixClawWorm/utils/DragImageView;->current_Top:I

    .line 273
    invoke-virtual {p0}, Lcom/SixClawWorm/utils/DragImageView;->getRight()I

    move-result v2

    add-int/2addr v2, v0

    iput v2, p0, Lcom/SixClawWorm/utils/DragImageView;->current_Right:I

    .line 274
    invoke-virtual {p0}, Lcom/SixClawWorm/utils/DragImageView;->getBottom()I

    move-result v2

    add-int/2addr v2, v1

    iput v2, p0, Lcom/SixClawWorm/utils/DragImageView;->current_Bottom:I

    .line 276
    iget v2, p0, Lcom/SixClawWorm/utils/DragImageView;->current_Left:I

    iget v3, p0, Lcom/SixClawWorm/utils/DragImageView;->current_Top:I

    iget v4, p0, Lcom/SixClawWorm/utils/DragImageView;->current_Right:I

    .line 277
    iget v5, p0, Lcom/SixClawWorm/utils/DragImageView;->current_Bottom:I

    .line 276
    invoke-virtual {p0, v2, v3, v4, v5}, Lcom/SixClawWorm/utils/DragImageView;->setFrame(IIII)Z

    .line 281
    iget v2, p0, Lcom/SixClawWorm/utils/DragImageView;->current_Top:I

    if-gtz v2, :cond_1

    iget v2, p0, Lcom/SixClawWorm/utils/DragImageView;->current_Bottom:I

    iget v3, p0, Lcom/SixClawWorm/utils/DragImageView;->screen_H:I

    if-lt v2, v3, :cond_1

    .line 283
    iput-boolean v7, p0, Lcom/SixClawWorm/utils/DragImageView;->isControl_V:Z

    .line 287
    :goto_0
    iget v2, p0, Lcom/SixClawWorm/utils/DragImageView;->current_Left:I

    if-gtz v2, :cond_2

    iget v2, p0, Lcom/SixClawWorm/utils/DragImageView;->current_Right:I

    iget v3, p0, Lcom/SixClawWorm/utils/DragImageView;->screen_W:I

    if-lt v2, v3, :cond_2

    .line 288
    iput-boolean v7, p0, Lcom/SixClawWorm/utils/DragImageView;->isControl_H:Z

    .line 352
    :cond_0
    :goto_1
    return-void

    .line 285
    :cond_1
    iput-boolean v6, p0, Lcom/SixClawWorm/utils/DragImageView;->isControl_V:Z

    goto :goto_0

    .line 290
    :cond_2
    iput-boolean v6, p0, Lcom/SixClawWorm/utils/DragImageView;->isControl_H:Z

    goto :goto_1

    .line 295
    :cond_3
    cmpg-float v2, p1, v4

    if-gez v2, :cond_0

    invoke-virtual {p0}, Lcom/SixClawWorm/utils/DragImageView;->getWidth()I

    move-result v2

    iget v3, p0, Lcom/SixClawWorm/utils/DragImageView;->MIN_W:I

    if-lt v2, v3, :cond_0

    .line 296
    invoke-virtual {p0}, Lcom/SixClawWorm/utils/DragImageView;->getLeft()I

    move-result v2

    add-int/2addr v2, v0

    iput v2, p0, Lcom/SixClawWorm/utils/DragImageView;->current_Left:I

    .line 297
    invoke-virtual {p0}, Lcom/SixClawWorm/utils/DragImageView;->getTop()I

    move-result v2

    add-int/2addr v2, v1

    iput v2, p0, Lcom/SixClawWorm/utils/DragImageView;->current_Top:I

    .line 298
    invoke-virtual {p0}, Lcom/SixClawWorm/utils/DragImageView;->getRight()I

    move-result v2

    sub-int/2addr v2, v0

    iput v2, p0, Lcom/SixClawWorm/utils/DragImageView;->current_Right:I

    .line 299
    invoke-virtual {p0}, Lcom/SixClawWorm/utils/DragImageView;->getBottom()I

    move-result v2

    sub-int/2addr v2, v1

    iput v2, p0, Lcom/SixClawWorm/utils/DragImageView;->current_Bottom:I

    .line 304
    iget-boolean v2, p0, Lcom/SixClawWorm/utils/DragImageView;->isControl_V:Z

    if-eqz v2, :cond_4

    iget v2, p0, Lcom/SixClawWorm/utils/DragImageView;->current_Top:I

    if-lez v2, :cond_4

    .line 305
    iput v6, p0, Lcom/SixClawWorm/utils/DragImageView;->current_Top:I

    .line 306
    invoke-virtual {p0}, Lcom/SixClawWorm/utils/DragImageView;->getBottom()I

    move-result v2

    mul-int/lit8 v3, v1, 0x2

    sub-int/2addr v2, v3

    iput v2, p0, Lcom/SixClawWorm/utils/DragImageView;->current_Bottom:I

    .line 307
    iget v2, p0, Lcom/SixClawWorm/utils/DragImageView;->current_Bottom:I

    iget v3, p0, Lcom/SixClawWorm/utils/DragImageView;->screen_H:I

    if-ge v2, v3, :cond_4

    .line 308
    iget v2, p0, Lcom/SixClawWorm/utils/DragImageView;->screen_H:I

    iput v2, p0, Lcom/SixClawWorm/utils/DragImageView;->current_Bottom:I

    .line 309
    iput-boolean v6, p0, Lcom/SixClawWorm/utils/DragImageView;->isControl_V:Z

    .line 313
    :cond_4
    iget-boolean v2, p0, Lcom/SixClawWorm/utils/DragImageView;->isControl_V:Z

    if-eqz v2, :cond_5

    iget v2, p0, Lcom/SixClawWorm/utils/DragImageView;->current_Bottom:I

    iget v3, p0, Lcom/SixClawWorm/utils/DragImageView;->screen_H:I

    if-ge v2, v3, :cond_5

    .line 314
    iget v2, p0, Lcom/SixClawWorm/utils/DragImageView;->screen_H:I

    iput v2, p0, Lcom/SixClawWorm/utils/DragImageView;->current_Bottom:I

    .line 315
    invoke-virtual {p0}, Lcom/SixClawWorm/utils/DragImageView;->getTop()I

    move-result v2

    mul-int/lit8 v3, v1, 0x2

    add-int/2addr v2, v3

    iput v2, p0, Lcom/SixClawWorm/utils/DragImageView;->current_Top:I

    .line 316
    iget v2, p0, Lcom/SixClawWorm/utils/DragImageView;->current_Top:I

    if-lez v2, :cond_5

    .line 317
    iput v6, p0, Lcom/SixClawWorm/utils/DragImageView;->current_Top:I

    .line 318
    iput-boolean v6, p0, Lcom/SixClawWorm/utils/DragImageView;->isControl_V:Z

    .line 323
    :cond_5
    iget-boolean v2, p0, Lcom/SixClawWorm/utils/DragImageView;->isControl_H:Z

    if-eqz v2, :cond_6

    iget v2, p0, Lcom/SixClawWorm/utils/DragImageView;->current_Left:I

    if-ltz v2, :cond_6

    .line 324
    iput v6, p0, Lcom/SixClawWorm/utils/DragImageView;->current_Left:I

    .line 325
    invoke-virtual {p0}, Lcom/SixClawWorm/utils/DragImageView;->getRight()I

    move-result v2

    mul-int/lit8 v3, v0, 0x2

    sub-int/2addr v2, v3

    iput v2, p0, Lcom/SixClawWorm/utils/DragImageView;->current_Right:I

    .line 326
    iget v2, p0, Lcom/SixClawWorm/utils/DragImageView;->current_Right:I

    iget v3, p0, Lcom/SixClawWorm/utils/DragImageView;->screen_W:I

    if-gt v2, v3, :cond_6

    .line 327
    iget v2, p0, Lcom/SixClawWorm/utils/DragImageView;->screen_W:I

    iput v2, p0, Lcom/SixClawWorm/utils/DragImageView;->current_Right:I

    .line 328
    iput-boolean v6, p0, Lcom/SixClawWorm/utils/DragImageView;->isControl_H:Z

    .line 332
    :cond_6
    iget-boolean v2, p0, Lcom/SixClawWorm/utils/DragImageView;->isControl_H:Z

    if-eqz v2, :cond_7

    iget v2, p0, Lcom/SixClawWorm/utils/DragImageView;->current_Right:I

    iget v3, p0, Lcom/SixClawWorm/utils/DragImageView;->screen_W:I

    if-gt v2, v3, :cond_7

    .line 333
    iget v2, p0, Lcom/SixClawWorm/utils/DragImageView;->screen_W:I

    iput v2, p0, Lcom/SixClawWorm/utils/DragImageView;->current_Right:I

    .line 334
    invoke-virtual {p0}, Lcom/SixClawWorm/utils/DragImageView;->getLeft()I

    move-result v2

    mul-int/lit8 v3, v0, 0x2

    add-int/2addr v2, v3

    iput v2, p0, Lcom/SixClawWorm/utils/DragImageView;->current_Left:I

    .line 335
    iget v2, p0, Lcom/SixClawWorm/utils/DragImageView;->current_Left:I

    if-ltz v2, :cond_7

    .line 336
    iput v6, p0, Lcom/SixClawWorm/utils/DragImageView;->current_Left:I

    .line 337
    iput-boolean v6, p0, Lcom/SixClawWorm/utils/DragImageView;->isControl_H:Z

    .line 341
    :cond_7
    iget-boolean v2, p0, Lcom/SixClawWorm/utils/DragImageView;->isControl_H:Z

    if-nez v2, :cond_8

    iget-boolean v2, p0, Lcom/SixClawWorm/utils/DragImageView;->isControl_V:Z

    if-eqz v2, :cond_9

    .line 342
    :cond_8
    iget v2, p0, Lcom/SixClawWorm/utils/DragImageView;->current_Left:I

    iget v3, p0, Lcom/SixClawWorm/utils/DragImageView;->current_Top:I

    iget v4, p0, Lcom/SixClawWorm/utils/DragImageView;->current_Right:I

    .line 343
    iget v5, p0, Lcom/SixClawWorm/utils/DragImageView;->current_Bottom:I

    .line 342
    invoke-virtual {p0, v2, v3, v4, v5}, Lcom/SixClawWorm/utils/DragImageView;->setFrame(IIII)Z

    goto/16 :goto_1

    .line 345
    :cond_9
    iget v2, p0, Lcom/SixClawWorm/utils/DragImageView;->current_Left:I

    iget v3, p0, Lcom/SixClawWorm/utils/DragImageView;->current_Top:I

    iget v4, p0, Lcom/SixClawWorm/utils/DragImageView;->current_Right:I

    .line 346
    iget v5, p0, Lcom/SixClawWorm/utils/DragImageView;->current_Bottom:I

    .line 345
    invoke-virtual {p0, v2, v3, v4, v5}, Lcom/SixClawWorm/utils/DragImageView;->setFrame(IIII)Z

    .line 347
    iput-boolean v7, p0, Lcom/SixClawWorm/utils/DragImageView;->isScaleAnim:Z

    goto/16 :goto_1
.end method

.method public setScreen_H(I)V
    .locals 0
    .parameter "screen_H"

    .prologue
    .line 90
    iput p1, p0, Lcom/SixClawWorm/utils/DragImageView;->screen_H:I

    .line 91
    return-void
.end method

.method public setScreen_W(I)V
    .locals 0
    .parameter "screen_W"

    .prologue
    .line 85
    iput p1, p0, Lcom/SixClawWorm/utils/DragImageView;->screen_W:I

    .line 86
    return-void
.end method

.method public setmActivity(Landroid/app/Activity;)V
    .locals 0
    .parameter "mActivity"

    .prologue
    .line 80
    iput-object p1, p0, Lcom/SixClawWorm/utils/DragImageView;->mActivity:Landroid/app/Activity;

    .line 81
    return-void
.end method
