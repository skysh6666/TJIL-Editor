包名 结绳.安卓

/*
GIF动画框
*/
@外部Java文件("../../extra_java/gif/GIFView.java")
类 GIF动画框 : 可视化组件
	@code
    public #<GIF动画框>(android.content.Context context) {
        super(context);
    }

    @Override
    public rn_1.GIFView onCreateView(android.content.Context context) {
        rn_1.GIFView view = new rn_1.GIFView(context);
        return view;
    }

    @Override
    public rn_1.GIFView getView() {
        return (rn_1.GIFView) view;
    }
    @end

	//设置GIF动画框的资源路径，文件路径可以为assets资源名称，也可以为sd卡路径
	属性写 动画路径(GIF文件路径 为 文本)
		如果 GIF文件路径.开头为("/")
			code getView().setMovieResource(#GIF文件路径);
		否则
			变量 文件流 : 输入流 = 取安卓环境().取附加资源管理器().打开文件(GIF文件路径);
			如果 文件流 == 空
				返回
			结束 如果
			本对象.动画输入流 = 文件流
			文件流.关闭()
		结束 如果
	结束 属性

	//通过输入流设置动画
	属性写 动画输入流(动画输入流 : 输入流)
		code getView().setMovieResource(#动画输入流);
	结束 属性

	属性读 播放状态() 为 逻辑型
		code return !getView().isPaused();
	结束 属性

	属性写 播放状态(是否播放 为 逻辑型)
		code getView().setPaused(!#是否播放);
	结束 属性

	属性读 动画时长() 为 整数
		code return getView().getMovieTime();
	结束 属性

	属性写 动画时长(动画时长 为 整数)
		code getView().setMovieTime(#动画时长);
	结束 属性
结束 类


//圆形图片框组件
@外部Java文件("../../extra_java/circleimageview/CircleImageView.java")
类 圆形图片框 : 图片框
	@code
    public #<圆形图片框>(android.content.Context context) {
        super(context);
    }

    @Override
    public rn_1.CircleImageView onCreateView(android.content.Context context) {
        rn_1.CircleImageView view = new rn_1.CircleImageView(context);
        return view;
    }

    @Override
    public rn_1.CircleImageView getView() {
        return (rn_1.CircleImageView) view;
    }
    @end

	//设置圆形图片框阴影
	属性写 圆角阴影(阴影度 为 整数)
		code getView().setElevation2(#阴影度);
	结束 属性

	//设置圆形图片框边框宽度
	属性写 边框宽度(边框宽度 为 整数)
		code getView().setBorderWidth(#边框宽度);
	结束 属性

	//获取圆形图片框边框宽度
	属性读 边框宽度() 为 整数
		code return getView().getBorderWidth();
	结束 属性

	//设置圆形图片框边框颜色
	属性写 边框颜色(边框颜色 为 整数)
		code getView().setBorderColor(#边框颜色);
	结束 属性

	//设置圆形图片框边框颜色
	属性写 边框颜色2(边框颜色 为 文本)
		code getView().setBorderColor(android.graphics.Color.parseColor(#边框颜色));
	结束 属性

	//获取圆形图片框边框颜色
	属性读 边框颜色() 为 整数
		code return getView().getBorderColor();
	结束 属性
结束 类


/*
圆形进度条
*/
@外部Java文件("../../extra_java/circleprogress/CircleBarView.java")
类 圆形进度条 : 可视化组件
	@code
    public #<圆形进度条>(android.content.Context context) {
        super(context);
    }

    @Override
    public rn_1.CircleBarView onCreateView(android.content.Context context) {
        rn_1.CircleBarView view = new rn_1.CircleBarView(context);
        return view;
    }

    @Override
    public rn_1.CircleBarView getView() {
        return (rn_1.CircleBarView) view;
    }
    @end
	
	属性写 进度值(进度值 为 整数)
		code getView().setProgress(#进度值);
	结束 属性
	
	属性写 进度条直径(直径 为 整数)
		code getView().setViewSize(#直径);
	结束 属性
	
	属性写 进度条粗细(粗细 为 整数)
		code getView().setStrokeWidth(#粗细);
	结束 属性
	
	属性写 进度条颜色(颜色 为 整数)
		code getView().setColor(#颜色);
	结束 属性
结束 类