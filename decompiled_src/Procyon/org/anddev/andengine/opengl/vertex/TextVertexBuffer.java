package org.anddev.andengine.opengl.vertex;

import org.anddev.andengine.util.*;
import org.anddev.andengine.opengl.util.*;
import org.anddev.andengine.opengl.font.*;

public class TextVertexBuffer extends VertexBuffer
{
    public static final int VERTICES_PER_CHARACTER = 6;
    private final HorizontalAlign mHorizontalAlign;
    
    static /* synthetic */ int[] $SWITCH_TABLE$org$anddev$andengine$util$HorizontalAlign() {
        final int[] $switch_TABLE$org$anddev$andengine$util$HorizontalAlign = TextVertexBuffer.$SWITCH_TABLE$org$anddev$andengine$util$HorizontalAlign;
        if ($switch_TABLE$org$anddev$andengine$util$HorizontalAlign != null) {
            return $switch_TABLE$org$anddev$andengine$util$HorizontalAlign;
        }
        final int[] $switch_TABLE$org$anddev$andengine$util$HorizontalAlign2 = new int[HorizontalAlign.values().length];
        while (true) {
            try {
                $switch_TABLE$org$anddev$andengine$util$HorizontalAlign2[HorizontalAlign.CENTER.ordinal()] = 2;
                try {
                    $switch_TABLE$org$anddev$andengine$util$HorizontalAlign2[HorizontalAlign.LEFT.ordinal()] = 1;
                    try {
                        $switch_TABLE$org$anddev$andengine$util$HorizontalAlign2[HorizontalAlign.RIGHT.ordinal()] = 3;
                        return TextVertexBuffer.$SWITCH_TABLE$org$anddev$andengine$util$HorizontalAlign = $switch_TABLE$org$anddev$andengine$util$HorizontalAlign2;
                    }
                    catch (NoSuchFieldError noSuchFieldError) {}
                }
                catch (NoSuchFieldError noSuchFieldError2) {}
            }
            catch (NoSuchFieldError noSuchFieldError3) {
                continue;
            }
            break;
        }
    }
    
    public TextVertexBuffer(final int n, final HorizontalAlign mHorizontalAlign, final int n2) {
        super(n * 12, n2);
        this.mHorizontalAlign = mHorizontalAlign;
    }
    
    public void update(final Font font, final int n, final int[] array, final String[] array2) {
    Label_0167_Outer:
        while (true) {
            while (true) {
            Label_0104_Outer:
                while (true) {
                    int n3 = 0;
                    int length2 = 0;
                    int n6 = 0;
                    int n7 = 0;
                Label_0410:
                    while (true) {
                        Label_0404: {
                            synchronized (this) {
                                final int[] mBufferData = this.mBufferData;
                                final int n2 = 0;
                                final int lineHeight = font.getLineHeight();
                                final int length = array2.length;
                                n3 = 0;
                                if (n3 >= length) {
                                    final FastFloatBuffer floatBuffer = this.getFloatBuffer();
                                    floatBuffer.position(0);
                                    floatBuffer.put(mBufferData);
                                    floatBuffer.position(0);
                                    super.setHardwareBufferNeedsUpdate();
                                    return;
                                }
                                final String s = array2[n3];
                                switch ($SWITCH_TABLE$org$anddev$andengine$util$HorizontalAlign()[this.mHorizontalAlign.ordinal()]) {
                                    case 3: {
                                        final int n4 = n - array[n3];
                                        break;
                                    }
                                    case 2: {
                                        final int n4 = n - array[n3] >> 1;
                                        break;
                                    }
                                    default: {
                                        break Label_0404;
                                    }
                                }
                                final int n5 = n3 * (font.getLineHeight() + font.getLineGap());
                                final int floatToRawIntBits = Float.floatToRawIntBits(n5);
                                length2 = s.length();
                                n6 = n2;
                                n7 = 0;
                                break Label_0410;
                                final Letter letter = font.getLetter(s.charAt(n7));
                                final int n8 = n5 + lineHeight;
                                int n4 = 0;
                                final int n9 = n4 + letter.mWidth;
                                final int floatToRawIntBits2 = Float.floatToRawIntBits(n4);
                                final int floatToRawIntBits3 = Float.floatToRawIntBits(n9);
                                final int floatToRawIntBits4 = Float.floatToRawIntBits(n8);
                                final int n10 = n6 + 1;
                                mBufferData[n6] = floatToRawIntBits2;
                                final int n11 = n10 + 1;
                                mBufferData[n10] = floatToRawIntBits;
                                final int n12 = n11 + 1;
                                mBufferData[n11] = floatToRawIntBits2;
                                final int n13 = n12 + 1;
                                mBufferData[n12] = floatToRawIntBits4;
                                final int n14 = n13 + 1;
                                mBufferData[n13] = floatToRawIntBits3;
                                final int n15 = n14 + 1;
                                mBufferData[n14] = floatToRawIntBits4;
                                final int n16 = n15 + 1;
                                mBufferData[n15] = floatToRawIntBits3;
                                final int n17 = n16 + 1;
                                mBufferData[n16] = floatToRawIntBits4;
                                final int n18 = n17 + 1;
                                mBufferData[n17] = floatToRawIntBits3;
                                final int n19 = n18 + 1;
                                mBufferData[n18] = floatToRawIntBits;
                                final int n20 = n19 + 1;
                                mBufferData[n19] = floatToRawIntBits2;
                                n6 = n20 + 1;
                                mBufferData[n20] = floatToRawIntBits;
                                n4 += letter.mAdvance;
                                ++n7;
                                break Label_0410;
                            }
                        }
                        int n4 = 0;
                        continue Label_0167_Outer;
                    }
                    if (n7 >= length2) {
                        ++n3;
                        final int n2 = n6;
                        continue Label_0104_Outer;
                    }
                    break;
                }
                continue;
            }
        }
    }
}
