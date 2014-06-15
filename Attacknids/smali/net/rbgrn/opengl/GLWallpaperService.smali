.class public Lnet/rbgrn/opengl/GLWallpaperService;
.super Landroid/service/wallpaper/WallpaperService;
.source "GLWallpaperService.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lnet/rbgrn/opengl/GLWallpaperService$GLEngine;
    }
.end annotation


# static fields
.field private static final TAG:Ljava/lang/String; = "GLWallpaperService"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 16
    invoke-direct {p0}, Landroid/service/wallpaper/WallpaperService;-><init>()V

    return-void
.end method


# virtual methods
.method public onCreate()V
    .locals 0

    .prologue
    .line 33
    invoke-super {p0}, Landroid/service/wallpaper/WallpaperService;->onCreate()V

    .line 34
    return-void
.end method

.method public onCreateEngine()Landroid/service/wallpaper/WallpaperService$Engine;
    .locals 1

    .prologue
    .line 51
    new-instance v0, Lnet/rbgrn/opengl/GLWallpaperService$GLEngine;

    invoke-direct {v0, p0}, Lnet/rbgrn/opengl/GLWallpaperService$GLEngine;-><init>(Lnet/rbgrn/opengl/GLWallpaperService;)V

    return-object v0
.end method

.method public onDestroy()V
    .locals 0

    .prologue
    .line 46
    invoke-super {p0}, Landroid/service/wallpaper/WallpaperService;->onDestroy()V

    .line 47
    return-void
.end method
