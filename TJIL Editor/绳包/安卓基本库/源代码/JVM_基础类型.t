包名 结绳.基本

/*
对象类，所有类的基础类，所有类都拥有本类方法
*/
@指代类("Object")
@全局基础类
类 对象
	/*
	将对象转换为文本值
	*/
    方法 到文本() : 文本
        code return String.valueOf(#this);
    结束 方法
	
	/*
	获取对象的类信息
	*/
	方法 取类信息() : Java类
        code return #this.getClass();
    结束 方法
结束 类

@禁止创建对象
@指代类("CharSequence")
类 字符串
	属性读 长度() : 整数
		code return #this.length();
	结束 属性
	
	方法 取字符(索引 : 整数) : 字符
		code return #this.charAt(#索引);
	结束 方法
结束 类

/*
文本，值需要用""引起来
*/
@禁止继承
@指代类("String")
类 文本 : 字符串
	
	@嵌入式代码
	@运算符重载
    方法 +(欲相加对象 : 对象) : 文本
        @code
        #this + #欲相加对象
        @end
    结束 方法
	
	/*
	判断当前文本是否等于另一个文本
	*/
    @运算符重载
    方法 ==(另一个文本 : 文本) : 逻辑型
        @code
        if (#this == null) {
            return #另一个文本 == null;
        }
        return #this.equals(#另一个文本);
        @end
    结束 方法
	
	/*
	判断当前文本是否不等于另一个文本
	*/
    @运算符重载
    方法 !=(另一个文本 : 文本) : 逻辑型
        @code
        if (#this == null) {
            return #另一个文本 != null;
        }
        return !#this.equals(#另一个文本);
        @end
    结束 方法
	
	/*
	判断当前文本是否包含指定文本
	*/
	@运算符重载
    方法 ?(欲判断文本 : 文本) : 逻辑型
        @code
        return #this.contains(#欲判断文本);
        @end
    结束 方法
	
	/*
	将当前文本重复指定次数
	*/
	@运算符重载
    方法 *(数量 : 整数) : 文本
        @code
		String result = "";
        for (int i = 0;i < #数量;i++) {
            result += #this;
        }
        return result;
        @end
    结束 方法
	
	/*
	取当前文本指定索引处的字符
	*/
	@运算符重载
    方法 [](索引 : 整数) : 字符
        返回 取字符(索引)
    结束 方法
	
	/*
	判断当前文本是否为空字符串
	*/
	方法 为空() : 逻辑型
		code return #this == null || #this.isEmpty();
	结束 方法
	
	/*判断当前文本开头是否为指定前缀*/
	方法 开头为(前缀 : 文本, 起始索引 : 整数 = 0) : 逻辑型
		code return #this.startsWith(#前缀, #起始索引);
	结束 方法
	
	/*判断当前文本结尾是否为指定后缀*/
	方法 结尾为(后缀 : 文本) : 逻辑型
		code return #this.endsWith(#后缀);
	结束 方法
	
	/*
	替换当前文本中的指定内容
	参数一: 想要替换的文本
	参数二: 想要替换成的内容
	*/
	方法 替换(欲替换内容 为 文本, 欲替换到内容 为 文本) : 文本
		code return #this.replace(#欲替换内容,#欲替换到内容);
	结束 方法
	
	/*
	在当前文本中寻找指定内容
	参数一: 欲寻找的文本
	参数二: 开始寻找的索引位置，默认为0
	*/
	方法 寻找文本(寻找内容 为 文本, 开始位置 为 整数 = 0) 为 整数
		@code
		if (#开始位置 < 0 || #开始位置 > #this.length() || "".equals(#this) || "".equals(#寻找内容)) {
			return -1;
		}
		return #this.indexOf(#寻找内容, #开始位置);
		@end
	结束 方法
	
	//从末尾开始找一段文本，参数一是要寻找的文本，参数二是开始寻找的位置
	方法 倒找文本(寻找内容 为 文本,开始位置 为 整数 = 0) 为 整数
		@code
		if (#开始位置 < 0 || #开始位置 > #this.length() || "".equals(#this) || "".equals(#寻找内容)) {
			return -1;
		}
		return #this.lastIndexOf(#寻找内容, #开始位置);
		@end
	结束 方法
	
	/*
	截取指定两个文本之间的内容
	参数一为开始截取的文本
	参数二为结束截取的文本
	*/
	方法 截取文本(
			开始文本 为 文本, 
			结束文本 为 文本,
			包含截取符 : 逻辑型 = 假) 为 文本
		@code
		int left = #this.indexOf(#开始文本);
		if (left == -1) {
			return "";
		}
		int right = #this.indexOf(#结束文本, left + #开始文本.length());
		if (right == -1) {
			return "";
		}
		String temp;
		if (#包含截取符) {
			temp = #取文本中间(#this, left, right + #结束文本.length() - 1);
		} else {
			temp = #取文本中间(#this, left + #开始文本.length(), right - 1);
		}
		return temp;
		@end
	结束 方法
	
	//将英文字母全部转化为大写
	方法 到大写() 为 文本
		code return #this.toUpperCase();
	结束 方法
	
	//将英文字母全部转化为小写
	方法 到小写() 为 文本
		code return #this.toLowerCase();
	结束 方法

	//取文本左边一段内容，参数一为要截取的长度
	方法 取文本左边(长度 为 整数) 为 文本
		@code
		if ("".equals(#this) || #长度 <= 0) {
			return "";
		}
		return #长度 <= #this.length() ? #this.substring(0, #长度) : #this;
		@end
	结束 方法

	//取文本右边一段内容，参数一为开始截取的索引
	方法 取文本右边(起始索引 为 整数) 为 文本
		@code
		if ("".equals(#this) || #起始索引 < 0) {
			return "";
		}
		return #this.substring(#起始索引, #this.length());
		@end
	结束 方法
	
	/*
	取文本中间一段内容
	参数一为开始索引位置，
	参数二为结束索引位置
	*/
	方法 取文本中间(开始索引位置 为 整数, 结束索引位置 为 整数) 为 文本
		@code
		return #this.substring(#开始索引位置, #结束索引位置 + 1);
		@end
	结束 方法
	
	//删除文本首尾处空字符
	方法 删首尾空() 为 文本
		code return #this.trim();
	结束 方法
	
	//将文本翻转排序(倒置)
	方法 翻转文本() 为 文本
		code return new StringBuffer(#this).reverse().toString();
	结束 方法

	//分割一段文本，参数一为作为分割符号的文本
	方法 分割文本(分割符 为 文本) 为 文本[]
		@code
		return #this.split(#分割符);
		@end
	结束 方法

	/*
	将当前文本转换为指定进制的整数值
	参数如果不填写默认为10进制
	*/
    方法 到整数(进制 : 整数 = 10) : 整数
        code return Integer.parseInt(#this, #进制);
    结束 方法
	
	/*
	将当前文本转换为指定进制的长整数值
	参数如果不填写默认为10进制
	*/
    方法 到长整数(进制 : 整数 = 10) : 长整数
        code return Long.parseLong(#this, #进制);
    结束 方法
	
	//将当前文本转换为小数值
	方法 到小数() : 小数
		code return Double.parseDouble(#this);
	结束 方法
	
	//将当前文本转换为单精度小数值
    方法 到单精度小数() : 单精度小数
        code return Float.parseFloat(#this);
    结束 方法
	
	//将当前文本转换为逻辑值
    方法 到逻辑值() : 逻辑型
        code return Boolean.parseBoolean(#this);
    结束 方法
	
	方法 到字节集(编码 : 文本 = "UTF-8") : 字节[]
		@code
		try {
			return #this.getBytes(#编码);
		} catch (Exception e) {
			throw new RuntimeException("文本到字节集编码错误：" + #编码);
		}
		@end
    结束 方法
	
	方法 到字符集() : 字符[]
		code return #this.toCharArray();
	结束 方法
	
	方法 创建正则表达式() : 正则表达式
		code return java.util.regex.Pattern.compile(#this);
	结束 方法
	
	方法 正则替换(欲替换匹配表达式 为 文本, 欲替换到内容 为 文本, 只替换首个匹配 : 逻辑型 = 假) : 文本
		如果 只替换首个匹配 则
			code return #this.replaceFirst(#欲替换匹配表达式,#欲替换到内容);
		否则
			code return #this.replaceAll(#欲替换匹配表达式,#欲替换到内容);
		结束 如果
	结束 方法
	
	//判断当前文本是否匹配指定的正则表达式
	方法 是否匹配表达式(正则表达式 : 文本) : 逻辑型
		code return #this.matches(#正则表达式);
	结束 方法
	
	@静态
	方法 拼接文本数组(文本数组 : 文本[], 拼接符 : 文本) : 文本
		code return String.join(#拼接符,#文本数组);
	结束 方法
	
	@静态
	方法 拼接文本集合(文本集合1 : 文本集合, 拼接符 : 文本) : 文本
		code return String.join(#拼接符,#文本集合1);
	结束 方法
	
	@静态
	方法 从字节集创建(字节集 : 字节[], 编码 : 文本 = "UTF-8") : 文本
		@code
		try {
			return new String(#字节集, #编码);
		} catch (Exception e) {
			return new String(#字节集);
		}
		@end
	结束 方法
	
	@静态
	方法 从字符集创建(字符集 : 字符[]) : 文本
		code return new String(#字符集);
	结束 方法
	
	/*
	格式化文本，返回格式化之后的文本值
	参数一：格式，%d为整数，%s为文本等，示例：1 + %d = %s
	参数二：格式化参数所需对象集，如{1,"2"}
	使用示例：文本.格式化("1+%d=%s", {1,"2"})
	*/
	@静态
	方法 格式化(格式 : 文本, 参数 : 对象[]) : 文本
		code return String.format(#格式, #参数);
	结束 方法
结束 类

@禁止继承
类 基本类型模板类<模板类型1>
	/*
	将基本类型转换为对象类型
	*/
	方法 到文本() : 文本
		code return String.valueOf(#this);
	结束 方法
	
	/*
	将基本类型转换为对象类型
	*/
	方法 到对象() : 模板类型1
		code return (#<@模板类型1>) #this;
	结束 方法
结束 类

@指代类("boolean")
类 逻辑型 : 基本类型模板类<逻辑型类>
结束 类

@指代类("int")
类 整数 : 基本类型模板类<整数类>
	@嵌入式代码
	方法 到字节() : 字节
		code (byte)#this
	结束 方法
	
	方法 到十六进制() : 文本
		code return Integer.toHexString(#this);
	结束 方法
	
	方法 到二进制() : 文本
		code return Integer.toBinaryString(#this);
	结束 方法
结束 类

@指代类("long")
类 长整数 : 基本类型模板类<长整数类>
结束 类

@指代类("double")
类 小数 : 基本类型模板类<小数类>
	@嵌入式代码
	方法 到整数() : 整数
		code (int) #this
	结束 方法
结束 类

@指代类("float")
类 单精度小数 : 基本类型模板类<单精度小数类>
	@嵌入式代码
	方法 到整数() : 整数
		code (int) #this
	结束 方法
结束 类

@指代类("char")
类 字符 : 基本类型模板类<字符类>
	//判断字符为数字
	方法 为数字() 为 逻辑型
		code return Character.isDigit(#this);
	结束 方法

	//判断字符为字母
	方法 为字母() 为 逻辑型
		code return Character.isLetter(#this);
	结束 方法

	//判断字符为字母或数字
	方法 为字母或数字() 为 逻辑型
		code return Character.isLetterOrDigit(#this);
	结束 方法

	//判断字符为空格
	方法 为空格() 为 逻辑型
		code return Character.isWhitespace(#this);
	结束 方法

	//判断字符为大写字母
	方法 为大写字母() 为 逻辑型
		code return Character.isUpperCase(#this);
	结束 方法

	//判断字符为小写字母
	方法 为小写字母() 为 逻辑型
		code return Character.isLowerCase(#this);
	结束 方法

	//转化字符为大写字母
	方法 到大写字母() 为 字符
		code return Character.toUpperCase(#this);
	结束 方法

	//转化字符为小写字母
	方法 到小写字母() 为 字符
		code return Character.toLowerCase(#this);
	结束 方法
	
	@嵌入式代码
	方法 到整数() : 整数
		code (int) #this
	结束 方法
结束 类

@指代类("byte")
类 字节 : 基本类型模板类<字节类>
	@嵌入式代码
	方法 到整数() : 整数
		code (int) #this
	结束 方法
结束 类


/*
JVM平台基本类型包装类模板基础类
*/
类 基本类型包装类模板<模板类型1>
	/*
	将基本类型转换为对象类型
	*/
	方法 到文本() : 文本
		code return String.valueOf(#this);
	结束 方法
	
	/*
	将包装类型转换为基本类型
	*/
	方法 到基本类型() : 模板类型1
		code return (#<@模板类型1>) #this;
	结束 方法
结束 类

@禁止继承
@指代类("Boolean")
类 逻辑型类 : 基本类型包装类模板<逻辑型>
结束 类

/*
数字类，是所有数字类型的基础类
*/
@指代类("Number")
类 数字
	/*
	获取数字的整数值
	*/
	属性读 整数值() : 整数
		code return #this.intValue();
	结束 属性
	
	/*
	获取数字的长整数值
	*/
	属性读 长整数值() : 长整数
		code return #this.longValue();
	结束 属性
	
	/*
	获取数字的小数值
	*/
	属性读 小数值() : 小数
		code return #this.doubleValue();
	结束 属性
	
	/*
	获取数字的单精度小数值
	*/
	属性读 单精度小数值() : 单精度小数
		code return #this.floatValue();
	结束 属性
	
	/*
	获取数字的字节值
	*/
	属性读 字节值() : 字节
		code return #this.byteValue();
	结束 属性
结束 类

@禁止继承
@指代类("Integer")
类 整数类 : 数字
	/*
	将包装类型转换为基本类型
	*/
	方法 到基本类型() : 整数
		code return (#<@整数>) #this;
	结束 方法
结束 类

@禁止继承
@指代类("Long")
类 长整数类 : 数字
	/*
	将包装类型转换为基本类型
	*/
	方法 到基本类型() : 长整数
		code return (#<@长整数>) #this;
	结束 方法
结束 类

@禁止继承
@指代类("Double")
类 小数类 : 数字
	/*
	将包装类型转换为基本类型
	*/
	方法 到基本类型() : 小数
		code return (#<@小数>) #this;
	结束 方法
结束 类

@指代类("Float")
类 单精度小数类 : 数字
	/*
	将包装类型转换为基本类型
	*/
	方法 到基本类型() : 单精度小数
		code return (#<@单精度小数>) #this;
	结束 方法
结束 类

@指代类("Character")
类 字符类
	/*
	将包装类型转换为基本类型
	*/
	方法 到基本类型() : 字符
		code return (#<@字符>) #this;
	结束 方法
结束 类

@指代类("Byte")
类 字节类
	/*
	将包装类型转换为基本类型
	*/
	方法 到基本类型() : 字节
		code return (#<@字节>) #this;
	结束 方法
结束 类


@指代类("Throwable")
类 异常
	方法 取异常信息() : 文本
		code return #this.getMessage();
	结束 方法
	
	方法 取造成原因() : 异常
		code return #this.getCause();
	结束 方法
	
	方法 输出堆栈信息()
		code #this.printStackTrace();
	结束 方法
结束 类


/*
文本构建器，用于构建文本值
文本直接相加效率比较低，使用文本构建器能够在大量文本拼接的场景下提高效率
*/
@指代类("java.lang.StringBuilder")
类 文本构建器 : 字符串
	
	@运算符重载
	方法 =(初始字符串 : 字符串)
		code return new StringBuilder(#初始字符串);
	结束 方法
	
	@运算符重载
	方法 +(追加对象 : 对象) : 文本构建器
		返回 追加对象(追加对象)
	结束 方法
	
	@运算符重载
	方法 ==(另一个构建器 : 文本构建器) : 逻辑型
		@code
        if (#this == null) {
            return #另一个构建器 == null;
        }
        return #this.equals(#另一个构建器);
        @end
	结束 方法
	
	@运算符重载
    方法 ?(欲判断文本 : 文本) : 逻辑型
        @code
        return #this.indexOf(#欲判断文本) != -1;
        @end
    结束 方法
	
	@运算符重载
    方法 [](索引 : 整数) : 字符
        返回 取字符(索引)
    结束 方法
	
	@运算符重载
    方法 []=(索引 : 整数, 设置字符 : 字符)
		设置字符(索引,设置字符)
	结束 方法
	
	方法 追加字符串(追加内容 : 字符串) : 文本构建器
		code return #this.append(#追加内容);
	结束 方法
	
	方法 追加文本(追加内容 : 文本) : 文本构建器
		code return #this.append(#追加内容);
	结束 方法
	
	方法 追加逻辑值(追加内容 : 逻辑型) : 文本构建器
		code return #this.append(#追加内容);
	结束 方法
	
	方法 追加字符(追加内容 : 字符) : 文本构建器
		code return #this.append(#追加内容);
	结束 方法
	
	方法 追加字符集(追加内容 : 字符[], 起始偏移量 : 整数 = 0, 长度 : 整数 = -1) : 文本构建器
		如果 长度 == -1 则
			长度 = 取数组长度(追加内容)
		结束 如果
		code return #this.append(#追加内容, #起始偏移量, #长度);
	结束 方法
	
	方法 追加整数(追加内容 : 整数) : 文本构建器
		code return #this.append(#追加内容);
	结束 方法
	
	方法 追加长整数(追加内容 : 长整数) : 文本构建器
		code return #this.append(#追加内容);
	结束 方法
	
	方法 追加小数(追加内容 : 小数) : 文本构建器
		code return #this.append(#追加内容);
	结束 方法
	
	方法 追加单精度小数(追加内容 : 单精度小数) : 文本构建器
		code return #this.append(#追加内容);
	结束 方法
	
	方法 追加对象(追加内容 : 对象) : 文本构建器
		code return #this.append(#追加内容);
	结束 方法
	
	方法 删除(起始位置 : 整数, 结束位置 : 整数) : 文本构建器
		code return #this.delete(#起始位置,#结束位置);
	结束 方法
	
	方法 从索引删除(索引 : 整数) : 文本构建器
		code return #this.deleteCharAt(#索引);
	结束 方法
	
	方法 替换(被替换起始位置 : 整数, 被替换结束位置 : 整数, 替换内容 : 文本) : 文本构建器
		code return #this.replace(#被替换起始位置,#被替换结束位置,#替换内容);
	结束 方法
	
	方法 插入字符串(插入索引位置 : 整数, 插入内容 : 字符串) : 文本构建器
		code return #this.insert(#插入索引位置,#插入内容);
	结束 方法
	
	方法 插入文本(插入索引位置 : 整数, 插入内容 : 文本) : 文本构建器
		code return #this.insert(#插入索引位置,#插入内容);
	结束 方法
	
	方法 插入逻辑值(插入索引位置 : 整数, 插入内容 : 逻辑型) : 文本构建器
		code return #this.insert(#插入索引位置,#插入内容);
	结束 方法
	
	方法 插入字符(插入索引位置 : 整数, 插入内容 : 字符) : 文本构建器
		code return #this.insert(#插入索引位置,#插入内容);
	结束 方法
	
	方法 插入字符集(插入索引位置 : 整数, 追加内容 : 字符[], 起始偏移量 : 整数 = 0, 长度 : 整数 = -1) : 文本构建器
		如果 长度 == -1 则
			长度 = 取数组长度(追加内容)
		结束 如果
		code return #this.insert(#插入索引位置,#追加内容,#起始偏移量,#长度);
	结束 方法
	
	方法 插入整数(插入索引位置 : 整数, 插入内容 : 整数) : 文本构建器
		code return #this.insert(#插入索引位置,#插入内容);
	结束 方法
	
	方法 插入长整数(插入索引位置 : 整数, 插入内容 : 长整数) : 文本构建器
		code return #this.insert(#插入索引位置,#插入内容);
	结束 方法
	
	方法 插入小数(插入索引位置 : 整数, 插入内容 : 小数) : 文本构建器
		code return #this.insert(#插入索引位置,#插入内容);
	结束 方法
	
	方法 插入单精度小数(插入索引位置 : 整数, 插入内容 : 单精度小数) : 文本构建器
		code return #this.insert(#插入索引位置,#插入内容);
	结束 方法
	
	方法 插入对象(插入索引位置 : 整数, 插入内容 : 对象) : 文本构建器
		code return #this.insert(#插入索引位置,#插入内容);
	结束 方法
	
	方法 寻找文本(寻找内容 : 文本, 开始位置 : 整数 = 0) : 整数
		code return #this.indexOf(#寻找内容,#开始位置);
	结束 方法
	
	方法 倒找文本(寻找内容 : 文本, 开始位置 : 整数 = -1) : 整数
		如果 开始位置 == -1 则
			开始位置 = 长度() - 1
		结束 如果
		code return #this.lastIndexOf(#寻找内容,#开始位置);
	结束 方法
	
	方法 翻转内容() : 文本构建器
		code return #this.reverse();
	结束 方法
	
	方法 设置字符(索引 : 整数, 设置字符 : 字符)
		code #this.setCharAt(#索引,#设置字符);
	结束 方法
	
	方法 设置新长度(新长度 : 整数)
		code #this.setLength(#新长度);
	结束 方法
	
	方法 清空()
		设置新长度(0)
	结束 方法
	
结束 类


/*
异步调度类，用于支持异步编程
*/
@导入Java("android.os.*")
@导入Java("java.util.List")
@导入Java("java.util.concurrent.*")
类 异步调度类
	@code
	private static final ExecutorService service = Executors.newCachedThreadPool();
	private static final Handler handler = new Handler(Looper.getMainLooper());

    public static void launch(Runnable callback) {
        service.submit(callback);
    }

    public static <T> void launchAll(List<? extends Callable<T>> callbacks) {
        try {
            service.invokeAll(callbacks);
        } catch (InterruptedException e) {
            e.printStackTrace();
        }
    }
	
	public static void back(Runnable runnable) {
        handler.post(runnable);
    }

    public static void shutdown() {
        service.shutdown();
    }
	@end
结束 类