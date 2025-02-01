包名 结绳.JVM

/*
定时器类，提供定时任务功能
可通过本类实现每隔一定周期执行一次功能
*/
@导入Java("java.util.Timer")
@导入Java("java.util.TimerTask")
@导入Java("android.os.Handler")
@导入Java("android.os.Message")
类 定时器
	@code
	private Timer timer = new Timer();
	private Handler handler = new Handler(){
		@Override
		public void handleMessage(Message msg) {
			super.handleMessage(msg);
			#定时事件();
		}
	};
	@end

	/*
	开始定时
	参数一为定时器的定时周期，每间隔定时周期时间，将会触发一次定时事件
	参数二为定时器首次启动的延迟时间，如设置3000，则定时器将会在3秒以后才会启动，不设置默认为0
	*/
	方法 开始定时(定时周期 为 长整数, 延迟时间 为 长整数 = 0L)
		@code
		timer.schedule(new TimerTask(){
			@Override
			public void run() {
				handler.sendEmptyMessage(0);
			}
		}, #延迟时间, #定时周期);
		@end
	结束 方法

	//关闭定时器，关闭以后无法再使用定时器，需重新创建定时器
	方法 关闭()
		code timer.cancel();
	结束 方法

	定义事件 定时事件()
结束 类

/*
倒计时器类，提供倒计时任务功能
可通过本类实现倒计时指定时间执行一次功能
*/
类 倒计时器
	@code
	private android.os.CountDownTimer timer;
	@end

	//开始倒计时
	方法 开始倒计时(倒计时时长 为 长整数, 间隔时长 为 长整数)
		@code
		timer = new android.os.CountDownTimer(#倒计时时长, #间隔时长) {
			@Override
			public void onTick(long p1) {
				#正在倒计时(p1);
			}

			@Override
			public void onFinish() {
				#倒计时结束();
			}
		};
		timer.start();
		@end
	结束 方法

	//关闭倒计时器，关闭以后无法再使用倒计时器，需重新创建倒计时器
	方法 关闭()
		code timer.cancel();
	结束 方法

	定义事件 正在倒计时(剩余时长 为 长整数)

	定义事件 倒计时结束()
结束 类


/*
国家和地区语言环境
*/
@指代类("java.util.Locale")
类 语言环境
	@静态
	常量 中文 : 语言环境?
	
	@静态
	常量 简体中文 : 语言环境?
	
	@静态
	常量 繁体中文 : 语言环境?
	
	@静态
	常量 英语 : 语言环境?
	
	@静态
	常量 法语 : 语言环境?
	
	@静态
	常量 日语 : 语言环境?
	
	@静态
	常量 意大利语 : 语言环境?
	
	@静态
	常量 朝鲜语 : 语言环境?
	
	@静态
	常量 德语 : 语言环境?
	
	@静态
	常量 英语_英国 : 语言环境?
	
	@静态
	常量 英语_美国 : 语言环境?
	
	@静态
	常量 英语_加拿大 : 语言环境?
	
	@静态
	常量 法语_加拿大 : 语言环境?
	
	@运算符重载
	方法 =(语言代码 : 文本, 国家或地区代码 : 文本)
		code return new java.util.Locale(#语言代码, #国家或地区代码);
	结束 方法
	
	@静态
	方法 新建语言环境(语言代码 : 文本, 国家或地区代码 : 文本) : 语言环境
		code return new java.util.Locale(#语言代码, #国家或地区代码);
	结束 方法
	
	@code
	static {
		#中文 = java.util.Locale.CHINESE;
		#简体中文 = java.util.Locale.SIMPLIFIED_CHINESE;
		#繁体中文 = java.util.Locale.TRADITIONAL_CHINESE;
		#英语 = java.util.Locale.ENGLISH;
		#法语 = java.util.Locale.FRENCH;
		#日语 = java.util.Locale.JAPANESE;
		#意大利语 = java.util.Locale.ITALIAN;
		#朝鲜语 = java.util.Locale.KOREAN;
		#德语 = java.util.Locale.GERMAN;
		#英语_英国 = java.util.Locale.UK;
		#英语_美国 = java.util.Locale.US;
		#英语_加拿大 = java.util.Locale.CANADA;
		#法语_加拿大 = java.util.Locale.CANADA_FRENCH;
	}
	@end
结束 类


@指代类("java.util.UUID")
@导入Java("java.util.UUID")
类 通用唯一识别码
	@静态
	方法 新建对象(最大范围:整数,最小范围:整数):通用唯一识别码
		code return new UUID(#最大范围,#最小范围);
	结束 方法
	
	@静态
	方法 取随机标识符():通用唯一识别码
		code return UUID.randomUUID();
	结束 方法
	
	@静态
	方法 从字节集创建(标识名:字节[]):通用唯一识别码
		code return UUID.nameUUIDFromBytes(#标识名);
	结束 方法
	
	@静态
	方法 从文本创建(标识名:文本):通用唯一识别码
		code return UUID.fromString(#标识名);
	结束 方法
	
	属性读 最大有效范围() : 整数
		code return #this.getLeastSignificantBits();
	结束 属性
	
	属性读 最小有效范围() : 整数
		code return #this.getMostSignificantBits();
	结束 属性
	
	属性读 版本() : 整数
		code return #this.version();
	结束 属性
	
	属性读 关联变量号() : 整数
		code return #this.variant();
	结束 属性
	
	属性读 时间戳() : 长整数
		code return #this.timestamp();
	结束 属性
	
	属性读 时间序列() : 整数
		code return #this.clockSequence();
	结束 属性
	
	属性读 节点() : 整数
		code return #this.node();
	结束 属性
	
	方法 到文本():文本
		code return #this.toString();
	结束 方法
	
结束 类