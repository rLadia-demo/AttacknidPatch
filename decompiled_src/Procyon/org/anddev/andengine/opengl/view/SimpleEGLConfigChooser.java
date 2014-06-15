package org.anddev.andengine.opengl.view;

class SimpleEGLConfigChooser extends ComponentSizeChooser
{
    public SimpleEGLConfigChooser(final boolean b) {
        int n;
        if (b) {
            n = 16;
        }
        else {
            n = 0;
        }
        super(4, 4, 4, 0, n, 0);
        this.mRedSize = 5;
        this.mGreenSize = 6;
        this.mBlueSize = 5;
    }
}
