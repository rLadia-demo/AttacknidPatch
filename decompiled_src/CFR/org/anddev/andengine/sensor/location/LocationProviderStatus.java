/*
 * Decompiled with CFR 0_79.
 */
package org.anddev.andengine.sensor.location;

public final class LocationProviderStatus
extends Enum<LocationProviderStatus> {
    public static final /* enum */ LocationProviderStatus AVAILABLE = new LocationProviderStatus("AVAILABLE", 0);
    private static final /* synthetic */ LocationProviderStatus[] ENUM$VALUES;
    public static final /* enum */ LocationProviderStatus OUT_OF_SERVICE = new LocationProviderStatus("OUT_OF_SERVICE", 1);
    public static final /* enum */ LocationProviderStatus TEMPORARILY_UNAVAILABLE = new LocationProviderStatus("TEMPORARILY_UNAVAILABLE", 2);

    static {
        LocationProviderStatus[] arrlocationProviderStatus = new LocationProviderStatus[]{LocationProviderStatus.AVAILABLE, LocationProviderStatus.OUT_OF_SERVICE, LocationProviderStatus.TEMPORARILY_UNAVAILABLE};
        LocationProviderStatus.ENUM$VALUES = arrlocationProviderStatus;
    }

    private LocationProviderStatus(String string22, int string22) {
        super(string, n);
    }

    public static LocationProviderStatus valueOf(String string) {
        return (LocationProviderStatus)Enum.valueOf(LocationProviderStatus.class, string);
    }

    public static LocationProviderStatus[] values() {
        LocationProviderStatus[] arrlocationProviderStatus = LocationProviderStatus.ENUM$VALUES;
        int n = arrlocationProviderStatus.length;
        LocationProviderStatus[] arrlocationProviderStatus2 = new LocationProviderStatus[n];
        System.arraycopy(arrlocationProviderStatus, 0, arrlocationProviderStatus2, 0, n);
        return arrlocationProviderStatus2;
    }
}

