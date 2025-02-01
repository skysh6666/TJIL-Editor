包名 结绳.安卓

/*
@外部依赖库("../依赖库/androidx")
@导入Java("androidx.appcompat.widget.Toolbar")
类 工具栏 : 可视化组件
	@code
	public #<工具栏>(android.content.Context context) {
        super(context);
    }

    @Override
    public Toolbar onCreateView(android.content.Context context) {
        Toolbar view = new Toolbar(context);
        return view;
    }

    @Override
    public Toolbar getView() {
        return (Toolbar) view;
    }
	@end
结束 类
*/

