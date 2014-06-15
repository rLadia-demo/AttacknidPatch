.class Lcom/SixClawWorm/utils/DragImageView$MyAsyncTask$1;
.super Ljava/lang/Object;
.source "DragImageView.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/SixClawWorm/utils/DragImageView$MyAsyncTask;->onProgressUpdate([Ljava/lang/Integer;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/SixClawWorm/utils/DragImageView$MyAsyncTask;

.field private final synthetic val$values:[Ljava/lang/Integer;


# direct methods
.method constructor <init>(Lcom/SixClawWorm/utils/DragImageView$MyAsyncTask;[Ljava/lang/Integer;)V
    .locals 0
    .parameter
    .parameter

    .prologue
    .line 1
    iput-object p1, p0, Lcom/SixClawWorm/utils/DragImageView$MyAsyncTask$1;->this$1:Lcom/SixClawWorm/utils/DragImageView$MyAsyncTask;

    iput-object p2, p0, Lcom/SixClawWorm/utils/DragImageView$MyAsyncTask$1;->val$values:[Ljava/lang/Integer;

    .line 429
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 6

    .prologue
    .line 432
    iget-object v0, p0, Lcom/SixClawWorm/utils/DragImageView$MyAsyncTask$1;->this$1:Lcom/SixClawWorm/utils/DragImageView$MyAsyncTask;

    #getter for: Lcom/SixClawWorm/utils/DragImageView$MyAsyncTask;->this$0:Lcom/SixClawWorm/utils/DragImageView;
    invoke-static {v0}, Lcom/SixClawWorm/utils/DragImageView$MyAsyncTask;->access$2(Lcom/SixClawWorm/utils/DragImageView$MyAsyncTask;)Lcom/SixClawWorm/utils/DragImageView;

    move-result-object v0

    iget-object v1, p0, Lcom/SixClawWorm/utils/DragImageView$MyAsyncTask$1;->val$values:[Ljava/lang/Integer;

    const/4 v2, 0x0

    aget-object v1, v1, v2

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    iget-object v2, p0, Lcom/SixClawWorm/utils/DragImageView$MyAsyncTask$1;->val$values:[Ljava/lang/Integer;

    const/4 v3, 0x1

    aget-object v2, v2, v3

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v2

    iget-object v3, p0, Lcom/SixClawWorm/utils/DragImageView$MyAsyncTask$1;->val$values:[Ljava/lang/Integer;

    const/4 v4, 0x2

    aget-object v3, v3, v4

    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v3

    iget-object v4, p0, Lcom/SixClawWorm/utils/DragImageView$MyAsyncTask$1;->val$values:[Ljava/lang/Integer;

    const/4 v5, 0x3

    aget-object v4, v4, v5

    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    move-result v4

    #calls: Lcom/SixClawWorm/utils/DragImageView;->setFrame(IIII)Z
    invoke-static {v0, v1, v2, v3, v4}, Lcom/SixClawWorm/utils/DragImageView;->access$5(Lcom/SixClawWorm/utils/DragImageView;IIII)Z

    .line 433
    return-void
.end method
