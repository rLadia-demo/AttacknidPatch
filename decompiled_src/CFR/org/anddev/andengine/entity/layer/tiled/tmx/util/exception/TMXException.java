/*
 * Decompiled with CFR 0_79.
 */
package org.anddev.andengine.entity.layer.tiled.tmx.util.exception;

public abstract class TMXException
extends Exception {
    private static final long serialVersionUID = 337819550394833109L;

    public TMXException() {
    }

    public TMXException(String string) {
        super(string);
    }

    public TMXException(String string, Throwable throwable) {
        super(string, throwable);
    }

    public TMXException(Throwable throwable) {
        super(throwable);
    }
}

