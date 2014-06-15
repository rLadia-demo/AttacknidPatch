/*
 * Decompiled with CFR 0_79.
 */
package org.anddev.andengine.entity.layer.tiled.tmx.util.exception;

import org.anddev.andengine.entity.layer.tiled.tmx.util.exception.TMXException;

public class TSXLoadException
extends TMXException {
    private static final long serialVersionUID = 10055223972707703L;

    public TSXLoadException() {
    }

    public TSXLoadException(String string) {
        super(string);
    }

    public TSXLoadException(String string, Throwable throwable) {
        super(string, throwable);
    }

    public TSXLoadException(Throwable throwable) {
        super(throwable);
    }
}

