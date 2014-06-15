/*
 * Decompiled with CFR 0_79.
 * 
 * Could not load the following classes:
 *  org.anddev.progressmonitor.IProgressListener
 */
package org.anddev.andengine.util;

import org.anddev.progressmonitor.IProgressListener;

public interface ProgressCallable<T> {
    public T call(IProgressListener var1) throws Exception;
}

