包名 结绳.安卓

/*
组件容器，用于储存组件
*/
@禁止创建对象
类 组件容器 : 窗口组件
    @code
	public final static int ID = -101;
	private #<线性布局> root;
	private #<可视化组件> userRoot;
	
	public #<组件容器>(android.content.Context context) {
		super(context);
		this.root = new #<线性布局>(context);
		this.root.getView().setTag(ID, this);
		onInit();
	}
	
    public void onInit() {}
	
	protected void setLayout(#<可视化组件> userRoot) {
		this.userRoot = userRoot;
		this.root.addComponent(userRoot);
	}
	
	public void addInLayout(#<@布局组件> parent) {
		parent.addComponent(this.root);
		#创建完毕();
	}
	
	public #<线性布局> getLayout() {
		return this.root;
	}
    @end
	
	方法 取根布局() : 线性布局
		code return getLayout();
	结束 方法
	
	@废弃使用("该方法常被误用，目前已进行废弃")
	方法 取用户布局() : 可视化组件
		code return userRoot;
	结束 方法
	
	@虚拟事件
    方法 创建完毕()
    结束 方法
	
	/*
	通知组件容器绑定数据
	*/
	@虚拟事件
	方法 绑定数据(数据 : 对象)
	结束 方法
结束 类


/*
启动信息类，用于储存启动服务、窗口等四大组件的启动信息
*/
@指代类("android.content.Intent")
类 启动信息
	/*
	向启动信息中置入附加数据
	*/
	@嵌入式代码
	方法 置入(键名 : 文本, 数据 : 对象)
		code #this.putExtra(#键名, #数据);
	结束 方法
	
	/*
	获取启动信息中所附加的文本信息
	若没有该名称所对应的信息，则返回空
	*/
	方法 取文本(键名 : 文本) : 文本
		code return #this.getStringExtra(#键名);
	结束 方法
	
	/*
	获取启动信息中所附加的文本数组信息
	若没有该名称所对应的信息，则返回空
	*/
	方法 取文本数组(键名 : 文本) : 文本[]
		code return #this.getStringArrayExtra(#键名);
	结束 方法
	
	/*
	获取启动信息中所附加的整数信息
	若没有该名称所对应的信息，则返回默认值
	*/
	方法 取整数(键名 : 文本, 默认值 : 整数 = 0) : 整数
		code return #this.getIntExtra(#键名, #默认值);
	结束 方法
	
	/*
	获取启动信息中所附加的整数数组信息
	若没有该名称所对应的信息，则返回空
	*/
	方法 取整数数组(键名 : 文本) : 整数[]
		code return #this.getIntArrayExtra(#键名);
	结束 方法
	
	/*
	获取启动信息中所附加的长整数信息
	若没有该名称所对应的信息，则返回默认值
	*/
	方法 取长整数(键名 : 文本, 默认值 : 长整数 = 0L) : 长整数
		code return #this.getLongExtra(#键名, #默认值);
	结束 方法
	
	/*
	获取启动信息中所附加的字符信息
	若没有该名称所对应的信息，则返回默认值
	*/
	方法 取字符(键名 : 文本, 默认值 : 字符 = ' ') : 字符
		code return #this.getCharExtra(#键名, #默认值);
	结束 方法
	
	/*
	获取启动信息中所附加的逻辑型信息
	若没有该名称所对应的信息，则返回默认值
	*/
	方法 取逻辑值(键名 : 文本, 默认值 : 逻辑型 = 假) : 逻辑型
		code return #this.getBooleanExtra(#键名, #默认值);
	结束 方法
	
	/*
	获取启动信息中所附加的序列化对象信息
	若没有该名称所对应的信息，则返回空
	*/
	方法 取序列化对象(键名 : 文本) : 对象
		code return #this.getSerializableExtra(#键名);
	结束 方法
结束 类

/*
安卓数据包类，用于存储状态信息
*/
@指代类("android.os.Bundle")
类 数据包
结束 类

/*
安卓环境，是安卓开发中最重要的类，表示着一种运行环境
安卓中的全局应用/窗口/服务都是安卓环境
*/
@导入Java("android.os.Environment")
@指代类("android.content.Context")
@禁止创建对象
类 安卓环境
	
	//获取安卓资源管理器
	方法 取安卓资源管理器() : 安卓资源管理器
		code return #this.getResources();
	结束 方法
	
	//获取安卓附加资源管理器
	方法 取附加资源管理器() : 附加资源管理器
		code return #this.getAssets();
	结束 方法
	
	/*
	发送一条广播信息
	参数为启动信息
	*/
	方法 发送广播(数据 : 启动信息)
		@code
		#this.sendBroadcast(#数据);
		@end
	结束 方法
	
	方法 取自身包名() 为 文本
		code return #this.getPackageName();
	结束 方法
	
	@导入Java("android.content.pm.*")
	方法 取自身版本号() 为 整数
		@code
		  try {
			PackageManager packageManager = #this.getPackageManager();
			PackageInfo packageInfo = packageManager.getPackageInfo(#this.getPackageName(), 0);
			return packageInfo.versionCode;
		} catch (PackageManager.NameNotFoundException e) {
			e.printStackTrace();
			return 0;
		}
		@end
	结束 方法
	
	方法 取程序包管理器() : 安卓程序包管理器
		code return #this.getPackageManager();
	结束 方法
	
	方法 取自身版本名称() : 文本
		容错处理()
			返回 取程序包管理器().取程序包信息(取自身包名()).版本名称
		结束容错()
		返回 ""
	结束 方法
	
	/*
	获取当前应用的私有目录文件对象
	*/
	方法 取私有目录() : 文件
		code return #this.getFilesDir();
	结束 方法
	
	/*
	获取当前应用的私有目录文件路径
	*/
	方法 取私有目录路径() : 文本
		返回 取私有目录().取绝对路径()
	结束 方法
	
	方法 取私有缓存目录():文件
		@code
	    return #this.getExternalCacheDir();
		@end
	结束 方法

	方法 取私有缓存目录路径():文本
		@code
	    return #this.getExternalCacheDir().getAbsolutePath();
		@end
	结束 方法

	方法 取私有数据目录(目标:文本):文件
		@code
	    return #this.getExternalFilesDir(#目标);
		@end
	结束 方法

	方法 取私有数据目录路径(目标:文本):文本
		@code
	    return #this.getExternalFilesDir(#目标).getAbsolutePath();
		@end
	结束 方法
	
	/*
	获取当前应用的数据目录文件对象
	*/
	方法 取数据目录() : 文件
		code return #this.getDataDir();
	结束 方法
	
	/*
	获取当前应用的数据目录文件路径
	*/
	方法 取数据目录路径() : 文本
		返回 取数据目录().取绝对路径()
	结束 方法
	
	/*
	获取公用下载目录文件对象
	*/
	方法 取公用下载目录() : 文件
		code return Environment.getExternalStoragePublicDirectory(Environment.DIRECTORY_DOWNLOADS);
	结束 方法
	
	/*
	获取公用下载目录的路径
	*/
	方法 取公用下载目录路径() : 文本
		返回 取公用下载目录().取绝对路径()
	结束 方法
	
	/*
	获取公用图片目录文件对象
	*/
	方法 取公用图片目录() : 文件
		code return Environment.getExternalStoragePublicDirectory(Environment.DIRECTORY_PICTURES);
	结束 方法
	
	/*
	获取公用图片目录的路径
	*/
	方法 取公用图片目录路径() : 文本
		返回 取公用图片目录().取绝对路径()
	结束 方法
	
	/*
	获取公用文档目录文件对象
	*/
	方法 取公用文档目录() : 文件
		code return Environment.getExternalStoragePublicDirectory(Environment.DIRECTORY_DOCUMENTS);
	结束 方法
	
	/*
	获取公用文档目录的路径
	*/
	方法 取公用文档目录路径() : 文本
		返回 取公用文档目录().取绝对路径()
	结束 方法
结束 类


/*
安卓菜单接口
*/
@指代类("android.view.Menu")
类 菜单
	/*
	添加一个菜单项
	参数：菜单项的标题
	*/
	方法 添加菜单项(标题 : 文本) : 菜单项
		code return #this.add(#标题);
	结束 方法
	
	/*
	添加一个菜单项
	参数一：菜单项所处组别的ID
	参数二: 菜单项的ID
	参数三: 菜单项的序号
	参数四: 菜单项的标题
	*/
	方法 添加菜单项2(组ID : 整数,ID : 整数,序号 : 整数,标题 : 文本) : 菜单项
		code return #this.add(#组ID, #ID, #序号, #标题);
	结束 方法
	
	/*
	添加一个子菜单项
	参数一：子菜单项所处组别的ID
	参数二: 子菜单项的ID
	参数三: 子菜单项的序号
	参数四: 子菜单项的标题
	*/
	方法 添加子菜单(组ID 为 整数, ID 为 整数, 序号 为 整数, 标题 为 文本)
		code #this.addSubMenu(#组ID, #ID, #序号, #标题);
	结束 方法
结束 类


/*
安卓菜单项接口
*/
@指代类("android.view.MenuItem")
类 菜单项
	@静态
	常量 总是显示 : 整数 = 2
	@静态
	常量 尽量显示 : 整数 = 1
	@静态
	常量 从不显示 : 整数 = 0
	@静态
	常量 带标题显示 : 整数 = 4
	
	/*
	获取菜单项的ID
	*/
	属性读 ID() : 整数
		code return #this.getItemId();
	结束 属性
	
	/*
	获取菜单项的组ID
	*/
	属性读 组ID() : 整数
		code return #this.getGroupId();
	结束 属性
	
	/*
	获取菜单项的序号
	*/
	属性读 序号() : 整数
		code return #this.getOrder();
	结束 属性
	
	/*
	获取菜单项的标题
	*/
	属性读 标题() : 文本
		code return #this.getTitle().toString();
	结束 属性
	
	/*
	设置菜单项的标题
	*/
	属性写 标题(标题 : 文本)
		code #this.setTitle(#标题);
	结束 属性
	
	/*
	设置菜单项的图片资源
	*/
	属性写 图标资源(图标 : 图片资源)
		code #this.setIcon(#图标);
	结束 属性
	
	/*
	设置菜单项作为标题栏操作菜单时的显示方式
	参见菜单项常量
	*/
	属性写 标题栏显示方式(方式 : 整数)
		code #this.setShowAsAction(#方式);
	结束 属性
结束 类