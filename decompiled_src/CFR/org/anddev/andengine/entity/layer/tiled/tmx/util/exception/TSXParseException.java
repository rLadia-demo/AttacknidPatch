/*
 * Decompiled with CFR 0_79.
 */
package org.anddev.andengine.entity.layer.tiled.tmx.util.exception;

import org.xml.sax.SAXException;

public class TSXParseException
extends SAXException {
    private static final long serialVersionUID = -7598783248970268198L;

    public TSXParseException() {
    }

    public TSXParseException(Exception exception) {
        super(exception);
    }

    public TSXParseException(String string) {
        super(string);
    }

    public TSXParseException(String string, Exception exception) {
        super(string, exception);
    }
}

