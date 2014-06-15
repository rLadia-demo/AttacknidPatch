.class Lorg/anddev/andengine/ui/activity/BaseActivity$1;
.super Landroid/os/AsyncTask;
.source "BaseActivity.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/anddev/andengine/ui/activity/BaseActivity;->doAsync(IILjava/util/concurrent/Callable;Lorg/anddev/andengine/util/Callback;Lorg/anddev/andengine/util/Callback;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/os/AsyncTask",
        "<",
        "Ljava/lang/Void;",
        "Ljava/lang/Void;",
        "TT;>;"
    }
.end annotation


# instance fields
.field private mException:Ljava/lang/Exception;

.field private mPD:Landroid/app/ProgressDialog;

.field final synthetic this$0:Lorg/anddev/andengine/ui/activity/BaseActivity;

.field private final synthetic val$pCallable:Ljava/util/concurrent/Callable;

.field private final synthetic val$pCallback:Lorg/anddev/andengine/util/Callback;

.field private final synthetic val$pExceptionCallback:Lorg/anddev/andengine/util/Callback;

.field private final synthetic val$pMessageResID:I

.field private final synthetic val$pTitleResID:I


# direct methods
.method constructor <init>(Lorg/anddev/andengine/ui/activity/BaseActivity;IILjava/util/concurrent/Callable;Lorg/anddev/andengine/util/Callback;Lorg/anddev/andengine/util/Callback;)V
    .locals 1
    .parameter
    .parameter
    .parameter
    .parameter
    .parameter
    .parameter

    .prologue
    .line 1
    iput-object p1, p0, Lorg/anddev/andengine/ui/activity/BaseActivity$1;->this$0:Lorg/anddev/andengine/ui/activity/BaseActivity;

    iput p2, p0, Lorg/anddev/andengine/ui/activity/BaseActivity$1;->val$pTitleResID:I

    iput p3, p0, Lorg/anddev/andengine/ui/activity/BaseActivity$1;->val$pMessageResID:I

    iput-object p4, p0, Lorg/anddev/andengine/ui/activity/BaseActivity$1;->val$pCallable:Ljava/util/concurrent/Callable;

    iput-object p5, p0, Lorg/anddev/andengine/ui/activity/BaseActivity$1;->val$pCallback:Lorg/anddev/andengine/util/Callback;

    iput-object p6, p0, Lorg/anddev/andengine/ui/activity/BaseActivity$1;->val$pExceptionCallback:Lorg/anddev/andengine/util/Callback;

    .line 72
    invoke-direct {p0}, Landroid/os/AsyncTask;-><init>()V

    .line 74
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/anddev/andengine/ui/activity/BaseActivity$1;->mException:Ljava/lang/Exception;

    return-void
.end method


# virtual methods
.method public bridge varargs synthetic doInBackground([Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1
    .parameter

    .prologue
    .line 1
    check-cast p1, [Ljava/lang/Void;

    invoke-virtual {p0, p1}, Lorg/anddev/andengine/ui/activity/BaseActivity$1;->doInBackground([Ljava/lang/Void;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public varargs doInBackground([Ljava/lang/Void;)Ljava/lang/Object;
    .locals 2
    .parameter "params"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([",
            "Ljava/lang/Void;",
            ")TT;"
        }
    .end annotation

    .prologue
    .line 85
    :try_start_0
    iget-object v1, p0, Lorg/anddev/andengine/ui/activity/BaseActivity$1;->val$pCallable:Ljava/util/concurrent/Callable;

    invoke-interface {v1}, Ljava/util/concurrent/Callable;->call()Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v1

    .line 89
    :goto_0
    return-object v1

    .line 86
    :catch_0
    move-exception v0

    .line 87
    .local v0, e:Ljava/lang/Exception;
    iput-object v0, p0, Lorg/anddev/andengine/ui/activity/BaseActivity$1;->mException:Ljava/lang/Exception;

    .line 89
    const/4 v1, 0x0

    goto :goto_0
.end method

.method public onPostExecute(Ljava/lang/Object;)V
    .locals 3
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)V"
        }
    .end annotation

    .prologue
    .line 95
    .local p1, result:Ljava/lang/Object;,"TT;"
    :try_start_0
    iget-object v1, p0, Lorg/anddev/andengine/ui/activity/BaseActivity$1;->mPD:Landroid/app/ProgressDialog;

    invoke-virtual {v1}, Landroid/app/ProgressDialog;->dismiss()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 100
    :goto_0
    invoke-virtual {p0}, Lorg/anddev/andengine/ui/activity/BaseActivity$1;->isCancelled()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 101
    new-instance v1, Lorg/anddev/andengine/ui/activity/BaseActivity$CancelledException;

    invoke-direct {v1}, Lorg/anddev/andengine/ui/activity/BaseActivity$CancelledException;-><init>()V

    iput-object v1, p0, Lorg/anddev/andengine/ui/activity/BaseActivity$1;->mException:Ljava/lang/Exception;

    .line 104
    :cond_0
    iget-object v1, p0, Lorg/anddev/andengine/ui/activity/BaseActivity$1;->mException:Ljava/lang/Exception;

    if-nez v1, :cond_1

    .line 105
    iget-object v1, p0, Lorg/anddev/andengine/ui/activity/BaseActivity$1;->val$pCallback:Lorg/anddev/andengine/util/Callback;

    invoke-interface {v1, p1}, Lorg/anddev/andengine/util/Callback;->onCallback(Ljava/lang/Object;)V

    .line 114
    :goto_1
    invoke-super {p0, p1}, Landroid/os/AsyncTask;->onPostExecute(Ljava/lang/Object;)V

    .line 115
    return-void

    .line 96
    :catch_0
    move-exception v0

    .line 97
    .local v0, e:Ljava/lang/Exception;
    const-string v1, "Error"

    invoke-static {v1, v0}, Lorg/anddev/andengine/util/Debug;->e(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_0

    .line 107
    .end local v0           #e:Ljava/lang/Exception;
    :cond_1
    iget-object v1, p0, Lorg/anddev/andengine/ui/activity/BaseActivity$1;->val$pExceptionCallback:Lorg/anddev/andengine/util/Callback;

    if-nez v1, :cond_2

    .line 108
    const-string v1, "Error"

    iget-object v2, p0, Lorg/anddev/andengine/ui/activity/BaseActivity$1;->mException:Ljava/lang/Exception;

    invoke-static {v1, v2}, Lorg/anddev/andengine/util/Debug;->e(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_1

    .line 110
    :cond_2
    iget-object v1, p0, Lorg/anddev/andengine/ui/activity/BaseActivity$1;->val$pExceptionCallback:Lorg/anddev/andengine/util/Callback;

    iget-object v2, p0, Lorg/anddev/andengine/ui/activity/BaseActivity$1;->mException:Ljava/lang/Exception;

    invoke-interface {v1, v2}, Lorg/anddev/andengine/util/Callback;->onCallback(Ljava/lang/Object;)V

    goto :goto_1
.end method

.method public onPreExecute()V
    .locals 4

    .prologue
    .line 78
    iget-object v0, p0, Lorg/anddev/andengine/ui/activity/BaseActivity$1;->this$0:Lorg/anddev/andengine/ui/activity/BaseActivity;

    iget-object v1, p0, Lorg/anddev/andengine/ui/activity/BaseActivity$1;->this$0:Lorg/anddev/andengine/ui/activity/BaseActivity;

    iget v2, p0, Lorg/anddev/andengine/ui/activity/BaseActivity$1;->val$pTitleResID:I

    invoke-virtual {v1, v2}, Lorg/anddev/andengine/ui/activity/BaseActivity;->getString(I)Ljava/lang/String;

    move-result-object v1

    iget-object v2, p0, Lorg/anddev/andengine/ui/activity/BaseActivity$1;->this$0:Lorg/anddev/andengine/ui/activity/BaseActivity;

    iget v3, p0, Lorg/anddev/andengine/ui/activity/BaseActivity$1;->val$pMessageResID:I

    invoke-virtual {v2, v3}, Lorg/anddev/andengine/ui/activity/BaseActivity;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-static {v0, v1, v2}, Landroid/app/ProgressDialog;->show(Landroid/content/Context;Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Landroid/app/ProgressDialog;

    move-result-object v0

    iput-object v0, p0, Lorg/anddev/andengine/ui/activity/BaseActivity$1;->mPD:Landroid/app/ProgressDialog;

    .line 79
    invoke-super {p0}, Landroid/os/AsyncTask;->onPreExecute()V

    .line 80
    return-void
.end method
