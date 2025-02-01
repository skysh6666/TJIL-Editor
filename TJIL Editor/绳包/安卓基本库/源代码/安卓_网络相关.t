包名 结绳.安卓

/*
网络操作类，提供基本网络操作功能
*/
@附加权限(安卓权限.网络权限)
@导入Java("java.io.*")
@导入Java("java.net.*")
@导入Java("java.util.*")
@导入Java("java.math.*")
@导入Java("java.security.*")
@导入Java("java.security.cert.*")
@导入Java("javax.net.ssl.*")
类 网络工具
	@隐藏
	变量 请求头 : 文本到文本哈希表
	@隐藏
	变量 是否支持重定向 : 逻辑型

	/*
	添加请求头，在进行请求时会附加上
	*/
	方法 添加请求头(名称 : 文本, 值 : 文本)
		请求头[名称] = 值
	结束 方法

	/*
	移除指定名称所对应的请求头
	*/
	方法 移除请求头(名称 : 文本)
		请求头.删除项目(名称)
	结束 方法

	/*
	清除所有请求头
	*/
	方法 清除请求头()
		请求头.清空()
	结束 方法

	/*
	设置是否支持重定向请求
	*/
	属性写 支持重定向(是否支持 : 逻辑型)
		本对象.是否支持重定向 = 是否支持
	结束 属性

	/*
	异步获取网页源码
	参数一为网址
	参数二为请求时要附加的cookie，不填写默认为空
	参数三为访问超时时间，不填写默认6000ms
	参数四为编码，不填写默认UTF-8
	*/
	@异步方法
	方法 取网页源码(
		网址 : 文本,
		cookie : 文本 = 空,
		超时 : 整数 = 6000,
		编码 : 文本 = "UTF-8")
		变量 结果 = 等待 取网页源码_同步_内部(网址, cookie, 超时, 编码)
		@code
		if (#结果 == null) {
			#取网页源码失败();
		} else {
			byte[] content = (byte[]) #结果[0];
			String cookie = (String) #结果[1];
			#取网页源码结束(#<文本.从字节集创建>(content, #编码), content, cookie);
		}
		@end
	结束 方法

	/*
	同步获取网页源码
	参数一为网址
	参数二为请求时要附加的cookie，不填写默认为空
	参数三为访问超时时间，不填写默认6000ms
	参数四为编码，不填写默认UTF-8
	*/
	方法 取网页源码_同步(
		网址 : 文本,
		cookie : 文本 = 空,
		超时 : 整数 = 6000,
		编码 : 文本 = "UTF-8") : 文本
		变量 结果 = 取网页源码_字节集_同步(网址, cookie, 超时, 编码)
		如果 结果 == 空 则
			返回 ("")
		否则
			返回 文本.从字节集创建(结果, 编码)
		结束 如果
	结束 方法

	/*
	同步获取网页源码字节集
	参数一为网址
	参数二为请求时要附加的cookie，不填写默认为空
	参数三为访问超时时间，不填写默认6000ms
	参数四为编码，不填写默认UTF-8
	*/
	方法 取网页源码_字节集_同步(
		网址 : 文本,
		cookie : 文本 = 空,
		超时 : 整数 = 6000,
		编码 : 文本 = "UTF-8") : 字节[]
		@code
		Object[] results = #取网页源码_同步_内部(#网址, #cookie, #超时, #编码);
		if (results == null) {
			return new byte[0];
		}
		return (byte[]) results[0];
		@end
	结束 方法

	@隐藏
	方法 取网页源码_同步_内部(
		网址 : 文本,
		cookie : 文本 = 空,
		超时 : 整数 = 6000,
		编码 : 文本 = "UTF-8") : 对象[]
		返回 发送请求_内部(网址, "GET", , ,cookie, 超时, 编码)
	结束 方法

	/*
	异步发送数据
	参数一为网址
	参数二为欲发送的数据，可以为文本，也可以为字节集或者文件
	参数三为请求时要附加的cookie，不填写默认为空
	参数四为访问超时时间，不填写默认6000ms
	参数五为编码，不填写默认UTF-8
	*/
	@异步方法
	方法 发送数据(
		网址 : 文本,
		欲发送数据 : 对象,
		cookie : 文本 = 空,
		超时 : 整数 = 6000,
		编码 : 文本 = "UTF-8")
		变量 结果 = 等待 发送数据_同步_内部(网址, 欲发送数据, cookie, 超时, 编码)
		@code
		if (#结果 == null) {
			#发送数据失败();
		} else {
			byte[] content = (byte[]) #结果[0];
			String cookie = (String) #结果[1];
			#发送数据结束(#<文本.从字节集创建>(content, #编码), content, cookie);
		}
		@end
	结束 方法

	/*
	同步发送数据
	参数一为网址
	参数二为欲发送的数据，可以为文本，也可以为字节集或者文件
	参数三为请求时要附加的cookie，不填写默认为空
	参数四为访问超时时间，不填写默认6000ms
	参数五为编码，不填写默认UTF-8
	*/
	方法 发送数据_同步(
		网址 : 文本,
		欲发送数据 : 对象,
		cookie : 文本 = 空,
		超时 : 整数 = 6000,
		编码 : 文本 = "UTF-8") : 文本
		变量 结果 = 发送数据_字节集_同步(网址, 欲发送数据, cookie, 超时, 编码)
		如果 结果 == 空 则
			返回 ("")
		否则
			返回 文本.从字节集创建(结果, 编码)
		结束 如果
	结束 方法

	/*
	同步发送数据，并要求返回字节集
	参数一为网址
	参数二为欲发送的数据，可以为文本，也可以为字节集或者文件
	参数三为请求时要附加的cookie，不填写默认为空
	参数四为访问超时时间，不填写默认6000ms
	参数五为编码，不填写默认UTF-8
	*/
	方法 发送数据_字节集_同步(
		网址 : 文本,
		欲发送数据 : 对象,
		cookie : 文本 = 空,
		超时 : 整数 = 6000,
		编码 : 文本 = "UTF-8") : 字节[]
		@code
		Object[] results = #发送数据_同步_内部(#网址, #欲发送数据, #cookie, #超时, #编码);
		if (results == null) {
			return new byte[0];
		}
		return (byte[]) results[0];
		@end
	结束 方法

	@隐藏
	方法 发送数据_同步_内部(
		网址 : 文本,
		欲发送数据 : 对象,
		cookie : 文本 = 空,
		超时 : 整数 = 6000,
		编码 : 文本 = "UTF-8") : 对象[]
		返回 发送请求_内部(网址, "POST", , 欲发送数据, cookie, 超时, 编码)
	结束 方法

	/*
	下载文件
	参数一为网址
	参数二为文件下载保存路径
	参数三为请求时要附加的cookie，不填写默认为空
	参数四为访问超时时间，不填写默认6000ms
	参数五为编码，不填写默认UTF-8
	最后返回是否下载成功
	*/
	@附加权限(安卓权限.文件权限_写入)
	@异步方法
	方法 下载(
		网址 : 文本,
		保存路径 : 文本,
		cookie : 文本 = 空,
		超时 : 整数 = 6000,
		编码 : 文本 = "UTF-8")
		变量 结果 = 等待 发送请求_内部(网址, "GET", 保存路径, , cookie, 超时, 编码)
		如果 结果 == 空 则
			下载失败()
		否则
			变量 结果cookie : 文本 = (结果[0] : 文本)
			下载结束(结果cookie)
		结束 如果
	结束 方法

	/*
	同步下载文件
	参数一为网址
	参数二为文件下载保存路径
	参数三为请求时要附加的cookie，不填写默认为空
	参数四为访问超时时间，不填写默认6000ms
	参数五为编码，不填写默认UTF-8
	最后返回是否下载成功
	*/
	@附加权限(安卓权限.文件权限_写入)
	方法 下载_同步(
		网址 : 文本,
		保存路径 : 文本,
		cookie : 文本 = 空,
		超时 : 整数 = 6000,
		编码 : 文本 = "UTF-8") : 逻辑型
		变量 结果 =  发送请求_内部(网址, "GET", 保存路径, , cookie, 超时, 编码)
		如果 结果 == 空 则
			返回 (假)
		结束 如果
		返回 (真)
	结束 方法
	
	/*
	上传文件
	参数一为网址
	参数二为文件路径
	参数三为服务端所要求的键名，不填写默认为file
	参数四为请求时要附加的cookie，不填写默认为空
	参数五为访问超时时间，不填写默认6000ms
	参数六为编码，不填写默认UTF-8
	最后返回响应结果
	*/
	@异步方法
	方法 上传(
		网址 : 文本,
		文件路径 : 文本,
		键名 : 文本 = "file",
		cookie : 文本 = 空,
		超时 : 整数 = 6000,
		编码 : 文本 = "UTF-8")
		变量 结果 = 等待 上传_内部(网址, 文件路径, 键名, cookie, 超时, 编码)
		如果 结果 == 空 则
			上传失败()
		否则
			@code
			byte[] content = (byte[]) #结果[0];
			String cookie = (String) #结果[1];
			#上传结束(#<文本.从字节集创建>(content, #编码), content, cookie);
			@end
		结束 如果
	结束 方法

	/*
	参数一为网址
	参数二为文件路径
	参数三为服务端所要求的键名，不填写默认为file
	参数四为请求时要附加的cookie，不填写默认为空
	参数五为访问超时时间，不填写默认6000ms
	参数六为编码，不填写默认UTF-8
	最后返回是否上传成功
	*/
	方法 上传_同步(
		网址 : 文本,
		文件路径 : 文本,
		键名 : 文本 = "file",
		cookie : 文本 = 空,
		超时 : 整数 = 6000,
		编码 : 文本 = "UTF-8") :文本
		@code
		Object[] results = #上传_内部(#网址, #文件路径, #键名, #cookie, #超时, #编码);
		if (results == null) {
			return "";
		}
		byte[] bytes = (byte[]) results[0];
		try {
			return new String(bytes, #编码);
		} catch (Exception e) {
			return new String(bytes);
		}
		@end
	结束 方法

	@隐藏
	方法 发送请求_内部(
		网址 : 文本,
		请求类型 : 文本 = "GET",
		下行路径 : 文本 = 空,
		欲发送数据 : 对象 = 空,
		cookie : 文本 = 空,
		超时 : 整数 = 6000,
		编码 : 文本 = "UTF-8") : 对象[]
		@code
		try {
			URL url = new URL(#网址);
            HttpURLConnection conn;
			//https设置ssl
            if (#网址.startsWith("https://")) {
                conn = (HttpsURLConnection) url.openConnection();
                setSsl();
            } else {
				conn = (HttpURLConnection) url.openConnection();
			}
            conn.setConnectTimeout(#超时);
            conn.setFollowRedirects(true);
            conn.setDoInput(true);
			//设置编码
            conn.setRequestProperty("Accept-Charset", #编码);
			//设置cookie
            if (#cookie != null) {
                conn.setRequestProperty("Cookie", #cookie);
			}
			//设置请求类型(GET/POST/DELETE/PUT)
            conn.setRequestMethod(#请求类型);
			//设置请求头
            if (#请求头 != null) {
                Set<Map.Entry<String, String>> entries = #请求头.entrySet();
                for (Map.Entry<String, String> entry : entries) {
                    conn.setRequestProperty(String.valueOf(entry.getKey()), String.valueOf(entry.getValue()));
                }
            }
			//POST发送的数据
			byte[] data = null;
			if (#欲发送数据 != null) {
				data = formatData(#欲发送数据, #编码);
				if(data != null) {
					conn.setDoOutput(true);
            		conn.setRequestProperty("Content-length", "" + data.length);
					OutputStream os = conn.getOutputStream();
            		os.write(data);
				}
			}
			conn.connect();
			//如果下行路径不为空且请求类型为GET，则是下载
            if ("GET".equals(#请求类型) && #下行路径 != null) {
                long length = conn.getContentLengthLong();
                File f = new File(#下行路径);
                if (!f.getParentFile().exists()) {
                    f.getParentFile().mkdirs();
				}
                FileOutputStream os = new FileOutputStream(f);
                InputStream is = conn.getInputStream();
                copyFile(is, os, length);
                Map<String, List<String>> hs = conn.getHeaderFields();
                List<String> cs = hs.get("Set-Cookie");
                StringBuffer cok = new StringBuffer();
                if (cs != null) {
                    for (String s : cs) {
                        cok.append(s + ";");
                    }
				}
                String returnCookie = cok.toString();
                return new Object[] { returnCookie };
            }
			int responseCode = conn.getResponseCode();
			//判断重定向
			if (#是否支持重定向 && (responseCode == HttpURLConnection.HTTP_MOVED_TEMP
					|| responseCode == HttpURLConnection.HTTP_MOVED_PERM
					|| responseCode == HttpURLConnection.HTTP_SEE_OTHER)) {
				String newUrl = conn.getHeaderField("Location");
				conn.disconnect();
				if (newUrl.startsWith("https://")) {
                	conn = (HttpsURLConnection) url.openConnection();
                	setSsl();
            	} else {
					conn = (HttpURLConnection) url.openConnection();
				}
				conn.setConnectTimeout(#超时);
            	conn.setFollowRedirects(true);
            	conn.setDoInput(true);
            	conn.setRequestProperty("Accept-Charset", #编码);
            	if (#cookie != null)
                	conn.setRequestProperty("Cookie", #cookie);
            	conn.setRequestMethod(#请求类型);
            	if (#请求头 != null) {
                	Set<Map.Entry<String, String>> entries = #请求头.entrySet();
                	for (Map.Entry<String, String> entry : entries) {
                    	conn.setRequestProperty(String.valueOf(entry.getKey()), String.valueOf(entry.getValue()));
                	}
            	}
				if(data != null) {
					conn.setDoOutput(true);
            		conn.setRequestProperty("Content-length", "" + data.length);
					OutputStream os = conn.getOutputStream();
            		os.write(data);
				}
				conn.connect();
				responseCode = conn.getResponseCode();
			}
			//获取返回结果
			if (responseCode >= 200 && responseCode < 400) {
				Map<String, List<String>> hs = conn.getHeaderFields();
				List<String> cs = hs.get("Set-Cookie");
                StringBuffer cok = new StringBuffer();
                if (cs != null) {
                    for (String s : cs) {
                        cok.append(s + ";");
                    }
                }
                ByteArrayOutputStream boas = new ByteArrayOutputStream();
                byte[] tmp = new byte[1024];
                int len;
                InputStream is = conn.getInputStream();
                while ((len = is.read(tmp)) != -1) {
                     boas.write(tmp, 0, len);
                }
                byte[] result = boas.toByteArray();
                boas.close();
                is.close();
                String cookie = cok.toString();
				return new Object[] {result, cookie};
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
		@end
	结束 方法
	
	@附加权限(安卓权限.文件权限_读取)
	@隐藏
	方法 上传_内部(
		网址 : 文本,
		文件路径 : 文本,
		键名 : 文本 = "file",
		cookie : 文本 = 空,
		超时 : 整数 = 6000,
		编码 : 文本 = "UTF-8") : 对象[]
		@code
		String BOUNDARY = UUID.randomUUID().toString(); //边界标识 随机生成 String PREFIX = "--" , LINE_END = "\r\n";
        String PREFIX = "--", LINE_END = "\r\n";
        String CONTENT_TYPE = "multipart/form-data"; //内容类型
		try {
			URL url = new URL(#网址);
            HttpURLConnection conn;
			//https设置ssl
            if (#网址.startsWith("https://")) {
                conn = (HttpsURLConnection) url.openConnection();
                setSsl();
            } else {
				conn = (HttpURLConnection) url.openConnection();
			}
            conn.setConnectTimeout(#超时);
            conn.setFollowRedirects(true);
			conn.setDoInput(true); //允许输入流
            conn.setDoOutput(true); //允许输出流
            conn.setUseCaches(false); //不允许使用缓存
            conn.setRequestMethod("POST"); //请求方式
			//设置编码
            conn.setRequestProperty("Accept-Charset", #编码);
			//设置cookie
            if (#cookie != null) {
                conn.setRequestProperty("Cookie", #cookie);
			}
			conn.setRequestProperty("connection", "keep-alive");
			conn.setRequestProperty("Content-Type", CONTENT_TYPE + ";boundary=" + BOUNDARY);
			//设置请求头
            if (#请求头 != null) {
                Set<Map.Entry<String, String>> entries = #请求头.entrySet();
                for (Map.Entry<String, String> entry : entries) {
                    conn.setRequestProperty(String.valueOf(entry.getKey()), String.valueOf(entry.getValue()));
                }
            }
			OutputStream outputSteam = conn.getOutputStream();
            DataOutputStream dos = new DataOutputStream(outputSteam);
            StringBuffer sb = new StringBuffer();
            sb.append(PREFIX);
            sb.append(BOUNDARY);
            sb.append(LINE_END);
            sb.append("Content-Disposition: form-data; name=\"" + #键名 + "\"; filename=\"" + #<文件操作.取文件名>(#文件路径) + "\""
                    + LINE_END);
            sb.append("Content-Type: application/octet-stream; charset=" + #编码 + LINE_END);
            sb.append(LINE_END);
            dos.write(sb.toString().getBytes());
            InputStream is = new FileInputStream(#文件路径);
            byte[] bytes = new byte[1024];
            int len;
			long max = new File(#文件路径).length();
			long progress = 0;
            while ((len = is.read(bytes)) != -1) {
                dos.write(bytes, 0, len);
                progress += len;
                double d = (new BigDecimal(progress / (double) max).setScale(2,
                    BigDecimal.ROUND_HALF_UP)).doubleValue();
                double d1 = d * 100;
                #正在上传(d1);
            }
            is.close();
            dos.write(LINE_END.getBytes());
            byte[] end_data = (PREFIX + BOUNDARY + PREFIX + LINE_END).getBytes();
            dos.write(end_data);
            dos.flush();
			int res = conn.getResponseCode();
			if (res >= 200 && res < 400) {
				Map<String, List<String>> hs = conn.getHeaderFields();
				List<String> cs = hs.get("Set-Cookie");
                StringBuffer cok = new StringBuffer();
                if (cs != null) {
                    for (String s : cs) {
                        cok.append(s + ";");
                    }
                }
                ByteArrayOutputStream bos = new ByteArrayOutputStream();
                InputStream resultStream = conn.getInputStream();
                len = -1;
                byte[] buffer = new byte[1024 * 8];
                while ((len = resultStream.read(buffer)) != -1) {
                    bos.write(buffer, 0, len);
                }
                resultStream.close();
                bos.flush();
                bos.close();
                byte[] result = bos.toByteArray();
                return new Object[]{result, cok.toString()};
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
		@end
	结束 方法

	/*
	当取网页源码(Get)结束时触发该事件
	并返回取源结果和cookie
	*/
	定义事件 取网页源码结束(结果 为 文本, 内容 : 字节[], cookie 为 文本)

	/*
	当发送数据(Post)结束时触发该事件
	并返回取源结果和cookie
	*/
	定义事件 发送数据结束(结果 为 文本, 内容 : 字节[], cookie 为 文本)

	/*
	当正在下载文件进度改变时触发该事件
	*/
	定义事件 正在下载(进度 : 小数)

	/*
	当下载文件结束时触发该事件
	并返回cookie
	*/
	定义事件 下载结束(cookie : 文本)
	
	/*
	当正在上传文件进度改变时触发该事件
	*/
	定义事件 正在上传(进度 : 小数)

	/*
	当上传文件结束时触发该事件
	并返回cookie
	*/
	定义事件 上传结束(结果 : 文本, 内容 : 字节[], cookie : 文本)

	/*
	当取网页源码(Get)失败时触发该事件
	*/
	定义事件 取网页源码失败()

	/*
	当发送数据(Post)失败时触发该事件
	*/
	定义事件 发送数据失败()

	/*
	当下载(Download)失败时触发该事件
	*/
	定义事件 下载失败()
	
	/*
	当上传(Upload)失败时触发该事件
	*/
	定义事件 上传失败()

	@code
	private boolean copyFile(InputStream in, OutputStream out, long length) {
        try {
			int readLength = 0;
            int byteread = 0;
            byte[] buffer = new byte[1024 * 1024];
            while ((byteread = in.read(buffer)) != -1) {
                readLength += byteread;
                double value = ((readLength / (length * 1.0)) * 100);
                #正在下载(value);
                out.write(buffer, 0, byteread);
            }
            //in.close
            //out.close
        } catch (Exception e) {
            return false;
        }
        return true;
    }
	
	private static byte[] formatData(Object obj, String charset) throws UnsupportedEncodingException, IOException {
        byte[] bs = null;
        if (obj instanceof String)
            bs = ((String) obj).getBytes(charset);
        else if (obj.getClass().getComponentType() == byte.class)
            bs = (byte[]) obj;
        else if (obj instanceof File)
            bs = readAll(new FileInputStream((File) obj));
		else
			bs = String.valueOf(obj).getBytes(charset);
        return bs;
    }
	
	private static byte[] readAll(InputStream input) throws IOException {
        ByteArrayOutputStream output = new ByteArrayOutputStream(4096);
        byte[] buffer = new byte[2 ^ 32];
        int n = 0;
        while (-1 != (n = input.read(buffer))) {
            output.write(buffer, 0, n);
        }
        byte[] ret = output.toByteArray();
        output.close();
        return ret;
	}
	
	private static void setSsl() {
        try {
            HttpsURLConnection.setDefaultHostnameVerifier(new HostnameVerifier() {
                public boolean verify(String hostname, SSLSession session) {
                    return true;
                }
            });
            SSLContext context = SSLContext.getInstance("TLS");
            context.init(null, new X509TrustManager[] { new X509TrustManager() {
                public void checkClientTrusted(X509Certificate[] chain, String authType) throws CertificateException {
                }

                public void checkServerTrusted(X509Certificate[] chain, String authType) throws CertificateException {
                }

                public X509Certificate[] getAcceptedIssuers() {
                    return new X509Certificate[0];
                }
            } }, new SecureRandom());
            HttpsURLConnection.setDefaultSSLSocketFactory(context.getSocketFactory());
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
	@end
结束 类

@指代类("android.net.Uri")
@禁止创建对象
类 安卓资源标识符
	@静态
	@运算符重载
	方法 =(Uri编码内容:文本):安卓资源标识符
		返回 解析(Uri编码内容)
	结束 方法
	
	@静态
	方法 解析(Uri编码内容:文本):安卓资源标识符
		code return android.net.Uri.parse(#Uri编码内容);
	结束 方法
	
	@静态
	方法 从文件创建(文件对象:文件):安卓资源标识符
		code return android.net.Uri.fromFile(#文件对象);
	结束 方法
	
	属性读 协议名称() : 文本
		code return #this.getScheme();
	结束 属性
	
	属性读 协议内容() : 文本
		code return #this.getSchemeSpecificPart();
	结束 属性
	
	
	属性读 主机名() : 文本
		code return #this.getAuthority();
	结束 属性
	
	
	属性读 主机地址() : 文本
		code return #this.getHost();
	结束 属性
	
	
	属性读 主机端口() : 整数
		code return #this.getPort();
	结束 属性
	
	
	属性读 用户信息() : 文本
		code return #this.getUserInfo();
	结束 属性
	
	属性读 编码用户信息() : 文本
		code return #this.getEncodedUserInfo();
	结束 属性
	
	属性读 资源路径() : 文本
		code return #this.getPath();
	结束 属性
	
	属性读 片段内容() : 文本
		code return #this.getFragment();
	结束 属性
	
	属性读 查询参数() : 文本
		code return #this.getQuery();
	结束 属性
	
	属性读 是否为绝对Uri() : 逻辑型
		code return #this.isAbsolute();
	结束 属性
	
	属性读 是否为不透明Uri() : 逻辑型
		code return #this.isOpaque();
	结束 属性
	
		属性读 是否为相对Uri() : 逻辑型
		code return #this.isRelative();
	结束 属性
	
	属性读 是否为绝对分层Uri() : 逻辑型
		code return #this.isHierarchical();
	结束 属性
	
	方法 取查询参数值(参数名称:文本) : 文本
		code return #this.getQueryParameter(#参数名称);
	结束 方法
	
	方法 取所有参数名():文本[]
		code return (String[])#this.getQueryParameterNames().toArray();
	结束 方法
	
	方法 取路径片段():文本集合
		code return (java.util.ArrayList)#this.getPathSegments();
	结束 方法
	
	方法 规范化方案():安卓资源标识符
		code return #this.normalizeScheme();
	结束 方法
	
	@静态
	方法 文本到Uri编码(编码内容 : 文本):文本
		code return android.net.Uri.encode(#编码内容);
	结束 方法
	
	@静态
	方法 文本到Uri解码(编码内容 : 文本):文本
		code return android.net.Uri.decode(#编码内容);
	结束 方法
	
	方法 比较(比较对象:安卓资源标识符):整数
		code return #this.compareTo(#比较对象);
	结束 方法
	
	方法 到文本():文本
		code return #this.toString();
	结束 方法
	
	
结束 类