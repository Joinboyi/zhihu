package cn.zspt.zh.util;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.xml.crypto.Data;

public class GeneralTools {
	public String DataBecomeString(Date date){//Data类型转换成String类型
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//日期格式化
        String hftime = sdf.format(date);
		return hftime;
	}
	public long DateDifference(Date date){//获取时间与当前时间的差值
		Date today=new Date();
		DateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//日期格式化
		long day=(today.getTime()-date.getTime())/(1000);
		return day;
	}
	public String DateDifference2(Date date){//获取时间与当前时间的差值并给出判断
		GeneralTools generalTools =new GeneralTools();
		long day = generalTools.DateDifference(date);
		String daytime = "";
		if(day<60){
			daytime = day+"秒前";
		}else if(day<60*60){
			daytime = (day/60)+"分钟前";
		}else if(day<24*60*60){
			daytime = ((day/60)/60)+"小时前";
		}else if(day<30*24*60*60){
			daytime = (((day/60)/24)/60)+"天前";
		}else if(day<12*30*24*60*60){
			daytime = ((((day/60)/24)/30)/60)+"月前";
		}else{
			daytime = (((((day/60)/24)/30)/12)/60)+"年前";
		}
		return daytime;
	}
	
//	public static void main(String[] args) {
//		GeneralTools test = new GeneralTools();
//		Date date = new Date();
//		test.DateDifference(date);
//	}
}
