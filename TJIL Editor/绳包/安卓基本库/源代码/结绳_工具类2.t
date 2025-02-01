包名 结绳.安卓

@全局类
@禁止创建对象
@附加权限(安卓权限.文件权限_写入)
@附加权限(安卓权限.文件权限_读取)
@导入Java("java.io.*")
@导入Java("java.util.*")
@导入Java("java.util.zip.*")
类 压缩操作
	//压缩文件到输出路径，参数一为要压缩的文件(或目录)路径
	@静态
	方法 ZIP压缩(路径 为 文本, 输出路径 为 文本) 为 逻辑型
		@code
		boolean flag = false;
		ZipOutputStream out = null;
		try {
			File outFile = new File(#输出路径);
			File fileOrDirectory = new File(#路径);
			out = new ZipOutputStream(new FileOutputStream(outFile));
			if (fileOrDirectory.isFile()) {
				zipFileOrDirectory(out, fileOrDirectory, "");
			} else {
				File[] entries = fileOrDirectory.listFiles();
				for (int i = 0; i < entries.length; i++) {
					zipFileOrDirectory(out, entries[i], "");
				}
			}
			flag = true;
		} catch (IOException ex) {
			ex.printStackTrace();
			flag = false;
		}
		finally {
			if (out != null) {
				try {
					out.close();
				} catch (IOException ex) {
					ex.printStackTrace();
					flag = false;
				}
			}
		}
		return flag;
		@end
	结束 方法

	//解压指定路径的压缩包到输出路径(必须为目录)
	@静态
	方法 ZIP解压(路径 为 文本, 输出路径 为 文本) 为 逻辑型
		@code
		boolean flag = false;
		ZipFile zipFile = null;
		try {
			zipFile = new ZipFile(#路径);
			Enumeration e = zipFile.entries();
			ZipEntry zipEntry = null;
			File dest = new File(#输出路径);
			dest.mkdirs();
			while (e.hasMoreElements()) {
				zipEntry = (ZipEntry)e.nextElement();
				String entryName = zipEntry.getName();
				InputStream in = null;
				FileOutputStream out = null;
				try {
					if (zipEntry.isDirectory()) {
						String name = zipEntry.getName();
						name = name.substring(0, name.length() - 1);
						File f = new File(#输出路径 + File.separator + name);
						f.mkdirs();
						flag = true;
					} else {
						int index = entryName.lastIndexOf("\\");
						if (index != - 1) {
							File df = new File(#输出路径 + File.separator + entryName.substring(0, index));
							df.mkdirs();
						}
						index = entryName.lastIndexOf("/");
						if (index != - 1) {
							File df = new File(#输出路径 + File.separator + entryName.substring(0, index));
							df.mkdirs();
						}
						File f = new File(#输出路径 + File.separator + zipEntry.getName());

						in = zipFile.getInputStream(zipEntry);
						out = new FileOutputStream(f);

						byte[] by = new byte[1024];
						int c;
						while ((c = in.read(by)) != - 1) {
							out.write(by, 0, c);
						}
						out.flush();
						flag = true;
					}
				} catch (IOException ex) {
					ex.printStackTrace();
					flag = false;
				}
				finally {
				}

			}

		} catch (IOException ex) {
			ex.printStackTrace();
			flag = false;
		}
		finally {
			if (zipFile != null) {
				try {
					zipFile.close();
				} catch (IOException ex) {
					flag = false;
				}
			}
		}
		return flag;
		@end
	结束 方法

	@code
	private static void zipFileOrDirectory(ZipOutputStream out, File fileOrDirectory, String curPath) throws IOException {
		FileInputStream in = null;
		try {
			if (!fileOrDirectory.isDirectory()) {
				byte[] buffer = new byte[4096];

				in = new FileInputStream(fileOrDirectory);

				ZipEntry entry = new ZipEntry(curPath + fileOrDirectory.getName());

				out.putNextEntry(entry);
				int bytes_read;
				while ((bytes_read = in.read(buffer)) != - 1) {
					out.write(buffer, 0, bytes_read);
				}
				out.closeEntry();
			} else {
				File[] entries = fileOrDirectory.listFiles();

				if (entries.length <= 0) {
					ZipEntry zipEntry = new ZipEntry(curPath + fileOrDirectory.getName() + "/");
					out.putNextEntry(zipEntry);
					out.closeEntry();
				} else {
					for (int i = 0; i < entries.length; i++) {
						zipFileOrDirectory(out, entries[i], curPath + fileOrDirectory.getName() + "/");
					}
				}
			}
		} catch (IOException ex) {
			ex.printStackTrace();
		}
		finally {
			if (in != null)
			try {
				in.close();
			} catch (IOException ex) {
				ex.printStackTrace();
			}
		}
	}
	@end

结束 类


@导入Java("java.io.*")
@导入Java("java.util.*")
@导入Java("java.util.regex.*")
@导入Java("java.text.*")
@导入Java("java.nio.channels.*")
@导入Java("java.util.zip.CRC32")
@导入Java("java.security.*")
@导入Java("android.content.Intent")
@导入Java("android.net.Uri")
@附加权限(安卓权限.文件权限_读取)
@附加权限(安卓权限.文件权限_写入)
@附加权限(安卓权限.管理外部文件权限)
@全局类
类 文件操作
	
	@静态
	方法 重命名文件(原路径 为 文本, 新路径 为 文本) 为 逻辑型
		@code
		if (#新路径.equals(#原路径)) {
			return true;
		}
		File oldfile = new File(#原路径);
		if (!oldfile.exists()) {
			return false;
		}
		File newfile = new File(#新路径);
		if (newfile.exists()) {
			return false;
		}
		if (oldfile.renameTo(newfile)) {
			return true;
		}
		return false;
		@end
	结束 方法
	
	@静态
	方法 复制文件(文件路径 为 文本, 欲复制到路径 为 文本) 为 逻辑型
		@code
		try {
			copyTo(new File(#文件路径), new File(#欲复制到路径));
		} catch (IOException e) {
	        e.printStackTrace();
			return false;
		}
		return true;
		@end
	结束 方法

	@静态
	方法 移动文件(文件路径 为 文本, 欲移到路径 为 文本)
		@code
		try {
			moveTo(new File(#文件路径), new File(#欲移到路径));
		} catch (IOException e) {
			e.printStackTrace();
		}
		@end
	结束 方法

	@静态
	方法 取文件前缀名(路径 为 文本) 为 文本
		变量 目标文件 : 文件 = 路径
		变量 文件名 = 目标文件.取文件名()
		变量 索引 = 文件名.寻找文本(".")
		如果 索引 == -1
			返回 ""
		否则
			返回 文件名.取文本中间(0, 索引 - 1)
		结束 如果
	结束 方法

	@静态
	方法 取文件后缀名(路径 为 文本) 为 文本
		变量 目标文件 : 文件 = 路径
		变量 文件名 = 目标文件.取文件名()
		变量 索引 = 文件名.倒找文本(".")
		如果 索引 == -1
			返回 ""
		否则
			返回 文件名.取文本中间(索引 + 1, 文件名.长度 - 1)
		结束 如果
	结束 方法

	@静态
	方法 取文件名(路径 为 文本) 为 文本
		变量 目标文件 : 文件 = 路径
		返回 (目标文件.取文件名())
	结束 方法

	@静态
	方法 取文件MD5(路径 为 文本) 为 文本
		@code
		  try {
			return getMD5(new File(#路径));
		} catch (IOException e) {
				e.printStackTrace();
		  }
		return "";
		@end
	结束 方法

	@静态
	方法 取文件SHA1(路径 为 文本) 为 文本
		@code
		  try {
			return getSHA1(new File(#路径));
		} catch (IOException e) {
				e.printStackTrace();
		  }
		return "";
		@end
	结束 方法

	@静态
	方法 取文件CRC32(路径 为 文本) 为 文本
		@code
		try {
			byte[] buffer = new byte[8192];
        	CRC32 crc = new CRC32();
        	FileInputStream fis = new FileInputStream(#路径);
        	while (true) {
            	int r = fis.read(buffer);
            	if (r == -1) {
                	break;
            	}
            	crc.update(buffer, 0, r);
        	}
        	fis.close();
        	return Long.toHexString(crc.getValue());
		} catch (IOException e) {
			e.printStackTrace();
		}
		return "";
		@end
	结束 方法

	@静态
	方法 追加文件内容(路径 为 文本, 欲追加文本 为 文本)
		@code
		  try {
			append(new File(#路径), #欲追加文本);
		} catch (IOException e) {
				e.printStackTrace();
		  }
		@end
	结束 方法

	@静态
	方法 删除文件(路径 为 文本) 为 逻辑型
		@code
		return deleteFile(new File(#路径));
		@end
	结束 方法

	@静态
	方法 创建目录(路径 为 文本) 为 逻辑型
		@code
		return createDirectory(new File(#路径));
		@end
	结束 方法

	@静态
	方法 创建文件(路径 为 文本) 为 逻辑型
		@code
		return createFile(new File(#路径));
		@end
	结束 方法

	@静态
	方法 是否为目录(路径 为 文本) 为 逻辑型
		@code
		File file = new File(#路径);
		if (file.exists() && file.isDirectory()) {
			return true;
		}
		return false;
		@end
	结束 方法

	@静态
	方法 是否为隐藏文件(路径 为 文本) 为 逻辑型
		@code
		File file = new File(#路径);
		if (file.exists()) {
			return file.isHidden();
		}
		return false;
		@end
	结束 方法

	@静态
	方法 文件是否存在(路径 为 文本) 为 逻辑型
		@code
		return new File(#路径).exists();
		@end
	结束 方法

	@静态
	方法 取文件编码(路径 为 文本) 为 文本
		@code
		try {
			BufferedInputStream in = new BufferedInputStream(new FileInputStream(new File(#路径)));
			in.mark(4);
			byte[] first3bytes = new byte[3];
			in.read(first3bytes);
			in.reset();
			if (first3bytes[0] == (byte) -17 && first3bytes[1] == (byte) -69 && first3bytes[2] == (byte) -65) {
				return "utf-8";
			}
			if (first3bytes[0] == (byte) -1 && first3bytes[1] == (byte) -2) {
				return "unicode";
			}
			if (first3bytes[0] == (byte) -2 && first3bytes[1] == (byte) -1) {
				return "utf-16be";
			}
			if (first3bytes[0] == (byte) -1 && first3bytes[1] == (byte) -1) {
				return "utf-16le";
			}
			return "GBK";
		} catch (Exception e) {
			//e.printStackTrace();
			throw new RuntimeException("取文件编码( 未找到文件:" + #路径);
		}
		@end
	结束 方法

	@静态
	方法 读入文本文件(路径 为 文本, 编码 为 文本 = "UTF-8") 为 文本
		@code
		try {
			BufferedReader br = new BufferedReader(new InputStreamReader(new FileInputStream(#路径), #编码));
        	boolean first = true;
        	StringBuilder content = new StringBuilder();
        	String line;
        	while ((line = br.readLine()) != null) {
            	if (first) {
                	first = false;
                	content.append(line);
            	} else {
                	content.append('\n').append(line);
            	}
        	}
        	br.close();
        	return content.toString();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return "";
		@end
	结束 方法

	@静态
	方法 写出文本文件(路径 为 文本, 欲写出内容 为 文本)
		@code
		  try {
			write(new File(#路径), #欲写出内容);
		  } catch (IOException e) {
				e.printStackTrace();
		  }
		@end
	结束 方法

	@静态
	方法 读入文件字节(路径 为 文本) 为 字节[]
		@code
		byte[] buffer = null;
		if (!new File(#路径).exists()) {
			return null;
		}
		try {
			FileInputStream fin = new FileInputStream(#路径);
			buffer = new byte[fin.available()];
			fin.read(buffer);
			fin.close();
			return buffer;
		} catch (Exception e) {
			e.printStackTrace();
			throw new RuntimeException("读入字节文件( 错误");
		}
		@end
	结束 方法

	@静态
	方法 写出字节文件(路径 为 文本, 欲写出字节集 为 字节[]) 为 逻辑型
		@code
		try {
			FileOutputStream fout = new FileOutputStream(#路径);
			fout.write(#欲写出字节集);
			fout.close();
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			throw new RuntimeException("写出字节文件( 错误");
		}
		@end
	结束 方法

	@静态
	方法 取文件大小(路径 为 文本) 为 长整数
		@code
		File file = new File(#路径);
		try {
			if (file.isDirectory()) {
				return getFileSizes(file);
			}
			return getFileSize(file);
		} catch (Exception e) {
			e.printStackTrace();
			throw new RuntimeException("取文件大小( 错误");
		}
		@end
	结束 方法

	@静态
	方法 写出资源文件(窗口环境 为 安卓环境, 文件名称 为 文本, 欲写到路径 为 文本) 为 逻辑型
		@code
		try {
			InputStream stream = #窗口环境.getAssets().open(#文件名称);
			File file = new File(#欲写到路径);
			if (!file.getParentFile().exists()) {
				file.getParentFile().mkdirs();
			}
			if (stream != null && writeStreamToFile(stream, file)) {
				return true;
			}
			return false;
		} catch (Exception e) {
			e.printStackTrace();
			throw new RuntimeException("写出资源文件( "  + #文件名称 + "或" + #欲写到路径);
		}
		@end
	结束 方法

	@静态
	方法 读入资源文件(窗口环境 为 安卓环境, 文件名称 为 文本, 编码 为 文本 = "UTF-8") 为 文本
		@code
		try {
			InputStream inputstream = #窗口环境.getAssets().open(#文件名称);
			if (inputstream == null) {
				return "";
			}
			int length = inputstream.available();
			byte[] buffer = new byte[length];
			inputstream.read(buffer);
			String res2 = new String(buffer, 0, length, #编码);
			inputstream.close();
			return res2;
		} catch (IOException e) {
			e.printStackTrace();
			throw new RuntimeException("读入资源文件( 未找到文件: "  + #文件名称);
		}
		@end
	结束 方法

	@静态
	方法 寻找文件关键词(路径 为 文本, 关键词 为 文本) 为 文本
		@code
		String result = "";
		for (File f : new File(#路径).listFiles()) {
			if (f.getName().indexOf(#关键词) >= 0) {
				result = f.getPath() + "\n" + result;
			}
		}
		return result;
		@end
	结束 方法

	@静态
	方法 寻找文件后缀名(路径 为 文本, 后缀名 为 文本) 为 文本
		@code
		String result = "";
		for (File f : new File(#路径).listFiles()) {
			if (f.getPath().substring(f.getPath().length() - #后缀名.length()).equals(#后缀名) && !f.isDirectory()) {
				result = f.getPath() + "\n" + result;
			}
		}
		return result;
		@end
	结束 方法

	@静态
	方法 打开文本文件_读(文件路径 为 文本, 编码 为 文本 = "UTF-8") 为 逻辑型
		@code
		if (!new File(#文件路径).exists()) {
			return false;
		}
		try {
			fin = new FileInputStream(#文件路径);
			isr = new InputStreamReader(fin, #编码);
			br = new BufferedReader(isr);
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
		@end
	结束 方法

	@静态
	方法 关闭读() 为 逻辑型
		@code
		try {
			br.close();
			fin.close();
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
		@end
	结束 方法

	@静态
	方法 读一行() 为 文本
		@code
		  try {
			String readLine = br.readLine();
			line = readLine;
			return line;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
		@end
	结束 方法

	@静态
	方法 打开文本文件_写(文件路径 为 文本, 编码 为 文本 = "UTF-8") 为 逻辑型
		@code
		if (!new File(#文件路径).exists()) {
			return false;
		}
		try {
			fout = new FileOutputStream(#文件路径);
			osw = new OutputStreamWriter(fout, #编码);
			bw = new BufferedWriter(osw);
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
		@end
	结束 方法

	@静态
	方法 关闭写() 为 逻辑型
		@code
		try {
			bw.close();
			fout.close();
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
		@end
	结束 方法

	@静态
	方法 写一行(欲写内容 为 文本) 为 逻辑型
		@code
		try {
			bw.newLine();
			bw.write(#欲写内容);
			bw.flush();
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
		@end
	结束 方法

	@静态
	方法 取子目录(路径 为 文本) 为 文本[]
		@code
		File[] ff = new File(#路径).listFiles();
		  String[] paths = new String[ff.length];
		for (int i = 0; i < ff.length; i++) {
			if (ff[i].isDirectory()) {
				paths[i] = ff[i].getAbsolutePath();
			}
		}
		return paths;
		@end
	结束 方法

	@静态
	方法 取子文件列表(路径 为 文本) 为 文本[]
		@code
		List<String> list = new ArrayList<>();
		File[] ff = new File(#路径).listFiles();
		for (int i = 0; i < ff.length; i++) {
			list.add(ff[i].getAbsolutePath());
		}
		return list.toArray(new String[list.size()]);
		@end
	结束 方法
	
	@静态
	常量 文件排序_时间排序 为 整数= 0
	@静态
	常量 文件排序_名称排序 为 整数 = 1
	@静态
	常量 文件排序_大小排序 为 整数 = 2

	@静态
	方法 取子文件列表2(路径 为 文本,排序方式 为 整数,是否正序 为 逻辑型) 为 文本[]
		@code
		List<String> list = new ArrayList<>();
		File[] files = new File(#路径).listFiles();
		if (#排序方式 == #文件排序_名称排序) {
			Arrays.sort(files, new Comparator<File>() {
					@Override
					public int compare(File o1, File o2) {
						if (o1.isDirectory() && o2.isFile()) {
							if (#是否正序)
								return -1;
							else
								return 1;
						}
						if (o1.isFile() && o2.isDirectory()) {
							if (#是否正序)
								return 1;
							else
								return -1;
						}
						if (o1.getName().compareTo(o2.getName()) == 1) {
							if (#是否正序) {
								return 1;
							} else {
								return -1;
							}
						} else {
							if (#是否正序) {
								return -1;
							} else {
								return 1;
							}
						}
					}
				});
		} else if (#排序方式 == #文件排序_时间排序) {
			Arrays.sort(files, new Comparator<File>() {
					@Override
					public int compare(File f1, File f2) {
						long diff = f1.lastModified() - f2.lastModified();
						if (diff > 0) {
							if (#是否正序) {
								return 1;
							} else {
								return -1;
							}
						} else if (diff == 0) {
							return 0;
						} else {
							if (#是否正序) {
								return -1;
							} else {
								return 1;
							}
						}
					}

					public boolean equals(Object obj) {
						return true;
					}
				});
		} else if (#排序方式 == #文件排序_大小排序) {
			Arrays.sort(files, new Comparator<File>() {
					@Override
					public int compare(File f1, File f2) {
						long diff = f1.length() - f2.length();
						if (diff > 0) {
							if (#是否正序) {
								return 1;
							} else {
								return -1;
							}
						} else if (diff == 0) {
							return 0;
						} else {
							if (#是否正序) {
								return -1;
							} else {
								return 1;
							}
						}
					}

					public boolean equals(Object obj) {
						return true;
					}
				});
		}
		for (int i = 0; i < files.length; i++) {
			list.add(files[i].getAbsolutePath());
		}
		return list.toArray(new String[list.size()]);
		@end
	结束 方法

	@静态
	方法 取子文件集合(路径 为 文本) 为 文本集合
		@code
		ArrayList<String> list = new ArrayList<>();
		File[] ff = new File(#路径).listFiles();
		for (int i = 0; i < ff.length; i++) {
			list.add(ff[i].getAbsolutePath());
		}
		return list;
		@end
	结束 方法

	@静态
	方法 取子文件集合2(路径 为 文本,排序方式 为 整数,是否正序 为 逻辑型) 为 文本集合
		@code
		ArrayList<String> list = new ArrayList<>();
		File[] files = new File(#路径).listFiles();
		if (#排序方式 == #文件排序_名称排序) {
			Arrays.sort(files, new Comparator<File>() {
					@Override
					public int compare(File o1, File o2) {
						if (o1.isDirectory() && o2.isFile()) {
							if (#是否正序)
								return -1;
							else
								return 1;
						}
						if (o1.isFile() && o2.isDirectory()) {
							if (#是否正序)
								return 1;
							else
								return -1;
						}
						if (o1.getName().compareTo(o2.getName()) == 1) {
							if (#是否正序) {
								return 1;
							} else {
								return -1;
							}
						} else {
							if (#是否正序) {
								return -1;
							} else {
								return 1;
							}
						}
					}
				});
		} else if (#排序方式 == #文件排序_时间排序) {
			Arrays.sort(files, new Comparator<File>() {
					@Override
					public int compare(File f1, File f2) {
						long diff = f1.lastModified() - f2.lastModified();
						if (diff > 0) {
							if (#是否正序) {
								return 1;
							} else {
								return -1;
							}
						} else if (diff == 0) {
							return 0;
						} else {
							if (#是否正序) {
								return -1;
							} else {
								return 1;
							}
						}
					}

					public boolean equals(Object obj) {
						return true;
					}
				});
		} else if (#排序方式 == #文件排序_大小排序) {
			Arrays.sort(files, new Comparator<File>() {
					@Override
					public int compare(File f1, File f2) {
						long diff = f1.length() - f2.length();
						if (diff > 0) {
							if (#是否正序) {
								return 1;
							} else {
								return -1;
							}
						} else if (diff == 0) {
							return 0;
						} else {
							if (#是否正序) {
								return -1;
							} else {
								return 1;
							}
						}
					}

					public boolean equals(Object obj) {
						return true;
					}
				});
		}
		for (int i = 0; i < files.length; i++) {
			list.add(files[i].getAbsolutePath());
		}
		return list;
		@end
	结束 方法

	@静态
	方法 取文件修改时间(路径 为 文本) 为 文本
		@code
		return new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date(new File(#路径).lastModified()));
		@end
	结束 方法

	@code
    private static FileInputStream fin;
	private static InputStreamReader isr;
	private static BufferedReader br;
	private static String line;
	private static FileOutputStream fout;
	private static OutputStreamWriter osw;
	private static BufferedWriter bw;
   
    /**
     * Copy or move file/directory
     */

    public static void moveTo(File from, File to) throws IOException {
        if (from.isDirectory()) {
            moveDir(from, to);
        } else {
            moveFile(from, to);
        }
    }

    public static void copyTo(File from, File to) throws IOException {
        if (from.isDirectory()) {
            copyDir(from, to);
        } else {
            copyFile(from, to);
        }
    }

    private static void moveDir(File oldFile, File newFile) throws IOException {
        copyDir(oldFile, newFile);
        deleteFile(oldFile);
    }

    private static void moveFile(File oldFile, File newFile) throws IOException {
        copyFile(oldFile, newFile);
        deleteFile(oldFile);
    }

    private static void copyDir(File srcFile, File dstFile) throws IOException {
        if (!dstFile.exists())
            dstFile.mkdirs();
        for (File file : dstFile.listFiles()) {
            if (file.isDirectory()) {
                copyDir(file, new File(dstFile.getAbsolutePath() + File.separator + file.getName()));
            } else {
                copyFile(file, new File(dstFile.getAbsolutePath() + File.separator + file.getName()));
            }
        }
    }

    private static void copyFile(File srcFile, File dstFile) throws IOException {
        if (!srcFile.exists()) {
            return;
        }
        if (!dstFile.exists()) {
            dstFile.getParentFile().mkdirs();
            if (srcFile.isFile())
                dstFile.createNewFile();
        }
        FileInputStream fileIns = null;
        FileOutputStream fileOuts = null;
        FileChannel source = null;
        FileChannel destination = null;
        try {
            fileIns = new FileInputStream(srcFile);
            fileOuts = new FileOutputStream(dstFile);
            source = fileIns.getChannel();
            destination = fileOuts.getChannel();
            destination.transferFrom(source, 0, source.size());
        } catch (IOException e) {
            throw e;
        } finally {
            if (fileIns != null)
                fileIns.close();
            if (fileOuts != null)
                fileOuts.close();
            if (source != null)
                source.close();
            if (destination != null)
                destination.close();
        }
    }

    

    public static String getSHA1(File file) throws IOException {
        return getDigest(file, "SHA1");
    }

    public static String getMD5(File file) throws IOException {
        return getDigest(file, "MD5");
    }

    private static String getDigest(File file, String algo) throws IOException {
        try {
            MessageDigest md = MessageDigest.getInstance(algo);
            byte[] buffer = new byte[8192];
            FileInputStream fis = new FileInputStream(file);
            while (true) {
                int r = fis.read(buffer);
                if (r == -1) {
                    break;
                }
                md.update(buffer, 0, r);
            }
            fis.close();
            return new java.math.BigInteger(1, md.digest()).toString(16);
        } catch (Exception e) {

        }
        return null;
    }

    /**
     * Write file...
     */

    public static void write(File file, String content) throws IOException {
        if (!file.exists()) {
            createFile(file);
        }
        BufferedWriter writer = new BufferedWriter(new OutputStreamWriter(new FileOutputStream(file)));
        writer.write(content);
        writer.flush();
        writer.close();
    }

    public static void write(File file, byte[] bytes) throws IOException {
        write(file, bytes, 0, bytes.length);
    }

    public static void write(File file, byte[] bytes, int offset, int len) throws IOException {
        if (!file.exists()) {
            createFile(file);
        }
        FileOutputStream fos = new FileOutputStream(file);
        fos.write(bytes, offset, len);
        fos.flush();
        fos.close();
    }

    /**
     * Append to the end of file
     */

    public static void append(File file, byte[] appendix) throws IOException {
        append(file, appendix, 0, appendix.length);
    }

    public static void append(File file, byte[] appendix, int off, int len) throws IOException {
        if (!file.exists()) {
            createFile(file);
        }
        RandomAccessFile raf = new RandomAccessFile(file, "rw");
        raf.seek(raf.length());
        raf.write(appendix, off, len);
        raf.close();
    }

    public static void append(File file, String appendix) throws IOException {
        if (!file.exists()) {
            createFile(file);
        }
        FileWriter fw = new FileWriter(file, true);
        fw.write(appendix);
        fw.flush();
        fw.close();
    }

    /**
     * Search files by name
     * 
     * @param file The <strong>directory</strong> you want to search
     * @param match The name or regular expression.This is decided by useRegex
     * @param useRegex Whether the parameter 'match' is a regex
     * @param ignoreCase Whether we should ignore the case
     * @param searchSub Whether we should search sub directories
     * @return The unodered result of searching
     */
    public static List<File> searchByName(File file, String match, boolean useRegex, boolean ignoreCase,
            boolean searchSub) {
        if (!file.isDirectory()) {
            throw new IllegalArgumentException("not a directory");
        }
        ArrayList<File> result = new ArrayList<>();
        Pattern pattern = null;
        if (useRegex) {
            if (ignoreCase) {
                pattern = Pattern.compile(match, Pattern.CASE_INSENSITIVE);
            } else {
                pattern = Pattern.compile(match);
            }
        } else {
            if (ignoreCase) {
                match = match.toLowerCase();
            }
        }
        for (File f : file.listFiles()) {
            searchByNameInternal(result, f, match, ignoreCase, useRegex, pattern, searchSub);
        }
        return result;
    }

    /**
     * Thia is a helper method of searchByName() to search fies actually
     */
    private static void searchByNameInternal(List<File> result, File file, String match, boolean ignoreCase,
            boolean useRegex, Pattern pattern, boolean searchSub) {
        if (useRegex) {
            Matcher m = pattern.matcher(file.getName());
            if (m.find()) {
                result.add(file);
            }
        } else {
            if (ignoreCase) {
                if (file.getName().toLowerCase().contains(match)) {
                    result.add(file);
                }
            } else {
                if (file.getName().contains(match)) {
                    result.add(file);
                }
            }
        }
        if (file.isDirectory() && searchSub) {
            for (File sub : file.listFiles()) {
                searchByNameInternal(result, sub, match, ignoreCase, useRegex, pattern, searchSub);
            }
        }
    }

    /**
     * Delete the given file
     * @param file The file to delete
     * @return Whether we succeeded
     */
    public static boolean deleteFile(File file) {
        boolean success = true;
        if (file.exists()) {
            if (file.isDirectory()) {
                for (File subFile : file.listFiles()) {
                    if (!success) {
                        return false;
                    }
                    success = success && deleteFile(subFile);
                }
            }
            if (success)
                success = success && file.delete();
        }
        return success;
    }
	
	public static boolean createFile(File file) {
        try {
            if (!file.getParentFile().exists()) {
                file.getParentFile().mkdirs();
            }
            return file.createNewFile();
        } catch (IOException e) {
            e.printStackTrace();
            return false;
        }
    }

    /**
     * Create the given file as directory
     * @param file The file to create as a directory
     * @return Whether we succeeded
     */
    public static boolean createDirectory(File file) {
        return file.mkdirs();
    }

    /**
     * Get the name of file by string path
     * @param path Path of a file
     * @return file name
     */
    public static String getFileName(String path) {
        int pos = path.lastIndexOf(File.pathSeparator);
        if (pos == -1) {
            return path;
        } else {
            return path.substring(pos + 1, path.length());
        }
    }

    /**
     * Get the parent path of file by string path
     * @param path Path of a file parent
     * @return parent path
     */
    public static String getFilePath(String path) {
        int pos = path.lastIndexOf(File.pathSeparator);
        if (pos == -1) {
            return path;
        } else {
            return path.substring(0, pos + 1);
        }
    }
	
	private static long getFileSize(File file) throws Exception {
		if (file.exists()) {
			return (long) new FileInputStream(file).available();
		}
		file.createNewFile();
		return 0;
	}

	private static long getFileSizes(File f) throws Exception {
		long size = 0;
		File[] flist = f.listFiles();
		for (int i = 0; i < flist.length; i++) {
			if (flist[i].isDirectory()) {
				size += getFileSizes(flist[i]);
			} else {
				size += getFileSize(flist[i]);
			}
		}
		return size;
	}
	
	private static boolean writeStreamToFile(InputStream stream, File file) throws FileNotFoundException, IOException {
		OutputStream output = new FileOutputStream(file);
		byte[] buffer = new byte[1024];
		while (true) {
			int read = stream.read(buffer);
			if (read != -1) {
				output.write(buffer, 0, read);
			} else {
				output.flush();
				output.close();
				stream.close();
				return true;
			}
		}
	}
	 @end
结束 类


@全局类
@导入Java("java.io.*")
@导入Java("java.util.*")
@导入Java("android.net.Uri")
@导入Java("android.content.*")
@导入Java("android.provider.*")
@导入Java("android.graphics.*")
类 图片操作
	@code
	public static byte[] Bitmap2Bytes(Bitmap bmp) {
		ByteArrayOutputStream baos = new ByteArrayOutputStream();
		bmp.compress(Bitmap.CompressFormat.PNG, 100, baos);
		return baos.toByteArray();
	}

	public static Bitmap Bytes2Bitmap(byte[] buffer) {
		return BitmapFactory.decodeByteArray(buffer, 0, buffer.length);
	}
	@end

	/*
	获取指定路径图片的字节数组
	如果要获取附加资源内的图片，则第二个参数必须填写
	*/
	@静态
	方法 取图片字节数组(图片路径 为 文本, 窗口 为 安卓环境 = 空) 为 字节[]
		@code
		if (#图片路径.startsWith("/")) {
			File f = new File(#图片路径);
			if (f.exists()) {
				Bitmap bitmap = BitmapFactory.decodeFile(#图片路径);
				return Bitmap2Bytes(bitmap);
			}
		} else {
			try {
				Bitmap bitmap = BitmapFactory.decodeStream(#窗口.getResources().getAssets().open(#图片路径));
				return Bitmap2Bytes(bitmap);
			} catch (IOException ioe) {
				ioe.printStackTrace();
			}
		}
		return null;
		@end
	结束 方法

	//旋转一个图片，参数一为图片字节数组，参数二位旋转的角度，返回处理后的图片字节数组
	@静态
	方法 旋转图片(图片字节集 为 字节[],角度 为 小数) 为 字节[]
		@code
		Bitmap zijie = Bytes2Bitmap(#图片字节集);
		Matrix matrix = new Matrix();
		matrix.postRotate((float) #角度);
		Bitmap linshi = Bitmap.createBitmap(zijie, 0, 0, zijie.getWidth(), zijie.getHeight(), matrix, true);
		return Bitmap2Bytes(linshi);
		@end
	结束 方法

	//缩放一个图片，参数一为图片字节数组，返回处理后的图片字节数组
	@静态
	方法 缩放图片(图片字节集 为 字节[],宽度 为 整数,高度 为 整数) 为 字节[]
		@code
		Bitmap lin = Bytes2Bitmap(#图片字节集);
		int width = lin.getWidth();
		int height = lin.getHeight();
		float scaleWidth = #宽度 / width;
		float scaleHeight = #高度 / height;
		Matrix matrix = new Matrix();
		matrix.postScale(scaleWidth, scaleHeight);
		return Bitmap2Bytes(Bitmap.createBitmap(lin, 0, 0, width, height, matrix, true));
		@end
	结束 方法

	//把图片反转，0为左右反转，1为上下反转，返回处理后的图片字节数组
	@静态
	方法 反转图片(图片字节集 为 字节[],方向 为 整数) 为 字节[]
		@code
		float[] floats = null;
		switch (#方向) {
			case 0:
			floats = new float[] { - 1.0F, 0.0F, 0.0F, 0.0F, 1.0F, 0.0F, 0.0F, 0.0F, 1.0F };
			break;
			case 1:
			floats = new float[] { 1.0F, 0.0F, 0.0F, 0.0F, - 1.0F, 0.0F, 0.0F, 0.0F, 1.0F };
		}
		if (floats != null) {
			Matrix matrix = new Matrix();
			matrix.setValues(floats);
			Bitmap ceshi = Bytes2Bitmap(#图片字节集);
			return Bitmap2Bytes(Bitmap.createBitmap(ceshi, 0, 0, ceshi.getWidth(), ceshi.getHeight(), matrix, true));
		}
		return #图片字节集;
		@end
	结束 方法

	//压缩图片，返回处理后的JPG格式图片字节数组
	@静态
	方法 压缩图片(待压缩图片 为 字节[]) 为 字节[]
		@code
		Bitmap image = Bytes2Bitmap(#待压缩图片);
		ByteArrayOutputStream baos = new ByteArrayOutputStream();
		image.compress(Bitmap.CompressFormat.JPEG, 100, baos);
		int options = 100;
		while (baos.toByteArray().length / 1024 > 100) {
			baos.reset();
			image.compress(Bitmap.CompressFormat.JPEG, options, baos);
			options -= 10;
		}
		ByteArrayInputStream isBm = new ByteArrayInputStream(baos.toByteArray());
		Bitmap bitmap = BitmapFactory.decodeStream(isBm, null, null);
		return Bitmap2Bytes(bitmap);
		@end
	结束 方法

	//压缩指定图片文件，并保存到指定路径，参数三:压缩图片最大宽高值 图片压缩后的宽度或高度不超过这个设定值，即指定压缩后的图片尺寸，注意这是一个近似值
	@静态
	方法 压缩图片2(
			待压缩图片路径 为 文本,
			压缩后保存路径 为 文本,
			压缩后最大宽高限度 为 整数)
		@code
		BitmapFactory.Options options = new BitmapFactory.Options();
		options.inJustDecodeBounds = true;

		Bitmap bitmap = BitmapFactory.decodeFile(#待压缩图片路径, options);
		options.inJustDecodeBounds = false;

		int be = options.outHeight / #压缩后最大宽高限度;
		if (be <= 0)
		be = 1;
		options.inSampleSize = be;

		bitmap = BitmapFactory.decodeFile(#待压缩图片路径, options);
		int w = bitmap.getWidth();
		int h = bitmap.getHeight();
		File file2 = new File(#压缩后保存路径);
		try {
			FileOutputStream out = new FileOutputStream(file2);
			if (bitmap.compress(Bitmap.CompressFormat.JPEG, 100, out)) {
				out.flush();
				out.close();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		@end
	结束 方法

	//切割图片，返回处理后的图片字节数组
	@静态
	方法 切割图片(图片字节集 为 字节[],横向切割数量 为 整数,纵向切割数量 为 整数) 为 集合
		@code
		ArrayList pieces = new ArrayList();
		Bitmap bitmap = Bytes2Bitmap(#图片字节集);
		int width = bitmap.getWidth();
		int height = bitmap.getHeight();
		int pieceWidth = width / #横向切割数量;
		int pieceHeight = height / #纵向切割数量;
		for(int i = 0; i < #纵向切割数量; ++i) {
			for(int j = 0; j < #横向切割数量; ++j) {
				int xValue = j * pieceWidth;
				int yValue = i * pieceHeight;
				Bitmap bitmap2 = Bitmap.createBitmap(bitmap, xValue, yValue, pieceWidth, pieceHeight);
				pieces.add(Bitmap2Bytes(bitmap2));
			}
		}
		return pieces;
		@end
	结束 方法

	//把图片倾斜处理，返回处理后的图片字节数组
	@静态
	方法 倾斜图片(图片字节集 为 字节[],横向倾斜角度 为 小数,纵向倾斜角度 为 小数) 为 字节[]
		@code
		Bitmap zijie = Bytes2Bitmap(#图片字节集);
		Matrix matrix = new Matrix();
		matrix.postSkew((float)#横向倾斜角度, (float)#纵向倾斜角度);
		Bitmap linshi = Bitmap.createBitmap(zijie, 0, 0, zijie.getWidth(), zijie.getHeight(), matrix, true);
		return Bitmap2Bytes(linshi);
		@end
	结束 方法

	//设置图片的圆角，返回处理后的图片字节数组
	@静态
	方法 设置图片圆角(图片字节集 为 字节[],圆角 为 整数) 为 字节[]
		@code
		Bitmap bitmap = Bytes2Bitmap(#图片字节集);
		Bitmap roundCornerBitmap = toRoundCorner(bitmap, #圆角);
		return Bitmap2Bytes(roundCornerBitmap);
		@end
	结束 方法

	//设置图片的倒影，返回处理后的图片字节数组
	@静态
	方法 设置图片倒影(图片字节集 为 字节[]) 为 字节[]
		@code
		Bitmap bitmap = Bytes2Bitmap(#图片字节集);
		Bitmap roundCornerBitmap = createReflectionImageWithOrigin(bitmap);
		return Bitmap2Bytes(roundCornerBitmap);
		@end
	结束 方法

	//取图片宽度，图片文件名可以是资源文件，也可以是SD卡文件
	@静态
	方法 取图片宽度(窗口 为 安卓环境,图片路径 为 文本) 为 整数
		@code
		int width = 0;
		if (#图片路径.length() > 0)
		if (#图片路径.startsWith("/")) {
			File f = new File(#图片路径);
			if (f.exists()) {
				Bitmap bitmap = BitmapFactory.decodeFile(#图片路径);
				width = bitmap.getWidth();
			}
		} else {
			try {
				Bitmap bitmap = BitmapFactory.decodeStream(#窗口.getResources().getAssets().open(#图片路径));
				width = bitmap.getWidth();
			} catch (IOException ioe) {
				ioe.printStackTrace();
			}
		}
		return width;
		@end
	结束 方法

	//取图片高度，图片文件名可以是资源文件，也可以是SD卡文件
	@静态
	方法 取图片高度(窗口 为 安卓环境,图片路径 为 文本) 为 整数
		@code
		int height = 0;
		if (#图片路径.length() > 0)
		if (#图片路径.startsWith("/")) {
			File f = new File(#图片路径);
			if (f.exists()) {
				Bitmap bitmap = BitmapFactory.decodeFile(#图片路径);
				height = bitmap.getHeight();
			}
		} else {
			try {
				Bitmap bitmap = BitmapFactory.decodeStream(#窗口.getResources().getAssets().open(#图片路径));
				height = bitmap.getHeight();
			} catch (IOException ioe) {
				ioe.printStackTrace();
			}
		}
		return height;
		@end
	结束 方法

	//取图片宽度，参数为图片字节数组
	@静态
	方法 取图片宽度2(图片字节集 为 字节[]) 为 整数
		@code
		Bitmap lin = Bytes2Bitmap(#图片字节集);
		int width = lin.getWidth();
		return width;
		@end
	结束 方法

	//取图片高度，参数为图片字节数组
	@静态
	方法 取图片高度2(图片字节集 为 字节[]) 为 整数
		@code
		Bitmap lin = Bytes2Bitmap(#图片字节集);
		int height = lin.getHeight();
		return height;
		@end
	结束 方法

	//取出图片指定范围内的部分
	@静态
	方法 取图片部分(图片字节集 为 字节[],起点横坐标 为 整数, 起点纵坐标 为 整数,宽度 为 整数,高度 为 整数) 为 字节[]
		@code
		Bitmap bitmap = Bytes2Bitmap(#图片字节集);
		bitmap = Bitmap.createBitmap(bitmap, #起点横坐标, #起点纵坐标, #宽度, #高度);
		return Bitmap2Bytes(bitmap);
		@end
	结束 方法

	//发送系统通知，更新系统相册，让SD卡上的指定图片显示在系统相册中
	@静态
	方法 更新系统相册(窗口 为 安卓环境, 图片路径 为 文本)
		@code
		try {
			//TODO 未测试
			File file = new File(#图片路径);
			MediaStore.Images.Media.insertImage(#窗口.getContentResolver(),file.getAbsolutePath(), file.getName(), null);
		} catch (IOException e) {
		}
		#窗口.sendBroadcast(new Intent(Intent.ACTION_MEDIA_SCANNER_SCAN_FILE, Uri.fromFile(new File(#图片路径))));
		@end
	结束 方法

	@code
	private static Bitmap toRoundCorner(Bitmap bitmap, int pixels) {
		Bitmap roundCornerBitmap = Bitmap.createBitmap(bitmap.getWidth(), bitmap.getHeight(), Bitmap.Config.ARGB_8888);
		Canvas canvas = new Canvas(roundCornerBitmap);
		int color = - 12434878;
		Paint paint = new Paint();
		paint.setColor(color);
		paint.setAntiAlias(true);
		Rect rect = new Rect(0, 0, bitmap.getWidth(), bitmap.getHeight());
		RectF rectF = new RectF(rect);
		float roundPx = pixels;
		canvas.drawARGB(0, 0, 0, 0);
		canvas.drawRoundRect(rectF, roundPx, roundPx, paint);
		paint.setXfermode(new PorterDuffXfermode(PorterDuff.Mode.SRC_IN));
		canvas.drawBitmap(bitmap, rect, rect, paint);
		return roundCornerBitmap;
	}

	private static Bitmap createReflectionImageWithOrigin(Bitmap bitmap) {
		int width = bitmap.getWidth();
		int height = bitmap.getHeight();
		Matrix matrix = new Matrix();
		matrix.preScale(1.0F, - 1.0F);
		Bitmap reflectionImage = Bitmap.createBitmap(bitmap, 0, height / 2, width, height / 2, matrix, false);
		Bitmap bitmapWithReflection = Bitmap.createBitmap(width, height + height / 2, Bitmap.Config.ARGB_8888);
		Canvas canvas = new Canvas(bitmapWithReflection);
		canvas.drawBitmap(bitmap, 0.0F, 0.0F, null);
		Paint deafalutPaint = new Paint();
		canvas.drawRect(0.0F, height, width, height + 4, deafalutPaint);
		canvas.drawBitmap(reflectionImage, 0.0F, height + 4, null);
		Paint paint = new Paint();
		LinearGradient shader = new LinearGradient(0.0F, bitmap.getHeight(), 0.0F, bitmapWithReflection.getHeight() + 4, 1895825407, 16777215, Shader.TileMode.CLAMP);
		paint.setShader(shader);
		paint.setXfermode(new PorterDuffXfermode(PorterDuff.Mode.DST_IN));
		canvas.drawRect(0.0F, height, width, bitmapWithReflection.getHeight() + 4, paint);
		return bitmapWithReflection;
	}
	@end
	
结束 类


@全局类
@导入Java("java.util.*")
@导入Java("java.text.*")
类 时间操作

	//根据格式获取时间文本，年为y，月为M，日为d，时为H，分为m，秒为s，如：取格式时间("yyyy-MM-dd")，返回xxxx-xx-xx，对应年份-月份-日
	@静态
	方法 取格式时间(格式 为 文本) 为 文本
		code return (new SimpleDateFormat(#格式).format(System.currentTimeMillis()));
	结束 方法

	//将时间戳转换为指定时间文本格式，年为y，月为M，日为d，时为H，分为m，秒为s，如：时间戳到文本(1239552759,"yyyy-MM-dd")，返回xxxx-xx-xx，对应年份-月份-日
	@静态
	方法 时间戳到文本(时间戳 为 长整数, 时间格式文本 为 文本) 为 文本
		code return (new SimpleDateFormat(#时间格式文本).format(#时间戳));
	结束 方法

	//返回现行时间戳长整数,单位为毫秒，也就是从1970年1月1日到现在的毫秒数
	@静态
	方法 取当前时间戳() 为 长整数
		code return System.currentTimeMillis();
	结束 方法
	
	//返回现行时间戳长整数,单位为纳秒，也就是从1970年1月1日到现在的纳秒数
	@静态
	方法 取当前纳秒时间戳() 为 长整数
		code return System.nanoTime();
	结束 方法

	//将时间文本转为时间戳
	@静态
	方法 时间文本到时间戳(时间格式 为 文本, 时间文本 为 文本) 为 长整数
		@code
		SimpleDateFormat format = new SimpleDateFormat(#时间格式);
		try {
			return format.parse(#时间文本).getTime();
		} catch(Exception e) {
			e.printStackTrace();
		}
		return 0;
		@end
	结束 方法
结束 类