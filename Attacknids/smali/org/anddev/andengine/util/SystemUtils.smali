.class public Lorg/anddev/andengine/util/SystemUtils;
.super Ljava/lang/Object;
.source "SystemUtils.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/anddev/andengine/util/SystemUtils$SystemUtilsException;
    }
.end annotation


# static fields
.field private static final BOGOMIPS_PATTERN:Ljava/lang/String; = "BogoMIPS[\\s]*:[\\s]*(\\d+\\.\\d+)[\\s]*\n"

.field private static final MEMFREE_PATTERN:Ljava/lang/String; = "MemFree[\\s]*:[\\s]*(\\d+)[\\s]*kB\n"

.field private static final MEMTOTAL_PATTERN:Ljava/lang/String; = "MemTotal[\\s]*:[\\s]*(\\d+)[\\s]*kB\n"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 14
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static getCPUBogoMips()F
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/anddev/andengine/util/SystemUtils$SystemUtilsException;
        }
    .end annotation

    .prologue
    .line 52
    const-string v2, "/proc/cpuinfo"

    const-string v3, "BogoMIPS[\\s]*:[\\s]*(\\d+\\.\\d+)[\\s]*\n"

    const/16 v4, 0x3e8

    invoke-static {v2, v3, v4}, Lorg/anddev/andengine/util/SystemUtils;->matchSystemFile(Ljava/lang/String;Ljava/lang/String;I)Ljava/util/regex/MatchResult;

    move-result-object v1

    .line 55
    .local v1, matchResult:Ljava/util/regex/MatchResult;
    :try_start_0
    invoke-interface {v1}, Ljava/util/regex/MatchResult;->groupCount()I

    move-result v2

    if-lez v2, :cond_0

    .line 56
    const/4 v2, 0x1

    invoke-interface {v1, v2}, Ljava/util/regex/MatchResult;->group(I)Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Ljava/lang/Float;->parseFloat(Ljava/lang/String;)F

    move-result v2

    return v2

    .line 58
    :cond_0
    new-instance v2, Lorg/anddev/andengine/util/SystemUtils$SystemUtilsException;

    invoke-direct {v2}, Lorg/anddev/andengine/util/SystemUtils$SystemUtilsException;-><init>()V

    throw v2
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    .line 60
    :catch_0
    move-exception v0

    .line 61
    .local v0, e:Ljava/lang/NumberFormatException;
    new-instance v2, Lorg/anddev/andengine/util/SystemUtils$SystemUtilsException;

    invoke-direct {v2, v0}, Lorg/anddev/andengine/util/SystemUtils$SystemUtilsException;-><init>(Ljava/lang/Throwable;)V

    throw v2
.end method

.method public static getCPUFrequencyCurrent()I
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/anddev/andengine/util/SystemUtils$SystemUtilsException;
        }
    .end annotation

    .prologue
    .line 106
    const-string v0, "/sys/devices/system/cpu/cpu0/cpufreq/scaling_cur_freq"

    invoke-static {v0}, Lorg/anddev/andengine/util/SystemUtils;->readSystemFileAsInt(Ljava/lang/String;)I

    move-result v0

    return v0
.end method

.method public static getCPUFrequencyMax()I
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/anddev/andengine/util/SystemUtils$SystemUtilsException;
        }
    .end annotation

    .prologue
    .line 122
    const-string v0, "/sys/devices/system/cpu/cpu0/cpufreq/cpuinfo_max_freq"

    invoke-static {v0}, Lorg/anddev/andengine/util/SystemUtils;->readSystemFileAsInt(Ljava/lang/String;)I

    move-result v0

    return v0
.end method

.method public static getCPUFrequencyMaxScaling()I
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/anddev/andengine/util/SystemUtils$SystemUtilsException;
        }
    .end annotation

    .prologue
    .line 138
    const-string v0, "/sys/devices/system/cpu/cpu0/cpufreq/scaling_max_freq"

    invoke-static {v0}, Lorg/anddev/andengine/util/SystemUtils;->readSystemFileAsInt(Ljava/lang/String;)I

    move-result v0

    return v0
.end method

.method public static getCPUFrequencyMin()I
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/anddev/andengine/util/SystemUtils$SystemUtilsException;
        }
    .end annotation

    .prologue
    .line 114
    const-string v0, "/sys/devices/system/cpu/cpu0/cpufreq/cpuinfo_min_freq"

    invoke-static {v0}, Lorg/anddev/andengine/util/SystemUtils;->readSystemFileAsInt(Ljava/lang/String;)I

    move-result v0

    return v0
.end method

.method public static getCPUFrequencyMinScaling()I
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/anddev/andengine/util/SystemUtils$SystemUtilsException;
        }
    .end annotation

    .prologue
    .line 130
    const-string v0, "/sys/devices/system/cpu/cpu0/cpufreq/scaling_min_freq"

    invoke-static {v0}, Lorg/anddev/andengine/util/SystemUtils;->readSystemFileAsInt(Ljava/lang/String;)I

    move-result v0

    return v0
.end method

.method public static getMemoryFree()I
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/anddev/andengine/util/SystemUtils$SystemUtilsException;
        }
    .end annotation

    .prologue
    .line 88
    const-string v2, "/proc/meminfo"

    const-string v3, "MemFree[\\s]*:[\\s]*(\\d+)[\\s]*kB\n"

    const/16 v4, 0x3e8

    invoke-static {v2, v3, v4}, Lorg/anddev/andengine/util/SystemUtils;->matchSystemFile(Ljava/lang/String;Ljava/lang/String;I)Ljava/util/regex/MatchResult;

    move-result-object v1

    .line 91
    .local v1, matchResult:Ljava/util/regex/MatchResult;
    :try_start_0
    invoke-interface {v1}, Ljava/util/regex/MatchResult;->groupCount()I

    move-result v2

    if-lez v2, :cond_0

    .line 92
    const/4 v2, 0x1

    invoke-interface {v1, v2}, Ljava/util/regex/MatchResult;->group(I)Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v2

    return v2

    .line 94
    :cond_0
    new-instance v2, Lorg/anddev/andengine/util/SystemUtils$SystemUtilsException;

    invoke-direct {v2}, Lorg/anddev/andengine/util/SystemUtils$SystemUtilsException;-><init>()V

    throw v2
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    .line 96
    :catch_0
    move-exception v0

    .line 97
    .local v0, e:Ljava/lang/NumberFormatException;
    new-instance v2, Lorg/anddev/andengine/util/SystemUtils$SystemUtilsException;

    invoke-direct {v2, v0}, Lorg/anddev/andengine/util/SystemUtils$SystemUtilsException;-><init>(Ljava/lang/Throwable;)V

    throw v2
.end method

.method public static getMemoryTotal()I
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/anddev/andengine/util/SystemUtils$SystemUtilsException;
        }
    .end annotation

    .prologue
    .line 70
    const-string v2, "/proc/meminfo"

    const-string v3, "MemTotal[\\s]*:[\\s]*(\\d+)[\\s]*kB\n"

    const/16 v4, 0x3e8

    invoke-static {v2, v3, v4}, Lorg/anddev/andengine/util/SystemUtils;->matchSystemFile(Ljava/lang/String;Ljava/lang/String;I)Ljava/util/regex/MatchResult;

    move-result-object v1

    .line 73
    .local v1, matchResult:Ljava/util/regex/MatchResult;
    :try_start_0
    invoke-interface {v1}, Ljava/util/regex/MatchResult;->groupCount()I

    move-result v2

    if-lez v2, :cond_0

    .line 74
    const/4 v2, 0x1

    invoke-interface {v1, v2}, Ljava/util/regex/MatchResult;->group(I)Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v2

    return v2

    .line 76
    :cond_0
    new-instance v2, Lorg/anddev/andengine/util/SystemUtils$SystemUtilsException;

    invoke-direct {v2}, Lorg/anddev/andengine/util/SystemUtils$SystemUtilsException;-><init>()V

    throw v2
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    .line 78
    :catch_0
    move-exception v0

    .line 79
    .local v0, e:Ljava/lang/NumberFormatException;
    new-instance v2, Lorg/anddev/andengine/util/SystemUtils$SystemUtilsException;

    invoke-direct {v2, v0}, Lorg/anddev/andengine/util/SystemUtils$SystemUtilsException;-><init>(Ljava/lang/Throwable;)V

    throw v2
.end method

.method public static isAndroidVersionOrHigher(I)Z
    .locals 1
    .parameter "pBuildVersionCode"

    .prologue
    .line 48
    sget-object v0, Landroid/os/Build$VERSION;->SDK:Ljava/lang/String;

    invoke-static {v0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v0

    if-lt v0, p0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private static matchSystemFile(Ljava/lang/String;Ljava/lang/String;I)Ljava/util/regex/MatchResult;
    .locals 10
    .parameter "pSystemFile"
    .parameter "pPattern"
    .parameter "pHorizon"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/anddev/andengine/util/SystemUtils$SystemUtilsException;
        }
    .end annotation

    .prologue
    const/4 v2, 0x1

    const/4 v5, 0x0

    .line 142
    const/4 v1, 0x0

    .line 144
    .local v1, in:Ljava/io/InputStream;
    :try_start_0
    new-instance v6, Ljava/lang/ProcessBuilder;

    const/4 v7, 0x2

    new-array v7, v7, [Ljava/lang/String;

    const/4 v8, 0x0

    const-string v9, "/system/bin/cat"

    aput-object v9, v7, v8

    const/4 v8, 0x1

    aput-object p0, v7, v8

    invoke-direct {v6, v7}, Ljava/lang/ProcessBuilder;-><init>([Ljava/lang/String;)V

    invoke-virtual {v6}, Ljava/lang/ProcessBuilder;->start()Ljava/lang/Process;

    move-result-object v3

    .line 146
    .local v3, process:Ljava/lang/Process;
    invoke-virtual {v3}, Ljava/lang/Process;->getInputStream()Ljava/io/InputStream;

    move-result-object v1

    .line 147
    new-instance v4, Ljava/util/Scanner;

    invoke-direct {v4, v1}, Ljava/util/Scanner;-><init>(Ljava/io/InputStream;)V

    .line 149
    .local v4, scanner:Ljava/util/Scanner;
    invoke-virtual {v4, p1, p2}, Ljava/util/Scanner;->findWithinHorizon(Ljava/lang/String;I)Ljava/lang/String;

    move-result-object v6

    if-eqz v6, :cond_0

    .line 150
    .local v2, matchFound:Z
    :goto_0
    if-eqz v2, :cond_1

    .line 151
    invoke-virtual {v4}, Ljava/util/Scanner;->match()Ljava/util/regex/MatchResult;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v5

    .line 158
    invoke-static {v1}, Lorg/anddev/andengine/util/StreamUtils;->closeStream(Ljava/io/Closeable;)V

    .line 151
    return-object v5

    .end local v2           #matchFound:Z
    :cond_0
    move v2, v5

    .line 149
    goto :goto_0

    .line 153
    .restart local v2       #matchFound:Z
    :cond_1
    :try_start_1
    new-instance v5, Lorg/anddev/andengine/util/SystemUtils$SystemUtilsException;

    invoke-direct {v5}, Lorg/anddev/andengine/util/SystemUtils$SystemUtilsException;-><init>()V

    throw v5
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0

    .line 155
    .end local v2           #matchFound:Z
    .end local v3           #process:Ljava/lang/Process;
    .end local v4           #scanner:Ljava/util/Scanner;
    :catch_0
    move-exception v0

    .line 156
    .local v0, e:Ljava/io/IOException;
    :try_start_2
    new-instance v5, Lorg/anddev/andengine/util/SystemUtils$SystemUtilsException;

    invoke-direct {v5, v0}, Lorg/anddev/andengine/util/SystemUtils$SystemUtilsException;-><init>(Ljava/lang/Throwable;)V

    throw v5
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 157
    .end local v0           #e:Ljava/io/IOException;
    :catchall_0
    move-exception v5

    .line 158
    invoke-static {v1}, Lorg/anddev/andengine/util/StreamUtils;->closeStream(Ljava/io/Closeable;)V

    .line 159
    throw v5
.end method

.method private static readSystemFileAsInt(Ljava/lang/String;)I
    .locals 8
    .parameter "pSystemFile"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/anddev/andengine/util/SystemUtils$SystemUtilsException;
        }
    .end annotation

    .prologue
    .line 163
    const/4 v2, 0x0

    .line 165
    .local v2, in:Ljava/io/InputStream;
    :try_start_0
    new-instance v4, Ljava/lang/ProcessBuilder;

    const/4 v5, 0x2

    new-array v5, v5, [Ljava/lang/String;

    const/4 v6, 0x0

    const-string v7, "/system/bin/cat"

    aput-object v7, v5, v6

    const/4 v6, 0x1

    aput-object p0, v5, v6

    invoke-direct {v4, v5}, Ljava/lang/ProcessBuilder;-><init>([Ljava/lang/String;)V

    invoke-virtual {v4}, Ljava/lang/ProcessBuilder;->start()Ljava/lang/Process;

    move-result-object v3

    .line 167
    .local v3, process:Ljava/lang/Process;
    invoke-virtual {v3}, Ljava/lang/Process;->getInputStream()Ljava/io/InputStream;

    move-result-object v2

    .line 168
    invoke-static {v2}, Lorg/anddev/andengine/util/StreamUtils;->readFully(Ljava/io/InputStream;)Ljava/lang/String;

    move-result-object v0

    .line 169
    .local v0, content:Ljava/lang/String;
    invoke-static {v0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_1

    move-result v4

    .line 175
    invoke-static {v2}, Lorg/anddev/andengine/util/StreamUtils;->closeStream(Ljava/io/Closeable;)V

    .line 169
    return v4

    .line 170
    .end local v0           #content:Ljava/lang/String;
    .end local v3           #process:Ljava/lang/Process;
    :catch_0
    move-exception v1

    .line 171
    .local v1, e:Ljava/io/IOException;
    :try_start_1
    new-instance v4, Lorg/anddev/andengine/util/SystemUtils$SystemUtilsException;

    invoke-direct {v4, v1}, Lorg/anddev/andengine/util/SystemUtils$SystemUtilsException;-><init>(Ljava/lang/Throwable;)V

    throw v4
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 174
    .end local v1           #e:Ljava/io/IOException;
    :catchall_0
    move-exception v4

    .line 175
    invoke-static {v2}, Lorg/anddev/andengine/util/StreamUtils;->closeStream(Ljava/io/Closeable;)V

    .line 176
    throw v4

    .line 172
    :catch_1
    move-exception v1

    .line 173
    .local v1, e:Ljava/lang/NumberFormatException;
    :try_start_2
    new-instance v4, Lorg/anddev/andengine/util/SystemUtils$SystemUtilsException;

    invoke-direct {v4, v1}, Lorg/anddev/andengine/util/SystemUtils$SystemUtilsException;-><init>(Ljava/lang/Throwable;)V

    throw v4
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0
.end method
