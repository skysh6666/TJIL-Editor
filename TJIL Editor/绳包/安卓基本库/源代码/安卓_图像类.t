包名 结绳.安卓

@指代类("android.graphics.drawable.Drawable")
@禁止创建对象
类 可绘制对象
	
	@运算符重载
	方法 =(文件路径:文本)
		code return #<@可绘制对象>.createFromPath(#文件路径);
	结束 方法
	
	@静态
	方法 从路径创建(文件路径:文本):可绘制对象
		code return android.graphics.drawable.Drawable.createFromPath(#文件路径);
	结束 方法
	
	@静态
	方法 从文件流创建(文件输入流:文件输入流,源名称:文本):可绘制对象
		code return android.graphics.drawable.Drawable.createFromStream(#文件输入流,#源名称);
	结束 方法
	
	方法 绘制区域(左边:整数,上边:整数,右边:整数,下边:整数)
		code #this.setBounds(#左边,#上边,#右边,#下边);
	结束 方法
	
	方法 绘制区域2(绘制区域:矩形)
		code #this.setBounds(#绘制区域);
	结束 方法
	
	方法 从矩形拷贝区域(被绘制区域:矩形)
		code #this.copyBounds(#被绘制区域);
	结束 方法
	
	方法 从矩形拷贝区域(被绘制区域:矩形)
		code #this.copyBounds(#被绘制区域);
	结束 方法
	
	方法 拷贝绘制区域到矩形():矩形
		code return #this.copyBounds();
	结束 方法
	
	方法 取绘制区域():矩形
		code return #this.getBounds();
	结束 方法
	
	方法 取抖动区域():矩形
		code return #this.getDirtyBounds();
	结束 方法
	
	方法 开启抖动(开启抖动算法:逻辑型)
		code #this.setDither(#开启抖动算法);
	结束 方法
	
	方法 过滤位图(开启过滤:逻辑型)
		code #this.setFilterBitmap(#开启过滤);
	结束 方法
	
	方法 是否过滤位图():逻辑型
		code return #this.isFilterBitmap();
	结束 方法
	
	方法 色调(色调颜色:整数)
		code #this.setTint(#色调颜色);
	结束 方法
	
	方法 状态(状态集:整数[])
		code #this.setState(#状态集);
	结束 方法
	
	方法 取状态():整数[]
		code return #this.getState();
	结束 方法
	
	方法 取自身对象():可绘制对象
		code return #this.getCurrent();
	结束 方法
	
	方法 取绘制间距(间距:矩形):矩形
		code #this.getPadding(#间距);return #间距;
	结束 方法
	
	属性写 透明度(透明数值:整数)
		code #this.setAlpha(#透明数值);
	结束 属性
	
	属性读 透明度():整数
		code return #this.getAlpha();
	结束 属性
	
	属性写 等级(等级:整数)
		code #this.setLevel(#等级);
	结束 属性
	
	属性读 等级():整数
		code return #this.getLevel();
	结束 属性
	
	方法 可见(是否可见:逻辑型,重新绘制:逻辑型)
		code #this.setVisible(#是否可见,#重新绘制);
	结束 方法
	
	属性读 可见():逻辑型
		code return #this.isVisible();
	结束 属性
	
	属性写 自动镜像(是否自动镜像:逻辑型)
		code #this.setAutoMirrored(#是否自动镜像);
	结束 属性
	
	属性读 自动镜像():逻辑型
		code return #this.isAutoMirrored();
	结束 属性
	
	方法 重新绘制()
		code #this.invalidateSelf();
	结束 方法
结束 类

/*@指代类("android.graphics.ColorFilter")
类 颜色过滤器
	
结束 类*/

@指代类("android.graphics.Rect")
类 矩形
	
	@运算符重载
	方法 =(左边:整数,上边:整数,右边:整数,下边:整数)
		code return new android.graphics.Rect(#左边,#上边,#右边,#下边);
	结束 方法
	
	属性读 上():整数
		code return #this.top;
	结束 属性
	
	属性写 上(位置:整数)
		code #this.top=#位置;
	结束 属性
	
	属性读 下():整数
		code return #this.bottom;
	结束 属性
	
	属性写 下(位置:整数)
		code #this.bottom=#位置;
	结束 属性
	
	属性读 左():整数
		code return #this.left;
	结束 属性
	
	属性写 左(位置:整数)
		code #this.left=#位置;
	结束 属性
	
	属性读 右():整数
		code return #this.right;
	结束 属性
	
	属性写 右(位置:整数)
		code #this.right=#位置;
	结束 属性
	
	方法 是否为空():逻辑型
		code return #this.isEmpty();
	结束 方法
	
	方法 清空()
		code #this.setEmpty();
	结束 方法
	
	方法 宽度():整数
		code return #this.width();
	结束 方法
	
	方法 高度():整数
		code return #this.height();
	结束 方法
	
	方法 中心横坐标():整数
		code return #this.centerX();
	结束 方法
	
	方法 中心纵坐标():整数
		code return #this.centerY();
	结束 方法
	
	方法 精确中心横坐标():单精度小数
		code return #this.exactCenterX();
	结束 方法
	
	方法 精确中心纵坐标():单精度小数
		code return #this.exactCenterY();
	结束 方法
	
	方法 设置(左边:整数,上边:整数,右边:整数,下边:整数)
		code #this.set(#左边,#上边,#右边,#下边);
	结束 方法 
	
	方法 拷贝矩形(被拷贝对象:矩形)
		code #this.set(#被拷贝对象);
	结束 方法
	
	方法 位置移动(横向距离:整数,纵向距离:整数)
		code #this.offset(#横向距离,#纵向距离);
	结束 方法
	
	方法 位置偏移(左边:整数,上边:整数)
		code #this.offsetTo(#左边,#上边);
	结束 方法
	
	方法 尺寸大小(横向尺寸:整数,纵向尺寸:整数)
		code #this.inset(#横向尺寸,#纵向尺寸);
	结束 方法
	
	方法 尺寸修改(左边:整数,上边:整数)
		code #this.inset(#左边,#上边);
	结束 方法
	
	方法 是否包含坐标(横向坐标:整数,纵向坐标:整数):逻辑型
		code return #this.contains(#横向坐标,#纵向坐标);
	结束 方法
	
	方法 是否包含矩形(被判断对象:矩形):逻辑型
		code return #this.contains(#被判断对象);
	结束 方法
	
	方法 是否包含矩形区域(左边:整数,上边:整数,右边:整数,下边:整数):逻辑型
		code return #this.contains(#左边,#上边,#右边,#下边);
	结束 方法
	
	方法 矩形相交(被判断对象:矩形):逻辑型
		code return #this.intersect(#被判断对象);
	结束 方法
	
	方法 多个矩形相交(被判断对象1:矩形,被判断对象2:矩形):逻辑型
		code return #this.setIntersect(#被判断对象1,#被判断对象2);
	结束 方法
	
	方法 矩形区域相交(左边:整数,上边:整数,右边:整数,下边:整数):逻辑型
		code return #this.intersect(#左边,#上边,#右边,#下边);
	结束 方法
	
	方法 矩形是否相交(被判断对象:矩形):逻辑型
		code return #this.intersect(#被判断对象);
	结束 方法
	
	方法 矩形区域是否相交(左边:整数,上边:整数,右边:整数,下边:整数):逻辑型
		code return #this.intersects(#左边,#上边,#右边,#下边);
	结束 方法
	
	方法 合并矩形坐标(横向坐标:整数,纵向坐标:整数)
		code  #this.union(#横向坐标,#纵向坐标);
	结束 方法
	
	方法 合并矩形(被合并对象:矩形)
		code  #this.union(#被合并对象);
	结束 方法
	
	方法 合并矩形区域(左边:整数,上边:整数,右边:整数,下边:整数)
		code  #this.union(#左边,#上边,#右边,#下边);
	结束 方法
	
	方法 规范化()
		code #this.sort();
	结束 方法
	
	方法 是否相等(被比较目标:对象):逻辑型
		code return #this.equals(#被比较目标);
	结束 方法
结束 类

@指代类("android.graphics.Bitmap")
类 位图对象
	
	@运算符重载
	方法 =(文件路径:文本):位图对象
	 code return android.graphics.BitmapFactory.decodeFile(#文件路径);
	结束 方法
	
	@静态
	方法 从文件路径创建位图(文件路径:文本):位图对象
	 code return android.graphics.BitmapFactory.decodeFile(#文件路径);
	结束 方法
	
	@静态
	方法 从字节集创建位图(位图数据:字节[],偏移量:整数=0,数据长度:整数):位图对象
		code return android.graphics.BitmapFactory.decodeByteArray(#位图数据,#偏移量,#数据长度);
	结束 方法
	
	@静态
	方法 从输入流创建位图(位图数据:输入流):位图对象
		code return android.graphics.BitmapFactory.decodeStream(#位图数据);
	结束 方法
	
	@静态
	方法 创建缩放位图(源位图:位图对象,新宽度:整数,新高度:整数,启用双线性过滤:逻辑型):位图对象
		code return android.graphics.Bitmap.createScaledBitmap(#源位图,#新宽度,#新高度,#启用双线性过滤);
	结束 方法
	
	@静态
	方法 创建位图(源位图:位图对象):位图对象
		code return android.graphics.Bitmap.createBitmap(#源位图);
	结束 方法
	
	@静态
	方法 创建位图2(宽度:整数,高度:整数,配置:位图配置):位图对象
		code return android.graphics.Bitmap.createBitmap(#宽度,#高度,#配置);
	结束 方法
	
	@静态
	方法 创建位图3(宽度:整数,高度:整数,配置:位图配置,存在透明度:逻辑型):位图对象
		code return android.graphics.Bitmap.createBitmap(#宽度,#高度,#配置,#存在透明度);
	结束 方法
	
	方法 创建位图4(颜色组:整数[],宽度:整数,高度:整数,配置:位图配置):位图对象
		code return android.graphics.Bitmap.createBitmap(#颜色组,#宽度,#高度,#配置);
	结束 方法
	
	属性读 密度():整数
		code return #this.getDensity();
	结束 属性
	
	属性写 密度(欲设置密度:整数)
		code #this.setDensity(#欲设置密度);
	结束 属性
	
	属性写 宽度(欲设置宽度:整数)
		code #this.setWidth(#欲设置宽度);
	结束 属性
	
	属性读 宽度():整数
		code return #this.getWidth();
	结束 属性
	
	属性写 高度(欲设置高度:整数)
		code #this.setHeight(#欲设置高度);
	结束 属性
	
	属性读 高度():整数
		code return #this.getHeight();
	结束 属性
	
	属性写 配置(位图配置:位图配置)
		code #this.setConfig(#位图配置);
	结束 属性
	
	属性读 配置():位图配置
		code return #this.getConfig();
	结束 属性
	
	方法 重新配置(宽度:整数,高度:整数,配置:位图配置)
		code #this.reconfigure(#宽度,#高度,#配置);
	结束 方法
	
	方法 回收()
		code #this.recycle();
	结束 方法
	
	方法 是否已被回收():逻辑型
		code return #this.isRecycled();
	结束 方法
	
	方法 拷贝(配置:位图配置,是否可以改变:逻辑型):位图对象
		code return #this.copy(#配置,#是否可以改变);
	结束 方法
	
	方法 压缩输出(压缩格式:位图压缩格式,压缩质量:整数,输出流:输出流):逻辑型
		code return #this.compress(#压缩格式,#压缩质量,#输出流);
	结束 方法
	
	方法 取是否预乘位图():逻辑型
		code return #this.isPremultiplied();
	结束 方法
	
	方法 预乘位图(是否预乘位图:逻辑型)
		code #this.setPremultiplied(#是否预乘位图);
	结束 方法
	
	方法 取缩放高度(目标位图密度:整数):整数
		code return #this.getScaledHeight(#目标位图密度);
	结束 方法
	
	方法 取缩放宽度(目标位图密度:整数):整数
		code return #this.getScaledWidth(#目标位图密度);
	结束 方法
	//返回位图像素中行之间的字节数
	方法 取行字节():整数
		code return #this.getRowBytes();
	结束 方法
	//返回可用于存储此位图像素的最小字节数
	方法 取字节():整数
		code return #this.getByteCount();
	结束 方法
	//返回用于存储此位图像素的分配内存的大小
	方法 取分配字节数():整数
		code return #this.getAllocationByteCount();
	结束 方法
	
	方法 取是否存在透明值():逻辑型
		code return #this.hasAlpha();
	结束 方法
	
	方法 透明值(存在透明值:逻辑型)
		code #this.setHasAlpha(#存在透明值);
	结束 方法
	
	方法 取是否细化纹理():逻辑型
		code return #this.hasMipMap();
	结束 方法
	
	方法 细化纹理(是否细化纹理:逻辑型)
		code  #this.setHasMipMap(#是否细化纹理);
	结束 方法
	
	方法 擦除颜色(颜色:整数)
		code #this.eraseColor(#颜色);
	结束 方法
	
	方法 擦除颜色2(颜色:长整数类)
		code #this.eraseColor(#颜色);
	结束 方法
	//返回指定位置的Color
	方法 取像素(横坐标:整数,纵坐标:整数):整数
		code return #this.getPixel(#横坐标,#纵坐标);
	结束 方法
	
	方法 取透明通道():位图对象
		code return #this.extractAlpha();
	结束 方法
	
	方法 等同(位图对象:位图对象):逻辑型
		code return #this.sameAs(#位图对象);
	结束 方法
结束 类

//====================================================
@指代类("android.graphics.Bitmap.Config")
@导入Java("android.graphics.Bitmap.Config")
@禁止创建对象
类 位图配置
	
	@静态
	常量 ALPHA_8:位图配置?
	
	@静态
	常量 RGB_565:位图配置?
	
	@静态
	常量 ARGB_4444:位图配置?
	
	@静态
	常量 ARGB_8888:位图配置?
	
	@静态
	常量 RGBA_F16:位图配置?
	
	@静态
	常量 HARDWARE:位图配置?
	
	@静态
	方法 到配置(配置名:文本):位图配置
	code return Config.valueOf(#配置名);
	结束 方法
	
	@静态
	方法 配置列表():位图配置[]
		code return Config.values();
	结束 方法
	
	@code
	static {
	#ALPHA_8=Config.ALPHA_8;
	#RGB_565=Config.RGB_565;
	#ARGB_4444=Config.ARGB_4444;
	#ARGB_8888=Config.ARGB_8888;
	#RGBA_F16=Config.RGBA_F16;
	#HARDWARE=Config.HARDWARE;
	}
	@end
结束 类

//=============================================================
@指代类("android.graphics.Bitmap.CompressFormat")
@导入Java("android.graphics.Bitmap.CompressFormat")
@禁止创建对象
类 位图压缩格式
	
	@静态
	常量 JPEG:位图压缩格式?
	
	@静态
	常量 PNG:位图压缩格式?
	
	@静态
	常量 WEBP:位图压缩格式?
	
	@静态
	常量 WEBP_有损:位图压缩格式?
	
	@静态
	常量 WEBP_无损:位图压缩格式?
	
	@code
	static {
	#JPEG=CompressFormat.JPEG;
	#PNG=CompressFormat.PNG;
	#WEBP=CompressFormat.WEBP;
	#WEBP_有损=CompressFormat.WEBP_LOSSY;
	#WEBP_无损=CompressFormat.WEBP_LOSSLESS;
	}
	@end
结束 类



/*
组件样式操作类，提供组件样式设置功能
*/
@全局类
@导入Java("android.graphics.*")
@导入Java("android.graphics.drawable.*")
@导入Java("android.graphics.drawable.shapes.*")
@导入Java("android.content.res.*")
类 组件样式操作

	//设置组件水波纹样式，有背景，有圆角，有水波纹反馈
	@静态
	方法 置水波纹样式(
		欲设置组件 为 可视化组件,
		圆角度数 为 小数,
		默认展示颜色 为 整数,
		水波纹颜色 为 整数)
		@code
		int[][] stateList = new int[][]{
			new int[]{android.R.attr.state_pressed},
			new int[]{android.R.attr.state_focused},
			new int[]{android.R.attr.state_activated},
			new int[]{}
		};
		int[] stateColorList = new int[]{
			#水波纹颜色,
			#水波纹颜色,
			#水波纹颜色,
			#默认展示颜色
		};
		ColorStateList colorStateList = new ColorStateList(stateList, stateColorList);

		float[] outRadius = new float[]{
			(float) #圆角度数, 
			(float) #圆角度数, 
			(float) #圆角度数, 
			(float) #圆角度数, 
			(float) #圆角度数, 
			(float) #圆角度数, 
			(float) #圆角度数, 
			(float) #圆角度数
		};
		RoundRectShape roundRectShape = new RoundRectShape(outRadius, null, null);
		ShapeDrawable maskDrawable = new ShapeDrawable();
		maskDrawable.setShape(roundRectShape);
		maskDrawable.getPaint().setColor(#默认展示颜色);
		maskDrawable.getPaint().setStyle(Paint.Style.FILL);

		ShapeDrawable contentDrawable = new ShapeDrawable();
		contentDrawable.setShape(roundRectShape);
		contentDrawable.getPaint().setColor(#默认展示颜色);
		contentDrawable.getPaint().setStyle(Paint.Style.FILL);
		RippleDrawable rippleDrawable = new RippleDrawable(colorStateList, contentDrawable, maskDrawable);
		#欲设置组件.getView().setBackground(rippleDrawable);
		@end
	结束 方法

	//设置组件水波纹样式，无背景，没有默认展示颜色，有向外扩散的水波纹圆圈
	@静态
	方法 置水波纹样式2(欲设置组件 为 可视化组件,水波纹颜色 为 整数)
		@code
		int[][] stateList = new int[][]{
			new int[]{android.R.attr.state_pressed},
			new int[]{android.R.attr.state_focused},
			new int[]{android.R.attr.state_activated},
			new int[]{}
		};
		int[] stateColorList = new int[]{
			#水波纹颜色,
			#水波纹颜色,
			#水波纹颜色,
			#水波纹颜色
		};
		ColorStateList colorStateList = new ColorStateList(stateList, stateColorList);

		RippleDrawable rippleDrawable = new RippleDrawable(colorStateList, null, null);
		#欲设置组件.getView().setBackground(rippleDrawable);
		@end
	结束 方法

	//设置组件水波纹样式，无背景，没有默认展示颜色，只有水波纹反馈
	@静态
	方法 置水波纹样式3(欲设置组件 为 可视化组件,圆角度数 为 单精度小数,水波纹颜色 为 整数)
		@code
		int[][] stateList = new int[][]{
			new int[]{android.R.attr.state_pressed},
			new int[]{android.R.attr.state_focused},
			new int[]{android.R.attr.state_activated},
			new int[]{}
		};
		int[] stateColorList = new int[]{
			#水波纹颜色,
			#水波纹颜色,
			#水波纹颜色,
			#水波纹颜色
		};
		ColorStateList colorStateList = new ColorStateList(stateList, stateColorList);

		float[] outRadius = new float[]{
			(float) #圆角度数, 
			(float) #圆角度数, 
			(float) #圆角度数, 
			(float) #圆角度数, 
			(float) #圆角度数, 
			(float) #圆角度数, 
			(float) #圆角度数, 
			(float) #圆角度数
		};
		RoundRectShape roundRectShape = new RoundRectShape(outRadius, null, null);
		ShapeDrawable maskDrawable = new ShapeDrawable();
		maskDrawable.setShape(roundRectShape);
		maskDrawable.getPaint().setColor(#水波纹颜色);
		maskDrawable.getPaint().setStyle(Paint.Style.FILL);
		RippleDrawable rippleDrawable = new RippleDrawable(colorStateList, null, maskDrawable);
		#欲设置组件.getView().setBackground(rippleDrawable);
		@end
	结束 方法

	//设置圆角，且有背景
	@静态
	方法 置圆角背景(
			欲设置组件 为 可视化组件,
			背景颜色 为 整数,
			左上圆角 为 小数,
			右上圆角 为 小数,
			右下圆角 为 小数,
			左下圆角 为 小数)
		@code
		float[] outRadius = new float[]{
			(float) #左上圆角, 
			(float) #左上圆角, 
			(float) #右上圆角, 
			(float) #右上圆角, 
			(float) #右下圆角, 
			(float) #右下圆角, 
			(float) #左下圆角, 
			(float) #左下圆角
		};
		android.graphics.drawable.GradientDrawable drawable = new android.graphics.drawable.GradientDrawable();
		drawable.setCornerRadii(outRadius);
		drawable.setColor(#背景颜色);
		#欲设置组件.getView().setBackground(drawable);
		@end
	结束 方法
	
	//设置圆角，且有背景
	@静态
	方法 置圆背景2(
			欲设置组件 为 可视化组件,
			背景颜色 为 整数,
			圆角度数 为 小数)
		置圆角背景(欲设置组件, 背景颜色, 
			圆角度数, 圆角度数, 圆角度数, 圆角度数)
	结束 方法

	//设置圆角，没有背景，但有边框
	@静态
	方法 置圆角边框(
			欲设置组件 为 可视化组件,
			边框宽度 为 整数,
			边框颜色 为 整数,
			左上圆角 为 小数,
			右上圆角 为 小数,
			右下圆角 为 小数,
			左下圆角 为 小数)
		@code
		float[] outRadius = new float[]{
			(float) #左上圆角, 
			(float) #左上圆角, 
			(float) #右上圆角, 
			(float) #右上圆角, 
			(float) #右下圆角, 
			(float) #右下圆角, 
			(float) #左下圆角, 
			(float) #左下圆角
		};
		android.graphics.drawable.GradientDrawable drawable = new android.graphics.drawable.GradientDrawable();
		drawable.setCornerRadii(outRadius);
		drawable.setStroke(#边框宽度,#边框颜色);
		#欲设置组件.getView().setBackground(drawable);
		@end
	结束 方法
	
	//设置圆角，没有背景，但有边框
	@静态
	方法 置圆角边框2(
			欲设置组件 为 可视化组件,
			边框宽度 为 整数,
			边框颜色 为 整数,
			圆角度数 为 小数)
		置圆角边框(欲设置组件, 边框宽度, 边框颜色,
			圆角度数, 圆角度数, 圆角度数, 圆角度数)
	结束 方法

	//设置圆角，有背景，有边框
	@静态
	方法 置圆角背景边框(
			欲设置组件 为 可视化组件,
			背景颜色 为 整数,
			边框宽度 为 整数,
			边框颜色 为 整数,
			左上圆角 为 小数,
			右上圆角 为 小数,
			右下圆角 为 小数,
			左下圆角 为 小数)
		@code
		float[] outRadius = new float[]{
			(float) #左上圆角, 
			(float) #左上圆角, 
			(float) #右上圆角, 
			(float) #右上圆角, 
			(float) #右下圆角, 
			(float) #右下圆角, 
			(float) #左下圆角, 
			(float) #左下圆角
		};
		android.graphics.drawable.GradientDrawable drawable = new android.graphics.drawable.GradientDrawable();
		drawable.setCornerRadii(outRadius);
		drawable.setStroke(#边框宽度,#边框颜色);
		drawable.setColor(#背景颜色);
		#欲设置组件.getView().setBackground(drawable);
		@end
	结束 方法
	
	//设置圆角，有背景，有边框
	@静态
	方法 置圆角背景边框2(
			欲设置组件 为 可视化组件,
			背景颜色 为 整数,
			边框宽度 为 整数,
			边框颜色 为 整数,
			圆角 为 小数)
			置圆角背景边框(欲设置组件, 背景颜色, 
				边框宽度,边框颜色,圆角,圆角,圆角,圆角)
	结束 方法

	//设置圆角，但没有背景
	@静态
	方法 置圆角(
			欲设置组件 为 可视化组件,
			左上圆角 为 小数,
			右上圆角 为 小数,
			右下圆角 为 小数,
			左下圆角 为 小数)
		@code
		float[] outRadius = new float[]{
			(float) #左上圆角, 
			(float) #左上圆角, 
			(float) #右上圆角, 
			(float) #右上圆角, 
			(float) #右下圆角, 
			(float) #右下圆角, 
			(float) #左下圆角, 
			(float) #左下圆角
		};
		android.graphics.drawable.GradientDrawable drawable = new android.graphics.drawable.GradientDrawable();
		drawable.setCornerRadii(outRadius);
		//drawable.setColor(0xffffffff);
		#欲设置组件.getView().setBackground(drawable);
		@end
	结束 方法

	//设置普通单击反馈样式
	@静态
	方法 置普通样式(
			欲设置组件 为 可视化组件,
			圆角度数 为 小数,
			默认展示颜色 为 整数,
			按下颜色 为 整数)
		@code
		float[] outRadius = new float[]{
			(float) #圆角度数, 
			(float) #圆角度数, 
			(float) #圆角度数, 
			(float) #圆角度数, 
			(float) #圆角度数, 
			(float) #圆角度数, 
			(float) #圆角度数, 
			(float) #圆角度数
		};
		RoundRectShape roundRectShape = new RoundRectShape(outRadius, null, null);
		ShapeDrawable maskDrawable = new ShapeDrawable();
		maskDrawable.setShape(roundRectShape);
		maskDrawable.getPaint().setColor(#按下颜色);
		maskDrawable.getPaint().setStyle(Paint.Style.FILL);
		ShapeDrawable contentDrawable = new ShapeDrawable();
		contentDrawable.setShape(roundRectShape);
		contentDrawable.getPaint().setColor(#默认展示颜色);
		contentDrawable.getPaint().setStyle(Paint.Style.FILL);
		StateListDrawable sd = new StateListDrawable();
		sd.addState(new int[]{android.R.attr.state_pressed}, maskDrawable);
		sd.addState(new int[]{0}, contentDrawable);
		#欲设置组件.getView().setBackground(sd);
		@end
	结束 方法

结束 类