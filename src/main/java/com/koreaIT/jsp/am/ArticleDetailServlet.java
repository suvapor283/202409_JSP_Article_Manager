package com.koreaIT.jsp.am;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.Map;

import com.koreaIT.jsp.am.config.Config;
import com.koreaIT.jsp.am.util.DBUtil;
import com.koreaIT.jsp.am.util.SecSql;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/article/detail")
public class ArticleDetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Connection connection = null;
		
		try {
			Class.forName(Config.getDBDriverName());
			connection = DriverManager.getConnection(Config.getDBUrl(), Config.getDBUsr(), Config.getDBUsrPw());

			int id = Integer.parseInt(request.getParameter("id"));
			
			SecSql sql = new SecSql();
			sql.append("SELECT A.*, M.loginId `writerName`");
			sql.append("FROM article A");
			sql.append("INNER JOIN `member` M");
			sql.append("ON A.memberId = M.id");
			sql.append("WHERE A.id = ?", id);
			
			Map<String, Object> articleMap = DBUtil.selectRow(connection, sql);
			
			HttpSession se = request.getSession();
			
			int loginedMemberId = -1;
			
			if (se.getAttribute("loginedMemberId") != null) {
				loginedMemberId = (int) se.getAttribute("loginedMemberId");
			}
			
			request.setAttribute("loginedMemberId", loginedMemberId);
			request.setAttribute("articleMap", articleMap);
			
			request.getRequestDispatcher("/jsp/article/detail.jsp").forward(request, response);
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (connection != null) {
				try {
					connection.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}
	}
}
