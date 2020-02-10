package timer;

import java.awt.image.BufferedImage;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;

import javax.imageio.ImageIO;

//import net.coobird.thumbnailator.Thumbnails;
//import net.coobird.thumbnailator.geometry.Position;

public class ThumbnailatorUtils {
//
//	/**
//	 * 指定大小進行縮放 
//	 * 若圖片橫比width小,高比height小,不變 若圖片橫比width小,高比height大,高縮小到height,圖片比例不變
//	 * 若圖片橫比width大,高比height小,橫縮小到width,圖片比例不變
//	 * 若圖片橫比width大,高比height大,圖片按比例縮小,橫為width或高為height
//	 * 
//	 * @param source
//	 *            輸入源
//	 * @param output
//	 *            輸出源
//	 * @param width
//	 *            寬
//	 * @param height
//	 *            高
//	 */
//	public static void ImgThumb(String source, String output, int width, int height) {
//		try {
//			Thumbnails.of(source).size(width, height).toFile(output);
//		} catch (IOException e) {
//			e.printStackTrace();
//		}
//	}
//
//	/**
//	 * 指定大小進行縮放
//	 * 
//	 * @param source
//	 *            輸入源
//	 * @param output
//	 *            輸出源
//	 * @param width
//	 *            寬
//	 * @param height
//	 *            高
//	 */
//	public static void ImgThumb(File source, String output, int width, int height) {
//		try {
//			Thumbnails.of(source).size(width, height).toFile(output);
//		} catch (IOException e) {
//			e.printStackTrace();
//		}
//	}
//
//	/**
//	 * 按照比例進行縮放
//	 * 
//	 * @param source
//	 *            輸入源
//	 * @param output
//	 *            輸出源
//	 * @param width
//	 *            寬
//	 * @param height
//	 *            高
//	 */
//	public static void ImgScale(String source, String output, double scale) {
//		try {
//			Thumbnails.of(source).scale(scale).toFile(output);
//		} catch (IOException e) {
//			e.printStackTrace();
//		}
//	}
//
//	public static void ImgScale(File source, String output, double scale) {
//		try {
//			Thumbnails.of(source).scale(scale).toFile(output);
//		} catch (IOException e) {
//			e.printStackTrace();
//		}
//	}
//
//	/**
//	 * 不按照比例,指定大小進行縮放
//	 * 
//	 * @param source
//	 *            輸入源
//	 * @param output
//	 *            輸出源
//	 * @param width
//	 *            寬
//	 * @param height
//	 *            高
//	 * @param keepAspectRatio
//	 *            預設是按照比例縮放的,值為false 時不按比例縮放
//	 */
//	public static void ImgNoScale(String source, String output, int width, int height, boolean keepAspectRatio) {
//		try {
//			Thumbnails.of(source).size(width, height).keepAspectRatio(keepAspectRatio).toFile(output);
//		} catch (IOException e) {
//			e.printStackTrace();
//		}
//	}
//
//	public static void ImgNoScale(File source, String output, int width, int height, boolean keepAspectRatio) {
//		try {
//			Thumbnails.of(source).size(width, height).keepAspectRatio(keepAspectRatio).toFile(output);
//		} catch (IOException e) {
//			e.printStackTrace();
//		}
//	}
//
//	/**
//	 * 旋轉 ,正數:順時針 負數:逆時針
//	 * 
//	 * @param source
//	 *            輸入源
//	 * @param output
//	 *            輸出源
//	 * @param width
//	 *            寬
//	 * @param height
//	 *            高
//	 * @param rotate
//	 *            角度
//	 */
//	public static void ImgRotate(String source, String output, int width, int height, double rotate) {
//		try {
//			Thumbnails.of(source).size(width, height).rotate(rotate).toFile(output);
//		} catch (IOException e) {
//			e.printStackTrace();
//		}
//	}
//
//	public static void ImgRotate(File source, String output, int width, int height, double rotate) {
//		try {
//			Thumbnails.of(source).size(width, height).rotate(rotate).toFile(output);
//		} catch (IOException e) {
//			e.printStackTrace();
//		}
//	}
//
//	/**
//	 * 水印
//	 * 
//	 * @param source
//	 *            輸入源
//	 * @param output
//	 *            輸入源
//	 * @param width
//	 *            寬
//	 * @param height
//	 *            高
//	 * @param position
//	 *            水印位置 Positions.BOTTOM_RIGHT o.5f
//	 * @param watermark
//	 *            水印圖片地址
//	 * @param transparency
//	 *            透明度 0.5f
//	 * @param quality
//	 *            圖片質量 0.8f
//	 */
//	public static void ImgWatermark(String source, String output, int width, int height, Position position, String watermark, float transparency, float quality) {
//		try {
//			Thumbnails.of(source).size(width, height).watermark(position, ImageIO.read(new File(watermark)), transparency).outputQuality(0.8f).toFile(output);
//		} catch (IOException e) {
//			e.printStackTrace();
//		}
//	}
//
//	public static void ImgWatermark(File source, String output, int width, int height, Position position, String watermark, float transparency, float quality) {
//		try {
//			Thumbnails.of(source).size(width, height).watermark(position, ImageIO.read(new File(watermark)), transparency).outputQuality(0.8f).toFile(output);
//		} catch (IOException e) {
//			e.printStackTrace();
//		}
//	}
//
//	/**
//	 * 裁剪圖片
//	 * 
//	 * @param source
//	 *            輸入源
//	 * @param output
//	 *            輸出源
//	 * @param position
//	 *            裁剪位置
//	 * @param x
//	 *            裁剪區域x
//	 * @param y
//	 *            裁剪區域y
//	 * @param width
//	 *            寬
//	 * @param height
//	 *            高
//	 * @param keepAspectRatio
//	 *            預設是按照比例縮放的,值為false 時不按比例縮放
//	 */
//	public static void ImgSourceRegion(String source, String output, Position position, int x, int y, int width, int height, boolean keepAspectRatio) {
//		try {
//			Thumbnails.of(source).sourceRegion(position, x, y).size(width, height).keepAspectRatio(keepAspectRatio).toFile(output);
//		} catch (IOException e) {
//			e.printStackTrace();
//		}
//	}
//
//	public static void ImgSourceRegion(File source, String output, Position position, int x, int y, int width, int height, boolean keepAspectRatio) {
//		try {
//			Thumbnails.of(source).sourceRegion(position, x, y).size(width, height).keepAspectRatio(keepAspectRatio).toFile(output);
//		} catch (IOException e) {
//			e.printStackTrace();
//		}
//	}
//
//	/**
//	 * 按座標裁剪
//	 * 
//	 * @param source
//	 *            輸入源
//	 * @param output
//	 *            輸出源
//	 * @param x
//	 *            起始x座標
//	 * @param y
//	 *            起始y座標
//	 * @param x1
//	 *            結束x座標
//	 * @param y1
//	 *            結束y座標
//	 * @param width
//	 *            寬
//	 * @param height
//	 *            高
//	 * @param keepAspectRatio
//	 *            預設是按照比例縮放的,值為false 時不按比例縮放
//	 */
//	public static void ImgSourceRegion(String source, String output, int x, int y, int x1, int y1, int width, int height, boolean keepAspectRatio) {
//		try {
//			Thumbnails.of(source).sourceRegion(x, y, x1, y1).size(width, height).keepAspectRatio(keepAspectRatio).toFile(output);
//		} catch (IOException e) {
//			e.printStackTrace();
//		}
//	}
//
//	public static void ImgSourceRegion(File source, String output, int x, int y, int x1, int y1, int width, int height, boolean keepAspectRatio) {
//		try {
//			Thumbnails.of(source).sourceRegion(x, y, x1, y1).size(width, height).keepAspectRatio(keepAspectRatio).toFile(output);
//		} catch (IOException e) {
//			e.printStackTrace();
//		}
//	}
//
//	/**
//	 * 轉化影象格式
//	 * 
//	 * @param source
//	 *            輸入源
//	 * @param output
//	 *            輸出源
//	 * @param width
//	 *            寬
//	 * @param height
//	 *            高
//	 * @param format
//	 *            圖片型別,gif、png、jpg
//	 */
//	public static void ImgFormat(String source, String output, int width, int height, String format) {
//		try {
//			Thumbnails.of(source).size(width, height).outputFormat(format).toFile(output);
//		} catch (IOException e) {
//			e.printStackTrace();
//		}
//	}
//
//	public static void ImgFormat(File source, String output, int width, int height, String format) {
//		try {
//			Thumbnails.of(source).size(width, height).outputFormat(format).toFile(output);
//		} catch (IOException e) {
//			e.printStackTrace();
//		}
//	}
//
//	/**
//	 * 輸出到OutputStream
//	 * 
//	 * @param source
//	 *            輸入源
//	 * @param output
//	 *            輸出源
//	 * @param width
//	 *            寬
//	 * @param height
//	 *            高
//	 * @return toOutputStream(流物件)
//	 */
//	public static OutputStream ImgOutputStream(String source, String output, int width, int height) {
//		OutputStream os = null;
//		try {
//			os = new FileOutputStream(output);
//			Thumbnails.of(source).size(width, height).toOutputStream(os);
//		} catch (IOException e) {
//			e.printStackTrace();
//		}
//		return os;
//	}
//
//	public static OutputStream ImgOutputStream(File source, String output, int width, int height) {
//		OutputStream os = null;
//		try {
//			os = new FileOutputStream(output);
//			Thumbnails.of(source).size(width, height).toOutputStream(os);
//		} catch (IOException e) {
//			e.printStackTrace();
//		}
//		return os;
//	}
//
//	/**
//	 * 輸出到BufferedImage
//	 * 
//	 * @param source
//	 *            輸入源
//	 * @param output
//	 *            輸出源
//	 * @param width
//	 *            寬
//	 * @param height
//	 *            高
//	 * @param format
//	 *            圖片型別,gif、png、jpg
//	 * @return BufferedImage
//	 */
//	public static BufferedImage ImgBufferedImage(String source, String output, int width, int height, String format) {
//		BufferedImage buf = null;
//		try {
//			buf = Thumbnails.of(source).size(width, height).asBufferedImage();
//			ImageIO.write(buf, format, new File(output));
//		} catch (IOException e) {
//			e.printStackTrace();
//		}
//		return buf;
//	}
//
//	public static BufferedImage ImgBufferedImage(File source, String output, int width, int height, String format) {
//		BufferedImage buf = null;
//		try {
//			buf = Thumbnails.of(source).size(width, height).asBufferedImage();
//			ImageIO.write(buf, format, new File(output));
//		} catch (IOException e) {
//			e.printStackTrace();
//		}
//		return buf;
//	}
}