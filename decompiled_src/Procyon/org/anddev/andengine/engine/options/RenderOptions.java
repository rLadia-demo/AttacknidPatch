package org.anddev.andengine.engine.options;

public class RenderOptions
{
    private boolean mDisableExtensionVertexBufferObjects;
    
    public RenderOptions() {
        super();
        this.mDisableExtensionVertexBufferObjects = false;
    }
    
    public RenderOptions disableExtensionVertexBufferObjects() {
        return this.setDisableExtensionVertexBufferObjects(true);
    }
    
    public RenderOptions enableExtensionVertexBufferObjects() {
        return this.setDisableExtensionVertexBufferObjects(false);
    }
    
    public boolean isDisableExtensionVertexBufferObjects() {
        return this.mDisableExtensionVertexBufferObjects;
    }
    
    public RenderOptions setDisableExtensionVertexBufferObjects(final boolean mDisableExtensionVertexBufferObjects) {
        this.mDisableExtensionVertexBufferObjects = mDisableExtensionVertexBufferObjects;
        return this;
    }
}
