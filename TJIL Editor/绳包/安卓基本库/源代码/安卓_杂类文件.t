包名 结绳.安卓

@导入Java("android.os.Looper")
@导入Java("android.content.Intent")
@导入Java("java.io.File")
@后缀代码("implements Thread.UncaughtExceptionHandler")
类 程序崩溃处理
	@code
	private Thread.UncaughtExceptionHandler mDefaultHandler;
	private static #<程序崩溃处理> INSTANCE = new #<程序崩溃处理>();
	private android.content.Context mContext;
	private String path;
	
	private #<程序崩溃处理>() {
	}
 
	@Override
	public void uncaughtException(Thread thread, Throwable ex) {
		if (!handleException(ex) && mDefaultHandler != null) {
			mDefaultHandler.uncaughtException(thread, ex);
		}
	}
 
	private boolean handleException(Throwable ex) {
		if (ex == null) {
			return false;
		}
		new Thread() {
			@Override
			public void run() {
				Looper.prepare();
				Looper.loop();
			}
		}.start();
		sendError(ex);
		return true;
	}
 
	private void sendError(Throwable ex) {
		StringBuilder sb = new StringBuilder();
		Throwable cause = ex.getCause();
		Intent intent = new Intent();
		intent.setPackage("com.tiecode.develop");
		intent.setAction("com.tiecode.LOGCAT");
		intent.putExtra("crash", ex);
		mContext.sendBroadcast(intent);
		sb.append("Caused by: ").append(cause.toString());
		StackTraceElement[] elements = cause.getStackTrace();
		for (StackTraceElement element : elements) {
			intent.putExtra("msg", "[运行异常]\tat " + element.toString());
			mContext.sendBroadcast(intent);
			sb.append("\n").append("\tat ").append(element.toString());
		}
		if (path != null && !"".equals(path)) {
			try {
				//jiesheng.FileUtils.write(new File(path), sb.toString());
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}
 
	private void init(android.content.Context context, String path) {
		this.mContext = context;
		this.path = path;
		mDefaultHandler = Thread.getDefaultUncaughtExceptionHandler();
		Thread.setDefaultUncaughtExceptionHandler(this);
	}
	@end
	
	//初始化程序崩溃处理，若不想保存到文件，第二个参数填写空或空字符串
	@静态
	方法 初始化(环境 为 安卓环境, 日志保存路径 为 文本)
		@code
		INSTANCE.init(#环境, #日志保存路径);
		@end
	结束 方法
结束 类

/*
设备信息类，提供手机设备的信息访问
*/
@导入Java("android.os.Build")
类 设备信息
	@静态
	常量 安卓版本号 为 整数?
	
	@静态
	常量 主板信息 为 文本?
	
	@静态
	常量 系统启动程序版本号 为 文本?
	
	@静态
	常量 品牌 为 文本?
	
	@静态
	常量 CPU指令集 为 文本?
	
	@静态
	常量 CPU指令集2 为 文本?
	
	@静态
	常量 设备参数 为 文本?
	
	@静态
	变量 显示屏参数 为 文本?
	
	@静态
	常量 唯一识别码 为 文本?
	
	@静态
	常量 硬件名称 为 文本?
	
	@静态
	常量 硬件制造商 为 文本?
	
	@静态
	常量 硬件序列号 为 文本?
	
	@静态
	常量 用户可见名称 为 文本?
	
	@静态
	常量 产品名称 为 文本?
	
	@静态
	常量 无线电固件版本 为 文本?
	
	@code
	static {
		#安卓版本号 = Build.VERSION.SDK_INT;
		#主板信息 = Build.BOARD;
		#系统启动程序版本号 = Build.BOOTLOADER;
		#品牌 = Build.BRAND;
		#CPU指令集 = Build.CPU_ABI;
		#CPU指令集2 = Build.CPU_ABI2;
		#设备参数 = Build.DEVICE;
		#显示屏参数 = Build.DISPLAY;
		#唯一识别码 = Build.FINGERPRINT;
		#硬件名称 = Build.HARDWARE;
		#硬件制造商 = Build.MANUFACTURER;
		#硬件序列号 = Build.SERIAL;
		#用户可见名称 = Build.MODEL;
		#产品名称 = Build.PRODUCT;
		#无线电固件版本 = Build.RADIO;
	}
	@end
结束 类