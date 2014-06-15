package org.anddev.andengine.opengl.texture.source;

import android.graphics.*;

public interface ITextureSource extends Cloneable
{
    ITextureSource clone();
    
    int getHeight();
    
    int getWidth();
    
    Bitmap onLoadBitmap();
}
