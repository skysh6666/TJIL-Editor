包名 结绳.JVM

@导入Java("java.util.*")
@导入Java("java.util.regex.*")
@指代类("java.util.regex.Pattern")
@禁止创建对象
类 正则表达式
	//进行正则匹配，参数一为原文本，参数二为正则表达式
	@静态
	方法 正则匹配(文本 为 文本,表达式 为 文本) 为 文本[]
		@code
		Matcher mr = Pattern.compile(#表达式, 40).matcher(#文本);
		List<String> list = new ArrayList<>();
		while (mr.find()) {
			list.add(mr.group());
		}
		return list.toArray(new String[list.size()]);
		@end
	结束 方法

	//进行正则匹配，参数一为原文本，参数二为正则表达式
	@静态
	方法 正则匹配2(文本 为 文本,表达式 为 文本) 为 文本集合
		@code
		Matcher mr = Pattern.compile(#表达式, 40).matcher(#文本);
		ArrayList<String> list = new ArrayList<>();
		while (mr.find()) {
			list.add(mr.group());
		}
		return list;
		@end
	结束 方法

	//编译一个正则表达式，得到正则表达式对象
	@静态
	@嵌入式代码
	方法 编译(表达式 : 文本) : 正则表达式
		code java.util.regex.Pattern.compile(#表达式)
	结束 方法
	
	@嵌入式代码
	属性读 表达式文本() : 文本
		code #this.pattern()
	结束 属性
	
	/*
	根据正则表达式匹配指定文本
	调用该方法后会得到一个正则匹配器
	*/
	方法 匹配(欲匹配文本 : 文本) : 正则匹配器
		code return #this.matcher(#欲匹配文本);
	结束 方法
	
	/*
	根据正则表达式分割指定文本
	调用该方法后会得到分割后的文本数组
	*/
	方法 分割(欲匹配文本 : 文本) : 文本[]
		code return #this.split(#欲匹配文本);
	结束 方法
结束 类


@禁止创建对象
@指代类("java.util.regex.Matcher")
类 正则匹配器
	//将匹配到的内容全部替换
	方法 全部替换(内容 为 文本) 为 文本
		@code
		return #this.replaceAll(#内容);
		@end
	结束 方法

	//匹配下一个文本
	方法 匹配下一个() 为 逻辑型
		@code
		return #this.find();
		@end
	结束 方法

	//获取匹配到的文本
	方法 取匹配文本() 为 文本
		@code
		return #this.group();
		@end
	结束 方法

	//获取匹配到的文本开始的位置
	方法 取匹配开始位置() 为 整数
		@code
		return #this.start();
		@end
	结束 方法

	//获取匹配到的文本结束的位置
	方法 取匹配结束位置() 为 整数
		@code
		return #this.end();
		@end
	结束 方法

	//获取匹配到的文本的数量
	方法 取子匹配数量() 为 整数
		@code
		return #this.groupCount();
		@end
	结束 方法

	//获取匹配到的某一个文本，参数为匹配到的文本的索引
	方法 取子匹配文本(索引 为 整数) 为 文本
		@code
		return #this.group(#索引);
		@end
	结束 方法
结束 类