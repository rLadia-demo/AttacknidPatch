/*
 * Decompiled with CFR 0_79.
 */
package org.anddev.andengine.entity.shape.modifier;

import org.anddev.andengine.entity.shape.IShape;
import org.anddev.andengine.entity.shape.modifier.IShapeModifier;
import org.anddev.andengine.entity.shape.modifier.MoveModifier;
import org.anddev.andengine.entity.shape.modifier.ShapeModifier;
import org.anddev.andengine.util.Path;
import org.anddev.andengine.util.modifier.IModifier;
import org.anddev.andengine.util.modifier.SequenceModifier;
import org.anddev.andengine.util.modifier.ease.IEaseFunction;

public class PathModifier
extends ShapeModifier {
    private final Path mPath;
    private IPathModifierListener mPathModifierListener;
    private final SequenceModifier<IShape> mSequenceModifier;

    public PathModifier(float f, Path path) {
        this(f, path, (IShapeModifier.IShapeModifierListener)null, IEaseFunction.DEFAULT);
    }

    public PathModifier(float f, Path path, IShapeModifier.IShapeModifierListener iShapeModifierListener) {
        this(f, path, iShapeModifierListener, null, IEaseFunction.DEFAULT);
    }

    public PathModifier(float f, Path path, IShapeModifier.IShapeModifierListener iShapeModifierListener, IPathModifierListener iPathModifierListener) throws IllegalArgumentException {
        this(f, path, iShapeModifierListener, iPathModifierListener, IEaseFunction.DEFAULT);
    }

    /*
     * Enabled aggressive block sorting
     */
    public PathModifier(float f, Path path, IShapeModifier.IShapeModifierListener iShapeModifierListener, IPathModifierListener iPathModifierListener, IEaseFunction iEaseFunction) throws IllegalArgumentException {
        int n = path.getSize();
        if (n < 2) {
            throw new IllegalArgumentException("Path needs at least 2 waypoints!");
        }
        this.mPath = path;
        this.mModifierListener = iShapeModifierListener;
        this.mPathModifierListener = iPathModifierListener;
        MoveModifier[] arrmoveModifier = new MoveModifier[n - 1];
        float[] arrf = path.getCoordinatesX();
        float[] arrf2 = path.getCoordinatesY();
        float f2 = path.getLength() / f;
        int n2 = arrmoveModifier.length;
        for (int i = 0; i < n2; ++i) {
            float f3 = path.getSegmentLength(i) / f2;
            if (i == 0) {
                arrmoveModifier[i] = new MoveModifier(f3, arrf[i], arrf[i + 1], arrf2[i], arrf2[i + 1], null, iEaseFunction){

                    @Override
                    protected void onManagedInitialize(IShape iShape) {
                        super.onManagedInitialize((Object)iShape);
                        if (PathModifier.this.mPathModifierListener == null) return;
                        PathModifier.this.mPathModifierListener.onWaypointPassed(PathModifier.this, iShape, 0);
                    }
                };
                continue;
            }
            arrmoveModifier[i] = new MoveModifier(f3, arrf[i], arrf[i + 1], arrf2[i], arrf2[i + 1], null, iEaseFunction);
        }
        this.mSequenceModifier = new SequenceModifier<IShape>((IModifier.IModifierListener<IShape>)new IShapeModifier.IShapeModifierListener(n2){
            private final /* synthetic */ int val$modifierCount;

            @Override
            public void onModifierFinished(IModifier<IShape> iModifier, IShape iShape) {
                if (PathModifier.this.mPathModifierListener != null) {
                    PathModifier.this.mPathModifierListener.onWaypointPassed(PathModifier.this, iShape, this.val$modifierCount);
                }
                if (PathModifier.this.mModifierListener == null) return;
                PathModifier.this.mModifierListener.onModifierFinished(PathModifier.this, iShape);
            }
        }, new SequenceModifier.ISubSequenceModifierListener<IShape>(){

            @Override
            public void onSubSequenceFinished(IModifier<IShape> iModifier, IShape iShape, int n) {
                if (PathModifier.this.mPathModifierListener == null) return;
                PathModifier.this.mPathModifierListener.onWaypointPassed(PathModifier.this, iShape, n);
            }
        }, (IModifier<T>[])arrmoveModifier);
    }

    public PathModifier(float f, Path path, IShapeModifier.IShapeModifierListener iShapeModifierListener, IEaseFunction iEaseFunction) {
        this(f, path, iShapeModifierListener, null, iEaseFunction);
    }

    public PathModifier(float f, Path path, IEaseFunction iEaseFunction) {
        this(f, path, (IShapeModifier.IShapeModifierListener)null, iEaseFunction);
    }

    protected PathModifier(PathModifier pathModifier) {
        this.mPath = pathModifier.mPath.clone();
        this.mSequenceModifier = pathModifier.mSequenceModifier.clone();
    }

    @Override
    public PathModifier clone() {
        return new PathModifier(this);
    }

    @Override
    public float getDuration() {
        return this.mSequenceModifier.getDuration();
    }

    public Path getPath() {
        return this.mPath;
    }

    public IPathModifierListener getPathModifierListener() {
        return this.mPathModifierListener;
    }

    @Override
    public boolean isFinished() {
        return this.mSequenceModifier.isFinished();
    }

    @Override
    public void onUpdate(float f, IShape iShape) {
        this.mSequenceModifier.onUpdate(f, iShape);
    }

    @Override
    public void reset() {
        this.mSequenceModifier.reset();
    }

    public void setPathModifierListener(IPathModifierListener iPathModifierListener) {
        this.mPathModifierListener = iPathModifierListener;
    }

    public interface IPathModifierListener {
        public void onWaypointPassed(PathModifier var1, IShape var2, int var3);
    }

}

