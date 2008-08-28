package gov.nih.nci.security.migrate.webapp.util;

import java.util.SortedMap;
import java.util.TreeMap;

public class SystemManager
{

	private static SortedMap<String, String> statesMap = null;
	private static SortedMap<String, String> countryMap = null;

	
	public static SortedMap getUSAStatesMap()
	{
		if(statesMap ==null){
			statesMap = new TreeMap<String, String>();
			statesMap.put("AK","AK");
			statesMap.put("AL","AL");
			statesMap.put("AR","AR");
			statesMap.put("AS","AS");
			statesMap.put("AZ","AZ");
			statesMap.put("CA","CA");
			statesMap.put("CO","CO");
			statesMap.put("CT","CT");
			statesMap.put("DC","DC");
			statesMap.put("DE","DE");
			statesMap.put("FL","FL");
			statesMap.put("FM","FM");
			statesMap.put("GA","GA");
			statesMap.put("GU","GU");
			statesMap.put("HI","HI");
			statesMap.put("IA","IA");
			statesMap.put("ID","ID");
			statesMap.put("IL","IL");
			statesMap.put("IN","IN");
			statesMap.put("KS","KS");
			statesMap.put("KY","KY");
			statesMap.put("LA","LA");
			statesMap.put("MA","MA");
			statesMap.put("MD","MD");
			statesMap.put("ME","ME");
			statesMap.put("MH","MH");
			statesMap.put("MI","MI");
			statesMap.put("MN","MN");
			statesMap.put("MO","MO");
			statesMap.put("MP","MP");
			statesMap.put("MS","MS");
			statesMap.put("MT","MT");
			statesMap.put("NC","NC");
			statesMap.put("ND","ND");
			statesMap.put("NE","NE");
			statesMap.put("NH","NH");
			statesMap.put("NJ","NJ");
			statesMap.put("NM","NM");
			statesMap.put("NV","NV");
			statesMap.put("NY","NY");
			statesMap.put("OH","OH");
			statesMap.put("OK","OK");
			statesMap.put("OR","OR");
			statesMap.put("Outside_US","Outside_US");
			statesMap.put("PA","PA");
			statesMap.put("PR","PR");
			statesMap.put("RI","RI");
			statesMap.put("SC","SC");
			statesMap.put("SD","SD");
			statesMap.put("TN","TN");
			statesMap.put("TX","TX");
			statesMap.put("UT","UT");
			statesMap.put("VA","VA");
			statesMap.put("VI","VI");
			statesMap.put("VT","VT");
			statesMap.put("WA","WA");
			statesMap.put("WI","WI");
			statesMap.put("WV","WV");
			statesMap.put("WY","WY");
		}
		return statesMap;
	}
	
	public static SortedMap getCountryMap(){
		if(countryMap == null){
			countryMap = new TreeMap<String, String>();
			countryMap.put("AD","AD");
			countryMap.put("AE","AE");
			countryMap.put("AF","AF");
			countryMap.put("AG","AG");
			countryMap.put("AI","AI");
			countryMap.put("AL","AL");
			countryMap.put("AM","AM");
			countryMap.put("AN","AN");
			countryMap.put("AO","AO");
			countryMap.put("AQ","AQ");
			countryMap.put("AR","AR");
			countryMap.put("AS","AS");
			countryMap.put("AT","AT");
			countryMap.put("AU","AU");
			countryMap.put("AW","AW");
			countryMap.put("AZ","AZ");
			countryMap.put("BA","BA");
			countryMap.put("BB","BB");
			countryMap.put("BD","BD");
			countryMap.put("BE","BE");
			countryMap.put("BF","BF");
			countryMap.put("BG","BG");
			countryMap.put("BH","BH");
			countryMap.put("BI","BI");
			countryMap.put("BJ","BJ");
			countryMap.put("BM","BM");
			countryMap.put("BN","BN");
			countryMap.put("BO","BO");
			countryMap.put("BR","BR");
			countryMap.put("BS","BS");
			countryMap.put("BT","BT");
			countryMap.put("BV","BV");
			countryMap.put("BW","BW");
			countryMap.put("BY","BY");
			countryMap.put("BZ","BZ");
			countryMap.put("CA","CA");
			countryMap.put("CC","CC");
			countryMap.put("CD","CD");
			countryMap.put("CF","CF");
			countryMap.put("CG","CG");
			countryMap.put("CH","CH");
			countryMap.put("CI","CI");
			countryMap.put("CK","CK");
			countryMap.put("CL","CL");
			countryMap.put("CM","CM");
			countryMap.put("CN","CN");
			countryMap.put("CO","CO");
			countryMap.put("CR","CR");
			countryMap.put("CU","CU");
			countryMap.put("CV","CV");
			countryMap.put("CX","CX");
			countryMap.put("CY","CY");
			countryMap.put("CZ","CZ");
			countryMap.put("DE","DE");
			countryMap.put("DJ","DJ");
			countryMap.put("DK","DK");
			countryMap.put("DM","DM");
			countryMap.put("DO","DO");
			countryMap.put("DZ","DZ");
			countryMap.put("EC","EC");
			countryMap.put("EE","EE");
			countryMap.put("EG","EG");
			countryMap.put("EH","EH");
			countryMap.put("ER","ER");
			countryMap.put("ES","ES");
			countryMap.put("ET","ET");
			countryMap.put("FI","FI");
			countryMap.put("FJ","FJ");
			countryMap.put("FK","FK");
			countryMap.put("FM","FM");
			countryMap.put("FO","FO");
			countryMap.put("FR","FR");
			countryMap.put("GA","GA");
			countryMap.put("GB","GB");
			countryMap.put("GD","GD");
			countryMap.put("GE","GE");
			countryMap.put("GF","GF");
			countryMap.put("GH","GH");
			countryMap.put("GI","GI");
			countryMap.put("GL","GL");
			countryMap.put("GM","GM");
			countryMap.put("GN","GN");
			countryMap.put("GP","GP");
			countryMap.put("GQ","GQ");
			countryMap.put("GR","GR");
			countryMap.put("GS","GS");
			countryMap.put("GT","GT");
			countryMap.put("GU","GU");
			countryMap.put("GW","GW");
			countryMap.put("GY","GY");
			countryMap.put("HK","HK");
			countryMap.put("HM","HM");
			countryMap.put("HN","HN");
			countryMap.put("HR","HR");
			countryMap.put("HT","HT");
			countryMap.put("HU","HU");
			countryMap.put("ID","ID");
			countryMap.put("IE","IE");
			countryMap.put("IL","IL");
			countryMap.put("IN","IN");
			countryMap.put("IO","IO");
			countryMap.put("IQ","IQ");
			countryMap.put("IR","IR");
			countryMap.put("IS","IS");
			countryMap.put("IT","IT");
			countryMap.put("JM","JM");
			countryMap.put("JO","JO");
			countryMap.put("JP","JP");
			countryMap.put("KE","KE");
			countryMap.put("KG","KG");
			countryMap.put("KH","KH");
			countryMap.put("KI","KI");
			countryMap.put("KM","KM");
			countryMap.put("KN","KN");
			countryMap.put("KP","KP");
			countryMap.put("KR","KR");
			countryMap.put("KW","KW");
			countryMap.put("KY","KY");
			countryMap.put("KZ","KZ");
			countryMap.put("LA","LA");
			countryMap.put("LB","LB");
			countryMap.put("LC","LC");
			countryMap.put("LI","LI");
			countryMap.put("LK","LK");
			countryMap.put("LR","LR");
			countryMap.put("LS","LS");
			countryMap.put("LT","LT");
			countryMap.put("LU","LU");
			countryMap.put("LV","LV");
			countryMap.put("LY","LY");
			countryMap.put("MA","MA");
			countryMap.put("MC","MC");
			countryMap.put("MD","MD");
			countryMap.put("MG","MG");
			countryMap.put("MH","MH");
			countryMap.put("MK","MK");
			countryMap.put("ML","ML");
			countryMap.put("MM","MM");
			countryMap.put("MN","MN");
			countryMap.put("MO","MO");
			countryMap.put("MP","MP");
			countryMap.put("MQ","MQ");
			countryMap.put("MR","MR");
			countryMap.put("MS","MS");
			countryMap.put("MT","MT");
			countryMap.put("MU","MU");
			countryMap.put("MV","MV");
			countryMap.put("MW","MW");
			countryMap.put("MX","MX");
			countryMap.put("MY","MY");
			countryMap.put("MZ","MZ");
			countryMap.put("NA","NA");
			countryMap.put("NC","NC");
			countryMap.put("NE","NE");
			countryMap.put("NF","NF");
			countryMap.put("NG","NG");
			countryMap.put("NI","NI");
			countryMap.put("NL","NL");
			countryMap.put("NO","NO");
			countryMap.put("NP","NP");
			countryMap.put("NR","NR");
			countryMap.put("NU","NU");
			countryMap.put("NZ","NZ");
			countryMap.put("OM","OM");
			countryMap.put("PA","PA");
			countryMap.put("PE","PE");
			countryMap.put("PF","PF");
			countryMap.put("PG","PG");
			countryMap.put("PH","PH");
			countryMap.put("PK","PK");
			countryMap.put("PL","PL");
			countryMap.put("PM","PM");
			countryMap.put("PN","PN");
			countryMap.put("PR","PR");
			countryMap.put("PS","PS");
			countryMap.put("PT","PT");
			countryMap.put("PW","PW");
			countryMap.put("PY","PY");
			countryMap.put("QA","QA");
			countryMap.put("RE","RE");
			countryMap.put("RO","RO");
			countryMap.put("RU","RU");
			countryMap.put("RW","RW");
			countryMap.put("SA","SA");
			countryMap.put("SB","SB");
			countryMap.put("SC","SC");
			countryMap.put("SD","SD");
			countryMap.put("SE","SE");
			countryMap.put("SG","SG");
			countryMap.put("SH","SH");
			countryMap.put("SI","SI");
			countryMap.put("SJ","SJ");
			countryMap.put("SK","SK");
			countryMap.put("SL","SL");
			countryMap.put("SM","SM");
			countryMap.put("SN","SN");
			countryMap.put("SO","SO");
			countryMap.put("SR","SR");
			countryMap.put("ST","ST");
			countryMap.put("SV","SV");
			countryMap.put("SY","SY");
			countryMap.put("SZ","SZ");
			countryMap.put("TC","TC");
			countryMap.put("TD","TD");
			countryMap.put("TF","TF");
			countryMap.put("TG","TG");
			countryMap.put("TH","TH");
			countryMap.put("TJ","TJ");
			countryMap.put("TK","TK");
			countryMap.put("TM","TM");
			countryMap.put("TN","TN");
			countryMap.put("TO","TO");
			countryMap.put("TP","TP");
			countryMap.put("TR","TR");
			countryMap.put("TT","TT");
			countryMap.put("TV","TV");
			countryMap.put("TW","TW");
			countryMap.put("TZ","TZ");
			countryMap.put("UA","UA");
			countryMap.put("UG","UG");
			countryMap.put("UM","UM");
			countryMap.put("US","US");
			countryMap.put("UY","UY");
			countryMap.put("UZ","UZ");
			countryMap.put("VA","VA");
			countryMap.put("VC","VC");
			countryMap.put("VE","VE");
			countryMap.put("VG","VG");
			countryMap.put("VI","VI");
			countryMap.put("VN","VN");
			countryMap.put("VU","VU");
			countryMap.put("WF","WF");
			countryMap.put("WS","WS");
			countryMap.put("YE","YE");
			countryMap.put("YT","YT");
			countryMap.put("YU","YU");
			countryMap.put("ZA","ZA");
			countryMap.put("ZM","ZM");
			countryMap.put("ZW","ZW");

		}
		return countryMap;
	}

	
}