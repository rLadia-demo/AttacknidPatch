/*
 * Decompiled with CFR 0_79.
 */
package org.anddev.andengine.entity.scene.popup;

import org.anddev.andengine.engine.camera.Camera;
import org.anddev.andengine.entity.IEntity;
import org.anddev.andengine.entity.layer.ILayer;
import org.anddev.andengine.entity.scene.Scene;
import org.anddev.andengine.entity.scene.popup.PopupScene;
import org.anddev.andengine.entity.shape.Shape;
import org.anddev.andengine.entity.shape.modifier.IShapeModifier;
import org.anddev.andengine.entity.text.Text;
import org.anddev.andengine.opengl.font.Font;
import org.anddev.andengine.util.HorizontalAlign;
import org.anddev.andengine.util.modifier.IModifier;

public class TextPopupScene
extends PopupScene {
    private final Text mText;

    public TextPopupScene(Camera camera, Scene scene, Font font, String string, float f) {
        this(camera, scene, font, string, f, null, null);
    }

    public TextPopupScene(Camera camera, Scene scene, Font font, String string, float f, Runnable runnable) {
        this(camera, scene, font, string, f, null, runnable);
    }

    public TextPopupScene(Camera camera, Scene scene, Font font, String string, float f, IShapeModifier iShapeModifier) {
        this(camera, scene, font, string, f, iShapeModifier, null);
    }

    public TextPopupScene(Camera camera, Scene scene, Font font, String string, float f, IShapeModifier iShapeModifier, Runnable runnable) {
        super(camera, scene, f, runnable);
        this.mText = new Text(0.0f, 0.0f, font, string, HorizontalAlign.CENTER);
        this.centerShapeInCamera((Shape)this.mText);
        if (iShapeModifier != null) {
            this.mText.addShapeModifier((IModifier)iShapeModifier);
        }
        this.getTopLayer().addEntity(this.mText);
    }

    public Text getText() {
        return this.mText;
    }
}

