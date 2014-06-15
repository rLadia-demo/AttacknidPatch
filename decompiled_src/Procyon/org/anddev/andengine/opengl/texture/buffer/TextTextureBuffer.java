package org.anddev.andengine.opengl.texture.buffer;

import org.anddev.andengine.opengl.buffer.*;
import org.anddev.andengine.opengl.util.*;
import org.anddev.andengine.opengl.font.*;

public class TextTextureBuffer extends BufferObject
{
    public TextTextureBuffer(final int n, final int n2) {
        super(n, n2);
    }
    
    public void update(final Font font, final String[] array) {
    Label_0060_Outer:
        while (true) {
            while (true) {
                while (true) {
                    int n = 0;
                    final int length2;
                    int n2 = 0;
                    Label_0202: {
                        synchronized (this) {
                            final FastFloatBuffer floatBuffer = this.getFloatBuffer();
                            floatBuffer.position(0);
                            final int length = array.length;
                            n = 0;
                            if (n >= length) {
                                floatBuffer.position(0);
                                this.setHardwareBufferNeedsUpdate();
                                return;
                            }
                            final String s = array[n];
                            length2 = s.length();
                            n2 = 0;
                            break Label_0202;
                            final Letter letter = font.getLetter(s.charAt(n2));
                            final float mTextureX = letter.mTextureX;
                            final float mTextureY = letter.mTextureY;
                            final float n3 = mTextureX + letter.mTextureWidth;
                            final float n4 = mTextureY + letter.mTextureHeight;
                            floatBuffer.put(mTextureX);
                            floatBuffer.put(mTextureY);
                            floatBuffer.put(mTextureX);
                            floatBuffer.put(n4);
                            floatBuffer.put(n3);
                            floatBuffer.put(n4);
                            floatBuffer.put(n3);
                            floatBuffer.put(n4);
                            floatBuffer.put(n3);
                            floatBuffer.put(mTextureY);
                            floatBuffer.put(mTextureX);
                            floatBuffer.put(mTextureY);
                            ++n2;
                        }
                    }
                    if (n2 >= length2) {
                        ++n;
                        continue Label_0060_Outer;
                    }
                    break;
                }
                continue;
            }
        }
    }
}
