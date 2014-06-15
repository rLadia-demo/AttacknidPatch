.class public abstract Lorg/anddev/andengine/ui/activity/BaseActivity;
.super Landroid/app/Activity;
.source "BaseActivity.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/anddev/andengine/ui/activity/BaseActivity$CancelledException;
    }
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 19
    invoke-direct {p0}, Landroid/app/Activity;-><init>()V

    return-void
.end method


# virtual methods
.method protected doAsync(IILjava/util/concurrent/Callable;Lorg/anddev/andengine/util/Callback;)V
    .locals 6
    .parameter "pTitleResID"
    .parameter "pMessageResID"
    .parameter
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(II",
            "Ljava/util/concurrent/Callable",
            "<TT;>;",
            "Lorg/anddev/andengine/util/Callback",
            "<TT;>;)V"
        }
    .end annotation

    .prologue
    .line 56
    .local p3, pCallable:Ljava/util/concurrent/Callable;,"Ljava/util/concurrent/Callable<TT;>;"
    .local p4, pCallback:Lorg/anddev/andengine/util/Callback;,"Lorg/anddev/andengine/util/Callback<TT;>;"
    const/4 v5, 0x0

    move-object v0, p0

    move v1, p1

    move v2, p2

    move-object v3, p3

    move-object v4, p4

    invoke-virtual/range {v0 .. v5}, Lorg/anddev/andengine/ui/activity/BaseActivity;->doAsync(IILjava/util/concurrent/Callable;Lorg/anddev/andengine/util/Callback;Lorg/anddev/andengine/util/Callback;)V

    .line 57
    return-void
.end method

.method protected doAsync(IILjava/util/concurrent/Callable;Lorg/anddev/andengine/util/Callback;Lorg/anddev/andengine/util/Callback;)V
    .locals 7
    .parameter "pTitleResID"
    .parameter "pMessageResID"
    .parameter
    .parameter
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(II",
            "Ljava/util/concurrent/Callable",
            "<TT;>;",
            "Lorg/anddev/andengine/util/Callback",
            "<TT;>;",
            "Lorg/anddev/andengine/util/Callback",
            "<",
            "Ljava/lang/Exception;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 72
    .local p3, pCallable:Ljava/util/concurrent/Callable;,"Ljava/util/concurrent/Callable<TT;>;"
    .local p4, pCallback:Lorg/anddev/andengine/util/Callback;,"Lorg/anddev/andengine/util/Callback<TT;>;"
    .local p5, pExceptionCallback:Lorg/anddev/andengine/util/Callback;,"Lorg/anddev/andengine/util/Callback<Ljava/lang/Exception;>;"
    new-instance v0, Lorg/anddev/andengine/ui/activity/BaseActivity$1;

    move-object v1, p0

    move v2, p1

    move v3, p2

    move-object v4, p3

    move-object v5, p4

    move-object v6, p5

    invoke-direct/range {v0 .. v6}, Lorg/anddev/andengine/ui/activity/BaseActivity$1;-><init>(Lorg/anddev/andengine/ui/activity/BaseActivity;IILjava/util/concurrent/Callable;Lorg/anddev/andengine/util/Callback;Lorg/anddev/andengine/util/Callback;)V

    .line 116
    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lorg/anddev/andengine/ui/activity/BaseActivity$1;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;

    .line 117
    return-void
.end method

.method protected doAsync(IILorg/anddev/andengine/util/AsyncCallable;Lorg/anddev/andengine/util/Callback;Lorg/anddev/andengine/util/Callback;)V
    .locals 3
    .parameter "pTitleResID"
    .parameter "pMessageResID"
    .parameter
    .parameter
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(II",
            "Lorg/anddev/andengine/util/AsyncCallable",
            "<TT;>;",
            "Lorg/anddev/andengine/util/Callback",
            "<TT;>;",
            "Lorg/anddev/andengine/util/Callback",
            "<",
            "Ljava/lang/Exception;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 223
    .local p3, pAsyncCallable:Lorg/anddev/andengine/util/AsyncCallable;,"Lorg/anddev/andengine/util/AsyncCallable<TT;>;"
    .local p4, pCallback:Lorg/anddev/andengine/util/Callback;,"Lorg/anddev/andengine/util/Callback<TT;>;"
    .local p5, pExceptionCallback:Lorg/anddev/andengine/util/Callback;,"Lorg/anddev/andengine/util/Callback<Ljava/lang/Exception;>;"
    invoke-virtual {p0, p1}, Lorg/anddev/andengine/ui/activity/BaseActivity;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, p2}, Lorg/anddev/andengine/ui/activity/BaseActivity;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-static {p0, v1, v2}, Landroid/app/ProgressDialog;->show(Landroid/content/Context;Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Landroid/app/ProgressDialog;

    move-result-object v0

    .line 224
    .local v0, pd:Landroid/app/ProgressDialog;
    new-instance v1, Lorg/anddev/andengine/ui/activity/BaseActivity$3;

    invoke-direct {v1, p0, v0, p4}, Lorg/anddev/andengine/ui/activity/BaseActivity$3;-><init>(Lorg/anddev/andengine/ui/activity/BaseActivity;Landroid/app/ProgressDialog;Lorg/anddev/andengine/util/Callback;)V

    invoke-interface {p3, v1, p5}, Lorg/anddev/andengine/util/AsyncCallable;->call(Lorg/anddev/andengine/util/Callback;Lorg/anddev/andengine/util/Callback;)V

    .line 237
    return-void
.end method

.method protected doProgressAsync(ILorg/anddev/andengine/util/ProgressCallable;Lorg/anddev/andengine/util/Callback;)V
    .locals 1
    .parameter "pTitleResID"
    .parameter
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(I",
            "Lorg/anddev/andengine/util/ProgressCallable",
            "<TT;>;",
            "Lorg/anddev/andengine/util/Callback",
            "<TT;>;)V"
        }
    .end annotation

    .prologue
    .line 131
    .local p2, pCallable:Lorg/anddev/andengine/util/ProgressCallable;,"Lorg/anddev/andengine/util/ProgressCallable<TT;>;"
    .local p3, pCallback:Lorg/anddev/andengine/util/Callback;,"Lorg/anddev/andengine/util/Callback<TT;>;"
    const/4 v0, 0x0

    invoke-virtual {p0, p1, p2, p3, v0}, Lorg/anddev/andengine/ui/activity/BaseActivity;->doProgressAsync(ILorg/anddev/andengine/util/ProgressCallable;Lorg/anddev/andengine/util/Callback;Lorg/anddev/andengine/util/Callback;)V

    .line 132
    return-void
.end method

.method protected doProgressAsync(ILorg/anddev/andengine/util/ProgressCallable;Lorg/anddev/andengine/util/Callback;Lorg/anddev/andengine/util/Callback;)V
    .locals 6
    .parameter "pTitleResID"
    .parameter
    .parameter
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(I",
            "Lorg/anddev/andengine/util/ProgressCallable",
            "<TT;>;",
            "Lorg/anddev/andengine/util/Callback",
            "<TT;>;",
            "Lorg/anddev/andengine/util/Callback",
            "<",
            "Ljava/lang/Exception;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 147
    .local p2, pCallable:Lorg/anddev/andengine/util/ProgressCallable;,"Lorg/anddev/andengine/util/ProgressCallable<TT;>;"
    .local p3, pCallback:Lorg/anddev/andengine/util/Callback;,"Lorg/anddev/andengine/util/Callback<TT;>;"
    .local p4, pExceptionCallback:Lorg/anddev/andengine/util/Callback;,"Lorg/anddev/andengine/util/Callback<Ljava/lang/Exception;>;"
    new-instance v0, Lorg/anddev/andengine/ui/activity/BaseActivity$2;

    move-object v1, p0

    move v2, p1

    move-object v3, p2

    move-object v4, p3

    move-object v5, p4

    invoke-direct/range {v0 .. v5}, Lorg/anddev/andengine/ui/activity/BaseActivity$2;-><init>(Lorg/anddev/andengine/ui/activity/BaseActivity;ILorg/anddev/andengine/util/ProgressCallable;Lorg/anddev/andengine/util/Callback;Lorg/anddev/andengine/util/Callback;)V

    .line 207
    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lorg/anddev/andengine/ui/activity/BaseActivity$2;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;

    .line 208
    return-void
.end method
