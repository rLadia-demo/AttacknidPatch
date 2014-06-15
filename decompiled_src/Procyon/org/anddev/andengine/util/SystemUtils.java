package org.anddev.andengine.util;

import java.util.regex.*;
import android.os.*;
import java.util.*;
import java.io.*;

public class SystemUtils
{
    private static final String BOGOMIPS_PATTERN = "BogoMIPS[\\s]*:[\\s]*(\\d+\\.\\d+)[\\s]*\n";
    private static final String MEMFREE_PATTERN = "MemFree[\\s]*:[\\s]*(\\d+)[\\s]*kB\n";
    private static final String MEMTOTAL_PATTERN = "MemTotal[\\s]*:[\\s]*(\\d+)[\\s]*kB\n";
    
    public static float getCPUBogoMips() throws SystemUtilsException {
        final MatchResult matchSystemFile = matchSystemFile("/proc/cpuinfo", "BogoMIPS[\\s]*:[\\s]*(\\d+\\.\\d+)[\\s]*\n", 1000);
        try {
            if (matchSystemFile.groupCount() > 0) {
                return Float.parseFloat(matchSystemFile.group(1));
            }
            throw new SystemUtilsException();
        }
        catch (NumberFormatException ex) {
            throw new SystemUtilsException(ex);
        }
    }
    
    public static int getCPUFrequencyCurrent() throws SystemUtilsException {
        return readSystemFileAsInt("/sys/devices/system/cpu/cpu0/cpufreq/scaling_cur_freq");
    }
    
    public static int getCPUFrequencyMax() throws SystemUtilsException {
        return readSystemFileAsInt("/sys/devices/system/cpu/cpu0/cpufreq/cpuinfo_max_freq");
    }
    
    public static int getCPUFrequencyMaxScaling() throws SystemUtilsException {
        return readSystemFileAsInt("/sys/devices/system/cpu/cpu0/cpufreq/scaling_max_freq");
    }
    
    public static int getCPUFrequencyMin() throws SystemUtilsException {
        return readSystemFileAsInt("/sys/devices/system/cpu/cpu0/cpufreq/cpuinfo_min_freq");
    }
    
    public static int getCPUFrequencyMinScaling() throws SystemUtilsException {
        return readSystemFileAsInt("/sys/devices/system/cpu/cpu0/cpufreq/scaling_min_freq");
    }
    
    public static int getMemoryFree() throws SystemUtilsException {
        final MatchResult matchSystemFile = matchSystemFile("/proc/meminfo", "MemFree[\\s]*:[\\s]*(\\d+)[\\s]*kB\n", 1000);
        try {
            if (matchSystemFile.groupCount() > 0) {
                return Integer.parseInt(matchSystemFile.group(1));
            }
            throw new SystemUtilsException();
        }
        catch (NumberFormatException ex) {
            throw new SystemUtilsException(ex);
        }
    }
    
    public static int getMemoryTotal() throws SystemUtilsException {
        final MatchResult matchSystemFile = matchSystemFile("/proc/meminfo", "MemTotal[\\s]*:[\\s]*(\\d+)[\\s]*kB\n", 1000);
        try {
            if (matchSystemFile.groupCount() > 0) {
                return Integer.parseInt(matchSystemFile.group(1));
            }
            throw new SystemUtilsException();
        }
        catch (NumberFormatException ex) {
            throw new SystemUtilsException(ex);
        }
    }
    
    public static boolean isAndroidVersionOrHigher(final int n) {
        return Integer.parseInt(Build$VERSION.SDK) >= n;
    }
    
    private static MatchResult matchSystemFile(final String s, final String s2, final int n) throws SystemUtilsException {
        int n2 = 1;
        InputStream inputStream = null;
        try {
            inputStream = new ProcessBuilder(new String[] { "/system/bin/cat", s }).start().getInputStream();
            final Scanner scanner = new Scanner(inputStream);
            if (scanner.findWithinHorizon(s2, n) == null) {
                n2 = 0;
            }
            if (n2 != 0) {
                return scanner.match();
            }
            throw new SystemUtilsException();
        }
        catch (IOException ex) {
            try {
                throw new SystemUtilsException(ex);
            }
            finally {
                StreamUtils.closeStream(inputStream);
            }
        }
    }
    
    private static int readSystemFileAsInt(final String s) throws SystemUtilsException {
        InputStream inputStream = null;
        try {
            inputStream = new ProcessBuilder(new String[] { "/system/bin/cat", s }).start().getInputStream();
            return Integer.parseInt(StreamUtils.readFully(inputStream));
        }
        catch (IOException ex) {
            throw new SystemUtilsException(ex);
        }
        catch (NumberFormatException ex2) {
            throw new SystemUtilsException(ex2);
        }
        finally {
            StreamUtils.closeStream(inputStream);
        }
    }
    
    public static class SystemUtilsException extends Exception
    {
        private static final long serialVersionUID = -7256483361095147596L;
        
        public SystemUtilsException() {
            super();
        }
        
        public SystemUtilsException(final Throwable t) {
            super(t);
        }
    }
}
