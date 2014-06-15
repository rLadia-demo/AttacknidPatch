package org.anddev.andengine.entity.text;

import org.anddev.andengine.opengl.font.*;
import org.anddev.andengine.util.*;
import javax.microedition.khronos.opengles.*;
import org.anddev.andengine.engine.camera.*;

public class ChangeableText extends Text
{
    private static final String ELLIPSIS = "...";
    private static final int ELLIPSIS_CHARACTER_COUNT;
    private int mCharacterCountCurrentText;
    
    static {
        ELLIPSIS_CHARACTER_COUNT = "...".length();
    }
    
    public ChangeableText(final float n, final float n2, final Font font, final String s) {
        this(n, n2, font, s, s.length() - StringUtils.countOccurrences(s, '\n'));
    }
    
    public ChangeableText(final float n, final float n2, final Font font, final String s, final int n3) {
        this(n, n2, font, s, HorizontalAlign.LEFT, n3);
    }
    
    public ChangeableText(final float n, final float n2, final Font font, final String s, final HorizontalAlign horizontalAlign, final int n3) {
        super(n, n2, font, s, horizontalAlign, n3);
        this.mCharacterCountCurrentText = s.length() - StringUtils.countOccurrences(s, '\n');
    }
    
    @Override
    protected void drawVertices(final GL10 gl10, final Camera camera) {
        gl10.glDrawArrays(4, 0, 6 * this.mCharacterCountCurrentText);
    }
    
    public void setText(final String s) {
        this.setText(s, false);
    }
    
    public void setText(final String s, final boolean b) {
        final int mCharacterCountCurrentText = s.length() - StringUtils.countOccurrences(s, '\n');
        if (mCharacterCountCurrentText > this.mCharactersMaximum) {
            if (b && this.mCharactersMaximum > ChangeableText.ELLIPSIS_CHARACTER_COUNT) {
                this.updateText(s.substring(0, this.mCharactersMaximum - ChangeableText.ELLIPSIS_CHARACTER_COUNT).concat("..."));
            }
            else {
                this.updateText(s.substring(0, this.mCharactersMaximum));
            }
            this.mCharacterCountCurrentText = this.mCharactersMaximum;
            return;
        }
        this.updateText(s);
        this.mCharacterCountCurrentText = mCharacterCountCurrentText;
    }
}
