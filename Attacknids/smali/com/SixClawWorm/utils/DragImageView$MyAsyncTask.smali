.class Lcom/SixClawWorm/utils/DragImageView$MyAsyncTask;
.super Landroid/os/AsyncTask;
.source "DragImageView.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/SixClawWorm/utils/DragImageView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "MyAsyncTask"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/os/AsyncTask",
        "<",
        "Ljava/lang/Void;",
        "Ljava/lang/Integer;",
        "Ljava/lang/Void;",
        ">;"
    }
.end annotation


# instance fields
.field private STEP:F

.field private bottom:I

.field private current_Height:I

.field private current_Width:I

.field private left:I

.field private right:I

.field private scale_WH:F

.field private screen_W:I

.field private step_H:F

.field private step_V:F

.field final synthetic this$0:Lcom/SixClawWorm/utils/DragImageView;

.field private top:I


# direct methods
.method public constructor <init>(Lcom/SixClawWorm/utils/DragImageView;III)V
    .locals 2
    .parameter
    .parameter "screen_W"
    .parameter "current_Width"
    .parameter "current_Height"

    .prologue
    .line 388
    iput-object p1, p0, Lcom/SixClawWorm/utils/DragImageView$MyAsyncTask;->this$0:Lcom/SixClawWorm/utils/DragImageView;

    .line 389
    invoke-direct {p0}, Landroid/os/AsyncTask;-><init>()V

    .line 384
    const/high16 v0, 0x4100

    iput v0, p0, Lcom/SixClawWorm/utils/DragImageView$MyAsyncTask;->STEP:F

    .line 390
    iput p2, p0, Lcom/SixClawWorm/utils/DragImageView$MyAsyncTask;->screen_W:I

    .line 391
    iput p3, p0, Lcom/SixClawWorm/utils/DragImageView$MyAsyncTask;->current_Width:I

    .line 392
    iput p4, p0, Lcom/SixClawWorm/utils/DragImageView$MyAsyncTask;->current_Height:I

    .line 393
    int-to-float v0, p4

    int-to-float v1, p3

    div-float/2addr v0, v1

    iput v0, p0, Lcom/SixClawWorm/utils/DragImageView$MyAsyncTask;->scale_WH:F

    .line 394
    iget v0, p0, Lcom/SixClawWorm/utils/DragImageView$MyAsyncTask;->STEP:F

    iput v0, p0, Lcom/SixClawWorm/utils/DragImageView$MyAsyncTask;->step_H:F

    .line 395
    iget v0, p0, Lcom/SixClawWorm/utils/DragImageView$MyAsyncTask;->scale_WH:F

    iget v1, p0, Lcom/SixClawWorm/utils/DragImageView$MyAsyncTask;->STEP:F

    mul-float/2addr v0, v1

    iput v0, p0, Lcom/SixClawWorm/utils/DragImageView$MyAsyncTask;->step_V:F

    .line 396
    return-void
.end method

.method static synthetic access$2(Lcom/SixClawWorm/utils/DragImageView$MyAsyncTask;)Lcom/SixClawWorm/utils/DragImageView;
    .locals 1
    .parameter

    .prologue
    .line 369
    iget-object v0, p0, Lcom/SixClawWorm/utils/DragImageView$MyAsyncTask;->this$0:Lcom/SixClawWorm/utils/DragImageView;

    return-object v0
.end method


# virtual methods
.method protected bridge varargs synthetic doInBackground([Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1
    .parameter

    .prologue
    .line 1
    check-cast p1, [Ljava/lang/Void;

    invoke-virtual {p0, p1}, Lcom/SixClawWorm/utils/DragImageView$MyAsyncTask;->doInBackground([Ljava/lang/Void;)Ljava/lang/Void;

    move-result-object v0

    return-object v0
.end method

.method protected varargs doInBackground([Ljava/lang/Void;)Ljava/lang/Void;
    .locals 4
    .parameter "params"

    .prologue
    .line 401
    :goto_0
    iget v1, p0, Lcom/SixClawWorm/utils/DragImageView$MyAsyncTask;->current_Width:I

    iget v2, p0, Lcom/SixClawWorm/utils/DragImageView$MyAsyncTask;->screen_W:I

    if-le v1, v2, :cond_0

    .line 423
    const/4 v1, 0x0

    return-object v1

    .line 403
    :cond_0
    iget v1, p0, Lcom/SixClawWorm/utils/DragImageView$MyAsyncTask;->left:I

    int-to-float v1, v1

    iget v2, p0, Lcom/SixClawWorm/utils/DragImageView$MyAsyncTask;->step_H:F

    sub-float/2addr v1, v2

    float-to-int v1, v1

    iput v1, p0, Lcom/SixClawWorm/utils/DragImageView$MyAsyncTask;->left:I

    .line 404
    iget v1, p0, Lcom/SixClawWorm/utils/DragImageView$MyAsyncTask;->top:I

    int-to-float v1, v1

    iget v2, p0, Lcom/SixClawWorm/utils/DragImageView$MyAsyncTask;->step_V:F

    sub-float/2addr v1, v2

    float-to-int v1, v1

    iput v1, p0, Lcom/SixClawWorm/utils/DragImageView$MyAsyncTask;->top:I

    .line 405
    iget v1, p0, Lcom/SixClawWorm/utils/DragImageView$MyAsyncTask;->right:I

    int-to-float v1, v1

    iget v2, p0, Lcom/SixClawWorm/utils/DragImageView$MyAsyncTask;->step_H:F

    add-float/2addr v1, v2

    float-to-int v1, v1

    iput v1, p0, Lcom/SixClawWorm/utils/DragImageView$MyAsyncTask;->right:I

    .line 406
    iget v1, p0, Lcom/SixClawWorm/utils/DragImageView$MyAsyncTask;->bottom:I

    int-to-float v1, v1

    iget v2, p0, Lcom/SixClawWorm/utils/DragImageView$MyAsyncTask;->step_V:F

    add-float/2addr v1, v2

    float-to-int v1, v1

    iput v1, p0, Lcom/SixClawWorm/utils/DragImageView$MyAsyncTask;->bottom:I

    .line 408
    iget v1, p0, Lcom/SixClawWorm/utils/DragImageView$MyAsyncTask;->current_Width:I

    int-to-float v1, v1

    const/high16 v2, 0x4000

    iget v3, p0, Lcom/SixClawWorm/utils/DragImageView$MyAsyncTask;->step_H:F

    mul-float/2addr v2, v3

    add-float/2addr v1, v2

    float-to-int v1, v1

    iput v1, p0, Lcom/SixClawWorm/utils/DragImageView$MyAsyncTask;->current_Width:I

    .line 410
    iget v1, p0, Lcom/SixClawWorm/utils/DragImageView$MyAsyncTask;->left:I

    iget-object v2, p0, Lcom/SixClawWorm/utils/DragImageView$MyAsyncTask;->this$0:Lcom/SixClawWorm/utils/DragImageView;

    #getter for: Lcom/SixClawWorm/utils/DragImageView;->start_Left:I
    invoke-static {v2}, Lcom/SixClawWorm/utils/DragImageView;->access$0(Lcom/SixClawWorm/utils/DragImageView;)I

    move-result v2

    invoke-static {v1, v2}, Ljava/lang/Math;->max(II)I

    move-result v1

    iput v1, p0, Lcom/SixClawWorm/utils/DragImageView$MyAsyncTask;->left:I

    .line 411
    iget v1, p0, Lcom/SixClawWorm/utils/DragImageView$MyAsyncTask;->top:I

    iget-object v2, p0, Lcom/SixClawWorm/utils/DragImageView$MyAsyncTask;->this$0:Lcom/SixClawWorm/utils/DragImageView;

    #getter for: Lcom/SixClawWorm/utils/DragImageView;->start_Top:I
    invoke-static {v2}, Lcom/SixClawWorm/utils/DragImageView;->access$1(Lcom/SixClawWorm/utils/DragImageView;)I

    move-result v2

    invoke-static {v1, v2}, Ljava/lang/Math;->max(II)I

    move-result v1

    iput v1, p0, Lcom/SixClawWorm/utils/DragImageView$MyAsyncTask;->top:I

    .line 412
    iget v1, p0, Lcom/SixClawWorm/utils/DragImageView$MyAsyncTask;->right:I

    iget-object v2, p0, Lcom/SixClawWorm/utils/DragImageView$MyAsyncTask;->this$0:Lcom/SixClawWorm/utils/DragImageView;

    #getter for: Lcom/SixClawWorm/utils/DragImageView;->start_Right:I
    invoke-static {v2}, Lcom/SixClawWorm/utils/DragImageView;->access$2(Lcom/SixClawWorm/utils/DragImageView;)I

    move-result v2

    invoke-static {v1, v2}, Ljava/lang/Math;->min(II)I

    move-result v1

    iput v1, p0, Lcom/SixClawWorm/utils/DragImageView$MyAsyncTask;->right:I

    .line 413
    iget v1, p0, Lcom/SixClawWorm/utils/DragImageView$MyAsyncTask;->bottom:I

    iget-object v2, p0, Lcom/SixClawWorm/utils/DragImageView$MyAsyncTask;->this$0:Lcom/SixClawWorm/utils/DragImageView;

    #getter for: Lcom/SixClawWorm/utils/DragImageView;->start_Bottom:I
    invoke-static {v2}, Lcom/SixClawWorm/utils/DragImageView;->access$3(Lcom/SixClawWorm/utils/DragImageView;)I

    move-result v2

    invoke-static {v1, v2}, Ljava/lang/Math;->min(II)I

    move-result v1

    iput v1, p0, Lcom/SixClawWorm/utils/DragImageView$MyAsyncTask;->bottom:I

    .line 414
    const-string v1, "jj"

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "top="

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget v3, p0, Lcom/SixClawWorm/utils/DragImageView$MyAsyncTask;->top:I

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ",bottom="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget v3, p0, Lcom/SixClawWorm/utils/DragImageView$MyAsyncTask;->bottom:I

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ",left="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget v3, p0, Lcom/SixClawWorm/utils/DragImageView$MyAsyncTask;->left:I

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ",right="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget v3, p0, Lcom/SixClawWorm/utils/DragImageView$MyAsyncTask;->right:I

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 415
    const/4 v1, 0x4

    new-array v1, v1, [Ljava/lang/Integer;

    const/4 v2, 0x0

    iget v3, p0, Lcom/SixClawWorm/utils/DragImageView$MyAsyncTask;->left:I

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v1, v2

    const/4 v2, 0x1

    iget v3, p0, Lcom/SixClawWorm/utils/DragImageView$MyAsyncTask;->top:I

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v1, v2

    const/4 v2, 0x2

    iget v3, p0, Lcom/SixClawWorm/utils/DragImageView$MyAsyncTask;->right:I

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v1, v2

    const/4 v2, 0x3

    iget v3, p0, Lcom/SixClawWorm/utils/DragImageView$MyAsyncTask;->bottom:I

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v1, v2

    invoke-virtual {p0, v1}, Lcom/SixClawWorm/utils/DragImageView$MyAsyncTask;->onProgressUpdate([Ljava/lang/Integer;)V

    .line 417
    const-wide/16 v1, 0xa

    :try_start_0
    invoke-static {v1, v2}, Ljava/lang/Thread;->sleep(J)V
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    goto/16 :goto_0

    .line 418
    :catch_0
    move-exception v0

    .line 419
    .local v0, e:Ljava/lang/InterruptedException;
    invoke-virtual {v0}, Ljava/lang/InterruptedException;->printStackTrace()V

    goto/16 :goto_0
.end method

.method protected varargs onProgressUpdate([Ljava/lang/Integer;)V
    .locals 2
    .parameter "values"

    .prologue
    .line 428
    invoke-super {p0, p1}, Landroid/os/AsyncTask;->onProgressUpdate([Ljava/lang/Object;)V

    .line 429
    iget-object v0, p0, Lcom/SixClawWorm/utils/DragImageView$MyAsyncTask;->this$0:Lcom/SixClawWorm/utils/DragImageView;

    #getter for: Lcom/SixClawWorm/utils/DragImageView;->mActivity:Landroid/app/Activity;
    invoke-static {v0}, Lcom/SixClawWorm/utils/DragImageView;->access$4(Lcom/SixClawWorm/utils/DragImageView;)Landroid/app/Activity;

    move-result-object v0

    new-instance v1, Lcom/SixClawWorm/utils/DragImageView$MyAsyncTask$1;

    invoke-direct {v1, p0, p1}, Lcom/SixClawWorm/utils/DragImageView$MyAsyncTask$1;-><init>(Lcom/SixClawWorm/utils/DragImageView$MyAsyncTask;[Ljava/lang/Integer;)V

    invoke-virtual {v0, v1}, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 435
    return-void
.end method

.method protected bridge varargs synthetic onProgressUpdate([Ljava/lang/Object;)V
    .locals 0
    .parameter

    .prologue
    .line 1
    check-cast p1, [Ljava/lang/Integer;

    invoke-virtual {p0, p1}, Lcom/SixClawWorm/utils/DragImageView$MyAsyncTask;->onProgressUpdate([Ljava/lang/Integer;)V

    return-void
.end method

.method public setLTRB(IIII)V
    .locals 0
    .parameter "left"
    .parameter "top"
    .parameter "right"
    .parameter "bottom"

    .prologue
    .line 378
    iput p1, p0, Lcom/SixClawWorm/utils/DragImageView$MyAsyncTask;->left:I

    .line 379
    iput p2, p0, Lcom/SixClawWorm/utils/DragImageView$MyAsyncTask;->top:I

    .line 380
    iput p3, p0, Lcom/SixClawWorm/utils/DragImageView$MyAsyncTask;->right:I

    .line 381
    iput p4, p0, Lcom/SixClawWorm/utils/DragImageView$MyAsyncTask;->bottom:I

    .line 382
    return-void
.end method
