包名 结绳.安卓

/*
悬浮窗类，用于提供悬浮窗支持
感谢来自Meng(QQ:2217444740)的封装
*/
@导入Java("android.content.Context")
@导入Java("android.app.Activity")
@导入Java("android.view.*")
@导入Java("java.util.*")
@附加权限("android.permission.SYSTEM_ALERT_WINDOW")
@附加权限("android.permission.SYSTEM_OVERLAY_WINDOW")
@禁止创建对象
@全局类
类 悬浮窗
	
	//创建一个悬浮窗，可创建多个不同标记的悬浮窗，标记相同会返回已存在的悬浮窗
	@静态
	方法 创建悬浮窗(布局 : 组件容器, 标记 : 文本 = "Tag") : 悬浮窗
		@code
		if(FMap != null && FMap.containsKey(#标记))
		return FMap.get(#标记);
		#<悬浮窗> f = new #<悬浮窗>(#标记, #布局);
		#<布局.创建完毕>();
    	return f;
		@end
	结束 方法
	
	属性写 X坐标(X : 整数)
		@code
		layoutParams.x = mx = #X;
        updateViewLayout();
		@end
	结束 属性
	
	属性读 X坐标(): 整数
		code return mx;
	结束 属性
	
	属性写 Y坐标(Y : 整数)
		@code
		layoutParams.y = my = #Y;
        updateViewLayout();
		@end
	结束 属性
	
	属性读 Y坐标() : 整数
		code return my;
	结束 属性
	
	//一般情况下无需设置
	属性写 固定宽度(宽 : 整数)
		@code
		layoutParams.width = width = #宽;
        updateViewLayout();
        @end
	结束 属性
	
	//一般情况无需设置
	属性写 固定高度(高 : 整数)
		@code
		layoutParams.height = height = #高;
        updateViewLayout();
		@end
	结束 属性
	
	//当悬浮窗靠近屏幕边缘时自动吸附
	属性写 边缘吸附(吸附 : 逻辑型)
		code autoMagnetic = #吸附;
	结束 属性
	
	属性读 边缘吸附() : 逻辑型
		code return autoMagnetic;
	结束 属性
	
	//当悬浮窗距离屏幕 小于指定距离时再吸附，默认为0，自动吸附
	属性写 吸附距离(距离 : 整数)
		code Magnetic = #距离;
	结束 属性
	
	属性读 吸附距离() : 整数
		code return Magnetic;
	结束 属性
	
	属性写 吸附动画时长(毫秒 : 整数)
		code animlong = #毫秒;
	结束 属性
	
	属性读 吸附动画时长() : 整数
		code return animlong;
	结束 属性
	
	属性写 长按触发时长(毫秒 : 整数)
		code longtime = #毫秒;
	结束 属性
	
	属性读 长按触发时长() : 整数
		code return longtime;
	结束 属性
	
	//悬浮窗是否可以拖动
	属性写 可移动(是否 : 逻辑型)
		code isMove = #是否;
	结束 属性
	
	属性读 可移动() : 逻辑型
		code return isMove;
	结束 属性
	
	//悬浮窗是否可以被触摸，为假时悬浮窗不可触摸，可以触摸悬浮窗下面的组件，触摸穿透
	属性写 可触摸(是否 : 逻辑型)
		@code
		isTouch = #是否;
        initFlags();
		@end
	结束 属性
	
	属性读 可触摸() : 逻辑型
		code return isTouch;
	结束 属性
	
	//悬浮窗是否可以显示到状态栏区域
	属性写 可显示到状态栏(是否 : 逻辑型)
		@code
		isSbar = #是否;
		initFlags();
		@end
	结束 属性
	
	属性读 可显示到状态栏() : 逻辑型
		code return isSbar;
	结束 属性
	
	//悬浮窗是否可以超出屏幕
	属性写 可显示到屏幕外(是否 : 逻辑型)
		@code
		isLimitDisplay = !#是否;
        initFlags();
		@end
	结束 属性
	
	属性读 可显示到屏幕外() : 逻辑型
		code return !isLimitDisplay;
	结束 属性
	
	//全局显示悬浮窗，需要授权悬浮窗权限
	属性写 全局悬浮(是否 : 逻辑型)
		@code
		if(isGlobal == #是否) return;
		isGlobal = #是否;
		boolean s = isShow;
		if(isShow || hide) {
        	removeView();
        	isShow = false;
        	firstShow = true;
		}
    	initWManager();
		if(s) #显示();
		@end
	结束 属性
	
	属性读 全局悬浮() : 逻辑型
		code return isGlobal;
	结束 属性
	
	属性写 标记(标记 : 文本)
		@code
		FMap.remove(tag);
		FMap.put(tag = #标记, this);
		@end
	结束 属性
	
	属性读 标记() : 文本
		code return tag;
	结束 属性
	
	属性读 是否显示() : 逻辑型
		code return isShow;
	结束 属性
	
	属性读 是否隐藏() : 逻辑型
		code return hide;
	结束 属性
	
	//推荐在 悬浮窗内编辑框被单击事件里执行，用于获取焦点，显示输入法，可以输入
	方法 弹出输入法()
		@code
		setEditable(true);
		@end
	结束 方法
	
	方法 更新位置(X : 整数, Y : 整数)
		code updateLocation(#X,#Y);
	结束 方法
	
	//立即吸附到边缘
	方法 吸附()
		@code
		if(!isShow) return;
		if(valueAnimator!=null) valueAnimator.cancel();
    	int maxDuration = 220;
        int duration;
        int lx = mx;
        int rx = (screenWidth() - lx) - contentView.getWidth();
        if(lx < rx){
        	duration = animlong == -1 ? (lx > 0 ? maxDuration * (lx/lx) : 100) : animlong;
            animSlide(lx,0,duration);
        }else{
            duration = animlong == -1 ? (rx > 0 ? maxDuration * (rx/rx) : 100) : animlong;
            animSlide(lx,screenWidth()-contentView.getWidth(),duration);
        }
		@end
	结束 方法
	
	方法 显示()
		@code
		contentView.setVisibility(View.VISIBLE);
    	hide = false;
        if (firstShow) {
            if (!isGlobal) {
            	firstShow();
            	return;
            }
            #<悬浮窗_权限申请窗口>.requestPermission(context, new #<悬浮窗_权限申请窗口>.FPListener() {
                public void onAcquired() {
                    firstShow();
					#悬浮窗获取权限成功();
                }
                public void onStart(){
                	#悬浮窗获取权限();
                }
                public void onSuccess() {
                    firstShow();
                    #悬浮窗获取权限成功();
                }
                public void onFailed() {
                    #悬浮窗获取权限失败();
                }
            });
        } else {
            if (isShow) return;
            isShow = true;
            #悬浮窗显示();
        }
		@end
	结束 方法
	
	方法 隐藏()
		@code
		if (!isShow) return;
        contentView.setVisibility(View.GONE);
        isShow = false;
        hide = true;
		@end
		悬浮窗隐藏()
	结束 方法
	
	//关闭后无法通过 标记获取
	方法 关闭()
		@code
		if (!isShow) return;
        removeView();
        isShow = false;
		hide = false;
        firstShow = true;
        FMap.remove(tag);
		@end
		悬浮窗关闭()
	结束 方法
	
	方法 取布局() : 组件容器
		code return this.vg;
	结束 方法
	
	// 指定 悬浮窗触摸 响应的组件，需要是 悬浮窗容器的组件，指定后 悬浮窗的单击、触摸、拖动等操作都与其关联
	方法 指定触摸监听组件(组件 : 可视化组件)
		@code
		View v;
		if(tempView != null) v = tempView; 
		else v = contentView;
		v.setOnTouchListener(null);
    	v.setOnKeyListener(null);
		initView(tempView = #组件.getView());
		@end
	结束 方法
	
	定义事件 悬浮窗显示()
	定义事件 悬浮窗隐藏()
	定义事件 悬浮窗关闭()
	
	定义事件 悬浮窗被单击(来源事件 : 触摸事件)
	定义事件 悬浮窗被长按(来源事件 : 触摸事件)
	定义事件 悬浮窗被触摸(来源事件 : 触摸事件)
	定义事件 悬浮窗被拖动(来源事件 : 触摸事件, X : 整数, Y : 整数)
	定义事件 悬浮窗被放开(来源事件 : 触摸事件)
	定义事件 悬浮窗外侧操作(来源事件 : 触摸事件)
	
	定义事件 悬浮窗获取权限()
	定义事件 悬浮窗获取权限成功()
	定义事件 悬浮窗获取权限失败()
	
	方法 是否有全局悬浮窗权限() : 逻辑型
		code return #<悬浮窗_权限申请窗口>.isPermission(context);
	结束 方法
	
	@静态
	方法 显示指定悬浮窗(标记 : 文本 = "Tag")
		取悬浮窗(标记).显示()
	结束 方法
	@静态
	方法 隐藏指定悬浮窗(标记 : 文本 = "Tag")
		取悬浮窗(标记).隐藏()
	结束 方法
	
	@静态
	方法 关闭指定悬浮窗(标记 : 文本 = "Tag")
		取悬浮窗(标记).关闭()
	结束 方法
	
	@静态
	方法 关闭所有悬浮窗()
		变量 集合 : 集合 = 取所有悬浮窗()
		循环(集合 -> 值)
			(值 : 悬浮窗).关闭()
		结束 循环
	结束 方法
	
	@静态
	方法 取悬浮窗(标记 : 文本 = "Tag") : 悬浮窗
		@code
		try{
		 return FMap == null ? null : FMap.get(#标记);
		} catch (Exception e) {
			android.util.Log.i("TieApp", String.valueOf("不存在此标记的悬浮窗。"));
		}
		return null;
		@end
	结束 方法
	
	@静态
	方法 取所有悬浮窗() : 集合
		变量 集合 : 集合
		@code
		for (#<悬浮窗> fw : FMap.values())
			#集合.add(fw);
		@end
		返回 集合
	结束 方法
	
	@code
	private static Map<String, #<悬浮窗>> FMap;
	
	private android.app.Application.ActivityLifecycleCallbacks ActivityLifecycle;
    private WindowManager windowManager;
    private WindowManager.LayoutParams layoutParams;
    private Context context, tempContext;
    private String tag;
	private #<组件容器> vg;
    private View contentView, tempView;
    private int width = -2, height = -2, mx = 0, my = 0, Magnetic = 0, longtime = 1000, animlong = -1;
    private boolean isGlobal = false, editable = false, hide = false, 
	firstShow = true, isShow = false, isDismiss = false, isMove = true, 
	isSbar = false, isLimitDisplay = true, isTouch = true, autoMagnetic = false;
    private #<悬浮窗_权限申请窗口>.FPListener PListener;
	
	public #<悬浮窗>(String ftag, #<组件容器> r){
		context = (contentView = (vg = r).getLayout().getView()).getContext();
    	initView(contentView);
        isGlobal = !(context instanceof Activity);
        initWManager();
        if (FMap == null) FMap = new HashMap<>();
        FMap.put(ftag, this);
        if(ActivityLifecycle == null) registerActivityLifecycle(((Activity)context).getApplication());
        contentView.setVisibility(View.GONE);
        this.tag = ftag;
	}
	
	public void initView(View v){
		v.setOnTouchListener(new ViewTouchListener());
    	v.setFocusableInTouchMode(true);
    	v.setOnKeyListener(new View.OnKeyListener() {
            public boolean onKey(View view, int keyCode, android.view.KeyEvent event) {
                //if(android.view.KeyEvent.KEYCODE_BACK == keyCode)
				 setEditable(false);
                return false;
            }
        });
	}
	
	public void setContentView(#<组件容器> r){
		setContentView((vg = r).getLayout().getView());
	}
    public void setContentView(View v){
    	removeView();
		contentView = v;
		initView(v);
    	context = v.getContext();
        initWManager(context);
        try{
        if(isShow || hide)
        windowManager.addView(contentView, layoutParams);
        } catch (Exception e) {}
    }
    
    public View getContentView(){
    	return contentView;
    }
	
	private void initWManager() {
		initWManager(context);
	}
	//初始 WindowManager
    private void initWManager(Context c) {
        if (isGlobal) windowManager = (WindowManager)c.getSystemService(Context.WINDOW_SERVICE);
        else windowManager = ((Activity)c).getWindowManager();
        initLParams();
    }

	//初始 布局属性
    private void initLParams() {
        layoutParams = new WindowManager.LayoutParams();
        layoutParams.width = width;
        layoutParams.height = height;
        layoutParams.format = android.graphics.PixelFormat.TRANSLUCENT;
        layoutParams.memoryType = WindowManager.LayoutParams.MEMORY_TYPE_GPU;
        layoutParams.softInputMode = WindowManager.LayoutParams.SOFT_INPUT_STATE_ALWAYS_VISIBLE;
        if (isGlobal) {
            if (android.os.Build.VERSION.SDK_INT >= android.os.Build.VERSION_CODES.O) {
                layoutParams.type = WindowManager.LayoutParams.TYPE_APPLICATION_OVERLAY;
            } else {
                layoutParams.type = WindowManager.LayoutParams.TYPE_PHONE;
            }
        }
        initFlags();
        layoutParams.gravity = Gravity.START | Gravity.TOP;
        //悬浮窗起始位置
        layoutParams.x = mx;
        layoutParams.y = my;
    }
    
    private void initFlags(){
    	int flags = WindowManager.LayoutParams.FLAG_WATCH_OUTSIDE_TOUCH |WindowManager.LayoutParams.FLAG_NOT_TOUCH_MODAL;
        if (!editable) flags |= WindowManager.LayoutParams.FLAG_NOT_FOCUSABLE | WindowManager.LayoutParams.FLAG_ALT_FOCUSABLE_IM;
        if(!isTouch) flags |= WindowManager.LayoutParams.FLAG_NOT_TOUCHABLE;
        if(isSbar) flags |= WindowManager.LayoutParams.FLAG_LAYOUT_IN_SCREEN | WindowManager.LayoutParams.FLAG_LAYOUT_INSET_DECOR;
        if(!isLimitDisplay) flags |= WindowManager.LayoutParams.FLAG_LAYOUT_NO_LIMITS;
        layoutParams.flags = flags;
        if(isShow || hide) updateViewLayout();
    }

    private void firstShow() {
    	try{
    	if(isDismiss) removeView();
    	} catch (Exception e) {}
        if (isShow) return;
        isShow = true;
        firstShow = false;
        if (contentView.getParent()!=null) return;
        Activity a = (Activity)context;
        
    	if(a.isFinishing() || a.isDestroyed()){
    		context = tempContext;
    		initWManager(context);
    	}
    	
    	if(isDismiss) initWManager(context);
    	isDismiss = false;
        windowManager.addView(contentView, layoutParams);
        if(!FMap.containsKey(tag)) FMap.put(tag, this);
        #悬浮窗显示();
    }
    
    public void updateView(Context c) {
    	tempContext = c;
    	if(!isShow && firstShow) return;
    	Activity a = (Activity)c;
    	if(a.isFinishing() || a.isDestroyed()) return;
    	if (context == c) return;
    	if (isGlobal && (context = c) == c) return;
    	removeView();
    	context = c;
        initWManager(c);
        try{
        if(isShow || hide)
        windowManager.addView(contentView, layoutParams);
        } catch (Exception e) {}
    }
    
    public void removeView(Context c) {
    	if (isGlobal) return;
    	if (context == c) removeView();
    }
   
    // 更新位置 layoutParams
    private void updateLocation() {
        updateViewLayout();
    }
    public void updateLocation(int x, int y) {
        layoutParams.x = mx = x;
        layoutParams.y = my = y;
        updateViewLayout();
    }
    
    private void removeView(){
    	try {
        	windowManager.removeView(contentView);
        } catch (Exception e) {}
    }
	
	public void setEditable(boolean s){
        if(editable = s)((android.view.inputmethod.InputMethodManager)context.getSystemService("input_method")).showSoftInput(contentView, 0);
		else {
			((android.view.inputmethod.InputMethodManager)context.getSystemService("input_method")).hideSoftInputFromWindow(contentView.getApplicationWindowToken(), 0);
			contentView.setFocusable(true);
			contentView.setFocusableInTouchMode(true);
			contentView.requestFocus();
		}
		initFlags();
	}
    
    private void updateViewLayout(){
    	try{
    	if(isShow || hide)
    	windowManager.updateViewLayout(contentView, layoutParams);
    	} catch (Exception e) {}
    }
	
    long time = 0;
    boolean isLongClick = false;
    boolean stoped = false;
	MotionEvent longEvent;
	
	// 模拟长按事件
	class MyThread extends Thread {
        public void run() {
            while (System.currentTimeMillis() - time < longtime && !stoped) ;
            if (stoped) return;
            isLongClick = true;
            ((#<@安卓窗口>)context).runOnUiThread(new Runnable() {
                @Override
                public void run() {
					#悬浮窗被长按(longEvent);
                }
            });
        }
    }
    
	// 监听触摸
    private float downX = 0, downY = 0, upX = 0, upY = 0; //相对于view左上角的坐标
    class ViewTouchListener implements android.view.View.OnTouchListener {
        float lastX, lastY, moveX, moveY;
        boolean click;
		boolean move;
		int sw , sh;
        public boolean onTouch(View v, MotionEvent event) {
            switch (event.getAction()) {
                case MotionEvent.ACTION_DOWN:
					if(valueAnimator!=null) valueAnimator.cancel();
                    downX = lastX = event.getRawX();
                    downY = lastY = event.getRawY();
                    #悬浮窗被触摸(event);
					sw = screenWidth();
					sh = screenHeight();
					if(editable) setEditable(false);
					click = true;
					move = false;
					stoped = false;
					time = System.currentTimeMillis();
                	new MyThread().start();
                    break;
                case MotionEvent.ACTION_MOVE:
                    //拖动 计算坐标 更新位置
                    float cx = event.getRawX();
                    float cy = event.getRawY();
        			moveX = cx - lastX;
        			moveY = cy - lastY;
        			lastX = cx;
        			lastY = cy;
        			if(!isMove) return false;
        			if ((Math.abs(cx - downX) >= 2 || Math.abs(cy - downY) >= 4)) move = true;
					if ((Math.abs(cx - downX) >= 6 || Math.abs(cy - downY) >= 8)) stoped = true;
					if(move){
						if(isLimitDisplay){
							updateLocation((mx += (int)moveX) < 0 ? 0 : (mx > sw -  v.getWidth() ? sw - v.getWidth() : mx),
							(my += (int)moveY) < 0 ? 0 : (my > sh - v.getHeight() ? sh - v.getHeight() : my));
						} else updateLocation(mx += (int)moveX,my += (int)moveY);
						click = false;
					}
                    break;
                case MotionEvent.ACTION_UP:
					stoped = true;
                    upX = event.getRawX();
                    upY = event.getRawY();
                    int vw = v.getWidth();
                    if(autoMagnetic && isMove){
                    	int maxDuration = 220;
                    	int duration;
                    	int lx = mx;
                    	int rx = (sw - lx) - vw;
                    	int moX = (int)(mx + moveX);
                    	if(lx < rx && Magnetic == 0 ? true : lx < Magnetic){
                        	duration = animlong == -1 ? (lx > 0 ? maxDuration * (lx/lx) : 100) : animlong;
							if(lx > 0) animSlide(moX,0,duration);
							else animSlide(moX,0,duration);
                    	}else if(Magnetic == 0 ? true : rx < Magnetic){
                        	duration = animlong == -1 ? (rx > 0 ? maxDuration * (rx/rx) : 100) : animlong;
                        	animSlide(moX,sw-vw,duration);
                    	}
                    }
                    if(!isLongClick) if(!(click = (Math.abs(upX - downX) > 2) || (Math.abs(upY - downY) > 2)))
					#悬浮窗被单击(event);
					isLongClick = false;
                    #悬浮窗被放开(event);
					if(isLimitDisplay)
					updateLocation(mx = mx < 0 ? 0 : (mx > sw ? sw - v.getWidth() : mx),
					my = my < 0 ? 0 : (my > sh ? sh - v.getHeight() : my));
                    break;
                case MotionEvent.ACTION_CANCEL:
                	break;
                case MotionEvent.ACTION_OUTSIDE:
					stoped = true;
                	click = false;
					if(editable) setEditable(false);
                    #悬浮窗外侧操作(event);
                    break;
            }
			longEvent = event;
            return click;
        }
    }
    
    public Context getContext() {
    	return context;
    }
	
    boolean f = false;
	android.animation.ValueAnimator valueAnimator;
    private void animSlide(int from, int to, int duration){
		if(f = (from < 0)) from = -from;
		//if(valueAnimator!=null && !valueAnimator.hasEnded()) valueAnimator.cancel();
		valueAnimator = android.animation.ValueAnimator.ofInt(from, to);
		valueAnimator.addUpdateListener(new android.animation.ValueAnimator.AnimatorUpdateListener() {
			@Override
            public void onAnimationUpdate(android.animation.ValueAnimator animation) {
				int viewLeft = (int)animation.getAnimatedValue();
				if(!f) updateLocation(mx = viewLeft,my);
				else updateLocation(mx = -viewLeft,my);
			}
		});
		valueAnimator.setDuration(duration < 0 ? 0 : duration);
		valueAnimator.start();
	}

    public int screenWidth(){
        return context.getResources().getDisplayMetrics().widthPixels;
    }
 
    public int screenHeight(){
		int nbar = context.getResources().getDimensionPixelSize(context.getResources().getIdentifier("navigation_bar_height", "dimen", "android"));
        return context.getResources().getDisplayMetrics().heightPixels + context.getResources().getDimensionPixelSize(context.getResources().getIdentifier("status_bar_height", "dimen", "android")) + (nbar < 80 ? +nbar : 0);
    }
    
	private void registerActivityLifecycle(android.app.Application a){
    	a.registerActivityLifecycleCallbacks( ActivityLifecycle = new android.app.Application.ActivityLifecycleCallbacks() {
            @Override
            public void onActivityCreated(Activity activity, android.os.Bundle savedInstanceState) {
				
            }
            @Override
            public void onActivityStarted(Activity activity) {
                //for (FWView fw : FMap.values())
				//	fw.updateView(activity);
            }
            @Override
            public void onActivityResumed(Activity activity) {
            	for (#<悬浮窗> fw : FMap.values())
					fw.updateView(activity);
            }
            @Override
            public void onActivityPaused(Activity activity) {
            }
            @Override
            public void onActivityStopped(Activity activity) {
            	
            }
            @Override
            public void onActivitySaveInstanceState(Activity activity, android.os.Bundle outState) {}
            @Override
            public void onActivityDestroyed(Activity activity) {
            	//for (FWView fw : FMap.values())
					//fw.removeView(activity);
            }
        });
	}
	@end
	
结束 类

@禁止继承
类 悬浮窗_权限申请窗口 : 窗口
	
	/*
	*    你无需创建或切换这个窗口，
	*	无需额外操作，
	*	
	*	你只需将悬浮窗的 全局悬浮 = 真
	*	显示时会自动申请
	*
	*	请无视这个窗口。
	*/

	事件 悬浮窗_权限申请窗口:即将创建()
		@code
		mListener.onStart();
		toSetting(this);
		@end
	结束 事件

	事件 悬浮窗_权限申请窗口:获得返回数据(请求码 : 整数,结果码 : 整数,数据 : 启动信息)
		如果 请求码 == 101
			@code
			if (isPermission(this)) mListener.onSuccess();
			else mListener.onFailed();
			@end
		结束 如果
		关闭窗口()
	结束 事件
	
	@code
	public static FPListener mListener;
	
    //是否有悬浮窗权限
    public static boolean isPermission(android.content.Context context) {
    	return android.os.Build.VERSION.SDK_INT >= 23 ? android.provider.Settings.canDrawOverlays(context) : true;
    }

    public static void toSetting(android.content.Context c) {
    	android.app.Activity activity = (android.app.Activity)c;
    	android.content.Intent intent = new android.content.Intent();;
        try {
        	if ("Xiaomi".equals(android.os.Build.MANUFACTURER)) {
                intent = new android.content.Intent("miui.intent.action.APP_PERM_EDITOR");
				intent.setPackage("com.miui.securitycenter");
	    		intent.putExtra("extra_pkgname", activity.getPackageName());
			} else if (android.text.TextUtils.equals("Meizu", android.os.Build.MANUFACTURER)) {
            	intent = new android.content.Intent("com.meizu.safe.security.SHOW_APPSEC");
        		intent.setClassName("com.meizu.safe", 
        		"com.meizu.safe.security.AppSecActivity");
        		intent.putExtra("packageName", activity.getPackageName());
            } else if ("Oppo".equalsIgnoreCase(android.os.Build.MANUFACTURER)) {
                intent = new android.content.Intent("android.intent.action.MAIN");
        		intent.setComponent(new android.content.ComponentName("com.coloros.safecenter",
            	"com.coloros.safecenter.permission.floatwindow.FloatWindowListActivity"));
            } else if (android.os.Build.VERSION.SDK_INT >= 23) {
        		intent.setAction(android.provider.Settings.ACTION_MANAGE_OVERLAY_PERMISSION);
        		intent.setData(android.net.Uri.parse("package:" + activity.getPackageName()));
            }
            activity.startActivityForResult(intent, 101);
        } catch (Exception e) {
			mListener.onFailed();
            android.widget.Toast.makeText(activity, "悬浮窗权限申请失败", android.widget.Toast.LENGTH_SHORT).show();
        }
    }
	
	public static void requestPermission(android.content.Context context, FPListener listener) {
		if (isPermission(context)) {
            listener.onAcquired();
            return;
        }
		mListener = listener;
        android.content.Intent intent = new android.content.Intent(context, #<悬浮窗_权限申请窗口>.class);
        intent.setFlags(android.content.Intent.FLAG_ACTIVITY_NEW_TASK);
        context.startActivity(intent);
    }
    
    public interface FPListener {
    	// 已获取
    	void onAcquired();
    	// 开始获取
    	void onStart();
    	// 获取成功
    	void onSuccess();
	    // 获取失败
    	void onFailed();
	}
	@end
结束 类