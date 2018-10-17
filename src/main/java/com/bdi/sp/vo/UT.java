package com.bdi.sp.vo;

public class UT {

	private Integer utnum;
	private String utid;
	private String utpwd;
	private String utname;
	private Character utgd;
	private String utbd;
	private String uthb;
	private String utadd;
	private String utre;
	private String utdesc;
	public Integer getUtnum() {
		return utnum;
	}
	public void setUtnum(Integer utnum) {
		this.utnum = utnum;
	}
	public String getUtid() {
		return utid;
	}
	public void setUtid(String utid) {
		this.utid = utid;
	}
	public String getUtpwd() {
		return utpwd;
	}
	public void setUtpwd(String utpwd) {
		this.utpwd = utpwd;
	}
	public String getUtname() {
		return utname;
	}
	public void setUtname(String utname) {
		this.utname = utname;
	}
	public Character getUtgd() {
		return utgd;
	}
	public void setUtgd(Character utgd) {
		this.utgd = utgd;
	}
	public String getUtbd() {
		return utbd;
	}
	public void setUtbd(String utbd) {
		this.utbd = utbd;
	}
	public String getUthb() {
		return uthb;
	}
	public void setUthb(String uthb) {
		this.uthb = uthb;
	}
	public String getUtadd() {
		return utadd;
	}
	public void setUtadd(String utadd) {
		this.utadd = utadd;
	}
	public String getUtre() {
		return utre;
	}
	public void setUtre(String utre) {
		this.utre = utre;
	}
	public String getUtdesc() {
		return utdesc;
	}
	public void setUtdesc(String utdesc) {
		this.utdesc = utdesc;
	}
	@Override
	public String toString() {
		return "UT [utnum=" + utnum + ", utid=" + utid + ", utpwd=" + utpwd + ", utname=" + utname + ", utgd=" + utgd
				+ ", utbd=" + utbd + ", uthb=" + uthb + ", utadd=" + utadd + ", utre=" + utre + ", utdesc=" + utdesc
				+ "]";
	}
	
}
