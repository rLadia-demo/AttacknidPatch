package org.anddev.andengine.util;

import android.content.*;
import android.view.*;

public class ViewUtils
{
    public static View inflate(final Context context, final int n) {
        return LayoutInflater.from(context).inflate(n, (ViewGroup)null);
    }
}
