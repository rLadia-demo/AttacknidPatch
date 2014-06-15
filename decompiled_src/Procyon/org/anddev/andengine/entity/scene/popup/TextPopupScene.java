package org.anddev.andengine.entity.scene.popup;

import org.anddev.andengine.entity.text.*;
import org.anddev.andengine.engine.camera.*;
import org.anddev.andengine.entity.scene.*;
import org.anddev.andengine.opengl.font.*;
import org.anddev.andengine.entity.shape.modifier.*;
import org.anddev.andengine.util.*;
import org.anddev.andengine.util.modifier.*;
import org.anddev.andengine.entity.shape.*;
import org.anddev.andengine.entity.*;

public class TextPopupScene extends PopupScene
{
    private final Text mText;
    
    public TextPopupScene(final Camera camera, final Scene scene, final Font font, final String s, final float n) {
        this(camera, scene, font, s, n, null, null);
    }
    
    public TextPopupScene(final Camera camera, final Scene scene, final Font font, final String s, final float n, final Runnable runnable) {
        this(camera, scene, font, s, n, null, runnable);
    }
    
    public TextPopupScene(final Camera camera, final Scene scene, final Font font, final String s, final float n, final IShapeModifier shapeModifier) {
        this(camera, scene, font, s, n, shapeModifier, null);
    }
    
    public TextPopupScene(final Camera camera, final Scene scene, final Font font, final String s, final float n, final IShapeModifier shapeModifier, final Runnable runnable) {
        super(camera, scene, n, runnable);
        this.centerShapeInCamera(this.mText = new Text(0.0f, 0.0f, font, s, HorizontalAlign.CENTER));
        if (shapeModifier != null) {
            this.mText.addShapeModifier(shapeModifier);
        }
        this.getTopLayer().addEntity(this.mText);
    }
    
    public Text getText() {
        return this.mText;
    }
}
