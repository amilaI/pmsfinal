package com.tela.pms.Test;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Locale;

public class PatientCreateTest {

	public static void main(String[] args) {
		
		java.sql.Timestamp date = new java.sql.Timestamp(new java.util.Date().getTime());
		System.out.println(date);
		
		SimpleDateFormat DATE_FORMAT = new SimpleDateFormat("yyyy-MM-dd  hh:mm  a",Locale.US);
		System.out.println(DATE_FORMAT.format(new Date()));
		
		/*java.sql.Timestamp date1 = new  Timestamp(Long.parseLong(s))
		System.out.println(date1);*/
		
	}
}
