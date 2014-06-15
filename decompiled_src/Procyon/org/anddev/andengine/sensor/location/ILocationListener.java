package org.anddev.andengine.sensor.location;

import android.location.*;
import android.os.*;

public interface ILocationListener
{
    void onLocationChanged(Location p0);
    
    void onLocationLost();
    
    void onLocationProviderDisabled();
    
    void onLocationProviderEnabled();
    
    void onLocationProviderStatusChanged(LocationProviderStatus p0, Bundle p1);
}
