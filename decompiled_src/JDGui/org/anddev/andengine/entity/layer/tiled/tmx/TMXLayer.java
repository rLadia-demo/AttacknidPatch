package org.anddev.andengine.entity.layer.tiled.tmx;

import java.io.DataInputStream;
import java.io.IOException;
import java.lang.reflect.Array;
import javax.microedition.khronos.opengles.GL10;
import javax.microedition.khronos.opengles.GL11;
import org.anddev.andengine.collision.RectangularShapeCollisionChecker;
import org.anddev.andengine.engine.camera.Camera;
import org.anddev.andengine.entity.layer.tiled.tmx.util.constants.TMXConstants;
import org.anddev.andengine.entity.shape.RectangularShape;
import org.anddev.andengine.opengl.texture.region.TextureRegion;
import org.anddev.andengine.opengl.util.GLHelper;
import org.anddev.andengine.opengl.vertex.RectangleVertexBuffer;
import org.anddev.andengine.util.MathUtils;
import org.anddev.andengine.util.SAXUtils;
import org.xml.sax.Attributes;

public class TMXLayer
  extends RectangularShape
  implements TMXConstants
{
  private final float[] mCullingVertices = new float[8];
  private final int mGlobalTileIDsExpected;
  private final String mName;
  private final TMXProperties<TMXLayerProperty> mTMXLayerProperties = new TMXProperties();
  private final TMXTiledMap mTMXTiledMap;
  private final TMXTile[][] mTMXTiles;
  private final int mTileColumns;
  private final int mTileRows;
  private int mTilesAdded;
  
  public TMXLayer(TMXTiledMap paramTMXTiledMap, Attributes paramAttributes)
  {
    super(0.0F, 0.0F, 0.0F, 0.0F, null);
    this.mTMXTiledMap = paramTMXTiledMap;
    this.mName = paramAttributes.getValue("", "name");
    this.mTileColumns = SAXUtils.getIntAttributeOrThrow(paramAttributes, "width");
    this.mTileRows = SAXUtils.getIntAttributeOrThrow(paramAttributes, "height");
    this.mTMXTiles = ((TMXTile[][])Array.newInstance(TMXTile.class, new int[] { this.mTileRows, this.mTileColumns }));
    this.mWidth = (paramTMXTiledMap.getTileWidth() * this.mTileColumns);
    float f1 = this.mWidth;
    this.mBaseWidth = f1;
    this.mHeight = (paramTMXTiledMap.getTileHeight() * this.mTileRows);
    float f2 = this.mHeight;
    this.mBaseHeight = f2;
    this.mRotationCenterX = (f1 * 0.5F);
    this.mRotationCenterY = (f2 * 0.5F);
    this.mScaleCenterX = this.mRotationCenterX;
    this.mScaleCenterY = this.mRotationCenterY;
    this.mGlobalTileIDsExpected = (this.mTileColumns * this.mTileRows);
    if (SAXUtils.getIntAttribute(paramAttributes, "visible", 1) == 1) {}
    for (boolean bool = true;; bool = false)
    {
      setVisible(bool);
      setAlpha(SAXUtils.getFloatAttribute(paramAttributes, "opacity", 1.0F));
      return;
    }
  }
  
  private void addTileByGlobalTileID(int paramInt, TMXLoader.ITMXTilePropertiesListener paramITMXTilePropertiesListener)
  {
    TMXTiledMap localTMXTiledMap = this.mTMXTiledMap;
    int i = this.mTileColumns;
    int j = this.mTilesAdded % i;
    int k = this.mTilesAdded / i;
    TMXTile[][] arrayOfTMXTile = this.mTMXTiles;
    if (paramInt == 0) {}
    for (TextureRegion localTextureRegion = null;; localTextureRegion = localTMXTiledMap.getTextureRegionFromGlobalTileID(paramInt))
    {
      TMXTile localTMXTile = new TMXTile(paramInt, j, k, this.mTMXTiledMap.getTileWidth(), this.mTMXTiledMap.getTileHeight(), localTextureRegion);
      arrayOfTMXTile[k][j] = localTMXTile;
      if ((paramInt != 0) && (paramITMXTilePropertiesListener != null))
      {
        TMXProperties localTMXProperties = localTMXTiledMap.getTMXTileProperties(paramInt);
        if (localTMXProperties != null) {
          paramITMXTilePropertiesListener.onTMXTileWithPropertiesCreated(localTMXTiledMap, this, localTMXTile, localTMXProperties);
        }
      }
      this.mTilesAdded = (1 + this.mTilesAdded);
      return;
    }
  }
  
  private int readGlobalTileID(DataInputStream paramDataInputStream)
    throws IOException
  {
    int i = paramDataInputStream.read();
    int j = paramDataInputStream.read();
    int k = paramDataInputStream.read();
    int m = paramDataInputStream.read();
    if ((i < 0) || (j < 0) || (k < 0) || (m < 0)) {
      throw new IllegalArgumentException("Couldn't read global Tile ID.");
    }
    return i | j << 8 | k << 16 | m << 24;
  }
  
  public void addTMXLayerProperty(TMXLayerProperty paramTMXLayerProperty)
  {
    this.mTMXLayerProperties.add(paramTMXLayerProperty);
  }
  
  protected void drawVertices(GL10 paramGL10, Camera paramCamera)
  {
    TMXTile[][] arrayOfTMXTile = this.mTMXTiles;
    int i = this.mTileColumns;
    int j = this.mTileRows;
    int k = this.mTMXTiledMap.getTileWidth();
    int m = this.mTMXTiledMap.getTileHeight();
    float f1 = k * this.mScaleX;
    float f2 = m * this.mScaleY;
    float[] arrayOfFloat = this.mCullingVertices;
    RectangularShapeCollisionChecker.fillVertices(this, arrayOfFloat);
    float f3 = arrayOfFloat[0];
    float f4 = arrayOfFloat[1];
    float f5 = paramCamera.getMinX();
    float f6 = paramCamera.getMinY();
    float f7 = paramCamera.getWidth();
    float f8 = paramCamera.getHeight();
    float f9 = (f5 - f3) / f1;
    int n = MathUtils.bringToBounds(0, i - 1, (int)Math.floor(f9));
    int i1 = MathUtils.bringToBounds(0, i - 1, (int)Math.ceil(f9 + f7 / f1));
    float f10 = (f6 - f4) / f2;
    int i2 = MathUtils.bringToBounds(0, j - 1, (int)Math.floor(f10));
    int i3 = MathUtils.bringToBounds(0, j - 1, (int)Math.floor(f10 + f8 / f2));
    int i4 = k * (1 + (i1 - n));
    paramGL10.glTranslatef(n * k, i2 * m, 0.0F);
    int i5 = i2;
    if (i5 > i3)
    {
      paramGL10.glLoadIdentity();
      return;
    }
    TMXTile[] arrayOfTMXTile1 = arrayOfTMXTile[i5];
    for (int i6 = n;; i6++)
    {
      if (i6 > i1)
      {
        paramGL10.glTranslatef(-i4, m, 0.0F);
        i5++;
        break;
      }
      TextureRegion localTextureRegion = arrayOfTMXTile1[i6].mTextureRegion;
      if (localTextureRegion != null)
      {
        localTextureRegion.onApply(paramGL10);
        paramGL10.glDrawArrays(5, 0, 4);
      }
      paramGL10.glTranslatef(k, 0.0F, 0.0F);
    }
  }
  
  public String getName()
  {
    return this.mName;
  }
  
  public TMXProperties<TMXLayerProperty> getTMXLayerProperties()
  {
    return this.mTMXLayerProperties;
  }
  
  public TMXTile getTMXTile(int paramInt1, int paramInt2)
    throws ArrayIndexOutOfBoundsException
  {
    return this.mTMXTiles[paramInt2][paramInt1];
  }
  
  public TMXTile getTMXTileAt(float paramFloat1, float paramFloat2)
  {
    float[] arrayOfFloat = convertSceneToLocalCoordinates(paramFloat1, paramFloat2);
    TMXTiledMap localTMXTiledMap = this.mTMXTiledMap;
    int i = (int)(arrayOfFloat[0] / localTMXTiledMap.getTileWidth());
    if ((i < 0) || (i > -1 + this.mTileColumns)) {}
    int j;
    do
    {
      return null;
      j = (int)(arrayOfFloat[1] / localTMXTiledMap.getTileWidth());
    } while ((j < 0) || (j > -1 + this.mTileRows));
    return this.mTMXTiles[j][i];
  }
  
  public TMXTile[][] getTMXTiles()
  {
    return this.mTMXTiles;
  }
  
  public int getTileColumns()
  {
    return this.mTileColumns;
  }
  
  public int getTileRows()
  {
    return this.mTileRows;
  }
  
  void initializeTMXTileFromXML(Attributes paramAttributes, TMXLoader.ITMXTilePropertiesListener paramITMXTilePropertiesListener)
  {
    addTileByGlobalTileID(SAXUtils.getIntAttributeOrThrow(paramAttributes, "gid"), paramITMXTilePropertiesListener);
  }
  
  /* Error */
  void initializeTMXTilesFromDataString(String paramString1, String paramString2, String paramString3, TMXLoader.ITMXTilePropertiesListener paramITMXTilePropertiesListener)
    throws IOException, IllegalArgumentException
  {
    // Byte code:
    //   0: aconst_null
    //   1: astore 5
    //   3: new 270	java/io/ByteArrayInputStream
    //   6: dup
    //   7: aload_1
    //   8: ldc_w 272
    //   11: invokevirtual 278	java/lang/String:getBytes	(Ljava/lang/String;)[B
    //   14: invokespecial 281	java/io/ByteArrayInputStream:<init>	([B)V
    //   17: astore 6
    //   19: aload_2
    //   20: ifnull +158 -> 178
    //   23: aload_2
    //   24: ldc_w 283
    //   27: invokevirtual 286	java/lang/String:equals	(Ljava/lang/Object;)Z
    //   30: ifeq +148 -> 178
    //   33: new 288	org/anddev/andengine/util/Base64InputStream
    //   36: dup
    //   37: aload 6
    //   39: iconst_0
    //   40: invokespecial 291	org/anddev/andengine/util/Base64InputStream:<init>	(Ljava/io/InputStream;I)V
    //   43: astore 8
    //   45: aload_3
    //   46: ifnull +125 -> 171
    //   49: aload_3
    //   50: ldc_w 293
    //   53: invokevirtual 286	java/lang/String:equals	(Ljava/lang/Object;)Z
    //   56: ifeq +50 -> 106
    //   59: new 295	java/util/zip/GZIPInputStream
    //   62: dup
    //   63: aload 8
    //   65: invokespecial 298	java/util/zip/GZIPInputStream:<init>	(Ljava/io/InputStream;)V
    //   68: astore 9
    //   70: new 159	java/io/DataInputStream
    //   73: dup
    //   74: aload 9
    //   76: invokespecial 299	java/io/DataInputStream:<init>	(Ljava/io/InputStream;)V
    //   79: astore 10
    //   81: aload_0
    //   82: getfield 136	org/anddev/andengine/entity/layer/tiled/tmx/TMXLayer:mTilesAdded	I
    //   85: istore 11
    //   87: aload_0
    //   88: getfield 112	org/anddev/andengine/entity/layer/tiled/tmx/TMXLayer:mGlobalTileIDsExpected	I
    //   91: istore 12
    //   93: iload 11
    //   95: iload 12
    //   97: if_icmplt +50 -> 147
    //   100: aload 10
    //   102: invokestatic 305	org/anddev/andengine/util/StreamUtils:closeStream	(Ljava/io/Closeable;)V
    //   105: return
    //   106: new 164	java/lang/IllegalArgumentException
    //   109: dup
    //   110: new 307	java/lang/StringBuilder
    //   113: dup
    //   114: ldc_w 309
    //   117: invokespecial 310	java/lang/StringBuilder:<init>	(Ljava/lang/String;)V
    //   120: aload_3
    //   121: invokevirtual 314	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   124: ldc_w 316
    //   127: invokevirtual 314	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   130: invokevirtual 319	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   133: invokespecial 169	java/lang/IllegalArgumentException:<init>	(Ljava/lang/String;)V
    //   136: athrow
    //   137: astore 7
    //   139: aload 5
    //   141: invokestatic 305	org/anddev/andengine/util/StreamUtils:closeStream	(Ljava/io/Closeable;)V
    //   144: aload 7
    //   146: athrow
    //   147: aload_0
    //   148: aload_0
    //   149: aload 10
    //   151: invokespecial 321	org/anddev/andengine/entity/layer/tiled/tmx/TMXLayer:readGlobalTileID	(Ljava/io/DataInputStream;)I
    //   154: aload 4
    //   156: invokespecial 266	org/anddev/andengine/entity/layer/tiled/tmx/TMXLayer:addTileByGlobalTileID	(ILorg/anddev/andengine/entity/layer/tiled/tmx/TMXLoader$ITMXTilePropertiesListener;)V
    //   159: goto -78 -> 81
    //   162: astore 7
    //   164: aload 10
    //   166: astore 5
    //   168: goto -29 -> 139
    //   171: aload 8
    //   173: astore 9
    //   175: goto -105 -> 70
    //   178: aload 6
    //   180: astore 8
    //   182: goto -137 -> 45
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	185	0	this	TMXLayer
    //   0	185	1	paramString1	String
    //   0	185	2	paramString2	String
    //   0	185	3	paramString3	String
    //   0	185	4	paramITMXTilePropertiesListener	TMXLoader.ITMXTilePropertiesListener
    //   1	166	5	localObject1	java.lang.Object
    //   17	162	6	localByteArrayInputStream	java.io.ByteArrayInputStream
    //   137	8	7	localObject2	java.lang.Object
    //   162	1	7	localObject3	java.lang.Object
    //   43	138	8	localObject4	java.lang.Object
    //   68	106	9	localObject5	java.lang.Object
    //   79	86	10	localDataInputStream	DataInputStream
    //   85	13	11	i	int
    //   91	7	12	j	int
    // Exception table:
    //   from	to	target	type
    //   3	19	137	finally
    //   23	45	137	finally
    //   49	70	137	finally
    //   70	81	137	finally
    //   106	137	137	finally
    //   81	93	162	finally
    //   147	159	162	finally
  }
  
  protected void onApplyVertices(GL10 paramGL10)
  {
    if (GLHelper.EXTENSIONS_VERTEXBUFFEROBJECTS)
    {
      GL11 localGL11 = (GL11)paramGL10;
      this.mTMXTiledMap.getSharedVertexBuffer().selectOnHardware(localGL11);
      GLHelper.vertexZeroPointer(localGL11);
      return;
    }
    GLHelper.vertexPointer(paramGL10, this.mTMXTiledMap.getSharedVertexBuffer().getFloatBuffer());
  }
  
  protected void onInitDraw(GL10 paramGL10)
  {
    super.onInitDraw(paramGL10);
    GLHelper.enableTextures(paramGL10);
    GLHelper.enableTexCoordArray(paramGL10);
  }
  
  protected void onManagedUpdate(float paramFloat) {}
  
  protected void onUpdateVertexBuffer() {}
  
  @Deprecated
  public void setRotation(float paramFloat) {}
}


/* Location:           C:\Users\Rodelle\Desktop\Attacknid\Tools\Attacknids-dex2jar.jar
 * Qualified Name:     org.anddev.andengine.entity.layer.tiled.tmx.TMXLayer
 * JD-Core Version:    0.7.0.1
 */