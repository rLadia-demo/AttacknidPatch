/*
 * Decompiled with CFR 0_79.
 * 
 * Could not load the following classes:
 *  android.location.Location
 *  android.os.Bundle
 */
package org.anddev.andengine.sensor.location;

import android.location.Location;
import android.os.Bundle;
import org.anddev.andengine.sensor.location.LocationProviderStatus;

public interface ILocationListener {
    public void onLocationChanged(Location var1);

    public void onLocationLost();

    public void onLocationProviderDisabled();

    public void onLocationProviderEnabled();

    public void onLocationProviderStatusChanged(LocationProviderStatus var1, Bundle var2);
}

