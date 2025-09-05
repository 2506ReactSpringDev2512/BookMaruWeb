package com.elon.member.common;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class BOOKTemplate {
	private final String DRIVER_NAME = "oracle.jdbc.driver.OracleDriver";
	private final String URL = "jdbc:oracle:thin:@localhost:1521:xe";
	private final String USER = "BOOK";
	private final String PASSWORD = "BOOK";

	private static BOOKTemplate instance;

	private BOOKTemplate() {
	}

	public static BOOKTemplate getInstance() {
		if (instance == null) {
			instance = new BOOKTemplate();
		}
		return instance;
	}

	public Connection getConnection() {
		Connection conn = null;
		try {
			Class.forName(DRIVER_NAME);
			conn = DriverManager.getConnection(URL, USER, PASSWORD);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return conn;
	}
}