package cn.zspt.zh.action;

import java.util.ArrayList;
import java.util.List;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.apache.struts2.json.annotations.JSON;

import com.opensymphony.xwork2.ActionSupport;

import cn.zspt.zh.domain.Section;
import cn.zspt.zh.service.ZHService;
import cn.zspt.zh.util.GeneralTools;

public class FindSectionAction extends ActionSupport {
	private ZHService zhService;
	private String str;
	private String result;
	private List<Section> sections;

	public String getResult() {
		return result;
	}

	public void setResult(String result) {
		this.result = result;
	}

	public List<Section> getSections() {
		return sections;
	}

	public void setSections(List<Section> sections) {
		this.sections = sections;
	}

	public ZHService getZhService() {
		return zhService;
	}

	public void setZhService(ZHService zhService) {
		this.zhService = zhService;
	}

	public String getStr() {
		return str;
	}

	public void setStr(String str) {
		this.str = str;
	}

	public String execute() {
		sections = zhService.findSection(str);
		JSONArray SectionsJson = new JSONArray();
		try {
			// 获取数据
			System.out.println(str);
			for (int i = 0; i < sections.size(); i++) {
				JSONObject jo = new JSONObject();
				System.out.println(sections.get(i).getSection_name());
				jo.put("section_name", sections.get(i).getSection_name());
				jo.put("section_summary", sections.get(i).getSection_summary());
				SectionsJson.add(jo);
			}

			// JSONObject json = JSONObject.fromObject(commentsJson);//
			// 将map对象转换成json类型数据
			JSONArray json = JSONArray.fromObject(SectionsJson);
			result = json.toString();// 给result赋值，传递给页面
		} catch (Exception e) {
			e.printStackTrace();
		}

		return "success";
	}
}
