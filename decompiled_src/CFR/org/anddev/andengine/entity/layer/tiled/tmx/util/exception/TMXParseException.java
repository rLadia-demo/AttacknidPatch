/*
 * Decompiled with CFR 0_79.
 */
package org.anddev.andengine.entity.layer.tiled.tmx.util.exception;

import org.xml.sax.SAXException;

public class TMXParseException
extends SAXException {
    private static final long serialVersionUID = 2213964295487921492L;

    public TMXParseException() {
    }

    public TMXParseException(Exception exception) {
        super(exception);
    }

    public TMXParseException(String string) {
        super(string);
    }

    public TMXParseException(String string, Exception exception) {
        super(string, exception);
    }
}

