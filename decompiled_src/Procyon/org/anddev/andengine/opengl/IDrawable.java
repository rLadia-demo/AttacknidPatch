package org.anddev.andengine.opengl;

import javax.microedition.khronos.opengles.*;
import org.anddev.andengine.engine.camera.*;

public interface IDrawable
{
    void onDraw(GL10 p0, Camera p1);
}
