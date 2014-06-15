.class public Lorg/anddev/andengine/entity/scene/menu/animator/AlphaMenuAnimator;
.super Lorg/anddev/andengine/entity/scene/menu/animator/BaseMenuAnimator;
.source "AlphaMenuAnimator.java"


# static fields
.field private static synthetic $SWITCH_TABLE$org$anddev$andengine$util$HorizontalAlign:[I = null

.field private static final ALPHA_FROM:F = 0.0f

.field private static final ALPHA_TO:F = 1.0f


# direct methods
.method static synthetic $SWITCH_TABLE$org$anddev$andengine$util$HorizontalAlign()[I
    .locals 3

    .prologue
    .line 14
    sget-object v0, Lorg/anddev/andengine/entity/scene/menu/animator/AlphaMenuAnimator;->$SWITCH_TABLE$org$anddev$andengine$util$HorizontalAlign:[I

    if-eqz v0, :cond_0

    :goto_0
    return-object v0

    :cond_0
    invoke-static {}, Lorg/anddev/andengine/util/HorizontalAlign;->values()[Lorg/anddev/andengine/util/HorizontalAlign;

    move-result-object v0

    array-length v0, v0

    new-array v0, v0, [I

    :try_start_0
    sget-object v1, Lorg/anddev/andengine/util/HorizontalAlign;->CENTER:Lorg/anddev/andengine/util/HorizontalAlign;

    invoke-virtual {v1}, Lorg/anddev/andengine/util/HorizontalAlign;->ordinal()I

    move-result v1

    const/4 v2, 0x2

    aput v2, v0, v1
    :try_end_0
    .catch Ljava/lang/NoSuchFieldError; {:try_start_0 .. :try_end_0} :catch_2

    :goto_1
    :try_start_1
    sget-object v1, Lorg/anddev/andengine/util/HorizontalAlign;->LEFT:Lorg/anddev/andengine/util/HorizontalAlign;

    invoke-virtual {v1}, Lorg/anddev/andengine/util/HorizontalAlign;->ordinal()I

    move-result v1

    const/4 v2, 0x1

    aput v2, v0, v1
    :try_end_1
    .catch Ljava/lang/NoSuchFieldError; {:try_start_1 .. :try_end_1} :catch_1

    :goto_2
    :try_start_2
    sget-object v1, Lorg/anddev/andengine/util/HorizontalAlign;->RIGHT:Lorg/anddev/andengine/util/HorizontalAlign;

    invoke-virtual {v1}, Lorg/anddev/andengine/util/HorizontalAlign;->ordinal()I

    move-result v1

    const/4 v2, 0x3

    aput v2, v0, v1
    :try_end_2
    .catch Ljava/lang/NoSuchFieldError; {:try_start_2 .. :try_end_2} :catch_0

    :goto_3
    sput-object v0, Lorg/anddev/andengine/entity/scene/menu/animator/AlphaMenuAnimator;->$SWITCH_TABLE$org$anddev$andengine$util$HorizontalAlign:[I

    goto :goto_0

    :catch_0
    move-exception v1

    goto :goto_3

    :catch_1
    move-exception v1

    goto :goto_2

    :catch_2
    move-exception v1

    goto :goto_1
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 31
    invoke-direct {p0}, Lorg/anddev/andengine/entity/scene/menu/animator/BaseMenuAnimator;-><init>()V

    .line 32
    return-void
.end method

.method public constructor <init>(F)V
    .locals 0
    .parameter "pMenuItemSpacing"

    .prologue
    .line 47
    invoke-direct {p0, p1}, Lorg/anddev/andengine/entity/scene/menu/animator/BaseMenuAnimator;-><init>(F)V

    .line 48
    return-void
.end method

.method public constructor <init>(FLorg/anddev/andengine/util/modifier/ease/IEaseFunction;)V
    .locals 0
    .parameter "pMenuItemSpacing"
    .parameter "pEaseFunction"

    .prologue
    .line 51
    invoke-direct {p0, p1, p2}, Lorg/anddev/andengine/entity/scene/menu/animator/BaseMenuAnimator;-><init>(FLorg/anddev/andengine/util/modifier/ease/IEaseFunction;)V

    .line 52
    return-void
.end method

.method public constructor <init>(Lorg/anddev/andengine/util/HorizontalAlign;)V
    .locals 0
    .parameter "pHorizontalAlign"

    .prologue
    .line 39
    invoke-direct {p0, p1}, Lorg/anddev/andengine/entity/scene/menu/animator/BaseMenuAnimator;-><init>(Lorg/anddev/andengine/util/HorizontalAlign;)V

    .line 40
    return-void
.end method

.method public constructor <init>(Lorg/anddev/andengine/util/HorizontalAlign;F)V
    .locals 0
    .parameter "pHorizontalAlign"
    .parameter "pMenuItemSpacing"

    .prologue
    .line 55
    invoke-direct {p0, p1, p2}, Lorg/anddev/andengine/entity/scene/menu/animator/BaseMenuAnimator;-><init>(Lorg/anddev/andengine/util/HorizontalAlign;F)V

    .line 56
    return-void
.end method

.method public constructor <init>(Lorg/anddev/andengine/util/HorizontalAlign;FLorg/anddev/andengine/util/modifier/ease/IEaseFunction;)V
    .locals 0
    .parameter "pHorizontalAlign"
    .parameter "pMenuItemSpacing"
    .parameter "pEaseFunction"

    .prologue
    .line 59
    invoke-direct {p0, p1, p2, p3}, Lorg/anddev/andengine/entity/scene/menu/animator/BaseMenuAnimator;-><init>(Lorg/anddev/andengine/util/HorizontalAlign;FLorg/anddev/andengine/util/modifier/ease/IEaseFunction;)V

    .line 60
    return-void
.end method

.method public constructor <init>(Lorg/anddev/andengine/util/HorizontalAlign;Lorg/anddev/andengine/util/modifier/ease/IEaseFunction;)V
    .locals 0
    .parameter "pHorizontalAlign"
    .parameter "pEaseFunction"

    .prologue
    .line 43
    invoke-direct {p0, p1, p2}, Lorg/anddev/andengine/entity/scene/menu/animator/BaseMenuAnimator;-><init>(Lorg/anddev/andengine/util/HorizontalAlign;Lorg/anddev/andengine/util/modifier/ease/IEaseFunction;)V

    .line 44
    return-void
.end method

.method public constructor <init>(Lorg/anddev/andengine/util/modifier/ease/IEaseFunction;)V
    .locals 0
    .parameter "pEaseFunction"

    .prologue
    .line 35
    invoke-direct {p0, p1}, Lorg/anddev/andengine/entity/scene/menu/animator/BaseMenuAnimator;-><init>(Lorg/anddev/andengine/util/modifier/ease/IEaseFunction;)V

    .line 36
    return-void
.end method


# virtual methods
.method public buildAnimations(Ljava/util/ArrayList;FF)V
    .locals 6
    .parameter
    .parameter "pCameraWidth"
    .parameter "pCameraHeight"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList",
            "<",
            "Lorg/anddev/andengine/entity/scene/menu/item/IMenuItem;",
            ">;FF)V"
        }
    .end annotation

    .prologue
    .local p1, pMenuItems:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lorg/anddev/andengine/entity/scene/menu/item/IMenuItem;>;"
    const/high16 v5, 0x3f80

    .line 72
    iget-object v1, p0, Lorg/anddev/andengine/entity/scene/menu/animator/AlphaMenuAnimator;->mEaseFunction:Lorg/anddev/andengine/util/modifier/ease/IEaseFunction;

    .line 73
    .local v1, easeFunction:Lorg/anddev/andengine/util/modifier/ease/IEaseFunction;
    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result v3

    .line 74
    .local v3, menuItemCount:I
    add-int/lit8 v2, v3, -0x1

    .local v2, i:I
    :goto_0
    if-gez v2, :cond_0

    .line 79
    return-void

    .line 75
    :cond_0
    new-instance v0, Lorg/anddev/andengine/entity/shape/modifier/AlphaModifier;

    const/4 v4, 0x0

    invoke-direct {v0, v5, v4, v5, v1}, Lorg/anddev/andengine/entity/shape/modifier/AlphaModifier;-><init>(FFFLorg/anddev/andengine/util/modifier/ease/IEaseFunction;)V

    .line 76
    .local v0, alphaModifier:Lorg/anddev/andengine/entity/shape/modifier/AlphaModifier;
    const/4 v4, 0x0

    invoke-virtual {v0, v4}, Lorg/anddev/andengine/entity/shape/modifier/AlphaModifier;->setRemoveWhenFinished(Z)V

    .line 77
    invoke-virtual {p1, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lorg/anddev/andengine/entity/scene/menu/item/IMenuItem;

    invoke-interface {v4, v0}, Lorg/anddev/andengine/entity/scene/menu/item/IMenuItem;->addShapeModifier(Lorg/anddev/andengine/util/modifier/IModifier;)V

    .line 74
    add-int/lit8 v2, v2, -0x1

    goto :goto_0
.end method

.method public prepareAnimations(Ljava/util/ArrayList;FF)V
    .locals 12
    .parameter
    .parameter "pCameraWidth"
    .parameter "pCameraHeight"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList",
            "<",
            "Lorg/anddev/andengine/entity/scene/menu/item/IMenuItem;",
            ">;FF)V"
        }
    .end annotation

    .prologue
    .line 83
    .local p1, pMenuItems:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lorg/anddev/andengine/entity/scene/menu/item/IMenuItem;>;"
    invoke-virtual {p0, p1}, Lorg/anddev/andengine/entity/scene/menu/animator/AlphaMenuAnimator;->getMaximumWidth(Ljava/util/ArrayList;)F

    move-result v3

    .line 84
    .local v3, maximumWidth:F
    invoke-virtual {p0, p1}, Lorg/anddev/andengine/entity/scene/menu/animator/AlphaMenuAnimator;->getOverallHeight(Ljava/util/ArrayList;)F

    move-result v9

    .line 86
    .local v9, overallHeight:F
    sub-float v10, p2, v3

    const/high16 v11, 0x3f00

    mul-float v0, v10, v11

    .line 87
    .local v0, baseX:F
    sub-float v10, p3, v9

    const/high16 v11, 0x3f00

    mul-float v1, v10, v11

    .line 89
    .local v1, baseY:F
    iget v6, p0, Lorg/anddev/andengine/entity/scene/menu/animator/AlphaMenuAnimator;->mMenuItemSpacing:F

    .line 91
    .local v6, menuItemSpacing:F
    const/4 v8, 0x0

    .line 92
    .local v8, offsetY:F
    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result v5

    .line 93
    .local v5, menuItemCount:I
    const/4 v2, 0x0

    .local v2, i:I
    :goto_0
    if-lt v2, v5, :cond_0

    .line 115
    return-void

    .line 94
    :cond_0
    invoke-virtual {p1, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lorg/anddev/andengine/entity/scene/menu/item/IMenuItem;

    .line 97
    .local v4, menuItem:Lorg/anddev/andengine/entity/scene/menu/item/IMenuItem;
    invoke-static {}, Lorg/anddev/andengine/entity/scene/menu/animator/AlphaMenuAnimator;->$SWITCH_TABLE$org$anddev$andengine$util$HorizontalAlign()[I

    move-result-object v10

    iget-object v11, p0, Lorg/anddev/andengine/entity/scene/menu/animator/AlphaMenuAnimator;->mHorizontalAlign:Lorg/anddev/andengine/util/HorizontalAlign;

    invoke-virtual {v11}, Lorg/anddev/andengine/util/HorizontalAlign;->ordinal()I

    move-result v11

    aget v10, v10, v11

    packed-switch v10, :pswitch_data_0

    .line 106
    :pswitch_0
    invoke-interface {v4}, Lorg/anddev/andengine/entity/scene/menu/item/IMenuItem;->getWidthScaled()F

    move-result v10

    sub-float v10, v3, v10

    const/high16 v11, 0x3f00

    mul-float v7, v10, v11

    .line 109
    .local v7, offsetX:F
    :goto_1
    add-float v10, v0, v7

    add-float v11, v1, v8

    invoke-interface {v4, v10, v11}, Lorg/anddev/andengine/entity/scene/menu/item/IMenuItem;->setPosition(FF)V

    .line 111
    const/4 v10, 0x0

    invoke-interface {v4, v10}, Lorg/anddev/andengine/entity/scene/menu/item/IMenuItem;->setAlpha(F)V

    .line 113
    invoke-interface {v4}, Lorg/anddev/andengine/entity/scene/menu/item/IMenuItem;->getHeight()F

    move-result v10

    add-float/2addr v10, v6

    add-float/2addr v8, v10

    .line 93
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 99
    .end local v7           #offsetX:F
    :pswitch_1
    const/4 v7, 0x0

    .line 100
    .restart local v7       #offsetX:F
    goto :goto_1

    .line 102
    .end local v7           #offsetX:F
    :pswitch_2
    invoke-interface {v4}, Lorg/anddev/andengine/entity/scene/menu/item/IMenuItem;->getWidthScaled()F

    move-result v10

    sub-float v7, v3, v10

    .line 103
    .restart local v7       #offsetX:F
    goto :goto_1

    .line 97
    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_1
        :pswitch_0
        :pswitch_2
    .end packed-switch
.end method
