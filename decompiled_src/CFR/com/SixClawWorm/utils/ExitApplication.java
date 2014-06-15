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
 */
package com.SixClawWorm.utils;

import android.app.Activity;
import android.app.AlertDialog;
import android.content.Context;
import android.content.DialogInterface;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

public class ExitApplication {
    private static ExitApplication exitApplication;
    private List<Activity> listActivity = new ArrayList<Activity>();

    private ExitApplication() {
    }

    public static ExitApplication getInstance() {
        if (ExitApplication.exitApplication != null) return ExitApplication.exitApplication;
        ExitApplication.exitApplication = new ExitApplication();
        return ExitApplication.exitApplication;
    }

    public void addActivity(Activity activity) {
        this.listActivity.add(activity);
    }

    public void exit(Context context) {
        new AlertDialog.Builder(context).setTitle((CharSequence)"Are you sure?").setMessage((CharSequence)"Are you sure to quit the game?").setPositiveButton((CharSequence)"sure", (DialogInterface.OnClickListener)new DialogInterface.OnClickListener(){

            public void onClick(DialogInterface dialogInterface, int n) {
                Iterator iterator = ExitApplication.this.listActivity.iterator();
                do {
                    if (!iterator.hasNext()) {
                        System.exit(0);
                        return;
                    }
                    ((Activity)iterator.next()).finish();
                } while (true);
            }
        }).setNegativeButton((CharSequence)"cancel", (DialogInterface.OnClickListener)new DialogInterface.OnClickListener(){

            public void onClick(DialogInterface dialogInterface2, int dialogInterface2) {
            }
        }).create().show();
    }

}

