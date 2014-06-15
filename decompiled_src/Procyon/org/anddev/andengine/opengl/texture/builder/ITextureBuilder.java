package org.anddev.andengine.opengl.texture.builder;

import org.anddev.andengine.opengl.texture.*;
import java.util.*;

public interface ITextureBuilder
{
    void pack(BuildableTexture p0, ArrayList<BuildableTexture.TextureSourceWithWithLocationCallback> p1) throws TextureSourcePackingException;
    
    public static class TextureSourcePackingException extends Exception
    {
        private static final long serialVersionUID = 4700734424214372671L;
    }
}
