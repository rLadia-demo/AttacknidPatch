package org.anddev.andengine.opengl.font;

class Size
{
    private float mHeight;
    private float mWidth;
    
    public Size() {
        this(0.0f, 0.0f);
    }
    
    public Size(final float width, final float height) {
        super();
        this.setWidth(width);
        this.setHeight(height);
    }
    
    public float getHeight() {
        return this.mHeight;
    }
    
    public float getWidth() {
        return this.mWidth;
    }
    
    public void set(final int n, final int n2) {
        this.setWidth(n);
        this.setHeight(n2);
    }
    
    public void setHeight(final float mHeight) {
        this.mHeight = mHeight;
    }
    
    public void setWidth(final float mWidth) {
        this.mWidth = mWidth;
    }
}
