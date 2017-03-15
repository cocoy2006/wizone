package com.wicloud.test.java.util;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;

public class Tester {

	/**
	 * @param args
	 * @throws ParseException 
	 */
	public static void main(String[] args) throws ParseException {
		// TODO Auto-generated method stub
		Calendar c = Calendar.getInstance();
		c.set(2014, 8, 1, 0, 0, 0);
		System.out.println(c.getTime());
		System.out.println(c.getTimeInMillis());
		String day = "20140901";
		int yesterdayLong = (int) (new SimpleDateFormat("yyyyMMdd").parse(day).getTime() / 1000);
		System.out.println(yesterdayLong);
		System.out.println((int)yesterdayLong);
//		float f = 12.34355f;
//		System.out.println(rebuildAccuracy(f, 2));
//		System.out.println(rebuildAccuracy(f, 3));
//		System.out.println(rebuildAccuracy(f, 4));
	}
	
	private static float rebuildAccuracy(float f, int num) {
		return new Float(Math.round(f * Math.pow(10, num)) / Math.pow(10, num));
	}

}
