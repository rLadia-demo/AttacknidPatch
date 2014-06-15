.class public Lorg/anddev/andengine/util/ColorUtils;
.super Ljava/lang/Object;
.source "ColorUtils.java"


# static fields
.field private static final COLOR_FLOAT_TO_INT_FACTOR:I = 0xff

.field private static final HSV_TO_COLOR:[F = null

.field private static final HSV_TO_COLOR_HUE_INDEX:I = 0x0

.field private static final HSV_TO_COLOR_SATURATION_INDEX:I = 0x1

.field private static final HSV_TO_COLOR_VALUE_INDEX:I = 0x2


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 14
    const/4 v0, 0x3

    new-array v0, v0, [F

    sput-object v0, Lorg/anddev/andengine/util/ColorUtils;->HSV_TO_COLOR:[F

    .line 19
    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 9
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static HSVToColor(FFF)I
    .locals 2
    .parameter "pHue"
    .parameter "pSaturation"
    .parameter "pValue"

    .prologue
    .line 43
    sget-object v0, Lorg/anddev/andengine/util/ColorUtils;->HSV_TO_COLOR:[F

    const/4 v1, 0x0

    aput p0, v0, v1

    .line 44
    sget-object v0, Lorg/anddev/andengine/util/ColorUtils;->HSV_TO_COLOR:[F

    const/4 v1, 0x1

    aput p1, v0, v1

    .line 45
    sget-object v0, Lorg/anddev/andengine/util/ColorUtils;->HSV_TO_COLOR:[F

    const/4 v1, 0x2

    aput p2, v0, v1

    .line 46
    sget-object v0, Lorg/anddev/andengine/util/ColorUtils;->HSV_TO_COLOR:[F

    invoke-static {v0}, Landroid/graphics/Color;->HSVToColor([F)I

    move-result v0

    return v0
.end method

.method public static RGBToColor(FFF)I
    .locals 3
    .parameter "pRed"
    .parameter "pGreen"
    .parameter "pBlue"

    .prologue
    const/high16 v2, 0x437f

    .line 50
    mul-float v0, p0, v2

    float-to-int v0, v0

    mul-float v1, p1, v2

    float-to-int v1, v1

    mul-float/2addr v2, p2

    float-to-int v2, v2

    invoke-static {v0, v1, v2}, Landroid/graphics/Color;->rgb(III)I

    move-result v0

    return v0
.end method
