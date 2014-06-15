/*
 * Decompiled with CFR 0_79.
 */
package org.anddev.andengine.opengl.view;

import org.anddev.andengine.opengl.view.ComponentSizeChooser;

class SimpleEGLConfigChooser
extends ComponentSizeChooser {
    /*
     * Enabled aggressive block sorting
     */
    public SimpleEGLConfigChooser(boolean bl) {
        int n = bl ? 16 : 0;
        super(4, 4, 4, 0, n, 0);
        this.mRedSize = 5;
        this.mGreenSize = 6;
        this.mBlueSize = 5;
    }
}

