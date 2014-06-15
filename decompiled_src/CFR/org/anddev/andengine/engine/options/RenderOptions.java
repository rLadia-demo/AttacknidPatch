/*
 * Decompiled with CFR 0_79.
 */
package org.anddev.andengine.engine.options;

public class RenderOptions {
    private boolean mDisableExtensionVertexBufferObjects = false;

    public RenderOptions disableExtensionVertexBufferObjects() {
        return this.setDisableExtensionVertexBufferObjects(true);
    }

    public RenderOptions enableExtensionVertexBufferObjects() {
        return this.setDisableExtensionVertexBufferObjects(false);
    }

    public boolean isDisableExtensionVertexBufferObjects() {
        return this.mDisableExtensionVertexBufferObjects;
    }

    public RenderOptions setDisableExtensionVertexBufferObjects(boolean bl) {
        this.mDisableExtensionVertexBufferObjects = bl;
        return this;
    }
}

