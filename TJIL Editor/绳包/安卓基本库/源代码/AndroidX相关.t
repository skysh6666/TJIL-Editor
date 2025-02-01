包名 结绳.安卓

@外部依赖库("../../依赖库/androidx")
类 AndroidX系列基础类
结束 类

@外部依赖库("../../依赖库/material")
类 Material系列基础类
结束 类

@外部依赖库("../../依赖库/androidx")
@禁止创建对象
@指代类("androidx.appcompat.app.AppCompatActivity")
类 安卓兼容窗口 : 安卓窗口
结束 类

@禁止创建对象
@导入Java("android.content.Intent")
@导入Java("android.os.Bundle")
类 兼容窗口 : 安卓兼容窗口
	@code
	private #<可视化组件> root;
	
    @Override
    protected void onCreate(Bundle savedBundleInstance) {
		super.onCreate(savedBundleInstance);
		#即将创建();
        onInit();
        #创建完毕();
    }

    public void onInit() { }
	
	protected void setLayout(#<可视化组件> root) {
		this.root = root;
		setContentView(root.getView());
	}
	
	@Override
	protected void onStart() {
		super.onStart();
		#被启动();
	}

	@Override
	protected void onRestart() {
		super.onStart();
		#被重新启动();
	}

	@Override
	protected void onStop() {
		super.onStop();
		#被停止();
	}

	@Override
	protected void onPause() {
		super.onPause();
		#被暂停();
	}

	@Override
	protected void onResume() {
		super.onResume();
		#被恢复();
	}

	@Override
	protected void onDestroy() {
		super.onDestroy();
		#被销毁();
	}
	
	@Override
	public boolean onCreateOptionsMenu(android.view.Menu menu) {
		#菜单被创建(menu);
		return super.onCreateOptionsMenu(menu);
	}
	
	@Override
	public boolean onOptionsItemSelected(android.view.MenuItem item) {
		if (item.getItemId() == android.R.id.home) {
			#标题栏返回键被单击();
		} else {
			#菜单项被选中(item);
		}
		return super.onOptionsItemSelected(item);
	}
	
	@Override
	protected void onActivityResult(int requestCode, int resultCode, Intent data) {
		super.onActivityResult(requestCode, resultCode, data);
		#获得返回数据(requestCode, resultCode, data);
	}
	
	@Override
	public void onRequestPermissionsResult(int requestCode, String[] permissions, int[] grantResults) {
		super.onRequestPermissionsResult(requestCode, permissions, grantResults);
		#申请权限完毕(requestCode, permissions, grantResults);
	}
    @end
	
	/*
	窗口即将创建时触发该事件
	*/
    @虚拟事件
    方法 即将创建()
    结束 方法

	/*
	窗口创建完毕时触发该事件
	*/
    @虚拟事件
    方法 创建完毕()
    结束 方法

	/*
	窗口被启动时触发该事件
	*/
    @虚拟事件
    方法 被启动()
    结束 方法
	
	/*
	窗口被重新启动时触发该事件
	*/
	@虚拟事件
    方法 被重新启动()
    结束 方法

	/*
	窗口被暂停时触发该事件
	*/
    @虚拟事件
    方法 被暂停()
    结束 方法

	/*
	窗口被启动时触发该事件
	*/
    @虚拟事件
    方法 被停止()
    结束 方法

    @虚拟事件
    方法 被恢复()
    结束 方法
	
	@虚拟事件
    方法 被销毁()
    结束 方法
	
	@虚拟事件
	方法 菜单被创建(菜单 : 菜单)
	结束 方法
	
	@虚拟事件
	方法 菜单项被选中(菜单项 : 菜单项)
	结束 方法
	
	@虚拟事件
	方法 标题栏返回键被单击()
	结束 方法
	
	/*
	当窗口要求另一个窗口返回数据成功时，会触发该事件用于接收返回数据
	*/
	@虚拟事件
    方法 获得返回数据(请求码 : 整数,结果码 : 整数,数据 : 启动信息)
    结束 方法
	
	@虚拟事件
	方法 申请权限完毕(请求码 : 整数,权限集 : 文本[],允许结果 : 整数[])
	结束 方法
	
	@输出名("onBackPressed")
	@虚拟方法
	方法 返回键被按下()
		code super.onBackPressed();
	结束 方法
	
	/*
	设置窗口布局内容
	*/
	方法 置窗口布局(布局 : 可视化组件)
		code setLayout(#布局);
	结束 方法
	
	/*
	设置窗口布局内容
	*/
	方法 置窗口布局2(布局 : 组件容器)
	    @code
		setLayout(#<布局.取根布局>());
		#<布局.创建完毕>();
		@end
	结束 方法
	
	/*
	获取窗口布局内容
	*/
	方法 取窗口布局() : 可视化组件
		@code
		return this.root;
		@end
	结束 方法
	
	/*
	将工具栏设为兼容窗口的标题栏
	*/
	方法 置兼容标题栏()
		
	结束 方法
结束 类