package com.wicloud.main.java.util;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class Wicloud {

	public static String tomorrow(String date) {
		DateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		try {
			Date newDate = format.parse(date);
			newDate = tomorrow(newDate);
			return format.format(newDate);
		} catch (ParseException e) {
			e.printStackTrace();
			return null;
		}
	}
	
	public static Date tomorrow(Date date) {
		return new Date(date.getTime() + 24 * 3600 * 1000);
	}
	
	public static String change(String datestr, int num) {
		try {
			SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
			Date date1 = format.parse(datestr);
			long time = date1.getTime() - (1000L * 60 * 60 * 24 * num);
			Date date = new Date();
			if (time > 0) {
				date.setTime(time);
			}
			return format.format(date);
		} catch (Exception e) {
			return null;
		}
	}

	public static String Getoldtime(int delay) {
		long time = System.currentTimeMillis();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String oldTime = sdf.format(new Date(time - delay * 1000));
		return oldTime;
	}

	public static String Getrealtime_() {
		long time = System.currentTimeMillis();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd");
		String realTime = sdf.format(new Date(time));
		return realTime;
	}

	public static String Getrealtime() {
		long time = System.currentTimeMillis();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String realTime = sdf.format(new Date(time));
		return realTime;
	}
	
	/**
	 * like avg()*/
	public static double parseDoubleValue(Object value) {
		return value == null ? 0 : (Double) value;
	}
	
	/**
	 * like sum(), max(), min()*/
	public static long parseLongValue(Object value) {
		return value == null ? 0L : (Long) value;
	}
	
	/**
	 * like sum(), max(), min()*/
	public static int parseIntegerValue(Object value) {
		return value == null ? 0 : (Integer) value;
	}
	
}
