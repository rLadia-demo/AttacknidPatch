/*
 * Decompiled with CFR 0_79.
 * 
 * Could not load the following classes:
 *  javax.microedition.khronos.opengles.GL10
 *  javax.microedition.khronos.opengles.GL11
 */
package org.anddev.andengine.entity.layer.tiled.tmx;

import java.io.ByteArrayInputStream;
import java.io.DataInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.zip.GZIPInputStream;
import javax.microedition.khronos.opengles.GL10;
import javax.microedition.khronos.opengles.GL11;
import org.anddev.andengine.collision.RectangularShapeCollisionChecker;
import org.anddev.andengine.engine.camera.Camera;
import org.anddev.andengine.entity.layer.tiled.tmx.TMXLayerProperty;
import org.anddev.andengine.entity.layer.tiled.tmx.TMXLoader;
import org.anddev.andengine.entity.layer.tiled.tmx.TMXProperties;
import org.anddev.andengine.entity.layer.tiled.tmx.TMXTile;
import org.anddev.andengine.entity.layer.tiled.tmx.TMXTileProperty;
import org.anddev.andengine.entity.layer.tiled.tmx.TMXTiledMap;
import org.anddev.andengine.entity.layer.tiled.tmx.util.constants.TMXConstants;
import org.anddev.andengine.entity.shape.RectangularShape;
import org.anddev.andengine.opengl.texture.region.TextureRegion;
import org.anddev.andengine.opengl.util.FastFloatBuffer;
import org.anddev.andengine.opengl.util.GLHelper;
import org.anddev.andengine.opengl.vertex.RectangleVertexBuffer;
import org.anddev.andengine.opengl.vertex.VertexBuffer;
import org.anddev.andengine.util.Base64InputStream;
import org.anddev.andengine.util.MathUtils;
import org.anddev.andengine.util.SAXUtils;
import org.anddev.andengine.util.StreamUtils;
import org.xml.sax.Attributes;

public class TMXLayer
extends RectangularShape
implements TMXConstants {
    private final float[] mCullingVertices;
    private final int mGlobalTileIDsExpected;
    private final String mName;
    private final TMXProperties<TMXLayerProperty> mTMXLayerProperties;
    private final TMXTiledMap mTMXTiledMap;
    private final TMXTile[][] mTMXTiles;
    private final int mTileColumns;
    private final int mTileRows;
    private int mTilesAdded;

    /*
     * Enabled aggressive block sorting
     */
    public TMXLayer(TMXTiledMap tMXTiledMap, Attributes attributes) {
        float f;
        float f2;
        super(0.0f, 0.0f, 0.0f, 0.0f, null);
        this.mCullingVertices = new float[8];
        this.mTMXLayerProperties = new TMXProperties();
        this.mTMXTiledMap = tMXTiledMap;
        this.mName = attributes.getValue("", "name");
        this.mTileColumns = SAXUtils.getIntAttributeOrThrow(attributes, "width");
        this.mTileRows = SAXUtils.getIntAttributeOrThrow(attributes, "height");
        this.mTMXTiles = (TMXTile[][])Array.newInstance(TMXTile.class, this.mTileRows, this.mTileColumns);
        this.mBaseWidth = f2 = (this.mWidth = (float)(tMXTiledMap.getTileWidth() * this.mTileColumns));
        this.mBaseHeight = f = (this.mHeight = (float)(tMXTiledMap.getTileHeight() * this.mTileRows));
        this.mRotationCenterX = f2 * 0.5f;
        this.mRotationCenterY = f * 0.5f;
        this.mScaleCenterX = this.mRotationCenterX;
        this.mScaleCenterY = this.mRotationCenterY;
        this.mGlobalTileIDsExpected = this.mTileColumns * this.mTileRows;
        boolean bl = SAXUtils.getIntAttribute(attributes, "visible", 1) == 1;
        this.setVisible(bl);
        this.setAlpha(SAXUtils.getFloatAttribute(attributes, "opacity", 1.0f));
    }

    /*
     * Enabled aggressive block sorting
     */
    private void addTileByGlobalTileID(int n, TMXLoader.ITMXTilePropertiesListener iTMXTilePropertiesListener) {
        TMXProperties<TMXTileProperty> tMXProperties;
        TMXTile tMXTile;
        TMXTiledMap tMXTiledMap = this.mTMXTiledMap;
        int n2 = this.mTileColumns;
        int n3 = this.mTilesAdded % n2;
        int n4 = this.mTilesAdded / n2;
        TMXTile[][] arrtMXTile = this.mTMXTiles;
        TextureRegion textureRegion = n == 0 ? null : tMXTiledMap.getTextureRegionFromGlobalTileID(n);
        arrtMXTile[n4][n3] = tMXTile = new TMXTile(n, n3, n4, this.mTMXTiledMap.getTileWidth(), this.mTMXTiledMap.getTileHeight(), textureRegion);
        if (n != 0 && iTMXTilePropertiesListener != null && (tMXProperties = tMXTiledMap.getTMXTileProperties(n)) != null) {
            iTMXTilePropertiesListener.onTMXTileWithPropertiesCreated(tMXTiledMap, this, tMXTile, tMXProperties);
        }
        this.mTilesAdded = 1 + this.mTilesAdded;
    }

    private int readGlobalTileID(DataInputStream dataInputStream) throws IOException {
        int n = dataInputStream.read();
        int n2 = dataInputStream.read();
        int n3 = dataInputStream.read();
        int n4 = dataInputStream.read();
        if (n >= 0 && n2 >= 0 && n3 >= 0 && n4 >= 0) return n | n2 << 8 | n3 << 16 | n4 << 24;
        throw new IllegalArgumentException("Couldn't read global Tile ID.");
    }

    public void addTMXLayerProperty(TMXLayerProperty tMXLayerProperty) {
        this.mTMXLayerProperties.add((Object)tMXLayerProperty);
    }

    @Override
    protected void drawVertices(GL10 gL10, Camera camera) {
        TMXTile[][] arrtMXTile = this.mTMXTiles;
        int n = this.mTileColumns;
        int n2 = this.mTileRows;
        int n3 = this.mTMXTiledMap.getTileWidth();
        int n4 = this.mTMXTiledMap.getTileHeight();
        float f = (float)n3 * this.mScaleX;
        float f2 = (float)n4 * this.mScaleY;
        float[] arrf = this.mCullingVertices;
        RectangularShapeCollisionChecker.fillVertices(this, arrf);
        float f3 = arrf[0];
        float f4 = arrf[1];
        float f5 = camera.getMinX();
        float f6 = camera.getMinY();
        float f7 = camera.getWidth();
        float f8 = camera.getHeight();
        float f9 = (f5 - f3) / f;
        int n5 = MathUtils.bringToBounds(0, n - 1, (int)Math.floor(f9));
        int n6 = MathUtils.bringToBounds(0, n - 1, (int)Math.ceil(f9 + f7 / f));
        float f10 = (f6 - f4) / f2;
        int n7 = MathUtils.bringToBounds(0, n2 - 1, (int)Math.floor(f10));
        int n8 = MathUtils.bringToBounds(0, n2 - 1, (int)Math.floor(f10 + f8 / f2));
        int n9 = n3 * (1 + n6 - n5);
        gL10.glTranslatef((float)(n5 * n3), (float)(n7 * n4), 0.0f);
        int n10 = n7;
        block0 : do {
            if (n10 > n8) {
                gL10.glLoadIdentity();
                return;
            }
            TMXTile[] arrtMXTile2 = arrtMXTile[n10];
            int n11 = n5;
            do {
                TextureRegion textureRegion;
                if (n11 > n6) {
                    gL10.glTranslatef((float)(- n9), (float)n4, 0.0f);
                    ++n10;
                    continue block0;
                }
                if ((textureRegion = arrtMXTile2[n11].mTextureRegion) != null) {
                    textureRegion.onApply(gL10);
                    gL10.glDrawArrays(5, 0, 4);
                }
                gL10.glTranslatef((float)n3, 0.0f, 0.0f);
                ++n11;
            } while (true);
            break;
        } while (true);
    }

    public String getName() {
        return this.mName;
    }

    public TMXProperties<TMXLayerProperty> getTMXLayerProperties() {
        return this.mTMXLayerProperties;
    }

    public TMXTile getTMXTile(int n, int n2) throws ArrayIndexOutOfBoundsException {
        return this.mTMXTiles[n2][n];
    }

    /*
     * Enabled aggressive block sorting
     */
    public TMXTile getTMXTileAt(float f, float f2) {
        float[] arrf = this.convertSceneToLocalCoordinates(f, f2);
        TMXTiledMap tMXTiledMap = this.mTMXTiledMap;
        int n = (int)(arrf[0] / (float)tMXTiledMap.getTileWidth());
        if (n < 0) return null;
        if (n > -1 + this.mTileColumns) {
            return null;
        }
        int n2 = (int)(arrf[1] / (float)tMXTiledMap.getTileWidth());
        if (n2 < 0) return null;
        if (n2 > -1 + this.mTileRows) return null;
        return this.mTMXTiles[n2][n];
    }

    public TMXTile[][] getTMXTiles() {
        return this.mTMXTiles;
    }

    public int getTileColumns() {
        return this.mTileColumns;
    }

    public int getTileRows() {
        return this.mTileRows;
    }

    void initializeTMXTileFromXML(Attributes attributes, TMXLoader.ITMXTilePropertiesListener iTMXTilePropertiesListener) {
        this.addTileByGlobalTileID(SAXUtils.getIntAttributeOrThrow(attributes, "gid"), iTMXTilePropertiesListener);
    }

    /*
     * Unable to fully structure code
     * Enabled aggressive block sorting
     * Enabled unnecessary exception pruning
     */
    void initializeTMXTilesFromDataString(String var1_1, String var2_2, String var3_3, TMXLoader.ITMXTilePropertiesListener var4_4) throws IOException, IllegalArgumentException {
        block10 : {
            block9 : {
                var5_5 = null;
                try {
                    var6_6 = new ByteArrayInputStream(var1_1.getBytes("UTF-8"));
                    if (var2_2 != null && var2_2.equals("base64")) {
                        var8_7 = new Base64InputStream(var6_6, 0);
                    } else {
                        var8_9 = var6_6;
                    }
                    if (var3_3 == null) break block9;
                    if (var3_3.equals("gzip") == false) throw new IllegalArgumentException("Supplied compression '" + var3_3 + "' is not supported yet.");
                    var9_10 = new GZIPInputStream((InputStream)var8_8);
                    break block10;
                }
                catch (Throwable var7_16) {}
                ** GOTO lbl-1000
            }
            var9_12 = var8_8;
        }
        var10_13 = new DataInputStream((InputStream)var9_11);
        do {
            block11 : {
                var11_14 = this.mTilesAdded;
                var12_15 = this.mGlobalTileIDsExpected;
                if (var11_14 < var12_15) break block11;
                StreamUtils.closeStream(var10_13);
                return;
            }
            this.addTileByGlobalTileID(this.readGlobalTileID(var10_13), var4_4);
            continue;
            break;
        } while (true);
        catch (Throwable var7_16) {
            var5_5 = var10_13;
        }
lbl-1000: // 2 sources:
        {
            StreamUtils.closeStream(var5_5);
            throw var7_16;
        }
    }

    @Override
    protected void onApplyVertices(GL10 gL10) {
        if (GLHelper.EXTENSIONS_VERTEXBUFFEROBJECTS) {
            GL11 gL11 = (GL11)gL10;
            this.mTMXTiledMap.getSharedVertexBuffer().selectOnHardware(gL11);
            GLHelper.vertexZeroPointer(gL11);
            return;
        }
        GLHelper.vertexPointer(gL10, this.mTMXTiledMap.getSharedVertexBuffer().getFloatBuffer());
    }

    @Override
    protected void onInitDraw(GL10 gL10) {
        super.onInitDraw(gL10);
        GLHelper.enableTextures(gL10);
        GLHelper.enableTexCoordArray(gL10);
    }

    @Override
    protected void onManagedUpdate(float f) {
    }

    @Override
    protected void onUpdateVertexBuffer() {
    }

    @Deprecated
    @Override
    public void setRotation(float f) {
    }
}

