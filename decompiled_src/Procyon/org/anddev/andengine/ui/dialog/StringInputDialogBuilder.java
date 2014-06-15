package org.anddev.andengine.ui.dialog;

import org.anddev.andengine.util.*;
import android.content.*;

public class StringInputDialogBuilder extends GenericInputDialogBuilder<String>
{
    public StringInputDialogBuilder(final Context context, final int n, final int n2, final int n3, final int n4, final String s, final Callback<String> callback, final DialogInterface$OnCancelListener dialogInterface$OnCancelListener) {
        super(context, n, n2, n3, n4, s, callback, dialogInterface$OnCancelListener);
    }
    
    public StringInputDialogBuilder(final Context context, final int n, final int n2, final int n3, final int n4, final Callback<String> callback, final DialogInterface$OnCancelListener dialogInterface$OnCancelListener) {
        super(context, n, n2, n3, n4, callback, dialogInterface$OnCancelListener);
    }
    
    @Override
    protected String generateResult(final String s) {
        return s;
    }
}
