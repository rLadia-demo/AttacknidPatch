package org.anddev.andengine.extension.input.touch.controller;

import java.lang.reflect.Method;

import org.anddev.andengine.util.SystemUtils;

import android.content.Context;
import android.content.pm.PackageManager;
import android.os.Build;

/**
 * @author Nicolas Gramlich
 * @since 16:00:38 - 14.07.2010
 */
public class MultiTouch {
	// ===========================================================
	// Constants
	// ===========================================================

	// ===========================================================
	// Fields
	// ===========================================================

	private static Boolean SUPPORTED = null;
	private static Boolean SUPPORTED_DISTINCT = null;

	// ===========================================================
	// Constructors
	// ===========================================================

	// ===========================================================
	// Getter & Setter
	// ===========================================================

	// ===========================================================
	// Methods for/from SuperClass/Interfaces
	// ===========================================================

	// ===========================================================
	// Methods
	// ===========================================================
	
	public static boolean isSupported(final Context pContext) {
		if(SUPPORTED == null) {
			SUPPORTED = SystemUtils.isAndroidVersionOrHigher(Build.VERSION_CODES.ECLAIR_MR1) && hasFeature(pContext, PackageManager.FEATURE_TOUCHSCREEN_MULTITOUCH);
		} 

		return SUPPORTED;
	}
	
	public static boolean isSupportedDistinct(final Context pContext) {
		if(SUPPORTED_DISTINCT == null) {
			SUPPORTED_DISTINCT = SystemUtils.isAndroidVersionOrHigher(Build.VERSION_CODES.ECLAIR_MR1) && hasFeature(pContext, PackageManager.FEATURE_TOUCHSCREEN_MULTITOUCH_DISTINCT);
		} 

		return SUPPORTED_DISTINCT;
	}

	private static boolean hasFeature(final Context pContext, final String pFeature) {
		try{
			final Method PackageManager_hasSystemFeatures = PackageManager.class.getMethod("hasSystemFeature",  new Class[]{String.class});
			return (PackageManager_hasSystemFeatures == null) ? false : (Boolean)PackageManager_hasSystemFeatures.invoke(pContext.getPackageManager(), pFeature);
		}catch(Throwable t) {
			return false;
		}
	}
	
	public static boolean isSupportedByAndroidVersion() {
		return SystemUtils.isAndroidVersionOrHigher(Build.VERSION_CODES.ECLAIR);
	}

	// ===========================================================
	// Inner and Anonymous Classes
	// ===========================================================
}
