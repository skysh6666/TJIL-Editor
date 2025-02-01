包名 结绳.安卓

/*
线程消息类
*/
@指代类("android.os.Message")
类 消息
	属性读 标记值() : 整数
		code return #this.what;
	结束 属性
	
	属性写 标记值(值 : 整数)
		code #this.what = #值;
	结束 属性
	
	属性读 参数() : 对象
		code return #this.obj;
	结束 属性
	
	属性写 参数(值 : 对象)
		code #this.obj = #值;
	结束 属性
结束 类

/*
安卓线程基础类
*/
@全局类
@指代类("Thread")
类 安卓线程
	@嵌入式代码
	@静态
	方法 取当前线程() : 安卓线程
		code Thread.currentThread()
	结束 方法
	
	@嵌入式代码
	@静态
	方法 取当前线程ID() : 长整数
		code Thread.currentThread().getId()
	结束 方法
	
	@嵌入式代码
	@静态
	方法 取当前线程名称() : 文本
		code Thread.currentThread().getName()
	结束 方法
	
	/*
	通知系统当前线程已经执行完毕，转到到其他线程执行
	*/
	@静态
	@嵌入式代码
	方法 转交其它线程执行()
		code Thread.yield()
	结束 方法
	
	//使线程休眠一段时间
	@静态
	@嵌入式代码
	方法 延时(时长 为 长整数 = 0)
		code try { Thread.sleep(#时长); } catch (Exception e) { e.printStackTrace(); }
	结束 方法
	
	属性读 ID() : 长整数
		code return #this.getId();
	结束 属性
	
	属性读 名称() : 文本
		code return #this.getName();
	结束 属性
	
	属性写 名称(名称 : 文本)
		code #this.setName(#名称);
	结束 属性
	
	/*
	获取线程优先级，1-10
	*/
	属性读 优先级() : 整数
		code return #this.getPriority();
	结束 属性
	
	/*
	设置线程优先级，1-10
	*/
	属性写 优先级(优先级 : 整数)
		code #this.setPriority(#优先级);
	结束 属性
	
	属性读 正在执行() : 逻辑型
		code return #this.isAlive();
	结束 属性
	
	//启动线程
	@嵌入式代码
	方法 启动()
		code #this.start()
	结束 方法
	
	方法 中断()
		code #this.interrupt();
	结束 方法
结束 类

/*
线程类，提供线程操作功能
*/
类 线程 : 安卓线程
	@code
	private android.os.Handler handler = new android.os.Handler(android.os.Looper.getMainLooper()){
		@Override
		public void handleMessage(#<@消息> msg) {
			#更新主线程(msg);
		}
	};
	
	@Override
	public void run() {
		#被启动();
	}
	@end

	/*
	发送消息到主线程通知更新界面
	参数为欲发送的附加消息，默认为空
	*/
	方法 通知_更新主线程(欲发送消息 为 消息 = 空)
		@code
		if (#欲发送消息 == null) {
			handler.sendEmptyMessage(0);
		} else {
			handler.sendMessage(#欲发送消息);
		}
		@end
	结束 方法

	//线程内部处理器接收到发送的消息时触发该事件，一般在该处进行界面更新处理
	定义事件 更新主线程(来源消息 为 消息)

	//线程被启动时触发该事件，用户可在该事件进行耗时操作
	定义事件 被启动()
结束 类


/*
时钟类，提供周期事件功能
*/
@后缀代码("implements Runnable")
类 时钟
	@code
	private boolean enabled;
	private int period;
	private android.os.Handler handler = new android.os.Handler(android.os.Looper.getMainLooper());
 
	@Override
	public void run() {
		if (enabled) {
			#周期事件();
			handler.postDelayed(this, period);
		}
	}
	@end

	//设置时钟周期
	属性写 时钟周期(周期 为 整数)
		@code
		this.period = #周期;
		if (period > 0) {
			enabled = true;
		} else {
			enabled = false;
		}
		if (enabled) {
			handler.removeCallbacks(this);
			handler.postDelayed(this, period);
		}
		@end
	结束 属性

	//获取时钟周期
	属性读 时钟周期() 为 整数
		code return period;
	结束 属性

	//设置时钟是否可用
	属性写 可用(是否可用 为 逻辑型)
		@code
		enabled = #是否可用;
		if (enabled) {
			handler.removeCallbacks(this);
			handler.postDelayed(this, period);
		}
		@end
	结束 属性

	//获取时钟是否可用
	属性读 可用() 为 逻辑型
		code return enabled;
	结束 属性

	定义事件 周期事件()
结束 类