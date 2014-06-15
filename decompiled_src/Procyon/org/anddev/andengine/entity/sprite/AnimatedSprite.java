package org.anddev.andengine.entity.sprite;

import org.anddev.andengine.util.constants.*;
import org.anddev.andengine.opengl.texture.region.*;
import org.anddev.andengine.opengl.vertex.*;
import java.util.*;
import org.anddev.andengine.util.*;

public class AnimatedSprite extends TiledSprite implements TimeConstants
{
    private static final int LOOP_CONTINUOUS = -1;
    private long mAnimationDuration;
    private IAnimationListener mAnimationListener;
    private long mAnimationProgress;
    private boolean mAnimationRunning;
    private int mFirstTileIndex;
    private int mFrameCount;
    private long[] mFrameEndsInNanoseconds;
    private int mInitialLoopCount;
    private int mLoopCount;
    
    public AnimatedSprite(final float n, final float n2, final float n3, final float n4, final TiledTextureRegion tiledTextureRegion) {
        super(n, n2, n3, n4, tiledTextureRegion);
    }
    
    public AnimatedSprite(final float n, final float n2, final float n3, final float n4, final TiledTextureRegion tiledTextureRegion, final RectangleVertexBuffer rectangleVertexBuffer) {
        super(n, n2, n3, n4, tiledTextureRegion, rectangleVertexBuffer);
    }
    
    public AnimatedSprite(final float n, final float n2, final TiledTextureRegion tiledTextureRegion) {
        super(n, n2, tiledTextureRegion);
    }
    
    public AnimatedSprite(final float n, final float n2, final TiledTextureRegion tiledTextureRegion, final RectangleVertexBuffer rectangleVertexBuffer) {
        super(n, n2, tiledTextureRegion, rectangleVertexBuffer);
    }
    
    private int calculateCurrentFrameIndex() {
        final long mAnimationProgress = this.mAnimationProgress;
        final long[] mFrameEndsInNanoseconds = this.mFrameEndsInNanoseconds;
        final int mFrameCount = this.mFrameCount;
        for (int i = 0; i < mFrameCount; ++i) {
            if (mFrameEndsInNanoseconds[i] > mAnimationProgress) {
                return i;
            }
        }
        return mFrameCount - 1;
    }
    
    public AnimatedSprite animate(final long n) {
        return this.animate(n, true);
    }
    
    public AnimatedSprite animate(final long n, final int n2) {
        return this.animate(n, n2, null);
    }
    
    public AnimatedSprite animate(final long n, final int n2, final IAnimationListener animationListener) {
        final long[] array = new long[this.getTextureRegion().getTileCount()];
        Arrays.fill(array, n);
        return this.animate(array, n2, animationListener);
    }
    
    public AnimatedSprite animate(final long n, final boolean b) {
        int n2;
        if (b) {
            n2 = -1;
        }
        else {
            n2 = 0;
        }
        return this.animate(n, n2, null);
    }
    
    public AnimatedSprite animate(final long n, final boolean b, final IAnimationListener animationListener) {
        int n2;
        if (b) {
            n2 = -1;
        }
        else {
            n2 = 0;
        }
        return this.animate(n, n2, animationListener);
    }
    
    public AnimatedSprite animate(final long[] array) {
        return this.animate(array, true);
    }
    
    public AnimatedSprite animate(final long[] array, final int n) {
        return this.animate(array, n, null);
    }
    
    public AnimatedSprite animate(final long[] array, final int n, final int n2, final int n3) {
        return this.animate(array, n, n2, n3, null);
    }
    
    public AnimatedSprite animate(final long[] array, final int mFirstTileIndex, final int n, final int n2, final IAnimationListener mAnimationListener) {
        if (n - mFirstTileIndex < 1) {
            throw new IllegalArgumentException("An animation needs at least two tiles to animate between.");
        }
        final int mFrameCount = 1 + (n - mFirstTileIndex);
        if (array.length != mFrameCount) {
            throw new IllegalArgumentException("pFrameDurations must have the same length as pFirstTileIndex to pLastTileIndex.");
        }
        this.mFrameCount = mFrameCount;
        this.mAnimationListener = mAnimationListener;
        this.mInitialLoopCount = n2;
        this.mLoopCount = n2;
        this.mFirstTileIndex = mFirstTileIndex;
        if (this.mFrameEndsInNanoseconds == null || this.mFrameCount > this.mFrameEndsInNanoseconds.length) {
            this.mFrameEndsInNanoseconds = new long[this.mFrameCount];
        }
        final long[] mFrameEndsInNanoseconds = this.mFrameEndsInNanoseconds;
        MathUtils.arraySumInto(array, mFrameEndsInNanoseconds, 1000000L);
        this.mAnimationDuration = mFrameEndsInNanoseconds[-1 + this.mFrameCount];
        this.mAnimationProgress = 0L;
        this.mAnimationRunning = true;
        return this;
    }
    
    public AnimatedSprite animate(final long[] array, final int n, final int n2, final boolean b) {
        int n3;
        if (b) {
            n3 = -1;
        }
        else {
            n3 = 0;
        }
        return this.animate(array, n, n2, n3, null);
    }
    
    public AnimatedSprite animate(final long[] array, final int n, final IAnimationListener animationListener) {
        return this.animate(array, 0, -1 + this.getTextureRegion().getTileCount(), n, animationListener);
    }
    
    public AnimatedSprite animate(final long[] array, final boolean b) {
        int n;
        if (b) {
            n = -1;
        }
        else {
            n = 0;
        }
        return this.animate(array, n, null);
    }
    
    public AnimatedSprite animate(final long[] array, final boolean b, final IAnimationListener animationListener) {
        int n;
        if (b) {
            n = -1;
        }
        else {
            n = 0;
        }
        return this.animate(array, n, animationListener);
    }
    
    public boolean isAnimationRunning() {
        return this.mAnimationRunning;
    }
    
    @Override
    protected void onManagedUpdate(final float n) {
        super.onManagedUpdate(n);
        if (this.mAnimationRunning) {
            this.mAnimationProgress += (long)(1.0E9f * n);
            if (this.mAnimationProgress > this.mAnimationDuration) {
                this.mAnimationProgress %= this.mAnimationDuration;
                if (this.mInitialLoopCount != -1) {
                    --this.mLoopCount;
                }
            }
            if (this.mInitialLoopCount == -1 || this.mLoopCount >= 0) {
                this.setCurrentTileIndex(this.calculateCurrentFrameIndex() + this.mFirstTileIndex);
            }
            else {
                this.mAnimationRunning = false;
                if (this.mAnimationListener != null) {
                    this.mAnimationListener.onAnimationEnd(this);
                }
            }
        }
    }
    
    public void stopAnimation() {
        this.mAnimationRunning = false;
    }
    
    public void stopAnimation(final int currentTileIndex) {
        this.mAnimationRunning = false;
        this.setCurrentTileIndex(currentTileIndex);
    }
    
    public interface IAnimationListener
    {
        void onAnimationEnd(AnimatedSprite p0);
    }
}
