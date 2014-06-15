/*
 * Decompiled with CFR 0_79.
 */
package org.anddev.andengine.entity.layer.tiled.tmx.util.exception;

import org.anddev.andengine.entity.layer.tiled.tmx.util.exception.TMXException;

public class TMXLoadException
extends TMXException {
    private static final long serialVersionUID = -8295358631698809883L;

    public TMXLoadException() {
    }

    public TMXLoadException(String string) {
        super(string);
    }

    public TMXLoadException(String string, Throwable throwable) {
        super(string, throwable);
    }

    public TMXLoadException(Throwable throwable) {
        super(throwable);
    }
}

