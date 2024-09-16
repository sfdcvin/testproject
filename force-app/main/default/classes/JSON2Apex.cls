public class JSON2Apex {

    public Boolean error;
    public Boolean success;
	public String message;
	public Compliance compliance;
	public TaxpayerInfo taxpayerInfo;
	public List<Filing> filing;

	public class Compliance {
		public Object filingFrequency;
	}

	public class Filing {
	}

	public class Addr {
		public String flno;
		public String bnm;
		public String stcd;
		public String city;
		public String bno;
		public String lg;
		public String st;
		public String pncd;
		public String lt;
		public String loc;
		public String dst;
	}

	public class Adadr {
		public String ntr;
		public Addr addr;
	}

	public class TaxpayerInfo {
		public String lgnm;
		public List<String> nba;
		public List<Adadr> adadr;
		public String sts;
		public String ctj;
		public String ctjCd;
		public String dty;
		public String tradeNam;
		public String rgdt;
		public String cxdt;
		public Adadr pradr;
		public String stj;
		public String lstupdt;
		public String gstin;
		public String stjCd;
		public String ctb;
	}

	
	public static JSON2Apex parse(String json) {
		return (JSON2Apex) System.JSON.deserialize(json, JSON2Apex.class);
	}
}