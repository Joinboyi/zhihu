package cn.zspt.zh.action;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.sql.Timestamp;
import java.text.DecimalFormat;
import java.text.FieldPosition;
import java.text.Format;
import java.text.NumberFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;

import org.apache.struts2.ServletActionContext;

import cn.zspt.zh.domain.User;
import cn.zspt.zh.service.ZHService;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class UserHeadImageUpdateAction extends ActionSupport {
	private ZHService zhService;
	private File fileInput; 
	private String fileInuptContentType;
	private String fileInputFileName;
	private String savePath; 

	private static final FieldPosition HELPER_POSITION = new FieldPosition(0);

	/** This Format for format the data to special format. */
	private final static Format dateFormat = new SimpleDateFormat("MMddHHmmssS");

	/** This Format for format the number to special format. */
	private final static NumberFormat numberFormat = new DecimalFormat("0000");

	/** This int is the sequence number ,the default value is 0. */
	private static int seq = 0;

	private static final int MAX = 999999;

	public ZHService getZhService() {
		return zhService;
	}

	public void setZhService(ZHService zhService) {
		this.zhService = zhService;
	}

	public File getFileInput() {
		return fileInput;
	}

	public void setFileInput(File fileInput) {
		this.fileInput = fileInput;
	}

	public String getFileInuptContentType() {
		return fileInuptContentType;
	}

	public void setFileInuptContentType(String fileInuptContentType) {
		this.fileInuptContentType = fileInuptContentType;
	}

	public String getFileInputFileName() {
		return fileInputFileName;
	}

	public void setFileInputFileName(String fileInputFileName) {
		this.fileInputFileName = fileInputFileName;
	}

	public String getSavePath() {
		return ServletActionContext.getServletContext().getRealPath(savePath);
	}

	public void setSavePath(String savePath) {
		this.savePath = savePath;
	}

	public String execute() throws Exception {
		User user = (User) ActionContext.getContext().getSession().get("user");
		if (fileInput != null) {
			int i = fileInputFileName.lastIndexOf(".");
			String ext = fileInputFileName.substring(i);
			String imgName = user.getUser_id() + "_" + generateSequenceNo() + ext;
			System.out.println(imgName);
			FileOutputStream fos = new FileOutputStream(getSavePath() + "\\" + imgName);
			FileInputStream fis = new FileInputStream(fileInput);

			byte[] buffer = new byte[1024];
			int len = 0;
			while ((len = fis.read(buffer)) > 0) {
				fos.write(buffer, 0, len);
			}
			fos.close();
			fis.close();
			user.setUser_head_image(imgName);
		}
		zhService.updateUser(user);
		return SUCCESS;

	}
	
	//以当前时间生成数字
		public String generateSequenceNo() {

			Calendar rightNow = Calendar.getInstance();

			StringBuffer sb = new StringBuffer();

			dateFormat.format(rightNow.getTime(), sb, HELPER_POSITION);

			numberFormat.format(seq, sb, HELPER_POSITION);

			if (seq == MAX) {
				seq = 0;
			} else {
				seq++;
			}

			return sb.toString();
		}
}
