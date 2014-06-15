package org.anddev.andengine.extension.physics.box2d.util.triangulation;

import com.badlogic.gdx.math.Vector2;
import java.util.List;

public abstract interface ITriangulationAlgoritm
{
  public abstract List<Vector2> computeTriangles(List<Vector2> paramList);
}


/* Location:           C:\Users\Rodelle\Desktop\Attacknid\Tools\Attacknids-dex2jar.jar
 * Qualified Name:     org.anddev.andengine.extension.physics.box2d.util.triangulation.ITriangulationAlgoritm
 * JD-Core Version:    0.7.0.1
 */