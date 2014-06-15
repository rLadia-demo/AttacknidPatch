package org.anddev.andengine.util;

import org.anddev.andengine.util.constants.*;
import java.util.*;
import android.app.*;
import android.content.*;

public class BetaUtils implements Constants
{
    private static final String PREFERENCES_BETAUTILS_ID = "preferences.betautils.lastuse";
    
    public static boolean finishWhenExpired(final Activity activity, final GregorianCalendar gregorianCalendar, final int n, final int n2) {
        return finishWhenExpired(activity, gregorianCalendar, n, n2, null, null);
    }
    
    public static boolean finishWhenExpired(final Activity activity, final GregorianCalendar gregorianCalendar, final int title, final int message, final Intent intent, final Intent intent2) {
        final SharedPreferences instance = SimplePreferences.getInstance((Context)activity);
        final long max = Math.max(System.currentTimeMillis(), instance.getLong("preferences.betautils.lastuse", -1L));
        instance.edit().putLong("preferences.betautils.lastuse", max).commit();
        final GregorianCalendar gregorianCalendar2 = new GregorianCalendar();
        gregorianCalendar2.setTimeInMillis(max);
        if (gregorianCalendar2.after(gregorianCalendar)) {
            final AlertDialog$Builder setMessage = new AlertDialog$Builder((Context)activity).setTitle(title).setIcon(17301543).setMessage(message);
            setMessage.setPositiveButton(17039370, (DialogInterface$OnClickListener)new DialogInterface$OnClickListener() {
                public void onClick(final DialogInterface dialogInterface, final int n) {
                    if (intent != null) {
                        activity.startActivity(intent);
                    }
                    activity.finish();
                }
            });
            setMessage.setNegativeButton(17039360, (DialogInterface$OnClickListener)new DialogInterface$OnClickListener() {
                public void onClick(final DialogInterface dialogInterface, final int n) {
                    if (intent2 != null) {
                        activity.startActivity(intent2);
                    }
                    activity.finish();
                }
            }).create().show();
            return true;
        }
        return false;
    }
}
