包名 结绳.安卓

/*
安卓提示框类
*/
@禁止创建对象
@指代类("android.widget.Toast")
类 安卓提示框
	@静态
	常量 长时 : 整数 = 1
	@静态
	常量 短时 : 整数 = 0
	
	@静态
	方法 新建提示框(环境 : 安卓环境)
		code return new android.widget.Toast(#环境);
	结束 方法
	
	@静态
	方法 弹出提示(环境 : 安卓环境, 内容 : 文本, 长时显示 : 逻辑型 = 假)
		code android.widget.Toast.makeText(#环境, #内容, #长时显示 ? 1 : 0).show();
	结束 方法
	
	/*
	获取提示框显示时长
	*/
	属性读 显示时长() : 整数
		code return #this.getDuration();
	结束 属性
	
	/*
	设置提示框显示时长
	*/
	属性写 显示时长(时长 : 整数 = 安卓提示框.短时)
		code #this.setDuration(#时长);
	结束 属性
	
	/*
	获取提示框自定义布局
	*/
	属性读 布局() : 可视化组件
		code return (#<可视化组件>) #this.getView().getTag();
	结束 属性
	
	/*
	设置提示框自定义布局
	*/
	属性写 布局(组件 : 可视化组件)
		code #this.setView(#组件.getView());
	结束 属性
	
	/*
	设置提示框显示内容
	*/
	属性写 内容(内容 : 文本)
		code #this.setText(#内容);
	结束 属性
	
	/*
	获取提示框横向边距
	*/
	属性读 横向边距() : 整数
		code return (int) #this.getHorizontalMargin();
	结束 属性
	
	/*
	获取提示框纵向边距
	*/
	属性读 纵向边距() : 整数
		code return (int) #this.getVerticalMargin();
	结束 属性
	
	/*
	获取提示框横向偏移
	*/
	属性读 横向偏移() : 整数
		code return #this.getXOffset();
	结束 属性
	
	/*
	获取提示框纵向偏移
	*/
	属性读 纵向偏移() : 整数
		code return #this.getYOffset();
	结束 属性
	
	/*
	获取提示框对齐方式
	*/
	属性读 对齐方式() : 整数
		code return #this.getGravity();
	结束 属性
	
	/*
	将提示框显示出来
	*/
	方法 显示()
		code #this.show();
	结束 方法
	
	/*
	将提示框取消
	*/
	方法 取消()
		code #this.cancel();
	结束 方法
	
	/*
	设置提示框显示时的边距
	*/
	方法 置边距(横向边距 : 整数, 纵向边距 : 整数)
		code #this.setMargin(#横向边距, #纵向边距);
	结束 方法
	
	/*
	设置提示框的对齐方式，如(靠上对齐)
	*/
	方法 置对齐方式(对齐方式 : 整数, 横向偏移 : 整数, 纵向偏移 : 整数)
		code #this.setGravity(#对齐方式, #横向偏移, #纵向偏移);
	结束 方法
结束 类

/*
提示框组件
*/
类 提示框 : 窗口组件
	@静态
	常量 长时 : 整数 = 1
	@静态
	常量 短时 : 整数 = 0
	
	@隐藏
	变量 提示框对象 : 安卓提示框?
	
	@code
	public #<提示框>(android.content.Context context) {
		super(context);
		#提示框对象 = android.widget.Toast.makeText(context, "", 0);
	}
	@end
	
	/*
	获取提示框显示时长
	*/
	属性读 显示时长() : 整数
		返回 提示框对象.显示时长
	结束 属性
	
	/*
	设置提示框显示时长
	*/
	属性写 显示时长(时长 : 整数 = 提示框.短时)
		提示框对象.显示时长 = 时长
	结束 属性
	
	/*
	获取提示框自定义布局
	*/
	属性读 布局() : 可视化组件
		返回 提示框对象.布局
	结束 属性
	
	/*
	设置提示框自定义布局
	*/
	属性写 布局(组件 : 可视化组件)
		提示框对象.布局 = 组件
	结束 属性
	
	/*
	设置提示框显示内容
	*/
	属性写 内容(内容 : 文本)
		提示框对象.内容 = 内容
	结束 属性
	
	/*
	获取提示框横向边距
	*/
	属性读 横向边距() : 整数
		返回 提示框对象.横向边距
	结束 属性
	
	/*
	获取提示框纵向边距
	*/
	属性读 纵向边距() : 整数
		返回 提示框对象.纵向边距
	结束 属性
	
	/*
	获取提示框横向偏移
	*/
	属性读 横向偏移() : 整数
		返回 提示框对象.横向偏移
	结束 属性
	
	/*
	获取提示框纵向偏移
	*/
	属性读 纵向偏移() : 整数
		返回 提示框对象.纵向偏移
	结束 属性
	
	/*
	获取提示框对齐方式
	*/
	属性读 对齐方式() : 整数
		返回 提示框对象.对齐方式
	结束 属性
	
	/*
	将提示框显示出来
	*/
	方法 显示()
		提示框对象.显示()
	结束 方法
	
	/*
	将提示框取消
	*/
	方法 取消()
		提示框对象.取消()
	结束 方法
	
	/*
	设置提示框显示时的边距
	*/
	方法 置边距(横向边距 : 整数, 纵向边距 : 整数)
		提示框对象.置边距(横向边距, 纵向边距)
	结束 方法
	
	/*
	设置提示框的对齐方式，如(靠上对齐)
	*/
	方法 置对齐方式(对齐方式 : 整数, 横向偏移 : 整数, 纵向偏移 : 整数)
		提示框对象.置对齐方式(对齐方式, 横向偏移, 纵向偏移)
	结束 方法
	
	@静态
	方法 弹出提示(环境 : 安卓环境, 内容 : 文本, 长时显示 : 逻辑型 = 假)
		code android.widget.Toast.makeText(#环境, #内容, #长时显示 ? 1 : 0).show();
	结束 方法
结束 类


/*
音乐播放器组件
*/
@导入Java("android.media.*")
@导入Java("android.os.*")
@导入Java("java.util.*")
类 音乐播放器

	@code
	private MediaPlayer player;
	private Timer mTimer;
	private TimerTask mTimerTask;
	private Handler handleProgress;
	private boolean autoPlay = true;
	
	public #<音乐播放器>() {
		this.player = new MediaPlayer();
		this.mTimer = new Timer();
		player.setAudioStreamType(AudioManager.STREAM_MUSIC);
		player.setOnBufferingUpdateListener(new MediaPlayer.OnBufferingUpdateListener(){
			@Override
			public void onBufferingUpdate(MediaPlayer p1, int p2){
				#音乐正在缓冲(p2);
			}
		});
		player.setOnPreparedListener(new MediaPlayer.OnPreparedListener(){
			@Override
			public void onPrepared(MediaPlayer p1){
				if (autoPlay) {
					if(p1.isPlaying()){
						p1.stop();
						p1.start();
					}else{
						p1.start();
					}
				}
				#音乐缓冲完毕();
			}
		});
		player.setOnCompletionListener(new MediaPlayer.OnCompletionListener(){
			@Override
			public void onCompletion(MediaPlayer p1) {
				#音乐播放完毕();
			}
		});
		mTimerTask = new TimerTask() {
			@Override
			public void run(){
				if (player == null)
				return;
				if (player.isPlaying()){
					handleProgress.sendEmptyMessage(0);
				}
			}
		};
		mTimer.schedule(mTimerTask, 0,1000);
		handleProgress = new Handler() {
			public void handleMessage(Message msg){
				#音乐正在播放();
			};
		};
	}
	@end

	//设置音乐播放器是否循环播放
	属性写 循环播放(是否循环播放 为 逻辑型)
		code player.setLooping(#是否循环播放);
	结束 属性

	//获取音乐播放器是否循环播放
	属性读 循环播放() 为 逻辑型
		code return player.isLooping();
	结束 属性

	//设置播放音乐的路径，可以为本地路径，也可以为网络路径,第二个参数为是否自动播放，表示视频加载完成后是否自动播放
	@附加权限(安卓权限.文件权限_读取)
	@附加权限(安卓权限.网络权限)
	方法 置播放路径(路径 为 文本, 是否自动播放 为 逻辑型 = 真)
		@code
		this.autoPlay = #是否自动播放;
		player.reset();
		try {
			player.setDataSource(#路径);
			player.prepareAsync();
		} catch (Exception e) {
			e.printStackTrace();
		}
		@end
	结束 方法

	//开始播放音乐
	方法 开始播放()
		code player.start();
	结束 方法

	//暂停播放音乐
	方法 暂停播放()
		code player.pause();
	结束 方法

	//停止播放音乐
	方法 停止播放()
		code player.stop();
	结束 方法

	//获取音乐总时长
	方法 取音乐总时长() 为 整数
		code return player.getDuration();
	结束 方法

	//获取当前播放位置
	方法 取当前播放位置() 为 整数
		code return player.getCurrentPosition();
	结束 方法

	//快进至指定位置
	方法 快进至(位置 为 整数)
		code player.seekTo(#位置);
	结束 方法

	//设置播放音乐的音量，分别设置左声道音量和右声道音量
	方法 置音量(左声道音量 为 小数, 右声道音量 为 小数)
		code player.setVolume((float) #左声道音量, (float) #右声道音量);
	结束 方法

	//重置音乐播放器
	方法 重置()
		code player.reset();
	结束 方法

	//释放资源
	方法 释放资源()
		code player.release();
	结束 方法

	//判断音乐播放器是否在播放音乐
	方法 是否在播放() 为 逻辑型
		code return player.isPlaying();
	结束 方法

	//音乐正在缓冲时触发该事件，返回缓冲进度
	定义事件 音乐正在缓冲(进度 为 整数)

	//音乐缓冲完成时触发该事件
	定义事件 音乐缓冲完毕()

	//音乐正在播放时触发该事件
	定义事件 音乐正在播放()

	//音乐播放完毕时触发该事件
	定义事件 音乐播放完毕()
结束 类