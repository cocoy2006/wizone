package com.wicloud.main.java.service;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.TreeMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wicloud.main.java.dao.BranddisDAO;
import com.wicloud.main.java.util.Wicloud;

@Service
public class BranddisService {

	@Autowired
	private BranddisDAO branddisDao;
	
	public static final int PRICE_APPLE = 6499;
	public static final int PRICE_HUAWEI = 2499;
	public static final int PRICE_XIAOMI = 1799;
	public static final int PRICE_OPPO = 2799;
	public static final int PRICE_SAMSUNG = 3199;
	public static final int PRICE_VIVO = 2798;
	public static final int PRICE_MEIZU = 1099;
	public static final int PRICE_LETV = 999;
	public static final int PRICE_COOLPAD = 899;
	public static final int PRICE_GIONEE = 3999;

	public String avg(String start, String finish) {
		// get newer and old from table totalinfo
		StringBuffer brand = new StringBuffer();
		StringBuffer p = new StringBuffer();
		int others = 0;
		List list = branddisDao.findAvgBranddis(start, finish);
		if (list != null && list.size() > 0) {
			Object[] objs = (Object[]) list.get(0);
			List<Map.Entry<String, Integer>> mappingList = null;
			Map<String, Integer> map = new TreeMap<String, Integer>();
			map.put("Apple", (int) Wicloud.parseDoubleValue(objs[1]));
			map.put("Samsung", (int) Wicloud.parseDoubleValue(objs[2]));
			map.put("Nokia", (int) Wicloud.parseDoubleValue(objs[3]));
			map.put("Sony", (int) Wicloud.parseDoubleValue(objs[4]));
			map.put("ZTE", (int) Wicloud.parseDoubleValue(objs[5]));
			map.put("HUAWEI", (int) Wicloud.parseDoubleValue(objs[6]));
			map.put("ASUS", (int) Wicloud.parseDoubleValue(objs[7]));
			map.put("Intel", (int) Wicloud.parseDoubleValue(objs[8]));
			map.put("honhai", (int) Wicloud.parseDoubleValue(objs[9]));
			map.put("HTC", (int) Wicloud.parseDoubleValue(objs[10]));
			map.put("Xiaomi", (int) Wicloud.parseDoubleValue(objs[11]));
			map.put("OPPO", (int) Wicloud.parseDoubleValue(objs[12]));
			map.put("LG", (int) Wicloud.parseDoubleValue(objs[13]));
			map.put("Lenovo", (int) Wicloud.parseDoubleValue(objs[14]));
			map.put("Meizu", (int) Wicloud.parseDoubleValue(objs[15]));
			map.put("Coolpad", (int) Wicloud.parseDoubleValue(objs[16]));
			map.put("bbk", (int) Wicloud.parseDoubleValue(objs[17]));
			map.put("TP_LINK", (int) Wicloud.parseDoubleValue(objs[18]));
			map.put("gionee", (int) Wicloud.parseDoubleValue(objs[19]));
			map.put("murata", (int) Wicloud.parseDoubleValue(objs[20]));
			map.put("inpro", (int) Wicloud.parseDoubleValue(objs[21]));
			map.put("AzureWave", (int) Wicloud.parseDoubleValue(objs[22]));
			map.put("liteon", (int) Wicloud.parseDoubleValue(objs[23]));
			map.put("arris", (int) Wicloud.parseDoubleValue(objs[24]));
			map.put("K_Touch", (int) Wicloud.parseDoubleValue(objs[25]));
			map.put("AcSiP", (int) Wicloud.parseDoubleValue(objs[26]));
			map.put("AsiaPacific", (int) Wicloud.parseDoubleValue(objs[27]));
			map.put("ChiMei", (int) Wicloud.parseDoubleValue(objs[28]));
			map.put("Foxconn", (int) Wicloud.parseDoubleValue(objs[29]));
			map.put("Garmin", (int) Wicloud.parseDoubleValue(objs[30]));
			map.put("Gemtek", (int) Wicloud.parseDoubleValue(objs[31]));
			map.put("MediaTek", (int) Wicloud.parseDoubleValue(objs[32]));
			map.put("Qualcomm", (int) Wicloud.parseDoubleValue(objs[33]));
			map.put("Hisense", (int) Wicloud.parseDoubleValue(objs[34]));
			map.put("Roving", (int) Wicloud.parseDoubleValue(objs[35]));
			map.put("Simcom", (int) Wicloud.parseDoubleValue(objs[36]));
			map.put("SHARP", (int) Wicloud.parseDoubleValue(objs[37]));
			map.put("Wisol", (int) Wicloud.parseDoubleValue(objs[38]));
			map.put("Wistron", (int) Wicloud.parseDoubleValue(objs[39]));
			map.put("Amoi", (int) Wicloud.parseDoubleValue(objs[40]));
			map.put("BIRD", (int) Wicloud.parseDoubleValue(objs[41]));
			map.put("Philips", (int) Wicloud.parseDoubleValue(objs[42]));
			map.put("TCL", (int) Wicloud.parseDoubleValue(objs[43]));
			map.put("vivo", (int) Wicloud.parseDoubleValue(objs[44]));
			map.put("leTv", (int) Wicloud.parseDoubleValue(objs[45]));
			// 通过ArrayList构造函数把map.entrySet()转换成list
			mappingList = new ArrayList<Map.Entry<String, Integer>>(map.entrySet());
			// 通过比较器实现比较排序
			Collections.sort(mappingList,
					new Comparator<Map.Entry<String, Integer>>() {
						public int compare(Map.Entry<String, Integer> mapping1,
								Map.Entry<String, Integer> mapping2) {
							return mapping2.getValue().compareTo(
									mapping1.getValue());
						}
					});
			
			//计算消费等级start
			List list1 = branddisDao.findSumBranddis(start, finish);
			ArrayList<Map.Entry<String, Double>> mappingList1 = null;
			if (list1 != null && list1.size() > 0) {
				Object[] objs1 = (Object[]) list.get(0);
				Map<String, Double> map1 = new TreeMap<String, Double>();
				map1.put("counter", Wicloud.parseDoubleValue(objs[0]));
				map1.put("Apple", Wicloud.parseDoubleValue(objs[1]));
				map1.put("Samsung", Wicloud.parseDoubleValue(objs[2]));
				map1.put("Nokia", Wicloud.parseDoubleValue(objs[3]));
				map1.put("Sony", Wicloud.parseDoubleValue(objs[4]));
				map1.put("ZTE", Wicloud.parseDoubleValue(objs[5]));
				map1.put("HUAWEI", Wicloud.parseDoubleValue(objs[6]));
				map1.put("ASUS", Wicloud.parseDoubleValue(objs[7]));
				map1.put("Intel", Wicloud.parseDoubleValue(objs[8]));
				map1.put("honhai", Wicloud.parseDoubleValue(objs[9]));
				map1.put("HTC", Wicloud.parseDoubleValue(objs[10]));
				map1.put("Xiaomi", Wicloud.parseDoubleValue(objs[11]));
				map1.put("OPPO", Wicloud.parseDoubleValue(objs[12]));
				map1.put("LG", Wicloud.parseDoubleValue(objs[13]));
				map1.put("Lenovo", Wicloud.parseDoubleValue(objs[14]));
				map1.put("Meizu", Wicloud.parseDoubleValue(objs[15]));
				map1.put("Coolpad", Wicloud.parseDoubleValue(objs[16]));
				map1.put("bbk", Wicloud.parseDoubleValue(objs[17]));
				map1.put("TP_LINK", Wicloud.parseDoubleValue(objs[18]));
				map1.put("gionee", Wicloud.parseDoubleValue(objs[19]));
				map1.put("murata", Wicloud.parseDoubleValue(objs[20]));
				map1.put("inpro", Wicloud.parseDoubleValue(objs[21]));
				map1.put("AzureWave", Wicloud.parseDoubleValue(objs[22]));
				map1.put("liteon", Wicloud.parseDoubleValue(objs[23]));
				map1.put("arris", Wicloud.parseDoubleValue(objs[24]));
				map1.put("K_Touch", Wicloud.parseDoubleValue(objs[25]));
				map1.put("AcSiP", Wicloud.parseDoubleValue(objs[26]));
				map1.put("AsiaPacific", Wicloud.parseDoubleValue(objs[27]));
				map1.put("ChiMei", Wicloud.parseDoubleValue(objs[28]));
				map1.put("Foxconn", Wicloud.parseDoubleValue(objs[29]));
				map1.put("Garmin", Wicloud.parseDoubleValue(objs[30]));
				map1.put("Gemtek", Wicloud.parseDoubleValue(objs[31]));
				map1.put("MediaTek", Wicloud.parseDoubleValue(objs[32]));
				map1.put("Qualcomm", Wicloud.parseDoubleValue(objs[33]));
				map1.put("Hisense", Wicloud.parseDoubleValue(objs[34]));
				map1.put("Roving", Wicloud.parseDoubleValue(objs[35]));
				map1.put("Simcom", Wicloud.parseDoubleValue(objs[36]));
				map1.put("SHARP", Wicloud.parseDoubleValue(objs[37]));
				map1.put("Wisol", Wicloud.parseDoubleValue(objs[38]));
				map1.put("Wistron", Wicloud.parseDoubleValue(objs[39]));
				map1.put("Amoi", Wicloud.parseDoubleValue(objs[40]));
				map1.put("BIRD", Wicloud.parseDoubleValue(objs[41]));
				map1.put("Philips", Wicloud.parseDoubleValue(objs[42]));
				map1.put("TCL", Wicloud.parseDoubleValue(objs[43]));
				map1.put("vivo", Wicloud.parseDoubleValue(objs[44]));
				map1.put("leTv", Wicloud.parseDoubleValue(objs[45]));
				//通过ArrayList构造函数把map.entrySet()转换成list
				mappingList1 = new ArrayList<Map.Entry<String, Double>>(map1.entrySet());
				//通过比较器实现比较排序
				Collections.sort(mappingList1,
						new Comparator<Map.Entry<String, Double>>() {
							public int compare(Map.Entry<String, Double> mapping1,
									Map.Entry<String, Double> mapping2) {
								return mapping2.getValue().compareTo(
										mapping1.getValue());
							}
						});
			}
			double counter = mappingList1.get(0).getValue();
			String rank = "D";
			double c1=0,c12=0,c23=0,c35=0,c5=0;
			if(counter != 0) {
				int price = 0;
				Map<String, Integer> priceMap = new HashMap<String, Integer>(); 
				priceMap.put("Apple", PRICE_APPLE);
				priceMap.put("HUAWEI", PRICE_HUAWEI);
				priceMap.put("Xiaomi", PRICE_XIAOMI);
				priceMap.put("OPPO", PRICE_OPPO);
				priceMap.put("Samsung", PRICE_SAMSUNG);
				priceMap.put("vivo", PRICE_VIVO);
				priceMap.put("Meizu", PRICE_MEIZU);
				priceMap.put("leTv", PRICE_LETV);
				priceMap.put("Coolpad", PRICE_COOLPAD);
				priceMap.put("gionee", PRICE_GIONEE);
				for(Map.Entry<String, Double> mapping : mappingList1) {
					String brand1 = mapping.getKey();
					if(priceMap.containsKey(brand1)) {
						if (brand1.equals("Apple")) {
							c5 += mapping.getValue();
						} else if (brand1.equals("Samsung") || brand1.equals("gionee")) {
							c35 += mapping.getValue();
						} else if (brand1.equals("HUAWEI") || brand1.equals("OPPO") || brand1.equals("vivo")) {
							c23 += mapping.getValue();
						} else if (brand1.equals("Xiaomi") || brand1.equals("Meizu")) {
							c12 += mapping.getValue();
						} else if (brand1.equals("Coolpad") || brand1.equals("leTv")) {
							c1 = c1 + mapping.getValue();
						}
					}
					
				}
				c12=(double)(Math.round(c12/counter*100)/100.0);
				c23=(double)(Math.round(c23/counter*100)/100.0);
				c35=(double)(Math.round(c35/counter*100)/100.0);
				c5=(double)(Math.round(c5/counter*100)/100.0);
				c1=(double)(Math.round(c1/counter*100)/100.0);
				System.out.println(c1+","+c23+","+c35+","+c5);
				p.append(c5).append(",").append(c35).append(",").append(c23).append(",").append(c12).append(",").append(c1);
				
				for(Map.Entry<String, Double> mapping1 : mappingList1) {
					String brand1 = mapping1.getKey();
					if(priceMap.containsKey(brand1)) {
						price += (priceMap.get(brand1) * mapping1.getValue() / counter);
					}
				}
				if(price >= 0 && price < 1000) {
					rank = "D";
				} else if(price >= 1000 && price < 1500) {
					rank = "C";
				} else if(price >= 1500 && price < 2200) {
					rank = "B";
				} else if(price >= 2200 && price < 3000) {
					rank = "A";
				} else {
					rank = "A+";
				}
			}
			//计算消费等级end
			int ii = 10;
			double top10 = 0;
			for (Map.Entry<String, Integer> mapping : mappingList) {
				brand.append("{\"brand\":\"" + mapping.getKey()
						+ "\",\"value\":" + mapping.getValue() + "},");
				ii--;
				top10 = top10 + mapping.getValue();
				if (ii <= 0)
					break;
			}
			others = (int) (Wicloud.parseDoubleValue(objs[0]) - top10);
			brand.append("{\"brand\":\"Other\",\"value\":" + others + "}");
			return "{\"total\":" + (int)Wicloud.parseDoubleValue(objs[0]) + ",\"rank\":\""+rank+"\",\"brand\":[" + brand.toString()
					+ "]"+",\"p\":["+p.toString()+"]}";
		}

		return "";
	}
}

