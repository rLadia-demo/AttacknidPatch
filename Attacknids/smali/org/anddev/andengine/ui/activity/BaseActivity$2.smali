.class Lorg/anddev/andengine/ui/activity/BaseActivity$2;
.super Landroid/os/AsyncTask;
.source "BaseActivity.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/anddev/andengine/ui/activity/BaseActivity;->doProgressAsync(ILorg/anddev/andengine/util/ProgressCallable;Lorg/anddev/andengine/util/Callback;Lorg/anddev/andengine/util/Callback;)V
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
        "Ljava/lang/Integer;",
        "TT;>;"
    }
.end annotation


# instance fields
.field private mException:Ljava/lang/Exception;

.field private mPD:Landroid/app/ProgressDialog;

.field final synthetic this$0:Lorg/anddev/andengine/ui/activity/BaseActivity;

.field private final synthetic val$pCallable:Lorg/anddev/andengine/util/ProgressCallable;

.field private final synthetic val$pCallback:Lorg/anddev/andengine/util/Callback;

.field private final synthetic val$pExceptionCallback:Lorg/anddev/andengine/util/Callback;

.field private final synthetic val$pTitleResID:I


# direct methods
.method constructor <init>(Lorg/anddev/andengine/ui/activity/BaseActivity;ILorg/anddev/andengine/util/ProgressCallable;Lorg/anddev/andengine/util/Callback;Lorg/anddev/andengine/util/Callback;)V
    .locals 1
    .parameter
    .parameter
    .parameter
    .parameter
    .parameter

    .prologue
    .line 1
    iput-object p1, p0, Lorg/anddev/andengine/ui/activity/BaseActivity$2;->this$0:Lorg/anddev/andengine/ui/activity/BaseActivity;

    iput p2, p0, Lorg/anddev/andengine/ui/activity/BaseActivity$2;->val$pTitleResID:I

    iput-object p3, p0, Lorg/anddev/andengine/ui/activity/BaseActivity$2;->val$pCallable:Lorg/anddev/andengine/util/ProgressCallable;

    iput-object p4, p0, Lorg/anddev/andengine/ui/activity/BaseActivity$2;->val$pCallback:Lorg/anddev/andengine/util/Callback;

    iput-object p5, p0, Lorg/anddev/andengine/ui/activity/BaseActivity$2;->val$pExceptionCallback:Lorg/anddev/andengine/util/Callback;

    .line 147
    invoke-direct {p0}, Landroid/os/AsyncTask;-><init>()V

    .line 149
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/anddev/andengine/ui/activity/BaseActivity$2;->mException:Ljava/lang/Exception;

    return-void
.end method


# virtual methods
.method public bridge varargs synthetic doInBackground([Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1
    .parameter

    .prologue
    .line 1
    check-cast p1, [Ljava/lang/Void;

    invoke-virtual {p0, p1}, Lorg/anddev/andengine/ui/activity/BaseActivity$2;->doInBackground([Ljava/lang/Void;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public varargs doInBackground([Ljava/lang/Void;)Ljava/lang/Object;
    .locals 3
    .parameter "params"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([",
            "Ljava/lang/Void;",
            ")TT;"
        }
    .end annotation

    .prologue
    .line 165
    :try_start_0
    iget-object v1, p0, Lorg/anddev/andengine/ui/activity/BaseActivity$2;->val$pCallable:Lorg/anddev/andengine/util/ProgressCallable;

    new-instance v2, Lorg/anddev/andengine/ui/activity/BaseActivity$2$1;

    invoke-direct {v2, p0}, Lorg/anddev/andengine/ui/activity/BaseActivity$2$1;-><init>(Lorg/anddev/andengine/ui/activity/BaseActivity$2;)V

    invoke-interface {v1, v2}, Lorg/anddev/andengine/util/ProgressCallable;->call(Lorg/anddev/progressmonitor/IProgressListener;)Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v1

    .line 174
    :goto_0
    return-object v1

    .line 171
    :catch_0
    move-exception v0

    .line 172
    .local v0, e:Ljava/lang/Exception;
    iput-object v0, p0, Lorg/anddev/andengine/ui/activity/BaseActivity$2;->mException:Ljava/lang/Exception;

    .line 174
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
    .line 185
    .local p1, result:Ljava/lang/Object;,"TT;"
    :try_start_0
    iget-object v1, p0, Lorg/anddev/andengine/ui/activity/BaseActivity$2;->mPD:Landroid/app/ProgressDialog;

    invoke-virtual {v1}, Landroid/app/ProgressDialog;->dismiss()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 191
    :goto_0
    invoke-virtual {p0}, Lorg/anddev/andengine/ui/activity/BaseActivity$2;->isCancelled()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 192
    new-instance v1, Lorg/anddev/andengine/ui/activity/BaseActivity$CancelledException;

    invoke-direct {v1}, Lorg/anddev/andengine/ui/activity/BaseActivity$CancelledException;-><init>()V

    iput-object v1, p0, Lorg/anddev/andengine/ui/activity/BaseActivity$2;->mException:Ljava/lang/Exception;

    .line 195
    :cond_0
    iget-object v1, p0, Lorg/anddev/andengine/ui/activity/BaseActivity$2;->mException:Ljava/lang/Exception;

    if-nez v1, :cond_1

    .line 196
    iget-object v1, p0, Lorg/anddev/andengine/ui/activity/BaseActivity$2;->val$pCallback:Lorg/anddev/andengine/util/Callback;

    invoke-interface {v1, p1}, Lorg/anddev/andengine/util/Callback;->onCallback(Ljava/lang/Object;)V

    .line 205
    :goto_1
    invoke-super {p0, p1}, Landroid/os/AsyncTask;->onPostExecute(Ljava/lang/Object;)V

    .line 206
    return-void

    .line 186
    :catch_0
    move-exception v0

    .line 187
    .local v0, e:Ljava/lang/Exception;
    const-string v1, "Error"

    invoke-static {v1, v0}, Lorg/anddev/andengine/util/Debug;->e(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_0

    .line 198
    .end local v0           #e:Ljava/lang/Exception;
    :cond_1
    iget-object v1, p0, Lorg/anddev/andengine/ui/activity/BaseActivity$2;->val$pExceptionCallback:Lorg/anddev/andengine/util/Callback;

    if-nez v1, :cond_2

    .line 199
    const-string v1, "Error"

    iget-object v2, p0, Lorg/anddev/andengine/ui/activity/BaseActivity$2;->mException:Ljava/lang/Exception;

    invoke-static {v1, v2}, Lorg/anddev/andengine/util/Debug;->e(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_1

    .line 201
    :cond_2
    iget-object v1, p0, Lorg/anddev/andengine/ui/activity/BaseActivity$2;->val$pExceptionCallback:Lorg/anddev/andengine/util/Callback;

    iget-object v2, p0, Lorg/anddev/andengine/ui/activity/BaseActivity$2;->mException:Ljava/lang/Exception;

    invoke-interface {v1, v2}, Lorg/anddev/andengine/util/Callback;->onCallback(Ljava/lang/Object;)V

    goto :goto_1
.end method

.method public onPreExecute()V
    .locals 2

    .prologue
    .line 153
    new-instance v0, Landroid/app/ProgressDialog;

    iget-object v1, p0, Lorg/anddev/andengine/ui/activity/BaseActivity$2;->this$0:Lorg/anddev/andengine/ui/activity/BaseActivity;

    invoke-direct {v0, v1}, Landroid/app/ProgressDialog;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lorg/anddev/andengine/ui/activity/BaseActivity$2;->mPD:Landroid/app/ProgressDialog;

    .line 154
    iget-object v0, p0, Lorg/anddev/andengine/ui/activity/BaseActivity$2;->mPD:Landroid/app/ProgressDialog;

    iget v1, p0, Lorg/anddev/andengine/ui/activity/BaseActivity$2;->val$pTitleResID:I

    invoke-virtual {v0, v1}, Landroid/app/ProgressDialog;->setTitle(I)V

    .line 155
    iget-object v0, p0, Lorg/anddev/andengine/ui/activity/BaseActivity$2;->mPD:Landroid/app/ProgressDialog;

    const v1, 0x108004e

    invoke-virtual {v0, v1}, Landroid/app/ProgressDialog;->setIcon(I)V

    .line 156
    iget-object v0, p0, Lorg/anddev/andengine/ui/activity/BaseActivity$2;->mPD:Landroid/app/ProgressDialog;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/app/ProgressDialog;->setIndeterminate(Z)V

    .line 157
    iget-object v0, p0, Lorg/anddev/andengine/ui/activity/BaseActivity$2;->mPD:Landroid/app/ProgressDialog;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/app/ProgressDialog;->setProgressStyle(I)V

    .line 158
    iget-object v0, p0, Lorg/anddev/andengine/ui/activity/BaseActivity$2;->mPD:Landroid/app/ProgressDialog;

    invoke-virtual {v0}, Landroid/app/ProgressDialog;->show()V

    .line 159
    invoke-super {p0}, Landroid/os/AsyncTask;->onPreExecute()V

    .line 160
    return-void
.end method

.method public varargs onProgressUpdate([Ljava/lang/Integer;)V
    .locals 2
    .parameter "values"

    .prologue
    .line 179
    iget-object v0, p0, Lorg/anddev/andengine/ui/activity/BaseActivity$2;->mPD:Landroid/app/ProgressDialog;

    const/4 v1, 0x0

    aget-object v1, p1, v1

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    invoke-virtual {v0, v1}, Landroid/app/ProgressDialog;->setProgress(I)V

    .line 180
    return-void
.end method

.method public bridge varargs synthetic onProgressUpdate([Ljava/lang/Object;)V
    .locals 0
    .parameter

    .prologue
    .line 1
    check-cast p1, [Ljava/lang/Integer;

    invoke-virtual {p0, p1}, Lorg/anddev/andengine/ui/activity/BaseActivity$2;->onProgressUpdate([Ljava/lang/Integer;)V

    return-void
.end method
