包名 结绳.安卓

/*
JSON对象类，用于存储JSON数据
JSON是一种数据存储格式，使用键值对的格式储存数据，如：
{
	"key","value",
	"key2",123
}
用{}包起来的就是JSON对象，其中有两组数据，键名分别为key和key2
*/
@导入Java("org.json.*")
@指代类("org.json.JSONObject")
类 JSON对象
	/*
	通过传入JSON文本直接初始化JSON对象
	*/
	@运算符重载
	方法 =(JSON文本 : 文本)
		@code
		try {
			return new JSONObject(#JSON文本);
		} catch (Exception e) {
			throw new RuntimeException(JSON_INIT_ERROR);
		}
		@end
	结束 方法
	
	/*
	获取JSON对象中指定键所对应的对象值，如：
	{
		"data" : "abc"
		"data2" : 123
	}
	其中的data键所对应的数据就是一个文本值，其是一个对象值，因为对象是所有类型的基础类
	data2键所对应的数据就是一个整数值，其也是一个对象值
	*/
	@运算符重载
	方法 [](键名 : 文本) : 对象
		返回 取对象(键名)
	结束 方法
	
	/*
	向JSON对象中置入新的值，可以为JSON对象，JSON数组，文本值，整数值等，如：
	{
		"data" : 3.14
	}
	这个JSON对象中只有一个数据，调用 置入("name","A")后，其将会变为：
	{
		"data" : 3.14,
		"name" : "A"
	}
	*/
	@运算符重载
	方法 []=(键名 : 文本, 值 : 对象)
		@code
		try {
			#this.put(#键名, #值);
		} catch (JSONException e) {
			e.printStackTrace();
		}
		@end
	结束 方法
	
	/*
	判断JSON对象中是否存在指定键名
	*/
	@运算符重载
	方法 ?(键名 : 文本) : 逻辑型
		@code
		return #this.has(#键名);
		@end
	结束 方法
	
	/*
	获取JSON对象中指定键所对应的子JSON对象，如：
	{
		"data" : {
			"name": "abc"
		}
	}
	其中的data键所对应的数据就是一个JSON对象
	*/
	方法 取JSON对象(键名 : 文本) : JSON对象
		@code
		try {
			return #this.getJSONObject(#键名);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
		@end
	结束 方法
	
	/*
	获取JSON对象中指定键所对应的JSON数组，如：
	{
		"data" : [1,2,3]
	}
	其中的data键所对应的数据就是一个JSON数组
	*/
	方法 取JSON数组(键名 : 文本) : JSON数组
		@code
		try {
			return #this.getJSONArray(#键名);
		} catch (JSONException e) {
			return null;
		}
		@end
	结束 方法
	
	/*
	获取JSON对象中指定键所对应的对象值，如：
	{
		"data" : "abc"
		"data2" : 123
	}
	其中的data键所对应的数据就是一个文本值，其是一个对象值，因为对象是所有类型的基础类
	data2键所对应的数据就是一个整数值，其也是一个对象值
	*/
	方法 取对象(键名 : 文本) : 对象
		@code
		try {
			return #this.get(#键名);
		} catch (JSONException e) {
			e.printStackTrace();
		}
		return null;
		@end
	结束 方法
	
	/*
	获取JSON对象中指定键所对应的文本值，如：
	{
		"data" : "abc"
	}
	其中的data键所对应的数据就是一个文本值
	*/
	方法 取文本(键名 : 文本) : 文本
		@code
		try {
			return #this.getString(#键名);
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
		@end
	结束 方法
	
	/*
	获取JSON对象中指定键所对应的整数值，如：
	{
		"data" : 123
	}
	其中的data键所对应的数据就是一个整数值
	*/
	方法 取整数(键名 : 文本, 默认值 : 整数 = 0) : 整数
		@code
		try {
			return #this.getInt(#键名);
		} catch (Exception e) {
			e.printStackTrace();
			return #默认值;
		}
		@end
	结束 方法
	
	/*
	获取JSON对象中指定键所对应的长整数值，如：
	{
		"data" : 12369855665555L
	}
	其中的data键所对应的数据就是一个长整数值
	*/
	方法 取长整数(键名 : 文本, 默认值 : 整数 = 0) : 长整数
		@code
		try {
			return #this.getLong(#键名);
		} catch (Exception e) {
			e.printStackTrace();
			return #默认值;
		}
		@end
	结束 方法
	
	/*
	获取JSON对象中指定键所对应的小数值，如：
	{
		"data" : 3.14
	}
	其中的data键所对应的数据就是一个小数值
	*/
	方法 取小数(键名 : 文本, 默认值 : 小数 = 0.0) : 小数
		@code
		try {
			return #this.getDouble(#键名);
		} catch (Exception e) {
			e.printStackTrace();
			return #默认值;
		}
		@end
	结束 方法
	
	/*
	获取JSON对象中指定键所对应的逻辑值，如：
	{
		"data" : true
	}
	其中的data键所对应的数据就是一个逻辑值
	*/
	方法 取逻辑值(键名 : 文本, 默认值 : 逻辑型 = 假) : 逻辑型
		@code
		try {
			return #this.getBoolean(#键名);
		} catch (Exception e) {
			e.printStackTrace();
			return #默认值;
		}
		@end
	结束 方法
	
	/*
	向JSON对象中置入新的值，可以为JSON对象，JSON数组，文本值，整数值等，如：
	{
		"data" : 3.14
	}
	这个JSON对象中只有一个数据，调用 置入("name","A")后，其将会变为：
	{
		"data" : 3.14,
		"name" : "A"
	}
	*/
	方法 置入(键名 : 文本, 值 : 对象)
		@code
		try {
			#this.put(#键名, #值);
		} catch (JSONException e) {
			e.printStackTrace();
		}
		@end
	结束 方法
	
	/*
	移除JSON对象中指定键名对应的值
	{
		"data" : 3.14,
		"name" : "A"
	}
	这个JSON对象中有2个数据，调用 移除("name")后，其将会变为：
	{
		"data" : 3.14,
	}
	*/
	方法 移除(键名 : 文本)
		@code
		#this.remove(#键名);
		@end
	结束 方法
	
	/*
	判断JSON对象中是否存在指定键名
	*/
	方法 是否存在(键名 : 文本) : 逻辑型
		@code
		return #this.has(#键名);
		@end
	结束 方法
	
	/*
	将JSON对象转为文本
	*/
	方法 到文本(缩进空格数 : 整数 = 0) : 文本
		@code
		if (#缩进空格数 == 0) {
			return #this.toString();
		}
		try {
			return #this.toString(#缩进空格数);
		} catch (JSONException e) {
			e.printStackTrace();
			return null;
		}
		@end
	结束 方法
	
	/*
	将JSON对象写出到文件
	*/
	@附加权限(安卓权限.文件权限_写入)
	方法 写出到文件(文件路径 : 文本)
		变量 结果 = 到文本(3)
		写出文本文件(文件路径, 结果)
	结束 方法
	
	/*
	获取JSON对象中所有键名
	*/
	属性读 键名() 为 文本[]
      @code
        java.util.List<String> list = new java.util.ArrayList<>();
        java.util.Iterator<String> it = #this.keys();
		while (it.hasNext()) {
			list.add(it.next());
		}
        return list.toArray(new String[0]);
      @end
   结束 属性
	
	@code
	private final static String JSON_INIT_ERROR = "JSON数据文本错误";
	@end
结束 类

/*
JSON数组类，用于存储JSON数组内容
JSON数组是JSON对象值的一种数据格式，可以存储多个内容，如：
{
	"key",[1,2,3]
}
用[]包起来的就是JSON数组，其中有3个数据，也就是说key这个键所对应的数据是一个JSON数组，其中有3个数字
*/
@导入Java("org.json.*")
@指代类("org.json.JSONArray")
类 JSON数组
	/*
	通过传入JSON文本直接初始化JSON数组
	*/
	@运算符重载
	方法 =(JSON文本 : 文本)
		@code
		try {
			return new JSONArray(#JSON文本);
		} catch (Exception e) {
			throw new RuntimeException(JSON_INIT_ERROR);
		}
		@end
	结束 方法
	
	/*
	获取JSON数组中指定索引所对应的对象值，如：
	[1,"a"]
	其中索引为0处所对应的数据就是一个整数值，其是一个对象值，因为对象是所有类型的基础类
	索引为1处所对应的数据就是一文本数值，其也是一个对象值
	*/
	@运算符重载
	方法 [](索引 : 整数) : 对象
		返回 取对象(索引)
	结束 方法
	
	/*
	向JSON数组中置入新的值，可以为JSON对象，JSON数组，文本值，整数值等，如：
	[1,2]
	这个JSON数组中只有一个数据，调用 置入("name")后，其将会变为：
	[1,2,"name"]
	*/
	@运算符重载
	方法 []=(索引 : 整数, 值 : 对象)
		@code
		try {
			#this.put(#索引, #值);
		} catch (JSONException e) {
			e.printStackTrace();
		}
		@end
	结束 方法
	
	/*
	获取JSON数组中指定索引处所对应的子JSON对象，如：
	[
		"data" : {
			"name": "abc"
		},
		123
	]
	其中索引为0处所对应的数据就是一个JSON对象
	*/
	方法 取JSON对象(索引 : 整数) : JSON对象
		@code
		return #this.optJSONObject(#索引);
		@end
	结束 方法
	
	/*
	获取JSON数组中指定索引处所对应的JSON数组，如：
	[1,2,[1,2]]
	其中的索引为2处所对应的数据就是一个JSON数组
	*/
	方法 取JSON数组(索引 : 整数) : JSON数组
		@code
		return #this.optJSONArray(#索引);
		@end
	结束 方法
	
	/*
	获取JSON数组中指定索引处所对应的对象值，如：
	["abc",123]
	其中的索引为0处所对应的数据就是一个文本值，其是一个对象值，因为对象是所有类型的基础类
	索引为1所对应的数据就是一个整数值，其也是一个对象值
	*/
	方法 取对象(索引 : 整数) : 对象
		@code
		try {
			return #this.get(#索引);
		} catch (JSONException e) {
			e.printStackTrace();
		}
		return null;
		@end
	结束 方法
	
	/*
	获取JSON数组中指定索引处所对应的文本值，如：
	["abc",123]
	索引为0所对应的数据就是一个文本值
	*/
	方法 取文本(索引 : 整数) : 文本
		@code
		return #this.optString(#索引);
		@end
	结束 方法
	
	/*
	获取JSON数组中指定索引处所对应的整数值，如：
	["abc",123]
	索引为1所对应的数据就是一个整数值
	*/
	方法 取整数(索引 : 整数) : 整数
		@code
		return #this.optInt(#索引);
		@end
	结束 方法
	
	/*
	获取JSON数组中指定索引处所对应的小数值，如：
	["abc",3.14]
	索引为1所对应的数据就是一个小数值
	*/
	方法 取小数(索引 : 整数) : 小数
		@code
		return #this.optDouble(#索引);
		@end
	结束 方法
	
	/*
	获取JSON数组中指定索引处所对应的逻辑型值，如：
	["abc",true]
	索引为1所对应的数据就是一个逻辑型值
	*/
	方法 取逻辑值(索引 : 整数) : 逻辑型
		@code
		return #this.optBoolean(#索引);
		@end
	结束 方法
	
	/*
	向JSON数组中置入新的值
	*/
	方法 置入(值 : 对象)
		@code
		#this.put(#值);
		@end
	结束 方法
	
	/*
	移除JSON数组中指定索引处成员
	*/
	方法 移除(索引 : 整数)
		@code
		#this.remove(#索引);
		@end
	结束 方法
	
	/*
	获取JSON数组长度(成员数量)
	*/
	属性读 长度() : 整数
		@code
		return #this.length();
		@end
	结束 属性
	
	/*
	将JSON数组转为文本
	*/
	方法 到文本(缩进空格数 : 整数 = 0) : 文本
		@code
		if (#缩进空格数 == 0) {
			return #this.toString();
		}
		try {
			return #this.toString(#缩进空格数);
		} catch (JSONException e) {
			e.printStackTrace();
			return null;
		}
		@end
	结束 方法
	
	/*
	将JSON数组写出到文件
	*/
	@附加权限(安卓权限.文件权限_写入)
	方法 写出到文件(文件路径 : 文本)
		变量 结果 = 到文本(3)
		写出文本文件(文件路径, 结果)
	结束 方法
	
	@code
	private final static String JSON_INIT_ERROR = "JSON数据文本错误";
	@end
结束 类

/*
XML合成器，提供合成XML功能
*/
@导入Java("java.io.*")
@导入Java("org.xmlpull.v1.*")
类 XML合成器

	//开始定义一个XML文档，返回开始文档的结果，如果成功返回真，反之则假
	//需要传入参数，为该XML文档的编码类型,默认UTF-8
	方法 开始XML文档(文档编码 为 文本 = "UTF-8") 为 逻辑型
		@code
		if (serializer == null) {
			return false;
		}
		try {
			writer = new StringWriter();
			serializer.setOutput(writer);
			serializer.startDocument(#文档编码, true);
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
		return true;
		@end
	结束 方法

	//该方法与开始XML文档成对使用，返回结束XML的结果
	方法 结束XML文档() 为 逻辑型
		@code
		if (serializer == null) {
			return false;
		}
		try {
			serializer.endDocument();
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
		return true;
		@end
	结束 方法

	//开始定义一个XML节点，返回开始节点的结果，如果成功返回真，反之则假
	方法 开始节点(节点名称 为 文本) 为 逻辑型
		@code
		if (serializer == null) {
			return false;
		}
		try {
			serializer.startTag(null, #节点名称);
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
		return true;
		@end
	结束 方法

	//向当前节点添加属性，返回添加结果，如果成功返回真，反之则假
	方法 添加节点属性(属性名 为 文本, 属性内容 为 文本) 为 逻辑型
		@code
		if (serializer == null) {
			return false;
		}
		try {
			serializer.attribute(null, #属性名, #属性内容);
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
		return true;
		@end
	结束 方法

	//向当前节点设置内容，返回设置结果，如果成功返回真，反之则假
	方法 置节点内容(内容 为 文本) 为 逻辑型
		@code
		if (serializer == null) {
			return false;
		}
		try {
			serializer.text(#内容);
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
		return true;
		@end
	结束 方法

	//向当前节点位置添加注释，返回添加结果，如果成功返回真，反之则假
	方法 添加注释(内容 为 文本) 为 逻辑型
		@code
		if (serializer == null) {
			return false;
		}
		try {
			serializer.comment(#内容);
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
		return true;
		@end
	结束 方法

	//本方法与开始节点成对使用，如果成功返回真，反之则假
	方法 结束节点(节点名称 为 文本) 为 逻辑型
		@code
		if (serializer == null) {
			return false;
		}
		try {
			serializer.endTag(null, #节点名称);
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
		return true;
		@end
	结束 方法

	//将XML文档数据导出为文本型数据，如果失败，则返回空字符串
	方法 导出文本() 为 文本
		@code
		if (writer != null) {
			String xml = writer.toString();
			return xml;
		}
		return "";
		@end
	结束 方法

	@code
	private XmlSerializer serializer;
	private StringWriter writer;
	
	public #<XML合成器>() {
		try {
			serializer = XmlPullParserFactory.newInstance().newSerializer();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	@end

结束 类


/*
XML解析器，提供解析XML功能
*/
@导入Java("java.io.*")
@导入Java("org.xmlpull.v1.*")
类 XML解析器
	
	@code
	private XmlPullParser parser;
	@end

	//调用本方法初始化XML，返回是否载入XML成功
	方法 载入XML(XML文本 为 文本) 为 逻辑型
		@code
		try {
			parser = XmlPullParserFactory.newInstance().newPullParser();
			StringReader reader = new StringReader(#XML文本);
			parser.setInput(reader);
			if(parser.getEventType() == 1) {
				reader.close();
				return false;
			}
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
		return true;
		@end
	结束 方法

	//获取当前解析到的位置，-1为解析出现异常，0为文档开始位置，1为文档结束位置，2为节点开始位置，3为节点结束位置
	属性读 当前解析位置() 为 整数
		@code
		try {
			return parser.getEventType();
		} catch (Exception e) {
			e.printStackTrace();
			return -1;
		}
		@end
	结束 属性

	//获取当前已载入XML文档当前节点位置对应的节点名称，如果当前解析位置不在节点开始位置或节点结束位置，将返回空字符串
	属性读 当前节点名() 为 文本
		@code
		String name = parser.getName();
		return name != null ? name : "";
		@end
	结束 属性

	//获取当前已载入XML文档当前节点位置对应的节点内容，如果当前解析位置不在节点开始位置或节点结束位置，将返回空字符串
	属性读 当前节点内容() 为 文本
		@code
		String name = parser.getText();
		return name != null ? name : "";
		@end
	结束 属性

	//获取当前节点位置的属性数量，如果失败，则返回-1
	属性读 属性数量() 为 整数
		@code
		return parser.getAttributeCount();
		@end
	结束 属性

	//获取当前节点位置指定索引位置处的属性名称，索引不得大于属性数量，如果失败，则返回空字符串
	方法 取属性名(索引 为 整数) 为 文本
		@code
		String name = parser.getAttributeName(#索引);
		return name != null ? name : "";
		@end
	结束 方法

	//获取当前节点位置指定索引位置处的属性内容，索引不得大于属性数量，如果失败，则返回空对象
	方法 取属性内容(索引 为 整数) 为 文本
		@code
		String value = parser.getAttributeValue(#索引);
		return value != null ? value : "";
		@end
	结束 方法

	//解析一次XML，返回解析状态，-1为解析出现异常，0为文档开始位置，1为文档结束位置，2为节点开始位置，3为节点结束位置
	方法 解析() 为 整数
		@code
		try {
			return parser.next();
		} catch (Exception e) {
			e.printStackTrace();
			return -1;
		}
		@end
	结束 方法

结束 类