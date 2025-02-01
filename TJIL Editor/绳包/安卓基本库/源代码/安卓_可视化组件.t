包名 结绳.安卓

/*
可标记组件类，提供组件标记值设置与获取功能
*/
@禁止创建对象
类 可标记类
	@隐藏
	变量 标记值 : 对象?

	属性写 标记(标记值: 对象)
		本对象.标记值 = 标记值
	结束 属性

	属性读 标记() : 对象
		返回 (标记值)
	结束 属性
结束 类

/*
窗口组件，所有需要在窗口创建的组件都必须继承本类
*/
@禁止创建对象
@导入Java("android.content.Context")
类 窗口组件 : 可标记类
	@code
	protected Context context;

    public #<窗口组件>(Context context) {
        this.context = context;
    }
	@end

	方法 取安卓环境() : 安卓环境
		code return context;
	结束 方法

	方法 取安卓窗口() : 安卓窗口
		code return (#<@安卓窗口>)context;
	结束 方法
结束 类

@禁止创建对象
类 对齐方式
	@静态
	常量 靠上对齐 : 整数 = 48

	@静态
	常量 靠下对齐 : 整数 = 80

	@静态
	常量 靠左对齐 : 整数 = 3

	@静态
	常量 靠右对齐 : 整数 = 5

	@静态
	常量 居中 : 整数 = 17
结束 类

@禁止创建对象
@常量类型(整数)
@需求值类型(整数)
类 组件可视状态
	@静态
	常量 可视 : 组件可视状态 = 0

	@静态
	常量 不可视 : 组件可视状态 = 4

	@静态
	常量 隐藏 : 组件可视状态 = 8
结束 类

@禁止创建对象
@常量类型(整数)
@需求值类型(整数)
类 触摸手势
	@静态
	常量 左移 : 触摸手势 = 0
	@静态
	常量 右移 : 触摸手势 = 1
	@静态
	常量 上移 : 触摸手势 = 2
	@静态
	常量 下移 : 触摸手势 = 3
	@静态
	常量 左滑 : 触摸手势 = 4
	@静态
	常量 右滑 : 触摸手势 = 5
	@静态
	常量 上滑 : 触摸手势 = 6
	@静态
	常量 下滑 : 触摸手势 = 7
	@静态
	常量 单击 : 触摸手势 = 8
	@静态
	常量 双击 : 触摸手势 = 9
结束 类


/*
可视化组件，是所有可视化组件(如按钮，文本框)的基础类
继承本类的组件都将会在布局设计器中显示
*/
@导入Java("android.content.*")
@导入Java("android.content.res.*")
@导入Java("android.view.*")
@导入Java("android.widget.*")
类 可视化组件 : 窗口组件
	@隐藏
	@静态
	常量 横坐标设置错误 : 文本 = "横坐标属性只能在组件父布局为自适应布局时使用"
	@隐藏
	@静态
	常量 纵坐标设置错误 : 文本 = "纵坐标属性只能在组件父布局为自适应布局时使用"
	@隐藏
	@静态
	常量 权重设置错误 : 文本 = "权重属性只能在组件父布局为线性布局时设置"

	@code
    protected View view;
	private GestureDetector detector;

    public #<可视化组件>(Context context) {
        super(context);
        this.view = onCreateView(context);
		this.view.setTag(this);
		#创建完毕();
    }

    public View onCreateView(Context context) {
        View view = new View(context);
        return view;
    }

    public View getView() {
        return view;
    }
    @end
	
	@虚拟事件
	方法 创建完毕()
	结束 方法

	属性写 ID(ID 为 整数)
		code view.setId(#ID);
	结束 属性

	属性读 ID() 为 整数
		code return view.getId();
	结束 属性

	/*
	设置组件的宽度
	注：本属性必须在组件被添加到布局中后才能设置
	*/
	属性写 宽度(宽度 为 整数)
		@code
		ViewGroup.LayoutParams params = view.getLayoutParams();
		if (params == null) {
			return;
		}
		params.width = #宽度;
		view.setLayoutParams(params);
		@end
	结束 属性

	/*
	设置组件的宽度DP
	注：本属性必须在组件被添加到布局中后才能设置
	*/
	属性写 宽度DP(宽度 为 整数)
		@code
		ViewGroup.LayoutParams params = view.getLayoutParams();
		if (params == null) {
			return;
		}
		params.width = #<像素操作.DP到PX>(context, #宽度);
		view.setLayoutParams(params);
		@end
	结束 属性

	/*获取组件在布局中的宽度*/
	属性读 宽度() : 整数
		code return view.getWidth();
	结束 属性

	/*
	设置组件的高度
	注：本属性必须在组件被添加到布局中后才能设置
	*/
	属性写 高度(高度 为 整数)
		@code
		ViewGroup.LayoutParams params = view.getLayoutParams();
		if (params == null) {
			return;
		}
		params.height = #高度;
		view.setLayoutParams(params);
		@end
	结束 属性

	/*
	设置组件的高度DP
	注：本属性必须在组件被添加到布局中后才能设置
	*/
	属性写 高度DP(高度 为 整数)
		@code
		ViewGroup.LayoutParams params = view.getLayoutParams();
		if (params == null) {
			return;
		}
		params.height = #<像素操作.DP到PX>(context, #高度);
		view.setLayoutParams(params);
		@end
	结束 属性

	/*获取组件在布局中的宽度*/
	属性读 高度() : 整数
		code return view.getHeight();
	结束 属性

	/*
	设置组件的横坐标
	*/
	属性写 横坐标(横坐标 : 小数)
		@code
		view.setX((float) #横坐标);
		@end
	结束 属性

	/*
	获取组件的横坐标
	*/
	属性读 横坐标() : 小数
		@code
		return view.getX();
		@end
	结束 属性

	/*
	设置组件的纵坐标
	*/
	属性写 纵坐标(纵坐标 : 小数)
		@code
		view.setY((float) #纵坐标);
		@end
	结束 属性

	/*
	获取组件的纵坐标
	*/
	属性读 纵坐标() : 小数
		@code
		return view.getY();
		@end
	结束 属性
	
	属性写 竖坐标(竖坐标 : 小数)
		@code
		view.setZ((float) #竖坐标);
		@end
	结束 属性

	属性读 竖坐标() : 小数
		@code
		return view.getZ();
		@end
	结束 属性

	属性写 横向偏移(偏移 为 整数)
		@code
		view.setTranslationX(#偏移);
		@end
	结束 属性

	属性写 横向偏移DP(偏移 为 整数)
		@code
		view.setTranslationX(#<像素操作.DP到PX>(context, #偏移));
		@end
	结束 属性

	属性读 横向偏移() 为 整数
		@code
		return (int)view.getTranslationX();
		@end
	结束 属性

	属性写 纵向偏移(偏移 为 整数)
		@code
		view.setTranslationY(#偏移);
		@end
	结束 属性

	属性写 纵向偏移DP(偏移 为 整数)
		@code
		view.setTranslationY(#<像素操作.DP到PX>(context, #偏移));
		@end
	结束 属性

	属性读 纵向偏移() 为 整数
		@code
		return (int)view.getTranslationY();
		@end
	结束 属性

	属性写 竖向偏移(偏移 为 整数)
		@code
		view.setTranslationZ(#偏移);
		@end
	结束 属性

	属性读 竖向偏移() 为 整数
		@code
		return (int)view.getTranslationZ();
		@end
	结束 属性

	属性写 旋转角(旋转角 : 小数)
		@code
		view.setRotation((float) #旋转角);
		@end
	结束 属性

	属性读 旋转角() : 小数
		@code
		return view.getRotation();
		@end
	结束 属性

	属性写 X轴旋转角(旋转角 : 小数)
		@code
		view.setRotationX((float) #旋转角);
		@end
	结束 属性

	属性读 X轴旋转角() : 小数
		@code
		return view.getRotationX();
		@end
	结束 属性

	属性写 Y轴旋转角(旋转角 : 小数)
		@code
		view.setRotationY((float) #旋转角);
		@end
	结束 属性

	属性读 Y轴旋转角() : 小数
		@code
		return view.getRotationY();
		@end
	结束 属性

	属性写 内边距(边距 为 整数)
		code view.setPadding(#边距, #边距, #边距, #边距);
	结束 属性

	属性写 内边距DP(边距 为 整数)
		@code
		int padding = #<像素操作.DP到PX>(context, #边距);
		view.setPadding(padding, padding, padding, padding);
		@end
	结束 属性

	属性写 左内边距(左内边距 为 整数)
		code view.setPadding(#左内边距, view.getPaddingTop(),view.getPaddingRight(),view.getPaddingBottom());
	结束 属性

	属性写 左内边距DP(左内边距 为 整数)
		code view.setPadding(#<像素操作.DP到PX>(context, #左内边距), view.getPaddingTop(),view.getPaddingRight(),view.getPaddingBottom());
	结束 属性

	属性读 左内边距() 为 整数
		code return view.getPaddingLeft();
	结束 属性

	属性写 上内边距(上内边距 为 整数)
		code view.setPadding(view.getPaddingLeft(), #上内边距, view.getPaddingRight(),view.getPaddingBottom());
	结束 属性

	属性写 上内边距DP(上内边距 为 整数)
		code view.setPadding(view.getPaddingLeft(), #<像素操作.DP到PX>(context, #上内边距), view.getPaddingRight(),view.getPaddingBottom());
	结束 属性

	属性读 上内边距() 为 整数
		code return view.getPaddingTop();
	结束 属性

	属性写 右内边距(右内边距 为 整数)
		code view.setPadding(view.getPaddingLeft(),view.getPaddingTop(), #右内边距, view.getPaddingBottom());
	结束 属性

	属性写 右内边距DP(右内边距 为 整数)
		code view.setPadding(view.getPaddingLeft(),view.getPaddingTop(), #<像素操作.DP到PX>(context, #右内边距), view.getPaddingBottom());
	结束 属性

	属性读 右内边距() 为 整数
		code return view.getPaddingRight();
	结束 属性

	属性写 下内边距(下内边距 为 整数)
		code view.setPadding(view.getPaddingLeft(),view.getPaddingTop(),view.getPaddingRight(), #下内边距);
	结束 属性

	属性写 下内边距DP(下内边距 为 整数)
		code view.setPadding(view.getPaddingLeft(),view.getPaddingTop(),view.getPaddingRight(), #<像素操作.DP到PX>(context, #下内边距));
	结束 属性

	属性读 下内边距() 为 整数
		code return view.getPaddingBottom();
	结束 属性

	属性写 阴影(阴影度 为 整数)
		code view.setElevation(#阴影度);
	结束 属性

	属性读 阴影() 为 整数
		code return (int)view.getElevation();
	结束 属性

	属性写 透明度(透明度 为 小数)
		code view.setAlpha((float)#透明度);
	结束 属性

	属性读 透明度() 为 小数
		code  return (float)view.getAlpha();
	结束 属性

	属性写 可用(是否可用 为 逻辑型)
		code view.setEnabled(#是否可用);
	结束 属性

	属性读 可用() 为 逻辑型
		code return view.isEnabled();
	结束 属性

	属性写 可视(是否可视 为 逻辑型)
		@code
		if (#是否可视) {
			view.setVisibility(View.VISIBLE);
		} else {
			view.setVisibility(View.GONE);
		}
		@end
	结束 属性

	属性读 可视() 为 逻辑型
		@code
		return view.getVisibility() == View.VISIBLE ? true : false; 
		@end
	结束 属性

	属性写 可视状态(状态 为 组件可视状态)
		@code
		view.setVisibility(#状态);
		@end
	结束 属性

	属性读 可视状态() 为 组件可视状态
		@code
		return view.getVisibility();
		@end
	结束 属性

	//设置组件是否填充以占据整个系统界面，如状态栏
	属性写 填充系统界面(是否填充 为 逻辑型)
		code view.setFitsSystemWindows(#是否填充);
	结束 属性

	//获取组件是否填充以占据整个系统界面，如状态栏
	属性读 填充系统界面() 为 逻辑型
		code return view.getFitsSystemWindows();
	结束 属性

	//判断是否启用硬件加速
	属性读 硬件加速() 为 逻辑型
		@code
		return view.isHardwareAccelerated();
		@end
	结束 属性

	//设置是否启用硬件加速
	属性写 硬件加速(是否启用 为 逻辑型)
		@code
		view.setLayerType(#是否启用 ? View.LAYER_TYPE_HARDWARE : View.LAYER_TYPE_SOFTWARE, null);
		@end
	结束 属性

	属性写 可获取焦点(是否可获取焦点 为 逻辑型)
		@code
		view.setFocusable(#是否可获取焦点);
		@end
	结束 属性

	属性读 可获取焦点() 为 逻辑型
		code return view.isFocusable();
	结束 属性

	/*
	设置组件的背景图片
	*/
	属性写 背景图片(图片 : 图片资源)
		code view.setBackgroundResource(#图片);
	结束 属性

	/*
	设置组件的背景颜色
	*/
	属性写 背景颜色(颜色 : 整数)
		code view.setBackgroundColor(#颜色);
	结束 属性

	//设置水波纹效果
	@导入Java("android.util.TypedValue")
	属性写 水波纹效果(是否开启水波纹效果 为 逻辑型)
		如果 是否开启水波纹效果 == 真 则
			@code
			android.content.res.Resources.Theme theme = context.getTheme();
			TypedValue typedValue = new TypedValue();
			theme.resolveAttribute(android.R.attr.selectableItemBackground, typedValue, true);
			int[] attribute = new int[]{android.R.attr.selectableItemBackground};
			TypedArray typedArray = theme.obtainStyledAttributes(typedValue.resourceId, attribute);
			view.setForeground(typedArray.getDrawable(0));
			@end
		否则
			code view.setForeground(null);
		结束 如果
	结束 属性
	
	/*
	获取当前组件的父布局组件
	*/
	方法 取父组件() : 布局组件
		@code
		ViewGroup parent = (ViewGroup) view.getParent();
		if (parent == null) {
			return null;
		}
		return (#<布局组件>) parent.getTag();
		@end
	结束 方法
	
	/*
	从当前组件的父布局组件中移除该组件
	*/
	方法 从父组件中移除()
		变量 父组件 = 取父组件()
		如果 父组件 != 空
			父组件.移除组件(本对象)
		结束 如果
	结束 方法

	/*
	获取组件的属性动画播放器
	*/
	@导入Java("android.animation.Animator")
	方法 取动画播放器() : 组件属性动画播放器
		@code
		ViewPropertyAnimator animator = view.animate();
		animator.setListener(new android.animation.Animator.AnimatorListener() {
			@Override
			public void onAnimationStart(Animator p1) {
				#动画开始播放();
			}
			@Override
			public void onAnimationEnd(Animator p1) {
				#动画播放完毕();
			}
			@Override
			public void onAnimationCancel(Animator p1) {
				// TODO: Implement this method
			}
			@Override
			public void onAnimationRepeat(Animator p1) {
				#动画重复播放();
			}
		});
		return animator;
		@end
	结束 方法

	@导入Java("android.view.animation.Animation")
	方法 播放动画(欲播放动画 : 组件动画)
		@code
		view.startAnimation(#欲播放动画);
		#欲播放动画.setAnimationListener(new android.view.animation.Animation.AnimationListener(){
			@Override
			public void onAnimationStart(Animation p1) {
				#动画开始播放();
			}
			@Override
			public void onAnimationEnd(Animation p1) {
				#动画播放完毕();
			}
			@Override
			public void onAnimationRepeat(Animation p1) {
				#动画重复播放();
			}
		});
		@end
	结束 方法

	方法 刷新()
		code view.invalidate();
	结束 方法

	方法 模拟单击()
		code view.performClick();
	结束 方法

	方法 模拟长按()
		code view.performLongClick();
	结束 方法

	方法 请求焦点()
		code view.requestFocus();
	结束 方法

	方法 取消焦点()
		code view.clearFocus();
	结束 方法

	/*
	设置组件是否支持用户单击
	*/
	属性写 支持单击(是否支持: 逻辑型)
		@code
		view.setClickable(#是否支持);
        if (#是否支持) {
            view.setOnClickListener(new View.OnClickListener() {
                @Override
                public void onClick(View view) {
                    #被单击();
                }
            });
        } else {
            view.setOnClickListener(null);
        }
        @end
	结束 属性

	/*
	获取组件是否支持单击
	*/
	属性读 支持单击() : 逻辑型
		code return view.isClickable();
	结束 属性

	/*
	设置组件是否支持用户长按
	*/
	属性写 支持长按(是否支持: 逻辑型)
		@code
		view.setLongClickable(#是否支持);
        if (#是否支持) {
            view.setOnLongClickListener(new View.OnLongClickListener() {
                @Override
                public boolean onLongClick(View view) {
                    #被长按();
					return true;
                }
            });
        } else {
            view.setOnLongClickListener(null);
        }
        @end
	结束 属性

	/*
	获取组件是否支持长按
	*/
	属性读 支持长按() : 逻辑型
		code return view.isLongClickable();
	结束 属性

	/*
	设置组件是否支持监听被触摸事件
	*/
	属性写 支持触摸(是否支持: 逻辑型)
		@code
        if (#是否支持) {
			if (detector == null) {
				GestureDetector.SimpleOnGestureListener listener = new GestureDetector.SimpleOnGestureListener() {
					@Override
					public boolean onSingleTapConfirmed(MotionEvent e) {
						#触摸手势(#<触摸手势.单击>);
						return true;
					}
					@Override
					public boolean onDoubleTap(MotionEvent e) {
						#触摸手势(#<触摸手势.双击>);
						return true;
					}
					@Override
					public boolean onScroll(MotionEvent e1, MotionEvent e2, float distanceX, float distanceY) {
						int direction;
						if (Math.abs(distanceX) > Math.abs(distanceY)) {
							direction = distanceX > 0 ? #<触摸手势.左移> : #<触摸手势.右移>;
						} else {
							direction = distanceY > 0 ? #<触摸手势.上移> : #<触摸手势.下移>;
						}
						#触摸手势(direction);
						return true;
					}
					@Override
					public boolean onFling(MotionEvent e1, MotionEvent e2, float p3, float p4) {
						int deltaX = (int) (e1.getRawX() - e2.getRawX());
						int deltaY = (int) (e1.getRawY() - e2.getRawY());
						int direction;
						if (Math.abs(deltaX) > Math.abs(deltaY)) {
							direction = deltaX > 0 ? #<触摸手势.左滑> : #<触摸手势.右滑>;
						} else {
							direction = deltaY > 0 ? #<触摸手势.上滑> : #<触摸手势.下滑>;
						}
						#触摸手势(direction);
						return true;
					}
				};
				detector = new GestureDetector(listener);
			}
            view.setOnTouchListener(new View.OnTouchListener() {
                @Override
                public boolean onTouch(View view, android.view.MotionEvent event) {
					detector.onTouchEvent(event);
                    return #被触摸(event);
                }
            });
        } else {
            view.setOnTouchListener(null);
        }
        @end
	结束 属性

	/*
	设置组件是否支持监听被拖放事件
	*/
	属性写 支持拖放(是否支持: 逻辑型)
		@code
        if (#是否支持) {
            view.setOnDragListener(new View.OnDragListener() {
                @Override
                public boolean onDrag(View view, android.view.DragEvent event) {
                    return #被拖放(event);
                }
            });
        } else {
            view.setOnDragListener(null);
        }
        @end
	结束 属性

	/*
	设置组件是否支持监听被拖放事件
	*/
	属性写 支持焦点改变监听(是否支持: 逻辑型)
		@code
        if (#是否支持) {
            view.setOnFocusChangeListener(new View.OnFocusChangeListener() {
                @Override
                public void onFocusChange(View view, boolean hasFocus) {
                    #焦点被改变(hasFocus);
                }
            });
        } else {
            view.setOnFocusChangeListener(null);
        }
        @end
	结束 属性

	/*
	设置组件是否支持监听按键事件
	*/
	属性写 支持按键监听(是否支持: 逻辑型)
		@code
        if (#是否支持) {
            view.setOnKeyListener(new View.OnKeyListener() {
                @Override
                public boolean onKey(View view, int keyCode, android.view.KeyEvent event) {
                    return #按键输入(keyCode, event);
                }
            });
        } else {
            view.setOnKeyListener(null);
        }
        @end
	结束 属性

	//用户在组件上单击事件
	@属性需求.支持单击(真)
	定义事件 被单击()

	//组件被长按时事件
	@属性需求.支持长按(真)
	定义事件 被长按()

	/*
	组件被触摸时事件，本事件需要返回值
	返回真则拦截后续默认处理
	返回假则还要继续执行默认处理
	*/
	@属性需求.支持触摸(真)
	定义事件 被触摸(来源事件 : 触摸事件) : 逻辑型

	/*
	组件被触摸时产生一定手势(如上滑)时触发该事件
	具体手势类型可参见"触摸手势"类
	注意：本事件需要组件被触摸事件返回值为真时才会生效
	*/
	定义事件 触摸手势(手势 : 触摸手势)

	/*
	组件被拖放时事件，本事件需要返回值
	返回真则拦截后续默认处理
	返回假则还要继续执行默认处理
	*/
	@属性需求.支持拖放(真)
	定义事件 被拖放(来源事件 : 拖放事件) : 逻辑型

	//组件焦点改变时事件
	@属性需求.支持焦点改变监听(真)
	定义事件 焦点被改变(是否获得焦点 : 逻辑型)

	/*
	按键输入时事件，本事件需要返回值
	返回真则拦截后续默认处理
	返回假则还要继续执行默认处理
	*/
	@属性需求.支持按键监听(真)
	定义事件 按键输入(键代码 : 整数, 来源事件 : 按键事件) : 逻辑型

	//组件动画开始播放时触发该事件
	定义事件 动画开始播放()

	//动画播放完毕时触发该事件
	定义事件 动画播放完毕()

	//动画重复播放时触发该事件
	定义事件 动画重复播放()
结束 类


@导入Java("android.graphics.Typeface")
@导入Java("android.text.Html")
@导入Java("android.text.TextUtils")
类 文本框 : 可视化组件
	@code
	private android.text.TextWatcher watcher;
	
    public #<文本框>(android.content.Context context) {
        super(context);
    }

    @Override
    public android.widget.TextView onCreateView(android.content.Context context) {
        android.widget.TextView view = new android.widget.TextView(context);
        return view;
    }

    @Override
    public android.widget.TextView getView() {
        return (android.widget.TextView) view;
    }
    @end

	/*
	设置内容的对齐方式
	*/
	属性写 对齐方式(方式 : 整数)
		code getView().setGravity(#方式);
	结束 属性

	/*
	设置文本框类组件所显示的内容
	*/
	属性写 文本资源(资源: 文本资源)
		code getView().setText(#资源);
	结束 属性

	/*
	设置文本框类组件所显示的内容
	*/
	属性写 内容(值: 文本)
		code getView().setText(#值);
	结束 属性

	/*
	获取文本框类组件所显示(输入)的内容
	*/
	属性读 内容() : 文本
		code return getView().getText().toString();
	结束 属性

	//设置文本框内容粗体显示
	属性写 粗体(是否粗体 : 逻辑型)
		@code
		Typeface typeface = getView().getTypeface();
		if (#是否粗体) {
			if (typeface.isItalic()) {
				getView().setTypeface(Typeface.defaultFromStyle(Typeface.BOLD_ITALIC));
			} else {
				getView().setTypeface(Typeface.defaultFromStyle(Typeface.BOLD));
			}
		} else {
			if (typeface.isBold() && typeface.isItalic()) {
				getView().setTypeface(Typeface.defaultFromStyle(Typeface.ITALIC));
			} else {
				getView().setTypeface(Typeface.defaultFromStyle(Typeface.NORMAL));
			}
		}
		@end
	结束 属性

	//设置文本框内容斜体显示
	属性写 斜体(是否斜体 : 逻辑型)
		@code
		Typeface typeface = getView().getTypeface();
		if (#是否斜体) {
			if (typeface.isBold()) {
				getView().setTypeface(Typeface.defaultFromStyle(Typeface.BOLD_ITALIC));
			} else {
				getView().setTypeface(Typeface.defaultFromStyle(Typeface.ITALIC));
			}
		} else {
			if (typeface.isBold() && typeface.isItalic()) {
				getView().setTypeface(Typeface.defaultFromStyle(Typeface.BOLD));
			} else {
				getView().setTypeface(Typeface.defaultFromStyle(Typeface.NORMAL));
			}
		}
		@end
	结束 属性

	//设置文本框字体大小
	属性写 字体大小(字体大小 为 整数)
		code getView().setTextSize(#字体大小);
	结束 属性

	//获取字体大小
	属性读 字体大小() 为 整数
		code return (int)getView().getTextSize();
	结束 属性

	//设置文本框字体颜色
	属性写 字体颜色(字体颜色 为 整数)
		code getView().setTextColor(#字体颜色);
	结束 属性

	//获取文本框字体颜色
	属性读 字体颜色() 为 整数
		code return getView().getTextColors().getDefaultColor();
	结束 属性

	//设置文本框显示行数
	属性写 显示行数(行数 为 整数)
		code getView().setLines(#行数);
	结束 属性

	//设置文本框最大显示行数
	属性写 最大显示行数(行数 为 整数)
		code getView().setMaxLines(#行数);
	结束 属性

	//设置文本框最小显示行数
	属性写 最小显示行数(行数 为 整数)
		code getView().setMinLines(#行数);
	结束 属性

	//设置行间距
	属性写 行距(行距 为 整数)
		code getView().setLineSpacing(0f, #行距);
	结束 属性

	//设置组件的字体，字体路径可以为附加资源中字体文件名称，也可以是sdcard路径
	属性写 字体(字体路径 为 文本)
		@code
		if (#字体路径.charAt(0) == '/') {
			getView().setTypeface(Typeface.createFromFile(#字体路径));
		} else {
			getView().setTypeface(Typeface.createFromAsset(context.getAssets(), #字体路径));
		}
		@end
	结束 属性

	@静态
	常量 超链接_全部 : 整数 = 0
	@静态
	常量 超链接_网址 : 整数 = 1
	@静态
	常量 超链接_邮箱 : 整数 = 2
	@静态
	常量 超链接_电话号码 : 整数 = 3
	@静态
	常量 超链接_地址 : 整数 = 4

	/*
	设置超链接的识别模式
	*/
	@导入Java("android.text.util.Linkify")
	@导入Java("android.text.method.LinkMovementMethod")
	属性写 超链接识别模式(模式 : 整数)
		@code
		switch (#模式) {
			case 0:
				getView().setAutoLinkMask(Linkify.ALL);
				break;
			case 1:
				getView().setAutoLinkMask(Linkify.WEB_URLS);
				break;
			case 2:
				getView().setAutoLinkMask(Linkify.EMAIL_ADDRESSES);
				break;
			case 3:
				getView().setAutoLinkMask(Linkify.PHONE_NUMBERS);
				break;
			case 4:
				getView().setAutoLinkMask(Linkify.MAP_ADDRESSES);
				break;
		}
		getView().setMovementMethod(LinkMovementMethod.getInstance());
		@end
	结束 属性

	//设置文本框是否开启跑马灯效果
	属性写 跑马灯效果(是否开启跑马灯效果 为 逻辑型)
		@code
		android.widget.TextView textView = getView();
		textView.setMarqueeRepeatLimit(Integer.MAX_VALUE);
		textView.setFocusable(true);
		textView.setEllipsize(TextUtils.TruncateAt.MARQUEE);
		textView.setSingleLine();
		textView.setFocusableInTouchMode(true);
		if (#是否开启跑马灯效果) {
			textView.setHorizontallyScrolling(true);
		} else {
			textView.setHorizontallyScrolling(false);
		}
		@end
	结束 属性

	//设置是否单行显示
	属性写 单行显示(是否单行显示 为 逻辑型)
		code getView().setSingleLine(#是否单行显示);
	结束 属性

	/*
	设置文本过长时，省略显示的方式
	0为省略开头
	1为省略中间
	2为省省略结尾
	*/
	属性写 省略显示(显示方式 为 整数)
		@code
		if (#显示方式 == 0) {
			getView().setEllipsize(TextUtils.TruncateAt.START);
		} else if (#显示方式 == 1) {
			getView().setEllipsize(TextUtils.TruncateAt.MIDDLE);
		} else if (#显示方式 == 2) {
			getView().setEllipsize(TextUtils.TruncateAt.END);
		}
		@end
	结束 属性

	属性写 支持内容改变监听(是否支持 : 逻辑型)
		@code
		if (#是否支持) {
			if (watcher == null) {
				watcher = new android.text.TextWatcher() {
           		 @Override
            		public void beforeTextChanged(CharSequence s, int start, int count, int after) {
            		}
            		@Override
            		public void onTextChanged(CharSequence s, int start, int before, int count) {
            		}
            		@Override
            		public void afterTextChanged(android.text.Editable s) {
						#内容被改变();
            		}
        		};
				getView().addTextChangedListener(watcher);
			}
		} else if (watcher != null) {
			getView().removeTextChangedListener(watcher);
		}
		@end
	结束 属性

	/*
	加载Html内容
	*/
	方法 加载Html(html代码 : 文本)
		@code
		getView().setText(Html.fromHtml(#html代码));
		@end
	结束 方法

	//高亮文本框中的特定字词
	@导入Java("java.util.regex.Pattern")
	@导入Java("java.util.regex.Matcher")
	@导入Java("android.text.*")
	@导入Java("android.text.style.*")
	方法 高亮(欲高亮文本数组 为 文本[], 高亮颜色 为 整数)
		@code
		SpannableString ss = new SpannableString(getView().getText());
		for (int i = 0;i < #欲高亮文本数组.length;i++) {
			Pattern p = Pattern.compile(#欲高亮文本数组[i]);
			Matcher m = p.matcher(ss);
			while (m.find()) {
				int start = m.start();
				int end = m.end();
				ss.setSpan(new ForegroundColorSpan(#高亮颜色), start, end, Spanned.SPAN_EXCLUSIVE_EXCLUSIVE);
			}
		}
		getView().setText(ss);
		@end
	结束 方法

	/*
	文本框类组件(编辑框/按钮等)内容被改变时触发该事件
	*/
	@属性需求.支持内容改变监听(真)
	定义事件 内容被改变()
结束 类

//编辑框组件
类 编辑框 : 文本框
	@code
    public #<编辑框>(android.content.Context context) {
        super(context);
    }

    @Override
    public android.widget.EditText onCreateView(android.content.Context context) {
        android.widget.EditText view = new android.widget.EditText(context);
        return view;
    }

    @Override
    public android.widget.EditText getView() {
        return (android.widget.EditText) view;
    }
    @end

	@静态
	常量 输入方式_普通输入 : 整数 = 1
	@静态
	常量 输入方式_数字 : 整数 = 2
	@静态
	常量 输入方式_电话号码 : 整数 = 3
	@静态
	常量 输入方式_时间日期 : 整数 = 4
	@静态
	常量 输入方式_密码 : 整数 = 0x81

	//设置编辑框提示文本
	属性写 提示文本(提示文本 为 文本)
		code getView().setHint(#提示文本);
	结束 属性

	//获取编辑框提示文本
	属性读 提示文本() 为 文本
		code return getView().getHint().toString();
	结束 属性

	//设置编辑框提示文本颜色，0xaarrggbb格式
	属性写 提示文本颜色(提示文本颜色 为 整数)
		code getView().setHintTextColor(#提示文本颜色);
	结束 属性

	//获取编辑框提示文本颜色
	属性读 提示文本颜色() 为 整数
		code return getView().getHintTextColors().getDefaultColor();
	结束 属性

	//设置编辑框输入方式
	属性写 输入方式(输入方式 为 整数)
		code getView().setInputType(#输入方式);
	结束 属性

	//获取编辑框输入方式
	属性读 输入方式() 为 整数
		code return getView().getInputType();
	结束 属性

	//设置光标位置
	属性写 光标位置(光标位置 为 整数)
		code getView().setSelection(#光标位置);
	结束 属性

	//获取光标位置
	属性读 光标位置() 为 整数
		code return getView().getSelectionStart();
	结束 属性

	//设置编辑框状态是否为密码输入
	属性写 密码输入(是否密码输入 为 逻辑型)
		如果 是否密码输入 == 真 则
			输入方式(0x81)
		否则
			code #输入方式(android.text.InputType.TYPE_TEXT_VARIATION_NORMAL);
		结束 如果
	结束 属性

	//设置编辑框是否为只能单行输入
	属性写 单行输入(是否单行输入 为 逻辑型)
		code getView().setSingleLine(#是否单行输入);
	结束 属性

	//设置编辑框是否显示光标
	属性写 显示光标(是否显示光标 为 逻辑型)
		code getView().setCursorVisible(#是否显示光标);
	结束 属性

	//全选编辑框的内容
	方法 全选()
		code getView().selectAll();
	结束 方法

	//删除指定位置文本
	方法 删除文本(开始位置 为 整数, 结束位置 为 整数)
		code getView().getText().delete(#开始位置, #结束位置);
	结束 方法

	//选中指定位置文本
	方法 选中文本(开始位置 为 整数, 结束位置 为 整数)
		code getView().setSelection(#开始位置, #结束位置);
	结束 方法

	//向编辑框指定位置插入文本
	方法 插入文本(欲插入位置 为 整数, 欲插入文本 为 文本)
		code getView().getText().insert(#欲插入位置, #欲插入文本);
	结束 方法

	//向编辑框中追加文本
	方法 追加文本(内容 为 文本)
		code getView().getText().append(#内容);
	结束 方法

	//显示输入法
	方法 显示输入法()
		code ((android.view.inputmethod.InputMethodManager)context.getSystemService("input_method")).showSoftInput(getView(), 0);
	结束 方法

	//隐藏输入法
	方法 隐藏输入法()
		code ((android.view.inputmethod.InputMethodManager)context.getSystemService("input_method")).hideSoftInputFromWindow(getView().getApplicationWindowToken(), 0);
	结束 方法
结束 类

//按钮组件
类 按钮 : 文本框
	@code
    public #<按钮>(android.content.Context context) {
        super(context);
    }

    @Override
    public android.widget.Button onCreateView(android.content.Context context) {
        android.widget.Button view = new android.widget.Button(context);
        return view;
    }

    @Override
    public android.widget.Button getView() {
        return (android.widget.Button) view;
    }
    @end
结束 类

/*
复合按钮基础类
其类型有单选框，多选框等
*/
@禁止创建对象
@导入Java("android.widget.CompoundButton")
@前缀代码("abstract")
类 复合按钮 : 按钮
	@code
    public #<复合按钮>(android.content.Context context) {
        super(context);
		getView().setOnCheckedChangeListener(new CompoundButton.OnCheckedChangeListener(){
			@Override
			public void onCheckedChanged(CompoundButton btn, boolean checked) {
				#选中状态改变(checked);
			}
		});
    }

    @Override
    public abstract CompoundButton onCreateView(android.content.Context context);
	
    @Override
    public abstract CompoundButton getView();
    @end

	//设置复合类按钮的选中状态
	属性写 选中(是否选中 为 逻辑型)
		code getView().setChecked(#是否选中);
	结束 属性

	//获取复合类按钮的选中状态
	属性读 选中() 为 逻辑型
		code return getView().isChecked();
	结束 属性

	//切换复合类按钮的选中状态
	方法 切换状态()
		code getView().toggle();
	结束 方法

	/*
	按钮选中状态发生变化时触发该事件
	*/
	定义事件 选中状态改变(选中 为 逻辑型)
结束 类

//单选框组件
@导入Java("android.widget.RadioButton")
@导入Java("android.widget.CompoundButton")
类 单选框 : 复合按钮
	@code
    public #<单选框>(android.content.Context context) {
        super(context);
    }

    @Override
    public RadioButton onCreateView(android.content.Context context) {
        RadioButton view = new RadioButton(context);
        return view;
    }

    @Override
    public RadioButton getView() {
        return (RadioButton) view;
    }
    @end
结束 类


//多选框组件
@导入Java("android.widget.CheckBox")
@导入Java("android.widget.CompoundButton")
类 多选框 : 复合按钮
	@code
    public #<多选框>(android.content.Context context) {
        super(context);
    }

    @Override
    public CheckBox onCreateView(android.content.Context context) {
        CheckBox view = new CheckBox(context);
        return view;
    }

    @Override
    public CheckBox getView() {
        return (CheckBox) view;
    }
    @end
结束 类


//开关组件
@导入Java("android.widget.Switch")
@导入Java("android.widget.CompoundButton")
类 开关 : 复合按钮
	@code
    public #<开关>(android.content.Context context) {
        super(context);
    }

    @Override
    public Switch onCreateView(android.content.Context context) {
        Switch view = new Switch(context);
        return view;
    }

    @Override
    public Switch getView() {
        return (Switch) view;
    }
    @end

	//设置开关打开时的文本
	属性写 文本_打开(文本 为 文本)
		code getView().setTextOn(#文本);
	结束 属性

	//获取开关打开时的文本
	属性读 文本_打开() 为 文本
		code return getView().getTextOn().toString();
	结束 属性

	//设置开关关闭时的文本
	属性写 文本_关闭(文本 为 文本)
		code getView().setTextOff(#文本);
	结束 属性

	//获取开关关闭时的文本
	属性读 文本_关闭() 为 文本
		code return getView().getTextOff().toString();
	结束 属性
结束 类


//图片框组件
类 图片框 : 可视化组件

	@code
    public #<图片框>(android.content.Context context) {
        super(context);
    }

    @Override
    public android.widget.ImageView onCreateView(android.content.Context context) {
        android.widget.ImageView view = new android.widget.ImageView(context);
        return view;
    }

    @Override
    public android.widget.ImageView getView() {
        return (android.widget.ImageView) view;
    }
    @end

	属性写 图片资源(需显示图片:图片资源)
		code getView().setImageResource(#需显示图片);
	结束 属性

	属性写 图片路径(图片路径:文本)
		code getView().setImageBitmap(android.graphics.BitmapFactory.decodeFile(#图片路径));
	结束 属性

	属性写 图片数据(数据:字节[])
		code getView().setImageBitmap(android.graphics.BitmapFactory.decodeByteArray(#数据,0,#数据.length));
	结束 属性

	属性写 图片对象(图片可绘制对象:可绘制对象)
		code getView().setImageDrawable(#图片可绘制对象);
	结束 属性

	属性写 位图对象(位图对象:位图对象)
		code getView().setImageBitmap(#位图对象);
	结束 属性

	属性写 图片透明度(透明值:整数)
		code getView().setImageAlpha(#透明值);
	结束 属性

	属性读 图片透明度():整数
		code return getView().getImageAlpha();
	结束 属性

	属性写 拉伸方式(缩放类型 : 整数)
		假如 缩放类型
			是 0
				本对象.图像缩放类型 = 图像缩放类型.完全拉伸
			是 1
				本对象.图像缩放类型 = 图像缩放类型.居中
			是 2
				本对象.图像缩放类型 = 图像缩放类型.左上
			是 3
				本对象.图像缩放类型 = 图像缩放类型.自适应居中
			是 4
				本对象.图像缩放类型 = 图像缩放类型.右下
			是 5
				本对象.图像缩放类型 = 图像缩放类型.矩阵
			是 6
				本对象.图像缩放类型 = 图像缩放类型.裁切居中
			是 7
				本对象.图像缩放类型 = 图像缩放类型.内置居中
		结束 假如
	结束 属性

	属性写 图像缩放类型(类型:图像缩放类型)
		code getView().setScaleType(#类型);
	结束 属性

	属性读 图像缩放类型():图像缩放类型
		code return getView().getScaleType();
	结束 属性

	属性写 图片自适应(是否自适应图片:逻辑型)
		code getView().setAdjustViewBounds(#是否自适应图片);
	结束 属性

	属性读 图片自适应():逻辑型
		code return getView().getAdjustViewBounds();
	结束 属性

	属性写 最大扩展宽度(宽度:整数)
		code getView().setMaxWidth(#宽度);
	结束 属性

	属性读 最大扩展宽度():整数
		code return getView().getMaxWidth();
	结束 属性

	属性写 最大扩展高度(高度:整数)
		code getView().setMaxHeight(#高度);
	结束 属性

	属性读 最大扩展高度():整数
		code return getView().getMaxHeight();
	结束 属性

	属性写 裁切内边距(保留内边距:逻辑型)
		code getView().setCropToPadding(#保留内边距);
	结束 属性

	属性读 裁切内边距():逻辑型
		code return getView().getCropToPadding();
	结束 属性

	属性写 图像级别(设置图片级别:整数)
		code getView().setImageLevel(#设置图片级别);
	结束 属性

	/*
	加载网络图片
	参数为图片网址(必须为直链)
	*/
	@异步方法
	方法 加载网络图片(网址 : 文本)
		变量 网络 : 网络工具
		变量 字节集 = 等待 网络.取网页源码_字节集_同步(网址)
		本对象.图片数据 = 字节集
	结束 方法

	方法 取图片():可绘制对象
		code return getView().getDrawable();
	结束 方法

结束 类

@导入Java("android.widget.ImageView.ScaleType")
@指代类("android.widget.ImageView.ScaleType")
类 图像缩放类型
	@静态
	常量 矩阵:图像缩放类型?
	@静态
	常量 完全拉伸:图像缩放类型?
	@静态
	常量 左上:图像缩放类型?
	@静态
	常量 自适应居中:图像缩放类型?
	@静态
	常量 右下:图像缩放类型?
	@静态
	常量 居中:图像缩放类型?
	@静态
	常量 裁切居中:图像缩放类型?
	@静态
	常量 内置居中:图像缩放类型?

	@code
	static {
	#矩阵=ScaleType.MATRIX;
	#完全拉伸=ScaleType.FIT_XY;
	#左上=ScaleType.FIT_START;
	#自适应居中=ScaleType.FIT_CENTER;
	#右下=ScaleType.FIT_END;
	#居中=ScaleType.CENTER;
	#裁切居中=ScaleType.CENTER_CROP;
	#内置居中=ScaleType.CENTER_INSIDE;
	}
	@end

结束 类

/*
进度圈组件
*/
@导入Java("android.graphics.*")
@导入Java("android.widget.ProgressBar")
@导入Java("android.graphics.drawable.*")
类 进度圈 : 可视化组件
	@code
    public #<进度圈>(android.content.Context context) {
        super(context);
    }

    @Override
    public ProgressBar onCreateView(android.content.Context context) {
        ProgressBar view = new ProgressBar(context);
        return view;
    }

    @Override
    public ProgressBar getView() {
        return (ProgressBar) view;
    }
    @end

	//设置进度圈颜色，颜色是十六进制整数型颜色，0xaarrggbb格式
	属性写 颜色(颜色 为 整数)
		code getView().getIndeterminateDrawable().setColorFilter(new PorterDuffColorFilter(#颜色,PorterDuff.Mode.SRC_ATOP));
	结束 属性

	//获取进度圈着色之后的颜色，返回整数型颜色
	属性读 颜色() 为 整数
		code return ((ColorDrawable)getView().getIndeterminateDrawable().getCurrent()).getColor();
	结束 属性
结束 类


/*
进度条组件
*/
@导入Java("android.graphics.*")
@导入Java("android.widget.ProgressBar")
@导入Java("android.graphics.drawable.*")
类 进度条 : 可视化组件
	@code
    public #<进度条>(android.content.Context context) {
        super(context);
    }

    @Override
    public ProgressBar onCreateView(android.content.Context context) {
        ProgressBar view = new ProgressBar(context, null, android.R.attr.progressBarStyleHorizontal);
        return view;
    }

    @Override
    public ProgressBar getView() {
        return (ProgressBar) view;
    }
    @end

	//设置进度条进度
	属性写 进度(进度值 为 整数)
		code getView().setProgress(#进度值);
	结束 属性

	//获取进度条进度
	属性读 进度() 为 整数
		code return getView().getProgress();
	结束 属性

	//设置进度条的最大进度
	属性写 最大进度(最大进度值 为 整数)
		code getView().setMax(#最大进度值);
	结束 属性

	//获取进度条的最大进度
	属性读 最大进度() 为 整数
		code return getView().getMax();
	结束 属性

	//设置进度条的缓冲进度，常用于缓冲音视频时设置缓冲进度
	属性写 缓冲进度(缓冲进度 为 整数)
		code getView().setSecondaryProgress(#缓冲进度);
	结束 属性

	//获取进度条缓冲进度
	属性读 缓冲进度() 为 整数
		code return getView().getSecondaryProgress();
	结束 属性

	//设置进度条进度是否为模糊进度，如设置为真，则不再显示进度，而是一种无限刷新加载的状态
	属性写 模糊进度(是否不明确进度 为 逻辑型)
		code getView().setIndeterminate(#是否不明确进度);
	结束 属性

	//获取进度条是否为模糊进度状态
	属性读 模糊进度() 为 逻辑型
		code return getView().isIndeterminate();
	结束 属性
结束 类

/*
拖动条组件
*/
@导入Java("android.graphics.*")
@导入Java("android.widget.SeekBar")
@导入Java("android.graphics.drawable.*")
类 拖动条 : 进度条
	@code
    public #<拖动条>(android.content.Context context) {
        super(context);
		getView().setOnSeekBarChangeListener(new SeekBar.OnSeekBarChangeListener(){
			@Override
			public void onProgressChanged(SeekBar p1, int p2, boolean p3) {
				#进度被改变(p2, p3);
			}
			@Override
			public void onStartTrackingTouch(SeekBar p1) {
				#开始拖动();
			}
			@Override
			public void onStopTrackingTouch(SeekBar p1) {
				#结束拖动();
			}
			});
    }

    @Override
    public SeekBar onCreateView(android.content.Context context) {
        SeekBar view = new SeekBar(context);
        return view;
    }

    @Override
    public SeekBar getView() {
        return (SeekBar) view;
    }
    @end

	定义事件 进度被改变(当前进度 为 整数, 是否人为改变 : 逻辑型)

	定义事件 开始拖动()

	定义事件 结束拖动()
结束 类


/*
评分条组件
*/
@导入Java("android.widget.RatingBar")
类 评分条 : 可视化组件
	@code
    public #<评分条>(android.content.Context context) {
        super(context);
		getView().setOnRatingBarChangeListener(new RatingBar.OnRatingBarChangeListener(){
			public void onRatingChanged(RatingBar p1, float p2, boolean p3) {
				#评分被改变(p2, p3);
			}
		});
    }

    @Override
    public RatingBar onCreateView(android.content.Context context) {
        RatingBar view = new RatingBar(context);
        return view;
    }

    @Override
    public RatingBar getView() {
        return (RatingBar) view;
    }
    @end

	//设置评分条的星星数量
	属性写 总评分(数量 为 整数)
		code getView().setNumStars(#数量);
	结束 属性

	//获取评分条的星星数量
	属性读 总评分() 为 整数
		code return getView().getNumStars();
	结束 属性

	//设置评分条的评分
	属性写 评分(评分 为 小数)
		code getView().setRating((float) #评分);
	结束 属性

	//获取评分条的评分
	属性读 评分() 为 小数
		code return getView().getRating();
	结束 属性

	//设置评分条的最小评分单位
	属性写 最小评分单位(评分 为 小数)
		code getView().setStepSize((float) #评分);
	结束 属性

	//获取评分条的最小评分单位
	属性读 最小评分单位() 为 小数
		code return getView().getStepSize();
	结束 属性

	//评分被改变时触发该事件
	定义事件 评分被改变(评分 为 小数, 是否人为改变 : 逻辑型)
结束 类

/*
视频播放器组件
*/
@导入Java("android.widget.VideoView")
@导入Java("android.media.MediaPlayer")
类 视频播放器 : 可视化组件
	@code
	private boolean autoPlay;
	
    public #<视频播放器>(#<@安卓环境> context) {
        super(context);
		getView().setOnPreparedListener(new MediaPlayer.OnPreparedListener(){
			@Override
			public void onPrepared(MediaPlayer p1) {
				if (autoPlay) {
					getView().start();
				}
				#视频加载完成();
			}
		});
		getView().setOnCompletionListener(new MediaPlayer.OnCompletionListener() {
			@Override
			public void onCompletion(MediaPlayer mp) {
				#视频播放完成();
			}
		});
		getView().setOnErrorListener(new MediaPlayer.OnErrorListener() {
			@Override
			public boolean onError(MediaPlayer mp, int what, int extra) {
				#视频播放错误();
				return true;
			}
		});
    }

    @Override
    public VideoView onCreateView(android.content.Context context) {
        VideoView view = new VideoView(context);
        return view;
    }

    @Override
    public VideoView getView() {
        return (VideoView) view;
    }
	@end

	//设置播放视频的路径，可以为本地路径，也可以为网络路径,第二个参数为是否自动播放，表示视频加载完成后是否自动播放
	@附加权限(安卓权限.文件权限_读取)
	@附加权限(安卓权限.网络权限)
	方法 置播放路径(路径 为 文本, 是否自动播放 为 逻辑型 = 真)
		@code
		if (#路径.startsWith("http")) {
			getView().setVideoURI(android.net.Uri.parse(#路径));
		} else if (#路径.startsWith("/")) {
			getView().setVideoPath(#路径);
		}
		autoPlay = #是否自动播放;
		@end
	结束 方法

	//开始播放视频
	方法 开始播放()
		code getView().start();
	结束 方法

	//暂停播放视频
	方法 暂停播放()
		code getView().pause();
	结束 方法

	//停止播放视频
	方法 停止播放()
		code getView().stopPlayback();
	结束 方法

	//获取视频总时长
	方法 取视频总时长() 为 整数
		code return getView().getDuration();
	结束 方法

	//获取当前播放位置
	方法 取当前播放位置() 为 整数
		code return getView().getCurrentPosition();
	结束 方法

	//快进至指定位置
	方法 快进至(位置 为 整数)
		code getView().seekTo(#位置);
	结束 方法

	//重新播放
	方法 重新播放()
		code getView().resume();
	结束 方法

	//判断视频播放器是否在播放视频
	方法 是否在播放() 为 逻辑型
		code return getView().isPlaying();
	结束 方法

	//视频加载完成时触发该事件
	定义事件 视频加载完成()

	//视频播放完成时触发该事件
	定义事件 视频播放完成()

	//视频播放错误时触发该事件
	定义事件 视频播放错误()
结束 类


/*
浏览框组件，提供访问网页的功能
*/
@附加权限(安卓权限.网络权限)
@附加清单.组件属性([[android:configChanges="orientation|screenSize|keyboardHidden|uiMode"]])
@导入Java("android.content.Context")
@导入Java("android.content.pm.ActivityInfo")
@导入Java("android.content.Intent")
@导入Java("android.content.ActivityNotFoundException")
@导入Java("android.view.View")
@导入Java("android.view.ViewGroup")
@导入Java("android.net.Uri")
@导入Java("android.net.http.SslError")
@导入Java("android.os.Build")
@导入Java("android.app.Activity")
@导入Java("android.app.DownloadManager")
@导入Java("android.widget.FrameLayout")
@导入Java("java.io.File")
@导入Java("android.graphics.Bitmap")
@导入Java("android.annotation.TargetApi")
@导入Java("android.widget.ProgressBar")
@导入Java("android.webkit.*")
类 浏览框 : 可视化组件

	@code 
	private ProgressBar mProgressBar;
	private boolean Prv = true;
	private View mView;
	private int visibleAbility;
	private int original;
	private WebChromeClient.CustomViewCallback mCallback;
	private static ValueCallback < Uri > message_upload;
	private static ValueCallback < Uri[] > message_upload2;
	private static JsPromptResult htcs;
	private java.util.ArrayList<String> JsI = new java.util.ArrayList();
	@end

	//设置是否显示进度条
	属性写 显示进度条(是否显示进度条 为 逻辑型)
		//code this.Prv = #是否显示进度条;
		code mProgressBar.setVisibility((this.Prv = #是否显示进度条) ? View.VISIBLE : View.GONE);
	结束 属性

	//浏览框UA
	属性读 UA() 为 文本
		code return getView().getSettings().getUserAgentString();
	结束 属性

	//设置浏览框UA
	属性写 UA(UA 为 文本)
		code getView().getSettings().setUserAgentString(#UA);
	结束 属性

	@静态
	常量 缓存_默认 : 整数 = -1

	//仅使用网络，不使用缓存
	@静态
	常量 缓存_仅网络 : 整数 = 2

	//仅使用缓存，不使用网络
	@静态
	常量 缓存_仅缓存 : 整数 = 3

	//只要本地有，无论是否过期，都使用缓存中的数据，没有就使用网络
	@静态
	常量 缓存_缓存_其它网络 : 整数 = -1

	属性写 缓存模式(缓存模式 为 整数)
		code getView().getSettings().setCacheMode(#缓存模式);
	结束 属性

	//判断浏览框是否可后退
	属性读 可后退() 为 逻辑型
		code return getView().canGoBack();
	结束 属性

	//判断浏览框是否可前进
	属性读 可前进() 为 逻辑型
		code return getView().canGoForward();
	结束 属性

	//获取浏览框当前网址
	属性读 网址() 为 文本
		code return getView().getUrl();
	结束 属性

	属性写 网址(网址 : 文本)
		code getView().loadUrl(#网址);
	结束 属性

	//获取浏览框当前网页标题
	属性读 标题() 为 文本
		code return getView().getTitle();
	结束 属性

	//获取浏览框当前网页加载进度
	属性读 进度() 为 整数
		code return getView().getProgress();
	结束 属性

	//获取 HTML 内容的高度
	属性读 页面高度() 为 整数
		code return getView().getContentHeight();
	结束 属性

	//获取当前页面的 favicon 
	属性读 网页图标() 为 位图对象
		code return getView().getFavicon();
	结束 属性

	//获取 网页301 转跳前的原始链接
	属性读 原始链接() 为 文本
		code return getView().getOriginalUrl();
	结束 属性

	//加载网址
	方法 加载网址(网址 为 文本)
		code getView().loadUrl(#网址);
	结束 方法

	//加载数据
	方法 加载数据(数据 为 文本)
		@code 
		try {
			getView().loadDataWithBaseURL("", #数据, "text/html", "utf-8", null);
		} catch (Exception e) {
			e.printStackTrace();
		}
		@end
	结束 方法

	//加载数据
	方法 加载数据2(域名 为 文本 = "", 数据 为 文本, MIME类型 为 文本 = "text/html", 编码 为 文本 = "utf-8", 链接 为 文本 = 空)
		@code 
		try {
			getView().loadDataWithBaseURL(#域名, #数据, #MIME类型, #编码, #链接);
		} catch (Exception e) {
			e.printStackTrace();
		}
		@end
	结束 方法

	方法 禁止加载网络图片(是否禁止 : 逻辑型)
		code getView().getSettings().setBlockNetworkImage(#是否禁止);
	结束 方法

	//通过Url打开应用
	方法 打开应用(url 为 文本)
		@code 
		try {
			Intent intent = new Intent(Intent.ACTION_VIEW, Uri.parse(#url));
			intent.setFlags(Intent.FLAG_ACTIVITY_NEW_TASK | Intent.FLAG_ACTIVITY_SINGLE_TOP);
			context.startActivity(intent);
		} catch (Exception e) {
			e.printStackTrace();
			//context.弹出提示("未安装该应用");
		}
		@end
	结束 方法

	//停止加载当前网页
	方法 停止加载()
		code getView().stopLoading();
	结束 方法

	//重新加载当前网页
	方法 重载()
		刷新网页()
	结束 方法

	//重新加载当前网页
	方法 刷新网页()
		code getView().reload();
	结束 方法

	//网页后退
	方法 后退()
		code getView().goBack();
	结束 方法

	//网页前进
	方法 前进()
		code getView().goForward();
	结束 方法

	/*//设置进度条
	方法 置进度条(欲替代进度条组件 为 进度条)
		code this.mProgressBar = #欲替代进度条组件.getView();
	结束 方法*/

	//设置某个网址的cookie
	方法 置cookie(网址 为 文本, cookie 为 文本)
		code CookieManager manager = CookieManager.getInstance();
		code manager.setCookie(#网址, #cookie);
	结束 方法

	//获取某个网址的cookie
	方法 取cookie(网址 为 文本) 为 文本
		code CookieManager manager = CookieManager.getInstance();
		code return manager.getCookie(#网址);
	结束 方法

	//清除浏览历史
	方法 清除历史()
		code getView().clearHistory();
	结束 方法

	//清除输入过的表单
	方法 清除表单()
		code getView().clearFormData();
	结束 方法

	//清除浏览框cookie
	方法 清除cookie()
		@code
		if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.LOLLIPOP) {
            CookieManager.getInstance().removeAllCookies(null);
        } else {
            CookieSyncManager.createInstance(context);
            CookieManager.getInstance().removeAllCookie();
            CookieSyncManager.getInstance().sync();
        }
		@end
	结束 方法

	//清除浏览框缓存
	方法 清除缓存()
		@code
		getView().clearCache(true);
		File cacheFile = new File(context.getCacheDir().getParent() + "/app_webview");
        clearCacheFolder(cacheFile, System.currentTimeMillis());
		@end
	结束 方法

	//用于拦截到下载的下载，返回下载任务的id
	@附加权限(安卓权限.文件权限_写入)
	方法 下载(下载网址 为 文本, 保存路径 为 文本) 为 长整数
		@code 
		DownloadManager downloadManager = (DownloadManager) context.getSystemService(Context.DOWNLOAD_SERVICE);
		Uri uri = Uri.parse(#下载网址);
		uri.getLastPathSegment();
		DownloadManager.Request request = new DownloadManager.Request(uri);
		File file = new File(#保存路径);
		request.setDestinationInExternalPublicDir(file.getParent(), file.getName());
		request.setTitle(file.getName());
		request.setDescription(#下载网址);
		File f = new File(#保存路径);
		if(f.exists())
		f.delete();
		long downloadId = downloadManager.enqueue(request);
		return downloadId;
		@end
	结束 方法

	//上传文件的回调
	方法 回调(请求码 为 整数, 结果码 为 整数, 数据 为 启动信息)
		@code 
		if (#请求码 == 5173) {
			if (null == message_upload) {
				return;
			}
			Uri result = #数据 == null || #结果码 != Activity.RESULT_OK ? null  : #数据.getData();
			message_upload.onReceiveValue(result);
			message_upload = null;
		} else if (#请求码 == 5174) {
			if (null == message_upload2) {
				return;
			}
			message_upload2.onReceiveValue(WebChromeClient.FileChooserParams.parseResult(#结果码, #数据));
			message_upload2 = null;
		}
		@end
	结束 方法

	//添加一个JS接口
	方法 添加JS接口(接口名 为 文本, 方法名 为 文本)
		变量 js : 文本 = ("if(window."+ 接口名 + " == null){window."+ 接口名 + "=function (){}}window."+ 接口名 + "."+方法名 +
		"=function (a = '', b = ''){return prompt('[JsI"+ 接口名 +"- #-"+ 方法名 + "-] _'+a,b)};")
		执行JS(js)
		code JsI.add(#js);
	结束 方法

	/*
	方法 保存状态(bundle 为 android.os.Bundle)
		getView().saveState(#bundle)
	结束 方法

	方法 恢复状态(bundle 为 android.os.Bundle)
		getView().restoreState(bundle)
	结束 方法*/

	//用于取消或中断JS交互事件的回调
	方法 取消JS交互事件回调()
		code htcs.cancel();
	结束 方法

	方法 执行JS(JS 为 文本)
		如果 JS.为空()
			返回
		结束 如果
		@code
	    getView().evaluateJavascript("javascript:" + #JS, new ValueCallback<String>() {
			//@Override
			public void onReceiveValue(String value) {
				if(value == null || value.startsWith("null")) return;
				value = ( "-\"'_\"" + value + "\"_'-\"").replace( "-\"'_\"\"","").replace( "\"\"_'-\"","");
				#执行JS回调(value);
			}
		});
	  @end
	结束 方法

	方法 释放浏览框()
		code getView().removeAllViews();
		code getView().destroy();
	结束 方法

	//不要在此方法内进行耗时操作
	定义事件 JS交互事件(接口名 : 文本, 方法名 为 文本, 数据1 : 文本, 数据2 为 文本) 为 文本

	//执行JS 方法的回调，JS里用 return 返回数据
	定义事件 执行JS回调(数据 为 文本)

	//拦截到Url时触发该事件
	定义事件 拦截到Url(url 为 文本) 为 逻辑型

	//拦截到Uri时触发该事件
	定义事件 拦截到Uri(uri 为 文本)

	//网页开始加载时触发该事件，返回加载的网址
	定义事件 网页开始加载(网址 为 文本)

	//网页加载完成时触发该事件，返回加载的网址
	定义事件 网页加载完成(网址 为 文本)

	//网页加载进度改变时触发该事件，返回进度
	定义事件 进度值改变(进度 为 整数)

	//接收到网页标题触发该事件，返回网页标题
	定义事件 接收到标题(网址 为 文本)

	//接收到网页图标触发该事件，返回可绘制对象
	定义事件 接收到图标(图标 为 位图对象)

	//网页拦截到网页请求时触发该事件，返回请求的网址
	定义事件 拦截到请求(网址 为 文本)

	//网页拦截到下载请求时触发该事件，返回下载地址,名称,类型,以及大小
	定义事件 拦截到下载(网址 为 文本, 名称 为 文本, 类型 为 文本, 大小 为 长整数)

	//网页 Console Message， 等级： 0-调试, 1-错误, 2-日志, 3-异常, 4-警告
	定义事件 控制台日志(行数 为 整数, 信息 为 文本, 等级 : 整数, 来源ID : 文本) : 逻辑型

	方法 注入JS接口类(接口类 : 对象, 接口名 : 文本)
		code getView().addJavascriptInterface(#接口类, #接口名);
	结束 方法

	@code
	private void enabledCookie(WebView web) {
		CookieManager instance = CookieManager.getInstance();
		if (Build.VERSION.SDK_INT < 21) {
			CookieSyncManager.createInstance(context);
		}
		instance.setAcceptCookie(true);
		if (Build.VERSION.SDK_INT >= 21) {
			instance.setAcceptThirdPartyCookies(web, true);
		}
	}
	private void init() {
		mProgressBar = new ProgressBar(context, null, android.R.attr.progressBarStyleHorizontal);
		mProgressBar.setLayoutParams(new WebView.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, (int)(2 * context.getResources().getDisplayMetrics().density + 0.5f), 0, 0));
		getView().addView(mProgressBar);
		mProgressBar.setVisibility(View.GONE);
		getView().setWebChromeClient(new MyWebChromeClient());
		getView().setWebViewClient(new MyWebViewClient());
		getView().setDownloadListener(new MyDownloadListener());
		WebSettings mWebSettings = getView().getSettings();
		
		mWebSettings.setJavaScriptEnabled(true);
		mWebSettings.setDefaultTextEncodingName("utf-8");
		mWebSettings.setCacheMode(WebSettings.LOAD_DEFAULT);//缓存模式 
		
		mWebSettings.setPluginState(WebSettings.PluginState.ON);
		
		mWebSettings.setUseWideViewPort(true);
		mWebSettings.setAllowFileAccess(Build.VERSION.SDK_INT >= Build.VERSION_CODES.R); //文件访问
		mWebSettings.setSupportZoom(true);
		mWebSettings.setLoadWithOverviewMode(true);
		mWebSettings.setBuiltInZoomControls(true);
		mWebSettings.setUseWideViewPort(true);
		mWebSettings.setLoadWithOverviewMode(true);
		mWebSettings.setSupportZoom(true); 
		mWebSettings.setBuiltInZoomControls(true);
		mWebSettings.setDisplayZoomControls(false);
		mWebSettings.setSavePassword(true);
		mWebSettings.setSaveFormData(true);
		mWebSettings.setJavaScriptEnabled(true);
		mWebSettings.setDomStorageEnabled(true);
		mWebSettings.setJavaScriptCanOpenWindowsAutomatically(true);
		mWebSettings.setLoadsImagesAutomatically(true);
		mWebSettings.setAppCacheEnabled(true);
		mWebSettings.setAppCachePath(context.getCacheDir().getAbsolutePath());
		mWebSettings.setDatabaseEnabled(true);
		mWebSettings.setGeolocationDatabasePath(context.getDir("database", 0).getPath());
		mWebSettings.setGeolocationEnabled(true);
		
		if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.LOLLIPOP) {
			mWebSettings.setMixedContentMode(WebSettings.MIXED_CONTENT_ALWAYS_ALLOW);
		}
		if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.JELLY_BEAN_MR1) {
			mWebSettings.setMediaPlaybackRequiresUserGesture(true);
		}
		mWebSettings.setAllowFileAccessFromFileURLs(!(Build.VERSION.SDK_INT >= 16)); //允许从文件URL访问文件
		mWebSettings.setAllowUniversalAccessFromFileURLs(!(Build.VERSION.SDK_INT >= 30));
		
		CookieManager instance = CookieManager.getInstance();
		if (Build.VERSION.SDK_INT < 21) {
			CookieSyncManager.createInstance(context.getApplicationContext());
		}
		instance.setAcceptCookie(true);
		if (Build.VERSION.SDK_INT >= 21) {
			instance.setAcceptThirdPartyCookies(getView(), true);
		}
		enabledCookie(getView());
	}

	private void showVideo(View view, WebChromeClient.CustomViewCallback callback) {
		if (context instanceof Activity) {
			Activity activity = (Activity)context;
			mView = view;
			visibleAbility = activity.getWindow().getDecorView().getSystemUiVisibility();
			original = activity.getRequestedOrientation();
			mCallback = callback;
			FrameLayout decor = (FrameLayout) activity.getWindow().getDecorView();
			decor.addView(view, new FrameLayout.LayoutParams(
			ViewGroup.LayoutParams.MATCH_PARENT,
			ViewGroup.LayoutParams.MATCH_PARENT));
			view.setBackgroundColor(0xff66ccff);
			activity.getWindow().getDecorView().setSystemUiVisibility(
			View.SYSTEM_UI_FLAG_LAYOUT_STABLE |
			View.SYSTEM_UI_FLAG_LAYOUT_HIDE_NAVIGATION |
			View.SYSTEM_UI_FLAG_LAYOUT_FULLSCREEN |
			View.SYSTEM_UI_FLAG_HIDE_NAVIGATION |
			View.SYSTEM_UI_FLAG_FULLSCREEN |
			View.SYSTEM_UI_FLAG_IMMERSIVE);
			activity.setRequestedOrientation(ActivityInfo.SCREEN_ORIENTATION_LANDSCAPE);
		}
	}

	private void closeVideo() {
		if (context instanceof Activity) {
			Activity activity = (Activity)context;
			FrameLayout decor = (FrameLayout) activity.getWindow().getDecorView();
			decor.removeView(mView);
			mView = null;
			decor.setSystemUiVisibility(visibleAbility);
			activity.setRequestedOrientation(original);
			mCallback.onCustomViewHidden();
			mCallback = null;
		}
	}

	private class MyWebViewClient extends WebViewClient {
		@Override
		public boolean shouldOverrideUrlLoading(WebView view, final String url) {
			if (url.startsWith("http") || url.startsWith("file")) {
				return #拦截到Url(url);
			} else {
				#拦截到Uri(url);
				return true;
			}
		}

		@Override
		public void onReceivedSslError(WebView view, SslErrorHandler handler, SslError error) {
			handler.proceed();
		}

		@Override
		public WebResourceResponse shouldInterceptRequest(WebView view, String url) {
			if (Build.VERSION.SDK_INT < 21) #拦截到请求(url);
			return super.shouldInterceptRequest(view, url);
		}

		@Override
		public WebResourceResponse shouldInterceptRequest(WebView view, WebResourceRequest request) {
			#拦截到请求(request.getUrl().toString());
			return super.shouldInterceptRequest(view, request);
		}

		@Override
		public void onPageStarted(WebView view, String url, Bitmap bitmap) {
			#网页开始加载(url);
		}
		@Override
		public void onPageFinished(WebView view, String url) {
			#执行JS(JsI());
			#网页加载完成(url);
		}
	}

	public String JsI(){
		String s = "";
		for(String ss : JsI)
		s += ss;
		return s;
	}

	private class MyWebChromeClient extends WebChromeClient {

		@Override		 
		public boolean onJsPrompt(WebView view, String url, String message,		  
		String defaultValue, JsPromptResult result) {
			htcs = result;
			if(message.startsWith("[JsI")){
			 try{
			String[] z = message.split("-] _",2);
			String[] name = z[0].split("- #-",2);
			String cname = name[0].replace("[JsI","");
			String mname = name[1];
			String nr = z[1];
				String r = #JS交互事件(cname,mname,nr,defaultValue);
			result.confirm(r);
			}catch(Throwable e){
				#取消JS交互事件回调();
			}
				return true;
			}
			return super.onJsPrompt(view, url, message, defaultValue, result);
		}

		@Override
		public void  onProgressChanged(WebView view, int progress) {
		 #进度值改变(progress);
		 #执行JS(JsI()); // 注入放这里 其实并不消耗性能，因为加载网页时只会执行几次
		 //if (progress > 20 && progress < 50 ) #执行JS(JsI());
		 //else if (progress > 69 && progress < 81 ) #执行JS(JsI());
			if(Prv){
				if (progress == 100) {
					mProgressBar.setVisibility(View.GONE);
				}
				else {
					if (mProgressBar.getVisibility() == View.GONE)
					mProgressBar.setVisibility(View.VISIBLE);
					mProgressBar.setProgress(progress);
				}
			}
			super.onProgressChanged(view, progress);
		}

		@Override
		public void onReceivedTitle(WebView view, String title) {
			super.onReceivedTitle(view, title);
			#接收到标题(title);
		}

		/*@Override
		 public Bitmap getDefaultVideoPoster() {
		 return BitmapFactory.decodeResource(context.getResources(), R.drawable.ic_launcher);
		 }*/

		@Override
		public void onShowCustomView(View view, WebChromeClient.CustomViewCallback callback) {
			if (mView != null) {
				onHideCustomView(); 
				return;
			}
			showVideo(view, callback);
		}

		@Override
		public void onHideCustomView() {
			if (mView == null) {
				return ;
			}
			closeVideo();
			getView().setVisibility(View.VISIBLE);
		}

		@Override
		public View getVideoLoadingProgressView() {
			return super.getVideoLoadingProgressView();
		}

		public void openFileChooser(ValueCallback < Uri > uri, String type, String capture) {
			if (context instanceof Activity) {
				Activity activity = (Activity)context;
				message_upload = uri;
				Intent i = new Intent(Intent.ACTION_GET_CONTENT);
				i.addCategory(Intent.CATEGORY_OPENABLE);
				i.setType("*/*");
				if(type.contains("image")){
					i = new Intent(Intent.ACTION_PICK);
					i.setType(type);
				}
				//activity.startActivityForResult(i, 5173);
				activity.startActivityForResult(Intent.createChooser(i, "文件选择"), 5173);
			}
		}

		@TargetApi(Build.VERSION_CODES.LOLLIPOP)
		public boolean onShowFileChooser(WebView view, ValueCallback < Uri[] > message, WebChromeClient.FileChooserParams params) {
			if (context instanceof Activity) {
				Activity activity = (Activity)context;
				if (message_upload2 != null) {
					message_upload2.onReceiveValue(null);
					message_upload2 = null;
				}
				message_upload2 = message;
				Intent i = params.createIntent();
				if(i.getType().contains("image")){
					i = new Intent(Intent.ACTION_PICK);
					i.setType(params.createIntent().getType());
				}
				try {
					activity.startActivityForResult(i, 5174);
					return true;
				} catch (ActivityNotFoundException e) {
					message_upload2 = null;
				}
			}
			return false;
		}
		
		//boolean onJsAlert(WebView view, String url, String message, JsResult result)
		//boolean onJsConfirm(WebView view, String url, String message, JsResult result)
		//JsResult.confirm();
		
		public void onReceivedIcon(WebView view, Bitmap icon){//网站图标
			#接收到图标(icon);
		}
		
		public boolean onConsoleMessage(ConsoleMessage cm){
			return #控制台日志(cm.lineNumber(), cm.message(), cm.messageLevel().ordinal(), cm.sourceId());
		}
		
	}
	
	private static int clearCacheFolder(File dir, long time) {
	    int deletedFiles = 0;
    	if (dir != null && dir.isDirectory()) {
        	try {
      	      for (File child : dir.listFiles()) {
         	       if (child.isDirectory()) deletedFiles += clearCacheFolder(child, time);
            	    if (child.lastModified() < time) if (child.delete()) deletedFiles++;
          	  }
       	 } catch (Exception e) {
    	        e.printStackTrace();
     	   }
  	  }
   	 return deletedFiles;
    }

	class MyDownloadListener implements DownloadListener {

		@Override
		public void onDownloadStart(String url, String userAgent, String contentDisposition, String mimetype, long contentLength) {
			Uri uri = Uri.parse(url);
			String mFilename = uri.getLastPathSegment();
			if (contentDisposition != null) {
				String p = "filename=\"";
				int i = contentDisposition.indexOf(p);
				if (i != - 1) {
					i += p.length();
					int n = contentDisposition.indexOf('"', i);
					if (n > i)
					mFilename = contentDisposition.substring(i, n);
				}
			}
			#拦截到下载(url, mFilename, mimetype, contentLength);
		}
	}
	/*
	class JsInterface {
		@JavascriptInterface
		@SuppressLint({"JavascriptInterface"})
		public void js交互(String msg) {
			//挂接事件 js交互事件(msg);
		}
	}*/

	public WebView getView() {
		return (WebView)super.getView();
	}
	
	public #<浏览框>(android.content.Context context) {
		  super(context);
		this.context = context;
		init();
	 }

	 @Override
	 public WebView onCreateView(Context context) {
		  return new WebView(context);
	 }
	@end
结束 类