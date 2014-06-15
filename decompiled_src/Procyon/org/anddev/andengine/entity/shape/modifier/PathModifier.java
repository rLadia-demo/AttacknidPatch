package org.anddev.andengine.entity.shape.modifier;

import org.anddev.andengine.util.*;
import org.anddev.andengine.entity.shape.*;
import org.anddev.andengine.util.modifier.ease.*;
import org.anddev.andengine.util.modifier.*;

public class PathModifier extends ShapeModifier
{
    private final Path mPath;
    private IPathModifierListener mPathModifierListener;
    private final SequenceModifier<IShape> mSequenceModifier;
    
    public PathModifier(final float n, final Path path) {
        this(n, path, null, IEaseFunction.DEFAULT);
    }
    
    public PathModifier(final float n, final Path path, final IShapeModifierListener shapeModifierListener) {
        this(n, path, shapeModifierListener, null, IEaseFunction.DEFAULT);
    }
    
    public PathModifier(final float n, final Path path, final IShapeModifierListener shapeModifierListener, final IPathModifierListener pathModifierListener) throws IllegalArgumentException {
        this(n, path, shapeModifierListener, pathModifierListener, IEaseFunction.DEFAULT);
    }
    
    public PathModifier(final float n, final Path mPath, final IShapeModifierListener mModifierListener, final IPathModifierListener mPathModifierListener, final IEaseFunction easeFunction) throws IllegalArgumentException {
        super();
        final int size = mPath.getSize();
        if (size < 2) {
            throw new IllegalArgumentException("Path needs at least 2 waypoints!");
        }
        this.mPath = mPath;
        this.mModifierListener = (IModifierListener<T>)mModifierListener;
        this.mPathModifierListener = mPathModifierListener;
        final MoveModifier[] array = new MoveModifier[size - 1];
        final float[] coordinatesX = mPath.getCoordinatesX();
        final float[] coordinatesY = mPath.getCoordinatesY();
        final float n2 = mPath.getLength() / n;
        final int length = array.length;
        for (int i = 0; i < length; ++i) {
            final float n3 = mPath.getSegmentLength(i) / n2;
            if (i == 0) {
                array[i] = new MoveModifier(n3, coordinatesX[i], coordinatesX[i + 1], coordinatesY[i], coordinatesY[i + 1], null, easeFunction) {
                    @Override
                    protected void onManagedInitialize(final IShape shape) {
                        super.onManagedInitialize(shape);
                        if (PathModifier.this.mPathModifierListener != null) {
                            PathModifier.this.mPathModifierListener.onWaypointPassed(PathModifier.this, shape, 0);
                        }
                    }
                };
            }
            else {
                array[i] = new MoveModifier(n3, coordinatesX[i], coordinatesX[i + 1], coordinatesY[i], coordinatesY[i + 1], null, easeFunction);
            }
        }
        this.mSequenceModifier = new SequenceModifier<IShape>((IModifierListener<Object>)new IShapeModifierListener() {
            public void onModifierFinished(final IModifier<IShape> modifier, final IShape shape) {
                if (PathModifier.this.mPathModifierListener != null) {
                    PathModifier.this.mPathModifierListener.onWaypointPassed(PathModifier.this, shape, length);
                }
                if (PathModifier.this.mModifierListener != null) {
                    PathModifier.this.mModifierListener.onModifierFinished(PathModifier.this, shape);
                }
            }
        }, (SequenceModifier.ISubSequenceModifierListener<Object>)new SequenceModifier.ISubSequenceModifierListener<IShape>() {
            public void onSubSequenceFinished(final IModifier<IShape> modifier, final IShape shape, final int n) {
                if (PathModifier.this.mPathModifierListener != null) {
                    PathModifier.this.mPathModifierListener.onWaypointPassed(PathModifier.this, shape, n);
                }
            }
        }, (IModifier<Object>[])array);
    }
    
    public PathModifier(final float n, final Path path, final IShapeModifierListener shapeModifierListener, final IEaseFunction easeFunction) {
        this(n, path, shapeModifierListener, null, easeFunction);
    }
    
    public PathModifier(final float n, final Path path, final IEaseFunction easeFunction) {
        this(n, path, null, easeFunction);
    }
    
    protected PathModifier(final PathModifier pathModifier) {
        super();
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
    public void onUpdate(final float n, final IShape shape) {
        this.mSequenceModifier.onUpdate(n, shape);
    }
    
    @Override
    public void reset() {
        this.mSequenceModifier.reset();
    }
    
    public void setPathModifierListener(final IPathModifierListener mPathModifierListener) {
        this.mPathModifierListener = mPathModifierListener;
    }
    
    public interface IPathModifierListener
    {
        void onWaypointPassed(PathModifier p0, IShape p1, int p2);
    }
}
