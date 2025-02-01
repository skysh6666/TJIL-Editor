包名 结绳.安卓

@指代类("android.view.InputEvent")
类 输入事件
	/*
	获取当前事件所处设备的ID，比如鼠标ID，键盘ID
	*/
	属性读 设备ID() : 整数
		code return #this.getDeviceId();
	结束 属性
	
	/*
	获取当前事件的触发时间，单位:ms
	*/
	属性读 时间() : 长整数
		code return #this.getEventTime();
	结束 属性
结束 类

@前缀代码("final")
@禁止创建对象
@禁止继承
@常量类型(整数)
@需求值类型(整数)
类 触摸动作
	@静态
	常量 按下 : 触摸动作?
	
	@静态
	常量 移动 : 触摸动作?
	
	@静态
	常量 抬起 : 触摸动作?
	
	@静态
	常量 多点按下 : 触摸动作?
	
	@静态
	常量 多点抬起 : 触摸动作?
	
	@静态
	常量 取消 : 触摸动作?
	
	@code
	static {
		#按下 = android.view.MotionEvent.ACTION_DOWN;
		#移动 = android.view.MotionEvent.ACTION_MOVE;
		#抬起 = android.view.MotionEvent.ACTION_UP;
		#多点按下 = android.view.MotionEvent.ACTION_POINTER_DOWN;
		#多点抬起 = android.view.MotionEvent.ACTION_POINTER_UP;
		#取消 = android.view.MotionEvent.ACTION_CANCEL;
	}
	@end
结束 类

@指代类("android.view.MotionEvent")
类 触摸事件 : 输入事件
	/*
	获取该触摸事件的动作
	*/
	属性读 动作() : 触摸动作
		code return #this.getAction();
	结束 属性
	
	/*
	获取该触摸事件当前正在执行的动作
	*/
	属性读 当前动作() : 触摸动作
		code return #this.getActionMasked();
	结束 属性
	
	/*
	获取该触摸事件当前触摸点数量
	*/
	属性读 触摸点数量() : 整数
		code return #this.getPointerCount();
	结束 属性
	
	/*
	获取该触摸事件原始横坐标
	*/
	属性读 原始横坐标() : 小数
		code return #this.getRawX();
	结束 属性
	
	/*
	获取该触摸事件原始纵坐标
	*/
	属性读 原始纵坐标() : 小数
		code return #this.getRawY();
	结束 属性
	
	/*
	获取指定索引处触摸点的横坐标，默认为0
	如果只有一个触摸点，可以不必传入参数
	*/
	方法 取横坐标(索引 : 整数 = 0) : 小数
		code return #this.getX(#索引);
	结束 方法
	
	/*
	获取指定索引处触摸点的纵坐标，默认为0
	如果只有一个触摸点，可以不必传入参数
	*/
	方法 取纵坐标(索引 : 整数 = 0) : 小数
		code return #this.getY(#索引);
	结束 方法
结束 类

@禁止创建对象
@前缀代码("final")
@常量类型(整数)
@需求值类型(整数)
类 拖放动作
	@静态
	常量 开始拖放 : 拖放动作?
	
	@静态
	常量 结束拖放 : 拖放动作?
	
	@静态
	常量 放下 : 拖放动作?
	
	@code
	static {
		#开始拖放 = android.view.DragEvent.ACTION_DRAG_STARTED;
		#结束拖放 = android.view.DragEvent.ACTION_DRAG_ENDED;
		#放下 = android.view.DragEvent.ACTION_DROP;
	}
	@end
结束 类

@指代类("android.view.DragEvent")
类 拖放事件
	/*
	获取该触摸事件的动作
	*/
	属性读 动作() : 拖放动作
		code return #this.getAction();
	结束 属性
	
	/*
	获取该触摸事件原始横坐标
	*/
	属性读 横坐标() : 小数
		code return #this.getX();
	结束 属性
	
	/*
	获取该触摸事件原始纵坐标
	*/
	属性读 纵坐标() : 小数
		code return #this.getY();
	结束 属性
结束 类

@禁止创建对象
@常量类型(整数)
@需求值类型(整数)
类 按键动作
	@静态
	常量 按下 : 按键动作?
	
	@静态
	常量 放开 : 按键动作?
	
	@静态
	常量 同时按下多个 : 按键动作?
	
	@code
	static {
		#按下 = android.view.KeyEvent.ACTION_DOWN;
		#放开 = android.view.KeyEvent.ACTION_UP;
		#同时按下多个 = android.view.KeyEvent.ACTION_MULTIPLE;
	}
	@end
结束 类


@禁止创建对象
类 按键代码
	@静态
	常量 A : 整数?

	@静态
	常量 B : 整数?

	@静态
	常量 C : 整数?

	@静态
	常量 D : 整数?

	@静态
	常量 E : 整数?

	@静态
	常量 F : 整数?

	@静态
	常量 G : 整数?

	@静态
	常量 H : 整数?

	@静态
	常量 I : 整数?

	@静态
	常量 J : 整数?

	@静态
	常量 K : 整数?

	@静态
	常量 L : 整数?

	@静态
	常量 M : 整数?

	@静态
	常量 N : 整数?

	@静态
	常量 O : 整数?

	@静态
	常量 P : 整数?

	@静态
	常量 Q : 整数?

	@静态
	常量 R : 整数?

	@静态
	常量 S : 整数?

	@静态
	常量 T : 整数?

	@静态
	常量 U : 整数?

	@静态
	常量 V : 整数?

	@静态
	常量 W : 整数?

	@静态
	常量 X : 整数?

	@静态
	常量 Y : 整数?

	@静态
	常量 Z : 整数?
	
	@静态
	常量 CTRL_左 : 整数?
	
	@静态
	常量 CTRL_右 : 整数?
	
	@静态
	常量 回车 : 整数?
	
	@code
	static {
		#A = android.view.KeyEvent.KEYCODE_A;
		#B = android.view.KeyEvent.KEYCODE_B;
		#C = android.view.KeyEvent.KEYCODE_C;
		#D = android.view.KeyEvent.KEYCODE_D;
		#E = android.view.KeyEvent.KEYCODE_E;
		#F = android.view.KeyEvent.KEYCODE_F;
		#G = android.view.KeyEvent.KEYCODE_G;
		#H = android.view.KeyEvent.KEYCODE_H;
		#I = android.view.KeyEvent.KEYCODE_I;
		#J = android.view.KeyEvent.KEYCODE_J;
		#K = android.view.KeyEvent.KEYCODE_K;
		#L = android.view.KeyEvent.KEYCODE_L;
		#M = android.view.KeyEvent.KEYCODE_M;
		#N = android.view.KeyEvent.KEYCODE_N;
		#O = android.view.KeyEvent.KEYCODE_O;
		#P = android.view.KeyEvent.KEYCODE_P;
		#Q = android.view.KeyEvent.KEYCODE_Q;
		#R = android.view.KeyEvent.KEYCODE_R;
		#S = android.view.KeyEvent.KEYCODE_S;
		#T = android.view.KeyEvent.KEYCODE_T;
		#U = android.view.KeyEvent.KEYCODE_U;
		#V = android.view.KeyEvent.KEYCODE_V;
		#W = android.view.KeyEvent.KEYCODE_W;
		#X = android.view.KeyEvent.KEYCODE_X;
		#Y = android.view.KeyEvent.KEYCODE_Y;
		#Z = android.view.KeyEvent.KEYCODE_Z;
		#CTRL_左 = android.view.KeyEvent.KEYCODE_CTRL_LEFT;
		#CTRL_右 = android.view.KeyEvent.KEYCODE_CTRL_RIGHT;
		#回车 = android.view.KeyEvent.KEYCODE_ENTER;
	}
	@end
结束 类


@指代类("android.view.KeyEvent")
类 按键事件 : 输入事件
	/*
	获取该触摸事件的动作
	*/
	属性读 动作() : 按键动作
		code return #this.getAction();
	结束 属性
	
	/*
	获取该触摸事件当前正在执行的动作
	*/
	属性读 按键代码() : 整数
		code return #this.getKeyCode();
	结束 属性
结束 类