包名 结绳.安卓

@全局类
@导入Java("android.view.*")
@导入Java("android.util.*")
@导入Java("java.lang.reflect.*")
@导入Java("android.net.*")
@导入Java("android.database.*")
@导入Java("android.provider.*")
@导入Java("android.content.*")
@导入Java("android.content.res.*")
@导入Java("android.os.*")
类 系统操作
	@静态
	方法 取屏幕宽度(环境 为 安卓环境) 为 整数
		@code
		WindowManager wm = (WindowManager) #环境.getSystemService(Context.WINDOW_SERVICE);
		DisplayMetrics outMetrics = new DisplayMetrics();
		wm.getDefaultDisplay().getRealMetrics(outMetrics);
		return outMetrics.widthPixels; 
		@end
	结束 方法

	@静态
	方法 取屏幕高度(环境 为 安卓环境) 为 整数
		@code
		WindowManager wm = (WindowManager) #环境.getSystemService(Context.WINDOW_SERVICE);
		DisplayMetrics outMetrics = new DisplayMetrics();
		wm.getDefaultDisplay().getRealMetrics(outMetrics);
		return outMetrics.heightPixels;
		@end
	结束 方法

	@静态
	方法 取屏幕高度_不含导航栏(环境 为 安卓环境) 为 整数
		@code
		  if (!#导航栏是否显示(#环境)) {
				return #取屏幕高度(#环境);
		  }
		  DisplayMetrics outMetrics = new DisplayMetrics();
		  WindowManager wm = (WindowManager) #环境.getSystemService(Context.WINDOW_SERVICE);
		  wm.getDefaultDisplay().getMetrics(outMetrics);
		  int heightPixel = outMetrics.heightPixels;
		  if (Build.MANUFACTURER.equals("Xiaomi") && Settings.Global.getInt(#环境.getContentResolver(), "force_fsg_nav_bar", 0) != 0) {
				return heightPixel + #取导航栏高度(#环境);
		  }
		  if (#取导航栏高度(#环境) + heightPixel < #取屏幕高度(#环境)) {
				return heightPixel + #取状态栏高度(#环境);
		  }
		  return heightPixel;
		@end
	结束 方法
	
	@静态
	方法 取屏幕高度_不含导航栏和状态栏(环境 为 安卓环境) 为 整数
		@code
		  if (!#导航栏是否显示(#环境)) {
				return #取屏幕高度(#环境) - #取状态栏高度(#环境);
		  }
		  DisplayMetrics outMetrics = new DisplayMetrics();
		  WindowManager wm = (WindowManager) #环境.getSystemService(Context.WINDOW_SERVICE);
		  wm.getDefaultDisplay().getMetrics(outMetrics);
		  int heightPixel = outMetrics.heightPixels;
		  int statusBarHeight = #取状态栏高度(#环境);
		  if (Build.MANUFACTURER.equals("Xiaomi") && Settings.Global.getInt(#环境.getContentResolver(), "force_fsg_nav_bar", 0) != 0) {
				return heightPixel + #取导航栏高度(#环境) - statusBarHeight;
		  }
		  if (#取导航栏高度(#环境) + heightPixel < #取屏幕高度(#环境)) {
				heightPixel = heightPixel + statusBarHeight;
		  }
		  return heightPixel - statusBarHeight;
		@end
	结束 方法

	@静态
	方法 取屏幕密度(环境 为 安卓环境) 为 小数
		@code
		DisplayMetrics displaymetrics = new DisplayMetrics();
		WindowManager wm = (WindowManager) #环境.getSystemService(Context.WINDOW_SERVICE);
		wm.getDefaultDisplay().getMetrics(displaymetrics);
		return displaymetrics.density;
		@end
	结束 方法

	@静态
	方法 取状态栏高度(环境 为 安卓环境) 为 整数
		@code
		  if (Build.VERSION.SDK_INT < 29) {
				try {
					 Class<?> c = Class.forName("com.android.internal.R$dimen");
					 return #环境.getResources().getDimensionPixelSize(Integer.parseInt(c.getField("status_bar_height").get(c.newInstance()).toString()));
				} catch (Exception e) {
					 e.printStackTrace();
					 return 0;
				}
		  } else {
				Resources resources = #环境.getResources();
				return resources.getDimensionPixelSize(resources.getIdentifier("status_bar_height", "dimen", "android"));
		  }
		@end
	结束 方法

	@静态
	方法 取导航栏高度(环境 为 安卓环境) 为 整数
		@code
		  if (Build.VERSION.SDK_INT < 17) {
				return 0;
		  }
		  Resources resources = #环境.getResources();
		  return resources.getDimensionPixelSize(resources.getIdentifier("navigation_bar_height", "dimen", "android"));
		@end
	结束 方法

	//判断系统导航栏是否开启
	@静态
	方法 导航栏是否显示(环境 为 安卓环境) 为 逻辑型
		@code
		  if (Build.VERSION.SDK_INT < 17) {
				return false;
		  }
		  if (Build.MANUFACTURER.equals("Xiaomi") && Settings.Global.getInt(#环境.getContentResolver(), "force_fsg_nav_bar", 0) != 0) {
				return false;
		  }
		  DisplayMetrics outMetrics = new DisplayMetrics();
		  WindowManager wm = (WindowManager) #环境.getSystemService(Context.WINDOW_SERVICE);
		  wm.getDefaultDisplay().getRealMetrics(outMetrics);
		  int height1 = outMetrics.heightPixels;
		  wm.getDefaultDisplay().getMetrics(outMetrics);
		  if ((height1 - outMetrics.heightPixels) - #取状态栏高度(#环境) > 0) {
				return true;
		  }
		  return false;
		@end
	结束 方法

	@静态
	方法 置剪切板文本(环境 为 安卓环境, 文本 为 文本)
		@code
		ClipboardManager clipboard = (ClipboardManager) #环境.getSystemService("clipboard");
		clipboard.setText(#文本);
		@end
	结束 方法

	@静态
	方法 取剪切板文本(环境 为 安卓环境) 为 文本
		@code
		ClipboardManager clipboard = (ClipboardManager) #环境.getSystemService("clipboard");
		if (clipboard.hasText()) {
			String clipText =  clipboard.getText().toString();
			return clipText;
		}
		return "";
		@end
	结束 方法

	@静态
	方法 取ANDROID_ID(环境 为 安卓窗口) 为 文本
		code return Settings.System.getString(#环境.getContentResolver(), Settings.System.ANDROID_ID);
	结束 方法

	@静态
	方法 取设备唯一标识符() 为 文本
		@code
		String m_szDevIDShort = "35" + Build.BOARD.length() % 10
				+ Build.BRAND.length() % 10 + Build.CPU_ABI.length() % 10
				+ Build.DEVICE.length() % 10 + Build.DISPLAY.length() % 10
				+ Build.HOST.length() % 10 + Build.ID.length() % 10
				+ Build.MANUFACTURER.length() % 10 + Build.MODEL.length() % 10
				+ Build.PRODUCT.length() % 10 + Build.TAGS.length() % 10
				+ Build.TYPE.length() % 10 + Build.USER.length() % 10;
		String serial = "serial";
		try {
			if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.O) {
				serial = android.os.Build.getSerial();
			}
			else {
				serial = Build.SERIAL;
			}
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		return new java.util.UUID(m_szDevIDShort.hashCode(), serial.hashCode()).toString();
		 @end
	结束 方法

	//加载so库，so库路径可以为安装包lib下so库名称，也可以为绝对路径
	@静态
	方法 加载SO库(so库路径 为 文本)
		@code
		 if (#so库路径.startsWith("/")) {
			  System.load(#so库路径);
		 } else {
			  System.loadLibrary(#so库路径);
		 }
		@end
	结束 方法

	@静态
	方法 优化内存()
		@code
		System.gc();
		@end
	结束 方法
	
	@静态
	方法 关闭程序()
		@code
		android.os.Process.killProcess(android.os.Process.myPid());
		@end
	结束 方法
结束 类

@全局类
类 颜色操作
	
	@静态
	常量 透明色 : 整数 = 0X00000000
	
	@静态
	常量 白色 : 整数 = 0XFFFFFFFF
	
	@静态
	常量 半透明白色 : 整数 = 0X80FFFFFF
	
	@静态
	常量 黑色 : 整数 = 0XFF000000
	
	@静态
	常量 半透明黑色 : 整数 = 0X80000000
	
	@静态
	常量 红色 : 整数 = 0XFFFF0000
	
	@静态
	常量 半透明红色 : 整数 = 0X80FF0000
	
	@静态
	常量 绿色 : 整数 = 0XFF00FF00
	
	@静态
	常量 半透明绿色 : 整数 = 0X8000FF00
	
	@静态
	常量 蓝色 : 整数 = 0XFF0000FF
	
	@静态
	常量 半透明蓝色 : 整数 = 0X800000FF
	
	@静态
	常量 灰色 : 整数 = 0XFF969696
	
	@静态
	常量 半透明灰色 : 整数 = 0X80969696
	
	@静态
	常量 天蓝色 : 整数 = 0XFF87CEEB
	
	@静态
	常量 橙色 : 整数 = 0XFFFFA500
	
	@静态
	常量 金色 : 整数 = 0XFFFFD700
	
	@静态
	常量 粉色 : 整数 = 0XFFFFC0CB
	
	@静态
	常量 紫红色 : 整数 = 0XFFFF00FF
	
	@静态
	常量 灰白色 : 整数 = 0XFFF2F2F2
	
	@静态
	常量 紫色 : 整数 = 0XFF800080
	
	@静态
	常量 青色 : 整数 = 0XFF00FFFF
	
	@静态
	常量 黄色 : 整数 = 0XFFFFFF00
	
	@静态
	常量 巧克力色 : 整数 = 0XFFD2691E
	
	@静态
	常量 番茄色 : 整数 = 0XFFFF6347
	
	@静态
	常量 橙红色 : 整数 = 0XFFFF4500
	
	@静态
	常量 银白色 : 整数 = 0XFFC0C0C0
	
	@静态
	常量 深灰色 : 整数 = 0XFF444444
	
	@静态
	常量 亮灰色 : 整数 = 0XFFCCCCCC
	
	@静态
	常量 高光色 : 整数 = 0X33FFFFFF
	
	@静态
	常量 低光色 : 整数 = 0X33000000
	
	// 取颜色中的红色值
	@静态
	方法 取颜色红色值(颜色 : 整数) : 整数
		code return android.graphics.Color.red(#颜色);
	结束 方法
	
	// 取颜色中的绿色值
	@静态
	方法 取颜色绿色值(颜色 : 整数) : 整数
		code return android.graphics.Color.green(#颜色);
	结束 方法
	
	// 取颜色中的蓝色值
	@静态
	方法 取颜色蓝色值(颜色 : 整数) : 整数
		code return android.graphics.Color.blue(#颜色);
	结束 方法
	
	// 取颜色的透明度
	@静态
	方法 取颜色透明度(颜色 : 整数) : 整数
		code return android.graphics.Color.alpha(#颜色);
	结束 方法
	
	// 根据 透明度、红色值、绿色值、蓝色值 合成一个颜色
	@静态
	方法 合成颜色值(透明度 : 整数, 红色值 : 整数, 绿色值 : 整数, 蓝色值 : 整数) : 整数
		code return android.graphics.Color.argb(#透明度,#红色值,#绿色值,#蓝色值);
	结束 方法
	
	// 设置颜色中的红色值
	@静态
	方法 修改颜色红色值(颜色 : 整数, 红色值 : 整数) : 整数
		code return (#颜色 & 0xff00ffff) | (#红色值 << 16);
	结束 方法
	
	// 设置颜色中的绿色值
	@静态
	方法 修改颜色绿色值(颜色 : 整数, 绿色值 : 整数) : 整数
		code return (#颜色 & 0xffff00ff) | (#绿色值 << 8);
	结束 方法
	
	// 设置颜色中的蓝色值
	@静态
	方法 修改颜色蓝色值(颜色 : 整数, 蓝色值 : 整数) : 整数
		code return (#颜色 & 0xffffff00) | #蓝色值;
	结束 方法
	
	// 设置颜色的透明度
	@静态
	方法 修改颜色透明度(颜色 : 整数, 透明度 : 整数) : 整数
		code return (#颜色 & 0x00ffffff) | (#透明度 << 24);
	结束 方法
	
	// 获取随机颜色
	@静态
	方法 取随机颜色(支持透明度 : 逻辑型 = 真) : 整数
		@code
		int high = #支持透明度 ? (int) (Math.random() * 0x100) << 24 : 0xFF000000;
		return high | (int) (Math.random() * 0x1000000);
		@end
	结束 方法
	
	// 增加颜色的深度
	@静态
	方法 颜色加深(颜色 : 整数, 加深值 : 整数 = 16) : 整数
		变量 r : 整数 = 取颜色红色值(颜色) - 加深值
		变量 g : 整数 = 取颜色绿色值(颜色) - 加深值
		变量 b : 整数 = 取颜色蓝色值(颜色) - 加深值
		@code
		#r = #r > 255 ? 255 : Math.max(#r,0);
		#g = #g > 255 ? 255 : Math.max(#g,0);
		#b = #b > 255 ? 255 : Math.max(#b,0);
		@end
		颜色 = 修改颜色红色值(颜色,r)
		颜色 = 修改颜色绿色值(颜色,g)
		颜色 = 修改颜色蓝色值(颜色,b)
		返回 颜色
	结束 方法
	
	// 降低颜色的深度，使变浅
	@静态
	方法 颜色变浅(颜色 : 整数, 变浅值 : 整数 = 16) : 整数
		变量 r : 整数 = 取颜色红色值(颜色) + 变浅值
		变量 g : 整数 = 取颜色绿色值(颜色) + 变浅值
		变量 b : 整数 = 取颜色蓝色值(颜色) + 变浅值
		@code
		#r = #r > 255 ? 255 : Math.max(#r,0);
		#g = #g > 255 ? 255 : Math.max(#g,0);
		#b = #b > 255 ? 255 : Math.max(#b,0);
		@end
		颜色 = 修改颜色红色值(颜色,r)
		颜色 = 修改颜色绿色值(颜色,g)
		颜色 = 修改颜色蓝色值(颜色,b)
		返回 颜色
	结束 方法
	
	// 取颜色的灰度值
	@静态
	方法 取灰度值(颜色 : 整数) : 整数
		变量 r : 整数 = 取颜色红色值(颜色)
		变量 g : 整数 = 取颜色绿色值(颜色)
		变量 b : 整数 = 取颜色蓝色值(颜色)
		code return (int) (#r * 0.299F + #g * 0.587F + #b * 0.114F);
	结束 方法
	
	// 判断颜色是否为浅色，否则为深色
	@静态
	方法 是否为浅色(颜色 : 整数) : 逻辑型
		返回 取灰度值(颜色) >= 192
	结束 方法
	
	// 将文本类型颜色值转换为整数类型颜色
	@静态
	方法 文本到颜色值(颜色 : 文本) : 整数
		code return android.graphics.Color.parseColor(#颜色);
	结束 方法
	
	// 将整数类型颜色值转换到文本类型颜色
	@静态
	方法 颜色值到文本(颜色 : 整数, 支持透明度 : 逻辑型 = 真, 大写 : 逻辑型 = 真) : 文本
		@code
		if(!#支持透明度) {
			#颜色 = #颜色 & 0x00ffffff;
		}
		String colorStr = Integer.toHexString(#颜色);
		if(#大写) {
			colorStr = colorStr.toUpperCase();
		} else {
			colorStr = colorStr.toLowerCase();
		}
		while (colorStr.length() < 6) {
			colorStr = "0" + colorStr;
		}
		if(#支持透明度) {
			while (colorStr.length() < 8) {
				colorStr = (#大写 ? "F" : "f") + colorStr;
			}
		}
		return "#" + colorStr;
		@end
	结束 方法
	
结束 类


@全局类
类 数组操作
	@静态
	@嵌入式代码
	方法 取数组长度(数组 : 对象[]) : 整数
		code #数组.length
	结束 方法
	
	@静态
	方法 数组到集合(数组 : 对象[]) : 集合
		@code
		java.util.ArrayList<Object> list = new java.util.ArrayList<>();
		for (Object obj : #数组) {
			list.add(obj);
		}
		return list;
		@end
	结束 方法
	
	/*
	将数组转换为文本(只支持一维数组)
	*/
	@静态
	@嵌入式代码
	方法 数组到文本(数组 : 变体型) : 文本
		code java.util.Arrays.toString(#数组)
	结束 方法
	
	/*
	将数组转换为文本(支持多维数组)
	*/
	@静态
	@嵌入式代码
	方法 数组到文本2(数组 : 变体型) : 文本
		code java.util.Arrays.deepToString(#数组)
	结束 方法
结束 类


@全局类
类 数学运算
	
	@静态
	常量 E 为 小数 = 2.718281828459045d
	@静态
	常量 PI 为 小数 = 3.141592653589793d

	//求一个数的反正切值
	@静态
	方法 求反正切(值 为 小数) 为 小数
		code return Math.atan(#值);
	结束 方法

	//求一个数的余弦值
	@静态
	方法 求余弦(值 为 小数) 为 小数
		code return Math.cos(#值);
	结束 方法

	//求一个数的反对数
	@静态
	方法 求反对数(值 为 小数) 为 小数
		code return Math.exp(#值);
	结束 方法

	//求一个数的自然对数
	@静态
	方法 求自然对数(值 为 小数) 为 小数
		code return Math.log(#值);
	结束 方法
	
	/*
	获取指定范围内随机的整数
	*/
	@静态
	方法 取随机数(最小值 为 整数,最大值 为 整数) 为 整数
		@code
		return (int)(Math.random() * (#最大值 + 1- #最小值) + #最小值);
		@end
	结束 方法
	
	/*
	获取指定范围内随机的小数
	*/
	@静态
	方法 取随机小数(最小值 为 小数,最大值 为 小数) 为 小数
		@code
		return (Math.random() * (#最大值 + 1- #最小值) + #最小值);
		@end
	结束 方法
	
	//求一个数的正切值
	@静态
	方法 求正弦(值 为 小数) 为 小数
		code return Math.sin(#值);
	结束 方法

	//获取数的符号，如果参数小于0，则返回-1.0。 如果参数大于零，则返回1.0；如果参数为正零或负零，则将其作为结果返回。
	@静态
	方法 取符号(值 为 小数) 为 整数
		code return (int) Math.signum(#值);
	结束 方法

	//求一个数的平方根
	@静态
	方法 求平方根(值 为 小数) 为 小数
		code return Math.sqrt(#值);
	结束 方法

	//求一个数的正切值
	@静态
	方法 求正切(值 为 小数) 为 小数
		code return Math.tan(#值);
	结束 方法

	//将角度值转化为弧度值
	@静态
	方法 角度转弧度(值 为 小数) 为 小数
		code return Math.toRadians(#值);
	结束 方法

	//将弧度值转化为角度值
	@静态
	方法 弧度转角度(值 为 小数) 为 小数
		code return Math.toDegrees(#值);
	结束 方法

	//将一个数四舍五入，参数一为将要四舍五人的数字，参数二为小数点后几位
	@静态
	方法 四舍五入(数字 为 小数,精确度 为 整数) 为 小数
		code return new java.math.BigDecimal(String.valueOf(#数字)).setScale(#精确度, 4).doubleValue();
	结束 方法

	//求一个数的反正弦值
	@静态
	方法 求反正弦(值 为 小数) 为 小数
		code return Math.asin(#值);
	结束 方法

	//求一个数的反余弦值
	@静态
	方法 求反余弦(值 为 小数) 为 小数
		code return Math.acos(#值);
	结束 方法

	//求计算表达式计算结果
	@静态
	@导入Java("java.util.Stack")
	方法 计算表达式(表达式 为 文本) 为 小数
		@code
		double num[] = new double[20];
		int flag = 0, begin = 0, end = 0, now;
		now = -1;
		Stack<Character> st = new Stack<Character>();
		for (int i = 0; i < #表达式.length(); i++) {
			char s = #表达式.charAt(i);
			if (s == ' ') {

			} else if (s == '+' || s == '-' || s == '*' || s == '/' || s == '(' || s == ')' || s == '%') {
				if (flag == 1) {
					now += 1;
					if (end < begin) {
						num[now] = Integer.valueOf(#表达式.substring(begin, begin + 1));
					} else {
						num[now] = Integer.valueOf(#表达式.substring(begin, end + 1));
					}
					flag = 0;
				}
				if (s == '-') {
					if (i == 0) {
						flag = 1;
						begin = 0;
					} else if (#表达式.charAt(i - 1) == '(' || #表达式.charAt(i - 1) == '*'
								|| #表达式.charAt(i - 1) == '/') {
						flag = 1;
						begin = i;
					} else {
						if (st.empty()) {
							st.push(s);
						} else if (s == ')') {
							num[now - 1] = compute(num[now - 1], num[now], st.pop());
							now -= 1;
							st.pop();
						} else if (s == '(') {
							st.push(s);
						} else if (priority(s) <= priority(st.peek())) {
							num[now - 1] = compute(num[now - 1], num[now], st.pop());
							now -= 1;
							st.push(s);
						} else {
							st.push(s);
						}
					}
				} else if (st.empty()) {
					st.push(s);
				} else if (s == ')') {
					num[now - 1] = compute(num[now - 1], num[now], st.pop());
					now -= 1;
					st.pop();
				} else if (s == '(') {
					st.push(s);
				} else if (priority(s) <= priority(st.peek())) {
					num[now - 1] = compute(num[now - 1], num[now], st.pop());
					now -= 1;
					st.push(s);
				} else {
					st.push(s);
				}

			} else if (flag == 0) {
				flag = 1;
				begin = i;
			} else {
				end = i;
			}

		}
		if (flag == 1) {
			now += 1;
			if (end < begin) {
				num[now] = Integer.valueOf(#表达式.substring(begin, begin + 1));
			} else {
				num[now] = Integer.valueOf(#表达式.substring(begin, end + 1));
			}
		}
		while (now > 0) {
			num[now - 1] = compute(num[now - 1], num[now], st.pop());
			now -= 1;
		}
		return num[0];
		@end
	结束 方法

	@code
	 private static int priority(char s) {
		switch (s) {
			case '(':
			case ')':
				return 0;
			case '-':
			case '+':
				return 1;
			case '*':
			case '%':
			case '/':
				return 2;
			default:
				return -1;

		}
	}

	private static double compute(double num1, double num2, char s) {
		switch (s) {
			case '(':
			case ')':
				return 0;
			case '-':
				return num1 - num2;
			case '+':
				return num1 + num2;
			case '%':
				return num1 % num2;
			case '*':
				return num1 * num2;
			case '/':
				return num1 / num2;
			default:
				return 0;

		}
	}
	@end
结束 类


@全局类
类 常用操作
	
	/*
	向结绳发送调试信息
	参数可以为异常信息，也可以为文本信息
	*/
	@静态
	@调试
	方法 发送调试信息(信息 : 对象)
		@code
		if (#信息 instanceof Exception) {
			tdr.util.TDRSender.sendCrash((Exception) #信息);
		} else {
			tdr.util.TDRSender.sendLogcatLine(String.valueOf(#信息));
		}
		@end
	结束 方法
	
	@静态
	方法 运行报错(错误信息 : 文本)
		code throw new RuntimeException(#错误信息);
	结束 方法
	
	@调试
	@静态
	@嵌入式代码
	方法 调试输出(内容 : 对象="")
		//开启日志过滤后，结绳只会显示TieApp标签的日志信息
		code android.util.Log.i("TieApp", String.valueOf(#内容))
	结束 方法
	
	@调试
	@静态
	@嵌入式代码
	方法 调试输出2(格式 : 文本,参数 : 对象[] = 空)
		code android.util.Log.i("TieApp", String.format(#格式, #参数))
	结束 方法
结束 类


@全局类
@附加权限(安卓权限.文件权限_读取)
@附加权限(安卓权限.管理外部文件权限)
@导入Java("android.os.*")
@导入Java("android.app.*")
@导入Java("java.io.*")
类 存储卡操作
	
	//获取储存卡根目录路径
	@静态
	方法 取存储卡路径() 为 文本
		code return (Environment.getExternalStorageDirectory().getAbsolutePath());
	结束 方法
	
	//获取存储卡是否挂载
	@静态
	方法 取存储卡状态() 为 逻辑型
		code return "mounted".equals(Environment.getExternalStorageState());
	结束 方法

	//判断存储卡是否可写
	@静态
	方法 存储卡是否可写() 为 逻辑型
		code return Environment.getExternalStorageDirectory().canWrite();
	结束 方法

	//获取存储卡总容量，单位为MB
	@静态
	方法 取存储卡总容量() 为 长整数
		@code
		File path = Environment.getExternalStorageDirectory();
		StatFs sf = new StatFs(path.getPath());
		long blockSize = sf.getBlockSize();
		long allBlocks = sf.getBlockCount();
		return allBlocks * blockSize / 1024L / 1024L;
		@end
	结束 方法

	//获取储存卡剩余容量，单位为MB
	@静态
	方法 取存储卡剩余容量() 为 长整数
		@code
		File path = Environment.getExternalStorageDirectory();
		StatFs statFs = new StatFs(path.getPath());
		long blocSize = statFs.getBlockSize();
		long availaBlock = statFs.getAvailableBlocks();
		return availaBlock * blocSize / 1024L / 1024L;
		@end
	结束 方法

	//获取内部存储卡总容量，单位为MB
	@静态
	方法 取内部存储卡总容量() 为 长整数
		@code
		File path = Environment.getDataDirectory();
		StatFs stat = new StatFs(path.getPath());
		long blockSize = stat.getBlockSize();
		long totalBlocks = stat.getBlockCount();
		return totalBlocks * blockSize / 1024L / 1024L;
		@end
	结束 方法

	//获取内部储存卡剩余容量，单位为MB
	@静态
	方法 取内部存储卡剩余容量() 为 长整数
		@code
		File path = Environment.getDataDirectory();
		StatFs stat = new StatFs(path.getPath());
		long blockSize = stat.getBlockSize();
		long availableBlocks = stat.getAvailableBlocks();
		return availableBlocks * blockSize / 1024L / 1024L;
		@end
	结束 方法

	//获取手机总内存，单位为MB
	@静态
	方法 取手机总内存() 为 长整数
		@code
		String str1 = "/proc/meminfo";
		long initial_memory = 0L;
		try {
			FileReader localFileReader = new FileReader(str1);
			BufferedReader localBufferedReader = new BufferedReader(localFileReader, 8192);
			String str2 = localBufferedReader.readLine();
			String[] arrayOfString = str2.split("\\s+");
			initial_memory = Integer.valueOf(arrayOfString[1]).intValue();
			localBufferedReader.close(); 
		} catch (IOException e) {
			return 0L;
		}
		return (initial_memory > 0) ? (initial_memory / 1024L) : 0L;
		@end
	结束 方法

	//获取手机剩余内存，单位为MB
	@静态
	方法 取手机剩余内存(环境 为 安卓环境) 为 长整数
		@code
		ActivityManager am = (ActivityManager) #环境.getSystemService("activity");
		ActivityManager.MemoryInfo mi = new ActivityManager.MemoryInfo();
		am.getMemoryInfo(mi);
		return mi.availMem / 1024L / 1024L;
		@end
	结束 方法

	//获取手机CPU的主频
	@静态
	方法 取CPU主频() 为 小数
		@code
		int result = 0;
		FileReader fr = null;
		BufferedReader br = null;
		try {
			fr = new FileReader("/sys/devices/system/cpu/cpu0/cpufreq/cpuinfo_max_freq");
			br = new BufferedReader(fr);
			String text = br.readLine();
			result = Integer.parseInt(text.trim());
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		finally {
			if (fr != null) {
				try {
					fr.close();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
			if (br != null) {
				try {
					br.close();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
		}
		return result / 1000 / 1000;
		@end
	结束 方法
结束 类


@全局类
@导入Java("java.util.*")
@导入Java("java.util.regex.*")
类 转换操作
	/*
	将任意对象转换为文本值
	*/
	@静态
	方法 对象到文本(值 : 对象) : 文本
		返回 值.到文本()
	结束 方法
	
	/*
	将整数值转换为字节值
	*/
	@静态
	方法 整数到字节(值 : 整数) : 字节
		返回 值.到字节()
	结束 方法

	//将中文转为unicode编码
	@静态
	方法 中文转Unicode(值 为 文本) 为 文本
		@code
		char[] utfBytes = #值.toCharArray();
		String unicodeBytes = "";
		for (int i = 0; i < utfBytes.length; i++) {
			String hexB = Integer.toHexString(utfBytes[i]);
			if (hexB.length() <= 2) {
				hexB = "00" + hexB;
			}
			unicodeBytes = unicodeBytes + "\\u" + hexB;
		}
		return unicodeBytes;
		@end
	结束 方法

	//将unicode编码转为中文
	@静态
	方法 Unicode转中文(值 为 文本) 为 文本
		@code
		Pattern pattern = Pattern.compile("(\\\\u(\\p{XDigit}{4}))");
		Matcher matcher = pattern.matcher(#值);
		char ch;
		while (matcher.find()) {
			ch = (char) Integer.parseInt(matcher.group(2), 16);
			#值 = #值.replace(matcher.group(1), ch + "");
		}
		return #值;
		@end
	结束 方法

	//将字节型数组转为文本
	@静态
	方法 字节到文本(值 为 字节[],编码 为 文本="utf-8") 为 文本
		@code
		try {
			return new String(#值, #编码);
		} catch (Exception ex) {
		}
		return null;
		@end
	结束 方法

	//将文本转为字节型数组
	@静态
	方法 文本到字节(值 为 文本,编码 为 文本="utf-8") 为 字节[]
		@code
		try {
			return #值.getBytes(#编码);
		} catch (Exception ex) {
			throw new RuntimeException("文本到字节( 解码错误");
		}
		@end
	结束 方法

	//将字节型数组转换成整数
	@静态
	方法 字节到整数(值 为 字节[]) 为 整数
		@code
		int targets = #值[0] & 0xFF | #值[1] << 8 & 0xFF00 | #值[2] << 24 >>> 8 | #值[3] << 24;
		return targets;
		@end
	结束 方法

	//将整数转换成字节型数组
	@静态
	方法 整数到字节(值 为 整数) 为 字节[]
		@code
		byte[] targets = new byte[4];
		targets[0] = ((byte)(#值 & 0xFF));
		targets[1] = ((byte)(#值 >> 8 & 0xFF));
		targets[2] = ((byte)(#值 >> 16 & 0xFF));
		targets[3] = ((byte)(#值 >>> 24));
		return targets;
		@end
	结束 方法

	//将字节型数组转换成长整数
	@静态
	方法 字节到长整数(值 为 字节[]) 为 长整数
		code return (#值[0] & 0xFF) << 56 | (#值[1] & 0xFF) << 48 | (#值[2] & 0xFF) << 40 | (#值[3] & 0xFF) << 32 | (#值[4] & 0xFF) << 24 | (#值[5] & 0xFF) << 16 | (#值[6] & 0xFF) << 8 | (#值[7] & 0xFF) << 0;
	结束 方法

	//将长整数转换成字节型数组
	@静态
	方法 长整数到字节(值 为 长整数) 为 字节[]
		@code
		byte[] bb = new byte[8];
		bb[0] = ((byte)(int)(#值 >> 56));
		bb[1] = ((byte)(int)(#值 >> 48));
		bb[2] = ((byte)(int)(#值 >> 40));
		bb[3] = ((byte)(int)(#值 >> 32));
		bb[4] = ((byte)(int)(#值 >> 24));
		bb[5] = ((byte)(int)(#值 >> 16));
		bb[6] = ((byte)(int)(#值 >> 8));
		bb[7] = ((byte)(int)#值);
		return bb;
		@end
	结束 方法

	//将10进制数值转换成大写汉字的人民币金额文本
	@静态
	方法 数值到金额(值 为 小数) 为 文本
		@code
		if ((#值 > 1.0E+018D) || (#值 < - 1.0E+018D)) {
			return "";
		}
		String[] chineseDigits = { "零", "壹", "贰", "叁", "肆", "伍", "陆", "柒", "捌", "玖" };
		boolean negative = false;
		if (#值 < 0.0D) {
			negative = true;
			#值 *= - 1.0D;
		}
		long temp = Math.round(#值 * 100.0D);
		int numFen = (int)(temp % 10L);
		temp /= 10L;
		int numJiao = (int)(temp % 10L);
		temp /= 10L;
		int[] parts = new int[20];
		int numParts = 0;
		for (int i = 0; 
		temp != 0L; i++) {
			int part = (int)(temp % 10000L);
			parts[i] = part;
			numParts++;
			temp /= 10000L;
		}
		boolean beforeWanIsZero = true;
		String chineseStr = "";
		for (int i = 0; i < numParts; i++) {
			String partChinese = partTranslate(parts[i]);
			if (i % 2 == 0) {
				if ("".equals(partChinese))
				beforeWanIsZero = true;
				else {
					beforeWanIsZero = false;
				}
			}
			if (i != 0) {
				if (i % 2 == 0) {
					chineseStr = "亿" + chineseStr;
				} else if (("".equals(partChinese)) && (!beforeWanIsZero)) {
					chineseStr = "零" + chineseStr;
				} else {
					if ((parts[(i - 1)] < 1000) && (parts[(i - 1)] > 0)) {
						chineseStr = "零" + chineseStr;
					}
					chineseStr = "万" + chineseStr;
				}
			}

			chineseStr = partChinese + chineseStr;
		}
		if ("".equals(chineseStr))
		chineseStr = chineseDigits[0];
		else if (negative) {
			chineseStr = "负" + chineseStr;
		}
		chineseStr = chineseStr + "元";
		if ((numFen == 0) && (numJiao == 0))
		chineseStr = chineseStr + "整";
		else if (numFen == 0)
		chineseStr = chineseStr + chineseDigits[numJiao] + "角";
		else if (numJiao == 0)
		chineseStr = chineseStr + "零" + chineseDigits[numFen] + "分";
		else {
			chineseStr = chineseStr + chineseDigits[numJiao] + "角" + chineseDigits[numFen] + "分";
		}

		return chineseStr;
		@end
	结束 方法

	//将字节集(字节型数组)转换成16进制文本
	@静态
	方法 字节集到十六进制(值 为 字节[]) 为 文本
		@code
		byte[] hex = "0123456789ABCDEF".getBytes();
		byte[] buff = new byte[2 * #值.length];
		for (int i = 0; i < #值.length; i++) {
			buff[(2 * i)] = hex[(#值[i] >> 4 & 0xF)];
			buff[(2 * i + 1)] = hex[(#值[i] & 0xF)];
		}
		return new String(buff);
		@end
	结束 方法

	//将16进制文本转换成字节集(字节型数组)
	@静态
	方法 十六进制到字节集(值 为 文本) 为 字节[]
		@code
		byte[] b = new byte[#值.length() / 2];
		int j = 0;
		for (int i = 0; i < b.length; i++) {
			char c0 = #值.charAt(j++);
			char c1 = #值.charAt(j++);
			b[i] = ((byte)(parse(c0) << 4 | parse(c1)));
		}
		return b;
		@end
	结束 方法

	@code
	private static String partTranslate(int amountPart) {
		if ((amountPart < 0) || (amountPart > 10000)) {
			return "";
		}
		String[] chineseDigits = { "零", "壹", "贰", "叁", "肆", "伍", "陆", "柒", "捌", "玖" };
		String[] units = { "", "拾", "佰", "仟" };
		int temp = amountPart;
		String amountStr = new Integer(amountPart).toString();
		int amountStrLength = amountStr.length();
		boolean lastIsZero = true;
		String chineseStr = "";
		for (int i = 0; 
		(i < amountStrLength) && (temp != 0); i++) {
			int digit = temp % 10;
			if (digit == 0) {
				if (!lastIsZero) {
					chineseStr = "零" + chineseStr;
				}
				lastIsZero = true;
			} else {
				chineseStr = chineseDigits[digit] + units[i] + chineseStr;
				lastIsZero = false;
			}
			temp /= 10;
		}
		return chineseStr;
	}

	private static int parse(char c) {
		if (c >= 'a') {
			return c - 'a' + 10 & 0xF;
		}
		if (c >= 'A') {
			return c - 'A' + 10 & 0xF;
		}
		return c - '0' & 0xF;
	}
	@end
结束 类


@全局类
类 文本操作
	
	/*
	格式化文本，返回格式化之后的文本值
	参数一：格式，%d为整数，%s为文本等，示例：1 + %d = %s
	参数二：格式化参数所需对象集，如{1,"2"}
	使用示例：格式化文本("1+%d=%s", {1,"2"})
	*/
	@静态
	方法 格式化文本(格式 : 文本,参数 : 对象[]) : 文本
		返回 文本.格式化(格式, 参数)
	结束 方法
结束 类


@全局类
@导入Java("java.io.*")
类 对象操作
	@静态
	方法 键值对(键 : 对象, 值 : 对象) : 键值对
		变量 结果 : 键值对 = (键, 值)
		返回 结果
	结束 方法
	
	@静态
	方法 哈希表(值 : 键值对[]) : 哈希表
		变量 结果 : 哈希表
		循环(值 -> v)
			结果[v.键] = v.值
		结束 循环
		返回 结果
	结束 方法
	
	@静态
	@嵌入式代码
	方法 新建对象(类型 : 变体型) : 对象
		code new #类型()
	结束 方法
	
	@静态
	@嵌入式代码
	方法 新建窗口组件(类型 : 变体型, 环境 : 安卓环境) : 窗口组件
		code new #类型(#环境)
	结束 方法
	
	/*
	从文本文件读入一个对象
	需要注意的是，该对象的基础类必须直接或间接为序列化类
	*/
	@附加权限(安卓权限.文件权限_读取)
	@静态
	方法 读入对象(路径 为 文本)  为 对象
		@code
		try {
			ObjectInputStream ois = new ObjectInputStream(new FileInputStream(#路径));
			return ois.readObject();
		} catch (IOException e) {
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		return null;
		@end
	结束 方法

	/*
	从对象写入文本文件
	需要注意的是，该对象的基础类必须直接或间接为序列化类
	*/
	@附加权限(安卓权限.文件权限_写入)
	@静态
	方法 写出对象(欲写出对象 为 对象, 欲写到路径 为 文本)
		@code
		try {
			ObjectOutputStream oos = new ObjectOutputStream(new FileOutputStream(#欲写到路径));
			oos.writeObject(#欲写出对象);
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		@end
	结束 方法
结束 类


@全局类
类 像素操作
	@静态
	方法 DP到PX(环境 : 安卓环境, 值 : 整数) : 整数
		@code
		float scale = #环境.getResources().getDisplayMetrics().density;
        return (int) (#值 * scale + 0.5f);
		@end
	结束 方法
	
	@静态
	方法 PX到DP(环境 : 安卓环境, 值 : 整数) : 整数
		@code
		float scale = #环境.getResources().getDisplayMetrics().density;
        return (int) (#值 / scale + 0.5f);
		@end
	结束 方法
	
	@静态
	方法 SP到PX(环境 : 安卓环境, 值 : 整数) : 整数
		@code
		android.util.DisplayMetrics metrics = #环境.getResources().getDisplayMetrics();
		return (int) android.util.TypedValue.applyDimension(android.util.TypedValue.COMPLEX_UNIT_SP, #值, metrics);
		@end
	结束 方法
	
	@静态
	方法 PX到SP(环境 : 安卓环境, 值 : 整数) : 整数
		@code
		return (int) (#值 / #环境.getResources().getDisplayMetrics().scaledDensity);
		@end
	结束 方法
结束 类


@导入Java("java.net.*")
@导入Java("java.io.*")
@全局类
类 编码操作

	/*
	将普通文本转换成URL编码
	参数二 编码类型 为转换后的编码类型，不填写默认为"UTF-8"
	*/
	@静态
	方法 URL编码(值 为 文本,编码 为 文本 = "UTF-8") 为 文本
		@code
		try {
			return URLEncoder.encode(#值, #编码);
		} catch (UnsupportedEncodingException e) {
			return #值;
		}
		@end
	结束 方法

	/*
	将URL编码转换成普通文本
	参数二 编码类型 为转换后的编码类型，不填写默认为"UTF-8"
	*/
	@静态
	方法 URL解码(值 为 文本,编码 为 文本 = "UTF-8") 为 文本
		@code
		try {
			return URLDecoder.decode(#值, #编码);
		} catch (UnsupportedEncodingException e) {
			return #值;
		}
		@end
	结束 方法

	//将文本转换成新的编码格式
	@静态
	方法 转换编码(待转换文本 为 文本,原编码 为 文本,新编码 为 文本) 为 文本
		@code
		if (#待转换文本 == null) {
			return "";
		}
		try {
			return new String(#待转换文本.getBytes(#原编码), #新编码);
		} catch (UnsupportedEncodingException e) {
			return #待转换文本;
		}
		@end
	结束 方法

	//将ANSI文本转换成UCS2编码的文本，例如：编码操作.UCS2编码("结绳，你好！")
	@静态
	方法 UCS2编码(值 为 文本) 为 文本
		@code
		String str = "";
		for (int i = 0; i < #值.length(); i++) {
			String temp = Integer.toHexString(#值.charAt(i) & 65535);
			if (temp.length() == 2) {
				temp = "00" + temp;
			}
			str = str + "\\u" + temp;
		}
		return str;
		@end
	结束 方法

	//将UCS2编码的文本转换成ANSI文本，例如：编码操作.UCS2解码("\u7ed3\u7ef3\uff0c\u4f60\u597d\uff01")
	@静态
	方法 UCS2解码(值 为 文本) 为 文本
		@code
		int len = #值.length();
		StringBuffer outBuffer = new StringBuffer(len);
		int x = 0;
		while (x < len) {
			int x2 = x + 1;
			char aChar = #值.charAt(x);
			if (aChar == '\\') {
				x = x2 + 1;
				aChar = #值.charAt(x2);
				if (aChar == 'u') {
					int value = 0;
					int i = 0;
					while (i < 4) {
						x2 = x + 1;
						aChar = #值.charAt(x);
						switch (aChar) {
							case '0':
							case '1':
							case '2':
							case '3':
							case '4':
							case '5':
							case '6':
							case '7':
							case '8':
							case '9':
							value = ((value << 4) + aChar) - 48;
							break;
							case 'A':
							case 'B':
							case 'C':
							case 'D':
							case 'E':
							case 'F':
							value = (((value << 4) + 10) + aChar) - 65;
							break;
							case 'a':
							case 'b':
							case 'c':
							case 'd':
							case 'e':
							case 'f':
							value = (((value << 4) + 10) + aChar) - 97;
							break;
							default:
							throw new IllegalArgumentException("Malformed	\\uxxxx	encoding.");
						}
						i++;
						x = x2;
					}
					outBuffer.append((char) value);
				} else {
					if (aChar == 't') {
						aChar = '\t';
					} else if (aChar == 'r') {
						aChar = '\r';
					} else if (aChar == 'n') {
						aChar = '\n';
					} else if (aChar == 'f') {
						aChar = '\f';
					}
					outBuffer.append(aChar);
				}
			} else {
				outBuffer.append(aChar);
				x = x2;
			}
		}
		return outBuffer.toString();
		@end
	结束 方法

结束 类

@全局类
类 流程处理
	
	/*
	判断当前应用打包版本是否为调试版
	*/
	@静态
	方法 为调试版() : 逻辑型
		code return #[debug];
	结束 方法
	
	/*
	获取当前应用的构建时间文本
	*/
	@静态
	方法 取构建时间() : 文本
		code return #[date];
	结束 方法
	
	/*
	获取当前应用的构建时间戳
	*/
	@静态
	方法 取构建时间戳() : 长整数
		code return #[time];
	结束 方法
	
	/*
	获取当前代码所处源代码行号
	*/
	@静态
	@嵌入式代码
	方法 取当前行号() : 整数
		code #[line]
	结束 方法
	
	/*
	获取当前代码所处源文件路径
	*/
	@静态
	@嵌入式代码
	方法 取当前源文件路径() : 文本
		code #[source]
	结束 方法
	
	/*
	取反
	*/
	@静态
	方法 取反(值 : 逻辑型) : 逻辑型
		如果 值 == 真 则
			返回 (假)
		否则
			返回 (真)
		结束 如果
	结束 方法
	
	/*
	为指定变量进行赋值
	*/
	@静态
	@嵌入式代码
	方法 赋值(变量名 : 变体型, 值 : 变体型)
		code #变量名 = #值
	结束 方法
	
	/*
	将指定数字自增
	参数一: 欲操作数字
	参数二: 欲增加的值，默认为1
	*/
	@静态
	@嵌入式代码
	方法 自增(数字 : 变体型, 自增值 : 变体型 = 1)
		code #数字 += #自增值
	结束 方法
	
	/*
	将指定数字自减
	参数一: 欲操作数字
	参数二: 欲减去的值，默认为1
	*/
	@静态
	@嵌入式代码
	方法 自减(数字 : 变体型, 自减值 : 变体型 = 1)
		code #数字 -= #自减值
	结束 方法
	
	@静态
	@嵌入式代码
	方法 容错运行(代码 为 变体型)
		code try { #代码; } catch (Exception e) { e.printStackTrace(); }
	结束 方法
	
	@静态
	@嵌入式代码
	方法 容错处理()
		code try {
	结束 方法
	
	@静态
	@嵌入式代码
	方法 结束容错()
		code } catch (Exception e) { e.printStackTrace(); }
	结束 方法
	
	@静态
	@嵌入式代码
	方法 开始俘获异常()
		code try {
	结束 方法
	
	@静态
	@嵌入式代码
	方法 俘获所有异常()
		@code
		} catch (Exception e) {
		@end
	结束 方法
	
	@静态
	@嵌入式代码
	方法 取俘获异常() : 异常
		code e
	结束 方法
	
	@静态
	@嵌入式代码
	方法 结束俘获异常()
		code }
	结束 方法
	
	@静态
	@嵌入式代码
	方法 提交到新线程运行()
		code new Thread(new Runnable() { public void run() {
	结束 方法
	
	@静态
	@嵌入式代码
	方法 结束提交到新线程()
		code }}).start()
	结束 方法
	
	@静态
	@嵌入式代码
	方法 提交到主线程运行(窗口 : 安卓窗口)
		code #窗口.runOnUiThread(new Runnable() { public void run() {
	结束 方法
	
	@静态
	@嵌入式代码
	方法 结束提交到主线程()
		code }})
	结束 方法
结束 类