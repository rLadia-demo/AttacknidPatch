/*
 * Decompiled with CFR 0_79.
 */
package org.anddev.andengine.util;

import org.anddev.andengine.util.Callback;

public interface AsyncCallable<T> {
    public void call(Callback<T> var1, Callback<Exception> var2);
}

