package com.example.home;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface CommandService {
	public String processStart(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException;
	
}
