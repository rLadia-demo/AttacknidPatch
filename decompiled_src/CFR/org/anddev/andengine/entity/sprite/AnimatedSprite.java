/*
 * Decompiled with CFR 0_79.
 */
package org.anddev.andengine.entity.sprite;

import java.util.Arrays;
import org.anddev.andengine.entity.sprite.TiledSprite;
import org.anddev.andengine.opengl.texture.region.TiledTextureRegion;
import org.anddev.andengine.opengl.vertex.RectangleVertexBuffer;
import org.anddev.andengine.util.MathUtils;
import org.anddev.andengine.util.constants.TimeConstants;

public class AnimatedSprite
extends TiledSprite
implements TimeConstants {
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

    public AnimatedSprite(float f, float f2, float f3, float f4, TiledTextureRegion tiledTextureRegion) {
        super(f, f2, f3, f4, tiledTextureRegion);
    }

    public AnimatedSprite(float f, float f2, float f3, float f4, TiledTextureRegion tiledTextureRegion, RectangleVertexBuffer rectangleVertexBuffer) {
        super(f, f2, f3, f4, tiledTextureRegion, rectangleVertexBuffer);
    }

    public AnimatedSprite(float f, float f2, TiledTextureRegion tiledTextureRegion) {
        super(f, f2, tiledTextureRegion);
    }

    public AnimatedSprite(float f, float f2, TiledTextureRegion tiledTextureRegion, RectangleVertexBuffer rectangleVertexBuffer) {
        super(f, f2, tiledTextureRegion, rectangleVertexBuffer);
    }

    /*
     * Enabled aggressive block sorting
     */
    private int calculateCurrentFrameIndex() {
        long l = this.mAnimationProgress;
        long[] arrl = this.mFrameEndsInNanoseconds;
        int n = this.mFrameCount;
        for (int i = 0; i < n; ++i) {
            if (arrl[i] > l) return i;
        }
        return n - 1;
    }

    public AnimatedSprite animate(long l) {
        return this.animate(l, true);
    }

    public AnimatedSprite animate(long l, int n) {
        return this.animate(l, n, (IAnimationListener)null);
    }

    public AnimatedSprite animate(long l, int n, IAnimationListener iAnimationListener) {
        long[] arrl = new long[this.getTextureRegion().getTileCount()];
        Arrays.fill(arrl, l);
        return this.animate(arrl, n, iAnimationListener);
    }

    /*
     * Enabled aggressive block sorting
     */
    public AnimatedSprite animate(long l, boolean bl) {
        int n = bl ? -1 : 0;
        return this.animate(l, n, (IAnimationListener)null);
    }

    /*
     * Enabled aggressive block sorting
     */
    public AnimatedSprite animate(long l, boolean bl, IAnimationListener iAnimationListener) {
        int n = bl ? -1 : 0;
        return this.animate(l, n, iAnimationListener);
    }

    public AnimatedSprite animate(long[] arrl) {
        return this.animate(arrl, true);
    }

    public AnimatedSprite animate(long[] arrl, int n) {
        return this.animate(arrl, n, (IAnimationListener)null);
    }

    public AnimatedSprite animate(long[] arrl, int n, int n2, int n3) {
        return this.animate(arrl, n, n2, n3, null);
    }

    public AnimatedSprite animate(long[] arrl, int n, int n2, int n3, IAnimationListener iAnimationListener) {
        int n4;
        if (n2 - n < 1) {
            throw new IllegalArgumentException("An animation needs at least two tiles to animate between.");
        }
        if (arrl.length != (n4 = 1 + n2 - n)) {
            throw new IllegalArgumentException("pFrameDurations must have the same length as pFirstTileIndex to pLastTileIndex.");
        }
        this.mFrameCount = n4;
        this.mAnimationListener = iAnimationListener;
        this.mInitialLoopCount = n3;
        this.mLoopCount = n3;
        this.mFirstTileIndex = n;
        if (this.mFrameEndsInNanoseconds == null || this.mFrameCount > this.mFrameEndsInNanoseconds.length) {
            this.mFrameEndsInNanoseconds = new long[this.mFrameCount];
        }
        long[] arrl2 = this.mFrameEndsInNanoseconds;
        MathUtils.arraySumInto(arrl, arrl2, 1000000);
        this.mAnimationDuration = arrl2[-1 + this.mFrameCount];
        this.mAnimationProgress = 0;
        this.mAnimationRunning = true;
        return this;
    }

    /*
     * Enabled aggressive block sorting
     */
    public AnimatedSprite animate(long[] arrl, int n, int n2, boolean bl) {
        int n3 = bl ? -1 : 0;
        return this.animate(arrl, n, n2, n3, null);
    }

    public AnimatedSprite animate(long[] arrl, int n, IAnimationListener iAnimationListener) {
        return this.animate(arrl, 0, -1 + this.getTextureRegion().getTileCount(), n, iAnimationListener);
    }

    /*
     * Enabled aggressive block sorting
     */
    public AnimatedSprite animate(long[] arrl, boolean bl) {
        int n = bl ? -1 : 0;
        return this.animate(arrl, n, (IAnimationListener)null);
    }

    /*
     * Enabled aggressive block sorting
     */
    public AnimatedSprite animate(long[] arrl, boolean bl, IAnimationListener iAnimationListener) {
        int n = bl ? -1 : 0;
        return this.animate(arrl, n, iAnimationListener);
    }

    public boolean isAnimationRunning() {
        return this.mAnimationRunning;
    }

    /*
     * Enabled aggressive block sorting
     */
    @Override
    protected void onManagedUpdate(float f) {
        super.onManagedUpdate(f);
        if (!this.mAnimationRunning) return;
        this.mAnimationProgress = (long)(1.0E9f * f) + this.mAnimationProgress;
        if (this.mAnimationProgress > this.mAnimationDuration) {
            this.mAnimationProgress%=this.mAnimationDuration;
            if (this.mInitialLoopCount != -1) {
                this.mLoopCount = -1 + this.mLoopCount;
            }
        }
        if (this.mInitialLoopCount == -1 || this.mLoopCount >= 0) {
            this.setCurrentTileIndex(this.calculateCurrentFrameIndex() + this.mFirstTileIndex);
            return;
        }
        this.mAnimationRunning = false;
        if (this.mAnimationListener == null) return;
        this.mAnimationListener.onAnimationEnd(this);
    }

    public void stopAnimation() {
        this.mAnimationRunning = false;
    }

    public void stopAnimation(int n) {
        this.mAnimationRunning = false;
        this.setCurrentTileIndex(n);
    }

    public interface IAnimationListener {
        public void onAnimationEnd(AnimatedSprite var1);
    }

}

