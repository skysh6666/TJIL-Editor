包名 结绳.安卓

@导入Java("android.content.*")
类 共享数据
	@code
	private static SharedPreferences sp;
	private static SharedPreferences.Editor editor;
	@end

	//初始化共享数据，在使用时必须先初始化，否则会报错，参数为储存名称，可随意
	@静态
	方法 初始化(窗口 为 安卓窗口, 名称 为 文本)
		@code
		sp = #窗口.getSharedPreferences(#名称, Context.MODE_PRIVATE);
		editor = sp.edit();
		@end
	结束 方法

	//取出之前设置的值，参数为值的名称，获取失败则返回默认值
	@静态
	方法 取文本(键 为 文本, 默认值 为 文本 = "") 为 文本
		code return sp.getString(#键, #默认值);
	结束 方法

	//将指定名称和值的数据写入私有目录
	@静态
	方法 置文本(键 为 文本, 值 为 文本) 为 逻辑型
		@code
		editor.putString(#键, #值);
		return editor.commit();
		@end
	结束 方法

	//将指定名称和值的数据写入私有目录
	@静态
	方法 置整数(键 为 文本, 值 为 整数) 为 逻辑型
		@code
		editor.putInt(#键, #值);
		return editor.commit();
		@end
	结束 方法

	//取出之前设置的值，参数为值的名称，获取失败则返回默认值
	@静态
	方法 取整数(键 为 文本, 默认值 为 整数 = 0) 为 整数
		code return sp.getInt(#键, #默认值);
	结束 方法

	//将指定名称和值的数据写入私有目录
	@静态
	方法 置逻辑值(键 为 文本, 值 为 逻辑型) 为 逻辑型
		@code
		editor.putBoolean(#键, #值);
		return editor.commit();
		@end
	结束 方法

	//取出之前设置的值，参数为值的名称，获取失败则返回假
	@静态
	方法 取逻辑值(键 为 文本, 默认值 : 逻辑型 = 假) 为 逻辑型
		code return sp.getBoolean(#键, #默认值);
	结束 方法
	
	//判断共享数据是否包含某个数据
	@静态 
	方法 包含数据(键 为 文本) 为 逻辑型
		code return sp.contains(#键);
	结束 方法
	
	@静态
	方法 清空() 为 逻辑型
		@code
		editor.clear();
		return editor.commit();
		@end
   结束 方法

结束 类


@全局类
类 位运算
	//将两数进行位与运算，相当于 整数1&整数2
	@静态
	方法 位与(整数1 为 整数, 整数2 为 整数) 为 整数
		code return #整数1 & #整数2;
	结束 方法

	//将两数进行位或运算，相当于 整数1|整数2
	@静态
	方法 位或(整数1 为 整数, 整数2 为 整数) 为 整数
		code return #整数1 | #整数2;
	结束 方法

	//将两数进行位异或运算，相当于 整数1^整数2
	@静态
	方法 位异或(整数1 为 整数, 整数2 为 整数) 为 整数
		code return #整数1 ^ #整数2;
	结束 方法

	//进行为非运算，相当于 数 ^ -1
	@静态
	方法 位非(数字 为 整数) 为 整数
		code return #数字 ^ -1;
	结束 方法

	//将整数1进行左移运算，相当于 整数1 << 整数2
	@静态
	方法 位左移(整数1 为 整数, 整数2 为 整数) 为 整数
		code return #整数1 << #整数2;
	结束 方法

	//将整数1进行右移运算，相当于 整数1 >> 整数2
	@静态
	方法 位右移(整数1 为 整数, 整数2 为 整数) 为 整数
		code return #整数1 >> #整数2;
	结束 方法

	//将整数1进行无符号右移运算，相当于 整数1 >>> 整数2
	@静态
	方法 无符号位右移(整数1 为 整数, 整数2 为 整数) 为 整数
		code return #整数1 >>> #整数2;
	结束 方法

结束 类


@全局类
类 拼音操作

	@code
	public static String[] pystr = new String[]{"a", "ai", "an", "ang", "ao", "ba", "bai", "ban", "bang", "bao", "bei", "ben", "beng", "bi", "bian", "biao", "bie", "bin", "bing", "bo", "bu", "ca", "cai", "can", "cang", "cao", "ce", "ceng", "cha", "chai", "chan", "chang", "chao", "che", "chen", "cheng", "chi", "chong", "chou", "chu", "chuai", "chuan", "chuang", "chui", "chun", "chuo", "ci", "cong", "cou", "cu", "cuan", "cui", "cun", "cuo", "da", "dai", "dan", "dang", "dao", "de", "deng", "di", "dian", "diao", "die", "ding", "diu", "dong", "dou", "du", "duan", "dui", "dun", "duo", "e", "en", "er", "fa", "fan", "fang", "fei", "fen", "feng", "fo", "fou", "fu", "ga", "gai", "gan", "gang", "gao", "ge", "gei", "gen", "geng", "gong", "gou", "gu", "gua", "guai", "guan", "guang", "gui", "gun", "guo", "ha", "hai", "han", "hang", "hao", "he", "hei", "hen", "heng", "hong", "hou", "hu", "hua", "huai", "huan", "huang", "hui", "hun", "huo", "ji", "jia", "jian", "jiang", "jiao", "jie", "jin", "jing", "jiong", "jiu", "ju", "juan", "jue", "jun", "ka", "kai", "kan", "kang", "kao", "ke", "ken", "keng", "kong", "kou", "ku", "kua", "kuai", "kuan", "kuang", "kui", "kun", "kuo", "la", "lai", "lan", "lang", "lao", "le", "lei", "leng", "li", "lia", "lian", "liang", "liao", "lie", "lin", "ling", "liu", "long", "lou", "lu", "lv", "luan", "lue", "lun", "luo", "ma", "mai", "man", "mang", "mao", "me", "mei", "men", "meng", "mi", "mian", "miao", "mie", "min", "ming", "miu", "mo", "mou", "mu", "na", "nai", "nan", "nang", "nao", "ne", "nei", "nen", "neng", "ni", "nian", "niang", "niao", "nie", "nin", "ning", "niu", "nong", "nu", "nv", "nuan", "nue", "nuo", "o", "ou", "pa", "pai", "pan", "pang", "pao", "pei", "pen", "peng", "pi", "pian", "piao", "pie", "pin", "ping", "po", "pu", "qi", "qia", "qian", "qiang", "qiao", "qie", "qin", "qing", "qiong", "qiu", "qu", "quan", "que", "qun", "ran", "rang", "rao", "re", "ren", "reng", "ri", "rong", "rou", "ru", "ruan", "rui", "run", "ruo", "sa", "sai", "san", "sang", "sao", "se", "sen", "seng", "sha", "shai", "shan", "shang", "shao", "she", "shen", "sheng", "shi", "shou", "shu", "shua", "shuai", "shuan", "shuang", "shui", "shun", "shuo", "si", "song", "sou", "su", "suan", "sui", "sun", "suo", "ta", "tai", "tan", "tang", "tao", "te", "teng", "ti", "tian", "tiao", "tie", "ting", "tong", "tou", "tu", "tuan", "tui", "tun", "tuo", "wa", "wai", "wan", "wang", "wei", "wen", "weng", "wo", "wu", "xi", "xia", "xian", "xiang", "xiao", "xie", "xin", "xing", "xiong", "xiu", "xu", "xuan", "xue", "xun", "ya", "yan", "yang", "yao", "ye", "yi", "yin", "ying", "yo", "yong", "you", "yu", "yuan", "yue", "yun", "za", "zai", "zan", "zang", "zao", "ze", "zei", "zen", "zeng", "zha", "zhai", "zhan", "zhang", "zhao", "zhe", "zhen", "zheng", "zhi", "zhong", "zhou", "zhu", "zhua", "zhuai", "zhuan", "zhuang", "zhui", "zhun", "zhuo", "zi", "zong", "zou", "zu", "zuan", "zui", "zun", "zuo"};
	private static int[] pyvalue = new int[]{ - 20319, - 20317, - 20304, - 20295, - 20292, - 20283, - 20265, - 20257, - 20242, - 20230, - 20051, - 20036, - 20032, - 20026, - 20002, - 19990, - 19986, - 19982, - 19976, - 19805, - 19784, - 19775, - 19774, - 19763, - 19756, - 19751, - 19746, - 19741, - 19739, - 19728, - 19725, - 19715, - 19540, - 19531, - 19525, - 19515, - 19500, - 19484, - 19479, - 19467, - 19289, - 19288, - 19281, - 19275, - 19270, - 19263, - 19261, - 19249, - 19243, - 19242, - 19238, - 19235, - 19227, - 19224, - 19218, - 19212, - 19038, - 19023, - 19018, - 19006, - 19003, - 18996, - 18977, - 18961, - 18952, - 18783, - 18774, - 18773, - 18763, - 18756, - 18741, - 18735, - 18731, - 18722, - 18710, - 18697, - 18696, - 18526, - 18518, - 18501, - 18490, - 18478, - 18463, - 18448, - 18447, - 18446, - 18239, - 18237, - 18231, - 18220, - 18211, - 18201, - 18184, - 18183, - 18181, - 18012, - 17997, - 17988, - 17970, - 17964, - 17961, - 17950, - 17947, - 17931, - 17928, - 17922, - 17759, - 17752, - 17733, - 17730, - 17721, - 17703, - 17701, - 17697, - 17692, - 17683, - 17676, - 17496, - 17487, - 17482, - 17468, - 17454, - 17433, - 17427, - 17417, - 17202, - 17185, - 16983, - 16970, - 16942, - 16915, - 16733, - 16708, - 16706, - 16689, - 16664, - 16657, - 16647, - 16474, - 16470, - 16465, - 16459, - 16452, - 16448, - 16433, - 16429, - 16427, - 16423, - 16419, - 16412, - 16407, - 16403, - 16401, - 16393, - 16220, - 16216, - 16212, - 16205, - 16202, - 16187, - 16180, - 16171, - 16169, - 16158, - 16155, - 15959, - 15958, - 15944, - 15933, - 15920, - 15915, - 15903, - 15889, - 15878, - 15707, - 15701, - 15681, - 15667, - 15661, - 15659, - 15652, - 15640, - 15631, - 15625, - 15454, - 15448, - 15436, - 15435, - 15419, - 15416, - 15408, - 15394, - 15385, - 15377, - 15375, - 15369, - 15363, - 15362, - 15183, - 15180, - 15165, - 15158, - 15153, - 15150, - 15149, - 15144, - 15143, - 15141, - 15140, - 15139, - 15128, - 15121, - 15119, - 15117, - 15110, - 15109, - 14941, - 14937, - 14933, - 14930, - 14929, - 14928, - 14926, - 14922, - 14921, - 14914, - 14908, - 14902, - 14894, - 14889, - 14882, - 14873, - 14871, - 14857, - 14678, - 14674, - 14670, - 14668, - 14663, - 14654, - 14645, - 14630, - 14594, - 14429, - 14407, - 14399, - 14384, - 14379, - 14368, - 14355, - 14353, - 14345, - 14170, - 14159, - 14151, - 14149, - 14145, - 14140, - 14137, - 14135, - 14125, - 14123, - 14122, - 14112, - 14109, - 14099, - 14097, - 14094, - 14092, - 14090, - 14087, - 14083, - 13917, - 13914, - 13910, - 13907, - 13906, - 13905, - 13896, - 13894, - 13878, - 13870, - 13859, - 13847, - 13831, - 13658, - 13611, - 13601, - 13406, - 13404, - 13400, - 13398, - 13395, - 13391, - 13387, - 13383, - 13367, - 13359, - 13356, - 13343, - 13340, - 13329, - 13326, - 13318, - 13147, - 13138, - 13120, - 13107, - 13096, - 13095, - 13091, - 13076, - 13068, - 13063, - 13060, - 12888, - 12875, - 12871, - 12860, - 12858, - 12852, - 12849, - 12838, - 12831, - 12829, - 12812, - 12802, - 12607, - 12597, - 12594, - 12585, - 12556, - 12359, - 12346, - 12320, - 12300, - 12120, - 12099, - 12089, - 12074, - 12067, - 12058, - 12039, - 11867, - 11861, - 11847, - 11831, - 11798, - 11781, - 11604, - 11589, - 11536, - 11358, - 11340, - 11339, - 11324, - 11303, - 11097, - 11077, - 11067, - 11055, - 11052, - 11045, - 11041, - 11038, - 11024, - 11020, - 11019, - 11018, - 11014, - 10838, - 10832, - 10815, - 10800, - 10790, - 10780, - 10764, - 10587, - 10544, - 10533, - 10519, - 10331, - 10329, - 10328, - 10322, - 10315, - 10309, - 10307, - 10296, - 10281, - 10274, - 10270, - 10262, - 10260, - 10256, - 10254};
	private static int getChsAscii(String chs) {
		int asc = 0;
		try {
			byte[] bytes = chs.getBytes("gb2312");
			if (bytes.length > 2 || bytes.length == 0) {
				throw new RuntimeException("illegal resource string");
			}
			if (bytes.length == 1) {
				asc = bytes[0];
			}
			if (bytes.length != 2) {
				return asc;
			}
			return (((bytes[0] + 256) * 256) + (bytes[1] + 256)) - 65536;
		} catch (Exception e) {
			e.printStackTrace();
			return 0;
		}
	}
	@end

	//获得一个汉字的首拼字母，参数为要获取的文字
	@静态
	方法 取汉字首拼(内容 为 文本) 为 文本
		@code
		String py = #取汉字拼音(#内容);
		if(py.length() > 1) {
			py = py.substring(0,1);
		}
		return py;
		@end
	结束 方法

	//获取一段文本的首拼字母，参数为要获取的文本
	@静态
	方法 取词组首拼(内容 为 文本) 为 文本
		@code
		String key = "";
		String value = "";
		StringBuilder buffer = new StringBuilder();
		for (int i = 0; i < #内容.length(); i++) {
			key = #内容.substring(i, i + 1);
			if (key.getBytes().length >= 2) {
				value = #取汉字首拼(key);
			} else {
				value = key;
			}
			buffer.append(value);
		}
		return buffer.toString();
		@end
	结束 方法

	//获得一个汉字的拼音，参数为要获取的文字
	@静态
	方法 取汉字拼音(内容 为 文本) 为 文本
		@code
		String result = "";
		int ascii = getChsAscii(#内容);
		if (ascii > 0 && ascii < 160) {
			return String.valueOf((char) ascii);
		}
		for (int i = pyvalue.length - 1; i >= 0; i--) {
			if (pyvalue[i] <= ascii) {
				return pystr[i];
			}
		}
		return result;
		@end
	结束 方法

	//获取一段文本的拼音，参数为要获取的文本
	@静态
	方法 取词组拼音(内容 为 文本) 为 文本
		@code
		String key = "";
		String value = "";
		StringBuilder buffer = new StringBuilder();
		for (int i = 0; i < #内容.length(); i++) {
			key = #内容.substring(i, i + 1);
			if (key.getBytes().length >= 2) {
				value = #取汉字拼音(key);
			} else {
				value = key;
			}
			buffer.append(value);
		}
		return buffer.toString();
		@end
	结束 方法

结束 类

/*
加解密操作类
*/
@全局类
@导入Java("java.util.*")
@导入Java("java.security.*")
@导入Java("java.math.*")
类 加解密操作
	@静态
	常量 Base64编码集 : 文本 = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/"
	/*
	获取文本的MD5摘要值
	参数一: 欲加密的文本
	参数二: 编码，不填写默认为UTF-8
	*/
	@静态
	方法 MD5加密(值 为 文本, 编码 : 文本 = "UTF-8") 为 文本
		@code
		char hexDigits[] = { '0', '1', '2', '3', '4','5', '6', '7', 
			'8', '9', 'a', 'b', 'c', 'd', 'e', 'f' };
		try {
			byte[] btInput = #值.getBytes(#编码);
			MessageDigest mdInst = MessageDigest.getInstance("MD5");
			mdInst.update(btInput);
			byte[] md = mdInst.digest();
			int j = md.length;
			char str[] = new char[j * 2];
			int k = 0;
			for (int i = 0; i < j; i++) {
				byte byte0 = md[i];
				str[k++] = hexDigits[byte0 >>> 4 & 0xf];
				str[k++] = hexDigits[byte0 & 0xf];
			}
			return new String(str);
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
		@end
	结束 方法
	
	/*
	对文本进行SHA加密，并返回加密后的文本
	参数一为欲加密的文本
	参数二为编码，不填写默认为UTF-8
	*/
	@静态
	方法 SHA加密(值 为 文本, 编码 : 文本 = "UTF-8") 为 文本
		@code
		try {
			MessageDigest sha = MessageDigest.getInstance("SHA");
			sha.update(#值.getBytes(#编码));
			return new String(sha.digest(), #编码);
		} catch (Exception e) {
			return null;
		}
		@end
	结束 方法
	
	/*
	对指定文本内容进行Base64编码，并返回编码后的文本
	参数一：要编码的文本
	参数二: 编码，不填写默认为UTF-8
	参数二: 自定义编码集，不填写默认为大小写字母+数字
	*/
	@静态
	方法 Base64编码(欲编码内容 : 文本,
			编码 : 文本  = "UTF-8",
			编码集 : 文本 = 加解密操作.Base64编码集) : 文本
		变量 字节集 = 欲编码内容.到字节集(编码)
		返回 Base64编码_字节集(字节集, 编码集)
	结束 方法

	/*
	对指定Base64编码后的文本进行解码，并返回解码后文本
	参数一：要解码的文本
	参数二: 解码后文本的编码，不填写默认为UTF-8
	参数三: 自定义编码集，不填写默认为大小写字母+数字
	*/
	@静态
	方法 Base64解码(欲解码内容 : 文本,
			编码 : 文本 = "UTF-8",
			编码集 : 文本 = 加解密操作.Base64编码集) 为 文本
		变量 字节集 = Base64解码_字节集(欲解码内容, 编码集)
		返回 文本.从字节集创建(字节集, 编码)
	结束 方法
	
	/*
	对指定字节集进行Base64编码
	参数一：要编码的字节集
	参数二: 自定义编码集，不填写默认为大小写字母+数字
	*/
	@静态
	方法 Base64编码_字节集(欲编码字节集 : 字节[],
			 编码集 : 文本 = 加解密操作.Base64编码集) : 文本
		@code
		String add = "=";
		StringBuilder base64Str = new StringBuilder();
		String bytesBinary = #Base64_到二进制(#欲编码字节集, 2);
		int addCount = 0;
		while (bytesBinary.length() % 24 != 0) {
			bytesBinary += "0";
			addCount++;
		}
		for (int i = 0; i <= bytesBinary.length() - 6; i += 6) {
			int index = Integer.parseInt(bytesBinary.substring(i, i + 6), 2);
			if (index == 0 && i >= bytesBinary.length() - addCount) {
				base64Str.append(add);
			} else {
				base64Str.append(#编码集.charAt(index));
			}
		}
		return base64Str.toString();
		@end
	结束 方法

	/*
	对指定Base64编码后的文本进行解码，并返回解码后字节集
	参数一：要解码的文本
	参数二: 自定义编码集，不填写默认为大小写字母+数字
	*/
	@静态
	方法 Base64解码_字节集(欲解码内容 : 文本,
			编码集 : 文本 = 加解密操作.Base64编码集) 为 字节[]
		@code
		String base64Binarys = "";
		for (int i = 0; i < #欲解码内容.length(); i++) {
			char s = #欲解码内容.charAt(i);
			if (s != '=') {
				String binary = Integer.toBinaryString(#编码集.indexOf(s));
				while (binary.length() != 6) {
					binary = "0" + binary;
				}
				base64Binarys += binary;
			}
		}
		base64Binarys = base64Binarys.substring(0, base64Binarys.length() - base64Binarys.length() % 8);
		byte[] bytesStr = new byte[base64Binarys.length() / 8];
		for (int bytesIndex = 0; bytesIndex < base64Binarys.length() / 8; bytesIndex++) {
			bytesStr[bytesIndex] = (byte) Integer.parseInt(base64Binarys.substring(bytesIndex * 8, bytesIndex * 8 + 8), 2);
		}
		return bytesStr;
		@end
	结束 方法
	
	@隐藏
	@静态
	方法 Base64_到二进制(字节集 : 字节[], 进制 : 整数 = 2) : 文本
		@code
		String strBytes = new BigInteger(1, #字节集).toString(#进制);
		while (strBytes.length() % 8 != 0) {
			strBytes = "0" + strBytes;
		}
		return strBytes;
		@end
	结束 方法
	
	/*RC4加密
	参数一：要加密的文本
	参数二：密码
	参数三: 编码，不填写默认为UTF-8
	*/
	@静态
	方法 RC4加密(值 为 文本,密码 为 文本,编码 : 文本 = "UTF-8") 为 文本
		@code
		if ((#值 == null) || (#密码 == null))
			return null;
		try {
			byte[] a = #RC4Base(#值.getBytes(#编码), #密码, #编码);
			char[] hexDigits = { '0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'A', 'B', 'C', 'D', 'E', 'F' };
			int j = a.length;
			char[] str = new char[j * 2];
			int k = 0;
			for (int i = 0; i < j; i++) {
				byte byte0 = a[i];
				str[(k++)] = hexDigits[(byte0 >>> 4 & 0xF)];
				str[(k++)] = hexDigits[(byte0 & 0xF)];
			  }
			return new String(str);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
		@end
	结束 方法

	/*RC4解密
	参数一：要解密的文本
	参数二：密码
	参数三: 编码，不填写默认为UTF-8
	*/
	@静态
	方法 RC4解密(值 为 文本,密码 为 文本,编码 : 文本 = "UTF-8") 为 文本
		@code
		if ((#值 == null) || (#密码 == null))
			return null;
		try {
			return new String(#RC4Base(#HexString2Bytes(#值, #编码), #密码, #编码), #编码);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
		@end
	结束 方法
	
	@隐藏
	@静态
	方法 HexString2Bytes(内容 : 文本, 编码 : 文本) : 字节[]
		@code
		try {
			int size = #内容.length();
			byte[] ret = new byte[size / 2];
			byte[] tmp = #内容.getBytes(#编码);
			for (int i = 0; i < size / 2; i++) {
				ret[i] = #uniteBytes(tmp[(i * 2)], tmp[(i * 2 + 1)]);
			  }
			return ret;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
		@end
	结束 方法
	
	@隐藏
	@静态
	方法 uniteBytes(字节1 : 字节, 字节2 : 字节) : 字节
		@code
		char _b0 = (char)Byte.decode("0x" + new String(new byte[] { #字节1 })).byteValue();
		_b0 = (char)(_b0 << '\004');
		char _b1 = (char)Byte.decode("0x" + new String(new byte[] { #字节2 })).byteValue();
		byte ret = (byte)(_b0 ^ _b1);
		return ret;
		@end
	结束 方法
	
	@隐藏
	@静态
	方法 RC4Base(字节集 : 字节[], 密码 : 文本, 编码 : 文本) : 字节[]
		@code
		int x = 0;
		int y = 0;
		byte[] key = #initKey(#密码, #编码);

		byte[] result = new byte[#字节集.length];
		for (int i = 0; i < #字节集.length; i++) {
			x = x + 1 & 0xFF;
			y = (key[x] & 0xFF) + y & 0xFF;
			byte tmp = key[x];
			key[x] = key[y];
			key[y] = tmp;
			int xorIndex = (key[x] & 0xFF) + (key[y] & 0xFF) & 0xFF;
			result[i] = ((byte)(#字节集[i] ^ key[xorIndex]));
		}
		return result;
		@end
	结束 方法
	
	@隐藏
	@静态
	方法 initKey(密码 : 文本, 编码 : 文本) : 字节[]
		@code
		try {
			byte[] b_key = #密码.getBytes(#编码);
			byte[] state = new byte[256];

			for (int i = 0; i < 256; i++) {
				state[i] = ((byte)i);
			  }
			int index1 = 0;
			int index2 = 0;
			if ((b_key == null) || (b_key.length == 0)) {
				return null;
			  }
			for (int i = 0; i < 256; i++) {
				index2 = (b_key[index1] & 0xFF) + (state[i] & 0xFF) + index2 & 0xFF;
				byte tmp = state[i];
				state[i] = state[index2];
				state[index2] = tmp;
				index1 = (index1 + 1) % b_key.length;
			  }
			return state;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
		@end
	结束 方法

结束 类