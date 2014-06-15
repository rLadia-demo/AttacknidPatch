/*
 * Decompiled with CFR 0_79.
 * 
 * Could not load the following classes:
 *  android.os.Build
 *  android.os.Build$VERSION
 */
package org.anddev.andengine.util;

import android.os.Build;
import java.io.IOException;
import java.io.InputStream;
import java.util.Scanner;
import java.util.regex.MatchResult;
import org.anddev.andengine.util.StreamUtils;

public class SystemUtils {
    private static final String BOGOMIPS_PATTERN = "BogoMIPS[\\s]*:[\\s]*(\\d+\\.\\d+)[\\s]*\n";
    private static final String MEMFREE_PATTERN = "MemFree[\\s]*:[\\s]*(\\d+)[\\s]*kB\n";
    private static final String MEMTOTAL_PATTERN = "MemTotal[\\s]*:[\\s]*(\\d+)[\\s]*kB\n";

    public static float getCPUBogoMips() throws SystemUtilsException {
        MatchResult matchResult = SystemUtils.matchSystemFile("/proc/cpuinfo", "BogoMIPS[\\s]*:[\\s]*(\\d+\\.\\d+)[\\s]*\n", 1000);
        try {
            if (matchResult.groupCount() <= 0) throw new SystemUtilsException();
            return Float.parseFloat(matchResult.group(1));
        }
        catch (NumberFormatException var1_1) {
            throw new SystemUtilsException(var1_1);
        }
    }

    public static int getCPUFrequencyCurrent() throws SystemUtilsException {
        return SystemUtils.readSystemFileAsInt("/sys/devices/system/cpu/cpu0/cpufreq/scaling_cur_freq");
    }

    public static int getCPUFrequencyMax() throws SystemUtilsException {
        return SystemUtils.readSystemFileAsInt("/sys/devices/system/cpu/cpu0/cpufreq/cpuinfo_max_freq");
    }

    public static int getCPUFrequencyMaxScaling() throws SystemUtilsException {
        return SystemUtils.readSystemFileAsInt("/sys/devices/system/cpu/cpu0/cpufreq/scaling_max_freq");
    }

    public static int getCPUFrequencyMin() throws SystemUtilsException {
        return SystemUtils.readSystemFileAsInt("/sys/devices/system/cpu/cpu0/cpufreq/cpuinfo_min_freq");
    }

    public static int getCPUFrequencyMinScaling() throws SystemUtilsException {
        return SystemUtils.readSystemFileAsInt("/sys/devices/system/cpu/cpu0/cpufreq/scaling_min_freq");
    }

    public static int getMemoryFree() throws SystemUtilsException {
        MatchResult matchResult = SystemUtils.matchSystemFile("/proc/meminfo", "MemFree[\\s]*:[\\s]*(\\d+)[\\s]*kB\n", 1000);
        try {
            if (matchResult.groupCount() <= 0) throw new SystemUtilsException();
            return Integer.parseInt(matchResult.group(1));
        }
        catch (NumberFormatException var1_1) {
            throw new SystemUtilsException(var1_1);
        }
    }

    public static int getMemoryTotal() throws SystemUtilsException {
        MatchResult matchResult = SystemUtils.matchSystemFile("/proc/meminfo", "MemTotal[\\s]*:[\\s]*(\\d+)[\\s]*kB\n", 1000);
        try {
            if (matchResult.groupCount() <= 0) throw new SystemUtilsException();
            return Integer.parseInt(matchResult.group(1));
        }
        catch (NumberFormatException var1_1) {
            throw new SystemUtilsException(var1_1);
        }
    }

    public static boolean isAndroidVersionOrHigher(int n) {
        if (Integer.parseInt(Build.VERSION.SDK) < n) return false;
        return true;
    }

    /*
     * Enabled aggressive block sorting
     * Enabled unnecessary exception pruning
     */
    private static MatchResult matchSystemFile(String string, String string2, int n) throws SystemUtilsException {
        boolean bl = true;
        InputStream inputStream = null;
        try {
            inputStream = new ProcessBuilder("/system/bin/cat", string).start().getInputStream();
            Scanner scanner = new Scanner(inputStream);
            if (scanner.findWithinHorizon(string2, n) == null) {
                bl = false;
            }
            if (bl) {
                return scanner.match();
            }
            try {
                throw new SystemUtilsException();
            }
            catch (IOException var6_7) {
                throw new SystemUtilsException(var6_7);
            }
        }
        finally {
            StreamUtils.closeStream(inputStream);
        }
    }

    /*
     * Enabled aggressive block sorting
     * Enabled unnecessary exception pruning
     */
    private static int readSystemFileAsInt(String string) throws SystemUtilsException {
        InputStream inputStream = null;
        try {
            inputStream = new ProcessBuilder("/system/bin/cat", string).start().getInputStream();
            return Integer.parseInt(StreamUtils.readFully(inputStream));
        }
        catch (IOException var4_3) {
            throw new SystemUtilsException(var4_3);
        }
        catch (NumberFormatException var2_5) {
            throw new SystemUtilsException(var2_5);
        }
        finally {
            StreamUtils.closeStream(inputStream);
        }
    }

    public static class SystemUtilsException
    extends Exception {
        private static final long serialVersionUID = -7256483361095147596L;

        public SystemUtilsException() {
        }

        public SystemUtilsException(Throwable throwable) {
            super(throwable);
        }
    }

}

