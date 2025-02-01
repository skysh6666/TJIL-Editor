包名 结绳.自动化.构建

@常量类型(整数)
@需求值类型(整数)
类 工程种类
	@静态
	常量 APP : 工程种类 = 0
	@静态
	常量 控制台应用 : 工程种类 = 1
	@静态
	常量 库应用 : 工程种类 = 2
结束 类

@指代类("com.tiecode.develop.plugin.api.project.Project")
类 工程
	属性读 种类() : 工程种类
		code return #this.getKind();
	结束 属性
	
	属性读 名称() : 文本
		code return #this.getName();
	结束 属性
	
	属性读 目录() : 文件
		code return #this.getProjectDir();
	结束 属性
	
	属性读 标识类型() : 文本
		code return #this.getClassification();
	结束 属性
	
	属性读 标识ID() : 文本
		code return #this.getClassificationId();
	结束 属性
	
	/*
	获取该工程目录下的指定子文件
	*/
	方法 取子文件(文件名 : 文本) : 文件
		code return #this.getChildFile(#文件名);
	结束 方法
结束 类

类 结绳中文系列工程 : 工程
	
结束 类

类 结绳安卓工程 : 结绳中文系列工程
	
结束 类

类 任务基础类
	
结束 类

类 任务 : 任务基础类
结束 类