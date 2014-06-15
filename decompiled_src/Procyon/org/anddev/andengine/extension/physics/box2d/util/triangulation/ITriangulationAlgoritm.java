package org.anddev.andengine.extension.physics.box2d.util.triangulation;

import java.util.*;
import com.badlogic.gdx.math.*;

public interface ITriangulationAlgoritm
{
    List<Vector2> computeTriangles(List<Vector2> p0);
}
