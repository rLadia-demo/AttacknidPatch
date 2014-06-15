.class public abstract Lorg/anddev/andengine/entity/scene/menu/animator/BaseMenuAnimator;
.super Ljava/lang/Object;
.source "BaseMenuAnimator.java"

# interfaces
.implements Lorg/anddev/andengine/entity/scene/menu/animator/IMenuAnimator;


# static fields
.field protected static final DURATION:F = 1.0f

.field private static final HORIZONTALALIGN_DEFAULT:Lorg/anddev/andengine/util/HorizontalAlign; = null

.field private static final MENUITEMSPACING_DEFAULT:F = 1.0f


# instance fields
.field protected final mEaseFunction:Lorg/anddev/andengine/util/modifier/ease/IEaseFunction;

.field protected final mHorizontalAlign:Lorg/anddev/andengine/util/HorizontalAlign;

.field protected final mMenuItemSpacing:F


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 22
    sget-object v0, Lorg/anddev/andengine/util/HorizontalAlign;->CENTER:Lorg/anddev/andengine/util/HorizontalAlign;

    sput-object v0, Lorg/anddev/andengine/entity/scene/menu/animator/BaseMenuAnimator;->HORIZONTALALIGN_DEFAULT:Lorg/anddev/andengine/util/HorizontalAlign;

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .prologue
    .line 37
    const/high16 v0, 0x3f80

    invoke-direct {p0, v0}, Lorg/anddev/andengine/entity/scene/menu/animator/BaseMenuAnimator;-><init>(F)V

    .line 38
    return-void
.end method

.method public constructor <init>(F)V
    .locals 1
    .parameter "pMenuItemSpacing"

    .prologue
    .line 45
    sget-object v0, Lorg/anddev/andengine/entity/scene/menu/animator/BaseMenuAnimator;->HORIZONTALALIGN_DEFAULT:Lorg/anddev/andengine/util/HorizontalAlign;

    invoke-direct {p0, v0, p1}, Lorg/anddev/andengine/entity/scene/menu/animator/BaseMenuAnimator;-><init>(Lorg/anddev/andengine/util/HorizontalAlign;F)V

    .line 46
    return-void
.end method

.method public constructor <init>(FLorg/anddev/andengine/util/modifier/ease/IEaseFunction;)V
    .locals 1
    .parameter "pMenuItemSpacing"
    .parameter "pEaseFunction"

    .prologue
    .line 49
    sget-object v0, Lorg/anddev/andengine/entity/scene/menu/animator/BaseMenuAnimator;->HORIZONTALALIGN_DEFAULT:Lorg/anddev/andengine/util/HorizontalAlign;

    invoke-direct {p0, v0, p1, p2}, Lorg/anddev/andengine/entity/scene/menu/animator/BaseMenuAnimator;-><init>(Lorg/anddev/andengine/util/HorizontalAlign;FLorg/anddev/andengine/util/modifier/ease/IEaseFunction;)V

    .line 50
    return-void
.end method

.method public constructor <init>(Lorg/anddev/andengine/util/HorizontalAlign;)V
    .locals 1
    .parameter "pHorizontalAlign"

    .prologue
    .line 53
    const/high16 v0, 0x3f80

    invoke-direct {p0, p1, v0}, Lorg/anddev/andengine/entity/scene/menu/animator/BaseMenuAnimator;-><init>(Lorg/anddev/andengine/util/HorizontalAlign;F)V

    .line 54
    return-void
.end method

.method public constructor <init>(Lorg/anddev/andengine/util/HorizontalAlign;F)V
    .locals 1
    .parameter "pHorizontalAlign"
    .parameter "pMenuItemSpacing"

    .prologue
    .line 61
    sget-object v0, Lorg/anddev/andengine/util/modifier/ease/IEaseFunction;->DEFAULT:Lorg/anddev/andengine/util/modifier/ease/IEaseFunction;

    invoke-direct {p0, p1, p2, v0}, Lorg/anddev/andengine/entity/scene/menu/animator/BaseMenuAnimator;-><init>(Lorg/anddev/andengine/util/HorizontalAlign;FLorg/anddev/andengine/util/modifier/ease/IEaseFunction;)V

    .line 62
    return-void
.end method

.method public constructor <init>(Lorg/anddev/andengine/util/HorizontalAlign;FLorg/anddev/andengine/util/modifier/ease/IEaseFunction;)V
    .locals 0
    .parameter "pHorizontalAlign"
    .parameter "pMenuItemSpacing"
    .parameter "pEaseFunction"

    .prologue
    .line 64
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 65
    iput-object p1, p0, Lorg/anddev/andengine/entity/scene/menu/animator/BaseMenuAnimator;->mHorizontalAlign:Lorg/anddev/andengine/util/HorizontalAlign;

    .line 66
    iput p2, p0, Lorg/anddev/andengine/entity/scene/menu/animator/BaseMenuAnimator;->mMenuItemSpacing:F

    .line 67
    iput-object p3, p0, Lorg/anddev/andengine/entity/scene/menu/animator/BaseMenuAnimator;->mEaseFunction:Lorg/anddev/andengine/util/modifier/ease/IEaseFunction;

    .line 68
    return-void
.end method

.method public constructor <init>(Lorg/anddev/andengine/util/HorizontalAlign;Lorg/anddev/andengine/util/modifier/ease/IEaseFunction;)V
    .locals 1
    .parameter "pHorizontalAlign"
    .parameter "pEaseFunction"

    .prologue
    .line 57
    const/high16 v0, 0x3f80

    invoke-direct {p0, p1, v0, p2}, Lorg/anddev/andengine/entity/scene/menu/animator/BaseMenuAnimator;-><init>(Lorg/anddev/andengine/util/HorizontalAlign;FLorg/anddev/andengine/util/modifier/ease/IEaseFunction;)V

    .line 58
    return-void
.end method

.method public constructor <init>(Lorg/anddev/andengine/util/modifier/ease/IEaseFunction;)V
    .locals 1
    .parameter "pEaseFunction"

    .prologue
    .line 41
    const/high16 v0, 0x3f80

    invoke-direct {p0, v0, p1}, Lorg/anddev/andengine/entity/scene/menu/animator/BaseMenuAnimator;-><init>(FLorg/anddev/andengine/util/modifier/ease/IEaseFunction;)V

    .line 42
    return-void
.end method


# virtual methods
.method protected getMaximumWidth(Ljava/util/ArrayList;)F
    .locals 4
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList",
            "<",
            "Lorg/anddev/andengine/entity/scene/menu/item/IMenuItem;",
            ">;)F"
        }
    .end annotation

    .prologue
    .line 75
    .local p1, pMenuItems:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lorg/anddev/andengine/entity/scene/menu/item/IMenuItem;>;"
    const/4 v1, 0x1

    .line 76
    .local v1, maximumWidth:F
    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result v3

    add-int/lit8 v0, v3, -0x1

    .local v0, i:I
    :goto_0
    if-gez v0, :cond_0

    .line 80
    return v1

    .line 77
    :cond_0
    invoke-virtual {p1, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lorg/anddev/andengine/entity/scene/menu/item/IMenuItem;

    .line 78
    .local v2, menuItem:Lorg/anddev/andengine/entity/scene/menu/item/IMenuItem;
    invoke-interface {v2}, Lorg/anddev/andengine/entity/scene/menu/item/IMenuItem;->getWidthScaled()F

    move-result v3

    invoke-static {v1, v3}, Ljava/lang/Math;->max(FF)F

    move-result v1

    .line 76
    add-int/lit8 v0, v0, -0x1

    goto :goto_0
.end method

.method protected getOverallHeight(Ljava/util/ArrayList;)F
    .locals 5
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList",
            "<",
            "Lorg/anddev/andengine/entity/scene/menu/item/IMenuItem;",
            ">;)F"
        }
    .end annotation

    .prologue
    .line 84
    .local p1, pMenuItems:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lorg/anddev/andengine/entity/scene/menu/item/IMenuItem;>;"
    const/4 v2, 0x0

    .line 85
    .local v2, overallHeight:F
    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result v3

    add-int/lit8 v0, v3, -0x1

    .local v0, i:I
    :goto_0
    if-gez v0, :cond_0

    .line 90
    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result v3

    add-int/lit8 v3, v3, -0x1

    int-to-float v3, v3

    iget v4, p0, Lorg/anddev/andengine/entity/scene/menu/animator/BaseMenuAnimator;->mMenuItemSpacing:F

    mul-float/2addr v3, v4

    add-float/2addr v2, v3

    .line 91
    return v2

    .line 86
    :cond_0
    invoke-virtual {p1, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/anddev/andengine/entity/scene/menu/item/IMenuItem;

    .line 87
    .local v1, menuItem:Lorg/anddev/andengine/entity/scene/menu/item/IMenuItem;
    invoke-interface {v1}, Lorg/anddev/andengine/entity/scene/menu/item/IMenuItem;->getHeight()F

    move-result v3

    add-float/2addr v2, v3

    .line 85
    add-int/lit8 v0, v0, -0x1

    goto :goto_0
.end method
