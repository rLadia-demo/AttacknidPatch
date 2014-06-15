package org.anddev.andengine.entity.layer.tiled.tmx;

import org.anddev.andengine.entity.shape.*;
import org.anddev.andengine.entity.layer.tiled.tmx.util.constants.*;
import org.xml.sax.*;
import org.anddev.andengine.opengl.vertex.*;
import java.lang.reflect.*;
import org.anddev.andengine.opengl.texture.region.*;
import java.io.*;
import org.anddev.andengine.engine.camera.*;
import org.anddev.andengine.collision.*;
import org.anddev.andengine.util.*;
import org.anddev.andengine.opengl.util.*;
import javax.microedition.khronos.opengles.*;

public class TMXLayer extends RectangularShape implements TMXConstants
{
    private final float[] mCullingVertices;
    private final int mGlobalTileIDsExpected;
    private final String mName;
    private final TMXProperties<TMXLayerProperty> mTMXLayerProperties;
    private final TMXTiledMap mTMXTiledMap;
    private final TMXTile[][] mTMXTiles;
    private final int mTileColumns;
    private final int mTileRows;
    private int mTilesAdded;
    
    public TMXLayer(final TMXTiledMap mtmxTiledMap, final Attributes attributes) {
        super(0.0f, 0.0f, 0.0f, 0.0f, null);
        this.mCullingVertices = new float[8];
        this.mTMXLayerProperties = new TMXProperties<TMXLayerProperty>();
        this.mTMXTiledMap = mtmxTiledMap;
        this.mName = attributes.getValue("", "name");
        this.mTileColumns = SAXUtils.getIntAttributeOrThrow(attributes, "width");
        this.mTileRows = SAXUtils.getIntAttributeOrThrow(attributes, "height");
        this.mTMXTiles = (TMXTile[][])Array.newInstance(TMXTile.class, this.mTileRows, this.mTileColumns);
        super.mWidth = mtmxTiledMap.getTileWidth() * this.mTileColumns;
        final float mWidth = super.mWidth;
        super.mBaseWidth = mWidth;
        super.mHeight = mtmxTiledMap.getTileHeight() * this.mTileRows;
        final float mHeight = super.mHeight;
        super.mBaseHeight = mHeight;
        this.mRotationCenterX = mWidth * 0.5f;
        this.mRotationCenterY = mHeight * 0.5f;
        this.mScaleCenterX = this.mRotationCenterX;
        this.mScaleCenterY = this.mRotationCenterY;
        this.mGlobalTileIDsExpected = this.mTileColumns * this.mTileRows;
        this.setVisible(SAXUtils.getIntAttribute(attributes, "visible", 1) == 1);
        this.setAlpha(SAXUtils.getFloatAttribute(attributes, "opacity", 1.0f));
    }
    
    private void addTileByGlobalTileID(final int n, final TMXLoader.ITMXTilePropertiesListener itmxTilePropertiesListener) {
        final TMXTiledMap mtmxTiledMap = this.mTMXTiledMap;
        final int mTileColumns = this.mTileColumns;
        final int n2 = this.mTilesAdded % mTileColumns;
        final int n3 = this.mTilesAdded / mTileColumns;
        final TMXTile[][] mtmxTiles = this.mTMXTiles;
        TextureRegion textureRegionFromGlobalTileID;
        if (n == 0) {
            textureRegionFromGlobalTileID = null;
        }
        else {
            textureRegionFromGlobalTileID = mtmxTiledMap.getTextureRegionFromGlobalTileID(n);
        }
        final TMXTile tmxTile = new TMXTile(n, n2, n3, this.mTMXTiledMap.getTileWidth(), this.mTMXTiledMap.getTileHeight(), textureRegionFromGlobalTileID);
        mtmxTiles[n3][n2] = tmxTile;
        if (n != 0 && itmxTilePropertiesListener != null) {
            final TMXProperties<TMXTileProperty> tmxTileProperties = mtmxTiledMap.getTMXTileProperties(n);
            if (tmxTileProperties != null) {
                itmxTilePropertiesListener.onTMXTileWithPropertiesCreated(mtmxTiledMap, this, tmxTile, tmxTileProperties);
            }
        }
        ++this.mTilesAdded;
    }
    
    private int readGlobalTileID(final DataInputStream dataInputStream) throws IOException {
        final int read = dataInputStream.read();
        final int read2 = dataInputStream.read();
        final int read3 = dataInputStream.read();
        final int read4 = dataInputStream.read();
        if (read < 0 || read2 < 0 || read3 < 0 || read4 < 0) {
            throw new IllegalArgumentException("Couldn't read global Tile ID.");
        }
        return read | read2 << 8 | read3 << 16 | read4 << 24;
    }
    
    public void addTMXLayerProperty(final TMXLayerProperty tmxLayerProperty) {
        this.mTMXLayerProperties.add(tmxLayerProperty);
    }
    
    @Override
    protected void drawVertices(final GL10 gl10, final Camera camera) {
        final TMXTile[][] mtmxTiles = this.mTMXTiles;
        final int mTileColumns = this.mTileColumns;
        final int mTileRows = this.mTileRows;
        final int tileWidth = this.mTMXTiledMap.getTileWidth();
        final int tileHeight = this.mTMXTiledMap.getTileHeight();
        final float n = tileWidth * this.mScaleX;
        final float n2 = tileHeight * this.mScaleY;
        final float[] mCullingVertices = this.mCullingVertices;
        RectangularShapeCollisionChecker.fillVertices(this, mCullingVertices);
        final float n3 = mCullingVertices[0];
        final float n4 = mCullingVertices[1];
        final float minX = camera.getMinX();
        final float minY = camera.getMinY();
        final float width = camera.getWidth();
        final float height = camera.getHeight();
        final float n5 = (minX - n3) / n;
        final int bringToBounds = MathUtils.bringToBounds(0, mTileColumns - 1, (int)Math.floor(n5));
        final int bringToBounds2 = MathUtils.bringToBounds(0, mTileColumns - 1, (int)Math.ceil(n5 + width / n));
        final float n6 = (minY - n4) / n2;
        final int bringToBounds3 = MathUtils.bringToBounds(0, mTileRows - 1, (int)Math.floor(n6));
        final int bringToBounds4 = MathUtils.bringToBounds(0, mTileRows - 1, (int)Math.floor(n6 + height / n2));
        final int n7 = tileWidth * (1 + (bringToBounds2 - bringToBounds));
        gl10.glTranslatef((float)(bringToBounds * tileWidth), (float)(bringToBounds3 * tileHeight), 0.0f);
        for (int i = bringToBounds3; i <= bringToBounds4; ++i) {
            final TMXTile[] array = mtmxTiles[i];
            for (int j = bringToBounds; j <= bringToBounds2; ++j) {
                final TextureRegion mTextureRegion = array[j].mTextureRegion;
                if (mTextureRegion != null) {
                    mTextureRegion.onApply(gl10);
                    gl10.glDrawArrays(5, 0, 4);
                }
                gl10.glTranslatef((float)tileWidth, 0.0f, 0.0f);
            }
            gl10.glTranslatef((float)(-n7), (float)tileHeight, 0.0f);
        }
        gl10.glLoadIdentity();
    }
    
    public String getName() {
        return this.mName;
    }
    
    public TMXProperties<TMXLayerProperty> getTMXLayerProperties() {
        return this.mTMXLayerProperties;
    }
    
    public TMXTile getTMXTile(final int n, final int n2) throws ArrayIndexOutOfBoundsException {
        return this.mTMXTiles[n2][n];
    }
    
    public TMXTile getTMXTileAt(final float n, final float n2) {
        final float[] convertSceneToLocalCoordinates = this.convertSceneToLocalCoordinates(n, n2);
        final TMXTiledMap mtmxTiledMap = this.mTMXTiledMap;
        final int n3 = (int)(convertSceneToLocalCoordinates[0] / mtmxTiledMap.getTileWidth());
        if (n3 >= 0 && n3 <= -1 + this.mTileColumns) {
            final int n4 = (int)(convertSceneToLocalCoordinates[1] / mtmxTiledMap.getTileWidth());
            if (n4 >= 0 && n4 <= -1 + this.mTileRows) {
                return this.mTMXTiles[n4][n3];
            }
        }
        return null;
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
    
    void initializeTMXTileFromXML(final Attributes attributes, final TMXLoader.ITMXTilePropertiesListener itmxTilePropertiesListener) {
        this.addTileByGlobalTileID(SAXUtils.getIntAttributeOrThrow(attributes, "gid"), itmxTilePropertiesListener);
    }
    
    void initializeTMXTilesFromDataString(final String p0, final String p1, final String p2, final TMXLoader.ITMXTilePropertiesListener p3) throws IOException, IllegalArgumentException {
        // 
        // This method could not be decompiled.
        // 
        // Original Bytecode:
        // 
        //     1: astore          5
        //     3: new             Ljava/io/ByteArrayInputStream;
        //     6: dup            
        //     7: aload_1        
        //     8: ldc_w           "UTF-8"
        //    11: invokevirtual   java/lang/String.getBytes:(Ljava/lang/String;)[B
        //    14: invokespecial   java/io/ByteArrayInputStream.<init>:([B)V
        //    17: astore          6
        //    19: aload_2        
        //    20: ifnull          178
        //    23: aload_2        
        //    24: ldc_w           "base64"
        //    27: invokevirtual   java/lang/String.equals:(Ljava/lang/Object;)Z
        //    30: ifeq            178
        //    33: new             Lorg/anddev/andengine/util/Base64InputStream;
        //    36: dup            
        //    37: aload           6
        //    39: iconst_0       
        //    40: invokespecial   org/anddev/andengine/util/Base64InputStream.<init>:(Ljava/io/InputStream;I)V
        //    43: astore          8
        //    45: aload_3        
        //    46: ifnull          171
        //    49: aload_3        
        //    50: ldc_w           "gzip"
        //    53: invokevirtual   java/lang/String.equals:(Ljava/lang/Object;)Z
        //    56: ifeq            106
        //    59: new             Ljava/util/zip/GZIPInputStream;
        //    62: dup            
        //    63: aload           8
        //    65: invokespecial   java/util/zip/GZIPInputStream.<init>:(Ljava/io/InputStream;)V
        //    68: astore          9
        //    70: new             Ljava/io/DataInputStream;
        //    73: dup            
        //    74: aload           9
        //    76: invokespecial   java/io/DataInputStream.<init>:(Ljava/io/InputStream;)V
        //    79: astore          10
        //    81: aload_0        
        //    82: getfield        org/anddev/andengine/entity/layer/tiled/tmx/TMXLayer.mTilesAdded:I
        //    85: istore          11
        //    87: aload_0        
        //    88: getfield        org/anddev/andengine/entity/layer/tiled/tmx/TMXLayer.mGlobalTileIDsExpected:I
        //    91: istore          12
        //    93: iload           11
        //    95: iload           12
        //    97: if_icmplt       147
        //   100: aload           10
        //   102: invokestatic    org/anddev/andengine/util/StreamUtils.closeStream:(Ljava/io/Closeable;)V
        //   105: return         
        //   106: new             Ljava/lang/IllegalArgumentException;
        //   109: dup            
        //   110: new             Ljava/lang/StringBuilder;
        //   113: dup            
        //   114: ldc_w           "Supplied compression '"
        //   117: invokespecial   java/lang/StringBuilder.<init>:(Ljava/lang/String;)V
        //   120: aload_3        
        //   121: invokevirtual   java/lang/StringBuilder.append:(Ljava/lang/String;)Ljava/lang/StringBuilder;
        //   124: ldc_w           "' is not supported yet."
        //   127: invokevirtual   java/lang/StringBuilder.append:(Ljava/lang/String;)Ljava/lang/StringBuilder;
        //   130: invokevirtual   java/lang/StringBuilder.toString:()Ljava/lang/String;
        //   133: invokespecial   java/lang/IllegalArgumentException.<init>:(Ljava/lang/String;)V
        //   136: athrow         
        //   137: astore          7
        //   139: aload           5
        //   141: invokestatic    org/anddev/andengine/util/StreamUtils.closeStream:(Ljava/io/Closeable;)V
        //   144: aload           7
        //   146: athrow         
        //   147: aload_0        
        //   148: aload_0        
        //   149: aload           10
        //   151: invokespecial   org/anddev/andengine/entity/layer/tiled/tmx/TMXLayer.readGlobalTileID:(Ljava/io/DataInputStream;)I
        //   154: aload           4
        //   156: invokespecial   org/anddev/andengine/entity/layer/tiled/tmx/TMXLayer.addTileByGlobalTileID:(ILorg/anddev/andengine/entity/layer/tiled/tmx/TMXLoader$ITMXTilePropertiesListener;)V
        //   159: goto            81
        //   162: astore          7
        //   164: aload           10
        //   166: astore          5
        //   168: goto            139
        //   171: aload           8
        //   173: astore          9
        //   175: goto            70
        //   178: aload           6
        //   180: astore          8
        //   182: goto            45
        //    Exceptions:
        //  throws java.io.IOException
        //  throws java.lang.IllegalArgumentException
        //    Exceptions:
        //  Try           Handler
        //  Start  End    Start  End    Type
        //  -----  -----  -----  -----  ----
        //  3      19     137    139    Any
        //  23     45     137    139    Any
        //  49     70     137    139    Any
        //  70     81     137    139    Any
        //  81     93     162    171    Any
        //  106    137    137    139    Any
        //  147    159    162    171    Any
        // 
        // The error that occurred was:
        // 
        // java.lang.IllegalStateException: Expression is linked from several locations: Label_0081:
        //     at com.strobel.decompiler.ast.Error.expressionLinkedFromMultipleLocations(Error.java:27)
        //     at com.strobel.decompiler.ast.AstOptimizer.mergeDisparateObjectInitializations(AstOptimizer.java:2592)
        //     at com.strobel.decompiler.ast.AstOptimizer.optimize(AstOptimizer.java:235)
        //     at com.strobel.decompiler.ast.AstOptimizer.optimize(AstOptimizer.java:42)
        //     at com.strobel.decompiler.languages.java.ast.AstMethodBodyBuilder.createMethodBody(AstMethodBodyBuilder.java:214)
        //     at com.strobel.decompiler.languages.java.ast.AstMethodBodyBuilder.createMethodBody(AstMethodBodyBuilder.java:99)
        //     at com.strobel.decompiler.languages.java.ast.AstBuilder.createMethodBody(AstBuilder.java:756)
        //     at com.strobel.decompiler.languages.java.ast.AstBuilder.createMethod(AstBuilder.java:654)
        //     at com.strobel.decompiler.languages.java.ast.AstBuilder.addTypeMembers(AstBuilder.java:531)
        //     at com.strobel.decompiler.languages.java.ast.AstBuilder.createTypeCore(AstBuilder.java:498)
        //     at com.strobel.decompiler.languages.java.ast.AstBuilder.createTypeNoCache(AstBuilder.java:140)
        //     at com.strobel.decompiler.languages.java.ast.AstBuilder.createType(AstBuilder.java:129)
        //     at com.strobel.decompiler.languages.java.ast.AstBuilder.addType(AstBuilder.java:104)
        //     at com.strobel.decompiler.languages.java.JavaLanguage.decompileType(JavaLanguage.java:59)
        //     at com.strobel.decompiler.DecompilerDriver.decompileType(DecompilerDriver.java:301)
        //     at com.strobel.decompiler.DecompilerDriver.decompileJar(DecompilerDriver.java:224)
        //     at com.strobel.decompiler.DecompilerDriver.main(DecompilerDriver.java:109)
        // 
        // 
        // This method could not be decompiled.
        // 
        // Original Bytecode:
        // 
        //     1: astore          5
        //     3: new             Ljava/io/ByteArrayInputStream;
        //     6: dup            
        //     7: aload_1        
        //     8: ldc_w           "UTF-8"
        //    11: invokevirtual   java/lang/String.getBytes:(Ljava/lang/String;)[B
        //    14: invokespecial   java/io/ByteArrayInputStream.<init>:([B)V
        //    17: astore          6
        //    19: aload_2        
        //    20: ifnull          178
        //    23: aload_2        
        //    24: ldc_w           "base64"
        //    27: invokevirtual   java/lang/String.equals:(Ljava/lang/Object;)Z
        //    30: ifeq            178
        //    33: new             Lorg/anddev/andengine/util/Base64InputStream;
        //    36: dup            
        //    37: aload           6
        //    39: iconst_0       
        //    40: invokespecial   org/anddev/andengine/util/Base64InputStream.<init>:(Ljava/io/InputStream;I)V
        //    43: astore          8
        //    45: aload_3        
        //    46: ifnull          171
        //    49: aload_3        
        //    50: ldc_w           "gzip"
        //    53: invokevirtual   java/lang/String.equals:(Ljava/lang/Object;)Z
        //    56: ifeq            106
        //    59: new             Ljava/util/zip/GZIPInputStream;
        //    62: dup            
        //    63: aload           8
        //    65: invokespecial   java/util/zip/GZIPInputStream.<init>:(Ljava/io/InputStream;)V
        //    68: astore          9
        //    70: new             Ljava/io/DataInputStream;
        //    73: dup            
        //    74: aload           9
        //    76: invokespecial   java/io/DataInputStream.<init>:(Ljava/io/InputStream;)V
        //    79: astore          10
        //    81: aload_0        
        //    82: getfield        org/anddev/andengine/entity/layer/tiled/tmx/TMXLayer.mTilesAdded:I
        //    85: istore          11
        //    87: aload_0        
        //    88: getfield        org/anddev/andengine/entity/layer/tiled/tmx/TMXLayer.mGlobalTileIDsExpected:I
        //    91: istore          12
        //    93: iload           11
        //    95: iload           12
        //    97: if_icmplt       147
        //   100: aload           10
        //   102: invokestatic    org/anddev/andengine/util/StreamUtils.closeStream:(Ljava/io/Closeable;)V
        //   105: return         
        //   106: new             Ljava/lang/IllegalArgumentException;
        //   109: dup            
        //   110: new             Ljava/lang/StringBuilder;
        //   113: dup            
        //   114: ldc_w           "Supplied compression '"
        //   117: invokespecial   java/lang/StringBuilder.<init>:(Ljava/lang/String;)V
        //   120: aload_3        
        //   121: invokevirtual   java/lang/StringBuilder.append:(Ljava/lang/String;)Ljava/lang/StringBuilder;
        //   124: ldc_w           "' is not supported yet."
        //   127: invokevirtual   java/lang/StringBuilder.append:(Ljava/lang/String;)Ljava/lang/StringBuilder;
        //   130: invokevirtual   java/lang/StringBuilder.toString:()Ljava/lang/String;
        //   133: invokespecial   java/lang/IllegalArgumentException.<init>:(Ljava/lang/String;)V
        //   136: athrow         
        //   137: astore          7
        //   139: aload           5
        //   141: invokestatic    org/anddev/andengine/util/StreamUtils.closeStream:(Ljava/io/Closeable;)V
        //   144: aload           7
        //   146: athrow         
        //   147: aload_0        
        //   148: aload_0        
        //   149: aload           10
        //   151: invokespecial   org/anddev/andengine/entity/layer/tiled/tmx/TMXLayer.readGlobalTileID:(Ljava/io/DataInputStream;)I
        //   154: aload           4
        //   156: invokespecial   org/anddev/andengine/entity/layer/tiled/tmx/TMXLayer.addTileByGlobalTileID:(ILorg/anddev/andengine/entity/layer/tiled/tmx/TMXLoader$ITMXTilePropertiesListener;)V
        //   159: goto            81
        //   162: astore          7
        //   164: aload           10
        //   166: astore          5
        //   168: goto            139
        //   171: aload           8
        //   173: astore          9
        //   175: goto            70
        //   178: aload           6
        //   180: astore          8
        //   182: goto            45
        //    Exceptions:
        //  throws java.io.IOException
        //  throws java.lang.IllegalArgumentException
        //    Exceptions:
        //  Try           Handler
        //  Start  End    Start  End    Type
        //  -----  -----  -----  -----  ----
        //  3      19     137    139    Any
        //  23     45     137    139    Any
        //  49     70     137    139    Any
        //  70     81     137    139    Any
        //  81     93     162    171    Any
        //  106    137    137    139    Any
        //  147    159    162    171    Any
        // 
        // The error that occurred was:
        // 
        // java.lang.IllegalStateException: Expression is linked from several locations: Label_0081:
        //     at com.strobel.decompiler.ast.Error.expressionLinkedFromMultipleLocations(Error.java:27)
        //     at com.strobel.decompiler.ast.AstOptimizer.mergeDisparateObjectInitializations(AstOptimizer.java:2592)
        //     at com.strobel.decompiler.ast.AstOptimizer.optimize(AstOptimizer.java:235)
        //     at com.strobel.decompiler.ast.AstOptimizer.optimize(AstOptimizer.java:42)
        //     at com.strobel.decompiler.languages.java.ast.AstMethodBodyBuilder.createMethodBody(AstMethodBodyBuilder.java:214)
        //     at com.strobel.decompiler.languages.java.ast.AstMethodBodyBuilder.createMethodBody(AstMethodBodyBuilder.java:99)
        //     at com.strobel.decompiler.languages.java.ast.AstBuilder.createMethodBody(AstBuilder.java:756)
        //     at com.strobel.decompiler.languages.java.ast.AstBuilder.createMethod(AstBuilder.java:654)
        //     at com.strobel.decompiler.languages.java.ast.AstBuilder.addTypeMembers(AstBuilder.java:531)
        //     at com.strobel.decompiler.languages.java.ast.AstBuilder.createTypeCore(AstBuilder.java:498)
        //     at com.strobel.decompiler.languages.java.ast.AstBuilder.createTypeNoCache(AstBuilder.java:140)
        //     at com.strobel.decompiler.languages.java.ast.AstBuilder.createType(AstBuilder.java:129)
        //     at com.strobel.decompiler.languages.java.ast.AstBuilder.addType(AstBuilder.java:104)
        //     at com.strobel.decompiler.languages.java.JavaLanguage.decompileType(JavaLanguage.java:59)
        //     at com.strobel.decompiler.DecompilerDriver.decompileType(DecompilerDriver.java:301)
        //     at com.strobel.decompiler.DecompilerDriver.decompileJar(DecompilerDriver.java:224)
        //     at com.strobel.decompiler.DecompilerDriver.main(DecompilerDriver.java:109)
        // 
        throw new IllegalStateException("An error occurred while decompiling this method.");
    }
    
    @Override
    protected void onApplyVertices(final GL10 gl10) {
        if (GLHelper.EXTENSIONS_VERTEXBUFFEROBJECTS) {
            final GL11 gl2 = (GL11)gl10;
            this.mTMXTiledMap.getSharedVertexBuffer().selectOnHardware(gl2);
            GLHelper.vertexZeroPointer(gl2);
            return;
        }
        GLHelper.vertexPointer(gl10, this.mTMXTiledMap.getSharedVertexBuffer().getFloatBuffer());
    }
    
    @Override
    protected void onInitDraw(final GL10 gl10) {
        super.onInitDraw(gl10);
        GLHelper.enableTextures(gl10);
        GLHelper.enableTexCoordArray(gl10);
    }
    
    @Override
    protected void onManagedUpdate(final float n) {
    }
    
    @Override
    protected void onUpdateVertexBuffer() {
    }
    
    @Deprecated
    @Override
    public void setRotation(final float n) {
    }
}
