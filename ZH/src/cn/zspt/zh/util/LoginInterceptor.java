package cn.zspt.zh.util;

import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import org.apache.struts2.ServletActionContext;

import cn.zspt.zh.domain.User;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.AbstractInterceptor;

public class LoginInterceptor extends AbstractInterceptor {

	@Override
	public String intercept(ActionInvocation invocation) throws Exception {
		String actionName = invocation.getInvocationContext().getName();
		if (actionName.equals("loginsAction") || actionName.equals("logoutAction"))
			return invocation.invoke();
		// 将需要登录才能进行的action名字放到字符串数组里
		String loginNeed[] = { "topicDetail","indexAction","topicReply","topicWrite"};
		ActionContext ctx = invocation.getInvocationContext();
		Map session = ctx.getSession();
		User user = (User) session.get("user");
		if (user == null) {
			for (String s : loginNeed) {
				if (actionName.equals(s)) {
					HttpServletRequest request = ServletActionContext.getRequest();
					String url = request.getHeader("Referer");
					session.put("latestUrl", url);
					return "login";
				}
			}
		}
		return invocation.invoke();
	}
}