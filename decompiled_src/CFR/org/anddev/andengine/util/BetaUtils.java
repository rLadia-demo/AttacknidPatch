/*
 * Decompiled with CFR 0_79.
 * 
 * Could not load the following classes:
 *  android.app.Activity
 *  android.app.AlertDialog
 *  android.app.AlertDialog$Builder
 *  android.content.Context
 *  android.content.DialogInterface
 *  android.content.DialogInterface$OnClickListener
 *  android.content.Intent
 *  android.content.SharedPreferences
 *  android.content.SharedPreferences$Editor
 */
package org.anddev.andengine.util;

import android.app.Activity;
import android.app.AlertDialog;
import android.content.Context;
import android.content.DialogInterface;
import android.content.Intent;
import android.content.SharedPreferences;
import java.util.GregorianCalendar;
import org.anddev.andengine.util.SimplePreferences;
import org.anddev.andengine.util.constants.Constants;

public class BetaUtils
implements Constants {
    private static final String PREFERENCES_BETAUTILS_ID = "preferences.betautils.lastuse";

    public static boolean finishWhenExpired(Activity activity, GregorianCalendar gregorianCalendar, int n, int n2) {
        return BetaUtils.finishWhenExpired(activity, gregorianCalendar, n, n2, null, null);
    }

    public static boolean finishWhenExpired(Activity activity, GregorianCalendar gregorianCalendar, int n, int n2, Intent intent, Intent intent2) {
        SharedPreferences sharedPreferences = SimplePreferences.getInstance((Context)activity);
        long l = Math.max(System.currentTimeMillis(), sharedPreferences.getLong("preferences.betautils.lastuse", -1));
        sharedPreferences.edit().putLong("preferences.betautils.lastuse", l).commit();
        GregorianCalendar gregorianCalendar2 = new GregorianCalendar();
        gregorianCalendar2.setTimeInMillis(l);
        if (!gregorianCalendar2.after((Object)gregorianCalendar)) return false;
        AlertDialog.Builder builder = new AlertDialog.Builder((Context)activity).setTitle(n).setIcon(17301543).setMessage(n2);
        builder.setPositiveButton(17039370, (DialogInterface.OnClickListener)new DialogInterface.OnClickListener(intent, activity){
            private final /* synthetic */ Activity val$pActivity;
            private final /* synthetic */ Intent val$pOkIntent;

            public void onClick(DialogInterface dialogInterface2, int dialogInterface2) {
                if (this.val$pOkIntent != null) {
                    this.val$pActivity.startActivity(this.val$pOkIntent);
                }
                this.val$pActivity.finish();
            }
        });
        builder.setNegativeButton(17039360, (DialogInterface.OnClickListener)new DialogInterface.OnClickListener(intent2, activity){
            private final /* synthetic */ Activity val$pActivity;
            private final /* synthetic */ Intent val$pCancelIntent;

            public void onClick(DialogInterface dialogInterface2, int dialogInterface2) {
                if (this.val$pCancelIntent != null) {
                    this.val$pActivity.startActivity(this.val$pCancelIntent);
                }
                this.val$pActivity.finish();
            }
        }).create().show();
        return true;
    }

}

