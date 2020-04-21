package com.pikachuMVC.model;

import java.io.Serializable;
import java.sql.Blob;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;



@Entity
@Table(name = "cards")

public class CardBean implements Serializable{
	public CardBean() {
		super();
	}
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private	Integer		c_id;
	private	String      c_name ;			
	private	String		bank 	;		
	private	String		annlfee ;		
	private	Blob		c_img 	;		
	private	Double		fcb 	;		
	private	Double		dcb 	;		
	private	String		fcb_n ;		
	private	String		dcb_n 	;		
	private	String		fma 	;		
	private	String		dma 	;		
	private	String		fma_n 	;		
	private	String		dma_n 	;		
	private Double		refuel_cb ;		
	private String		refuel_dis 	;	
	private String		refuel_cb_n ;	
	private String		refuel_dis_n ;
	private String		wkdmoviedis 	;
	private String		moviedis 		;
	private String		wkdmoviedis_n ;
	private String		moviedis_n 		;
	private String		ditigalfb 		;
	private String		onlinefb 		;
	private String		ditigalfb_n 	;
	private String		onlinefb_n 		;
	private String		zeroins 		;
	private String		minins 			;
	private String		zeroins_n 		;
	private String		minins_n 		;
	private String		mileagefb 		;
	private String		cashfb 			;
	private String		mileagefb_n 	;
	private String		cashfb_n 		;
	private Integer		annual_income ;
	private String		c_type 		  ;
	
	public Integer getC_id() {
		return c_id;
	}
	public void setC_id(Integer c_id) {
		this.c_id = c_id;
	}
	public String getC_name() {
		return c_name;
	}
	public void setC_name(String c_name) {
		this.c_name = c_name;
	}
	public String getBank() {
		return bank;
	}
	public void setBank(String bank) {
		this.bank = bank;
	}
	public String getAnnlfee() {
		return annlfee;
	}
	public void setAnnlfee(String annlfee) {
		this.annlfee = annlfee;
	}
	public Blob getC_img() {
		return c_img;
	}
	public void setC_img(Blob c_img) {
		this.c_img = c_img;
	}
	public Double getFcb() {
		return fcb;
	}
	public void setFcb(Double fcb) {
		this.fcb = fcb;
	}
	public Double getDcb() {
		return dcb;
	}
	public void setDcb(Double dcb) {
		this.dcb = dcb;
	}
	public String getFcb_n() {
		return fcb_n;
	}
	public void setFcb_n(String fcb_n) {
		this.fcb_n = fcb_n;
	}
	public String getDcb_n() {
		return dcb_n;
	}
	public void setDcb_n(String dcb_n) {
		this.dcb_n = dcb_n;
	}
	public String getFma() {
		return fma;
	}
	public void setFma(String fma) {
		this.fma = fma;
	}
	public String getDma() {
		return dma;
	}
	public void setDma(String dma) {
		this.dma = dma;
	}
	public String getFma_n() {
		return fma_n;
	}
	public void setFma_n(String fma_n) {
		this.fma_n = fma_n;
	}
	public String getDma_n() {
		return dma_n;
	}
	public void setDma_n(String dma_n) {
		this.dma_n = dma_n;
	}
	public Double getRefuel_cb() {
		return refuel_cb;
	}
	public void setRefuel_cb(Double refuel_cb) {
		this.refuel_cb = refuel_cb;
	}
	public String getRefuel_dis() {
		return refuel_dis;
	}
	public void setRefuel_dis(String refuel_dis) {
		this.refuel_dis = refuel_dis;
	}
	public String getRefuel_cb_n() {
		return refuel_cb_n;
	}
	public void setRefuel_cb_n(String refuel_cb_n) {
		this.refuel_cb_n = refuel_cb_n;
	}
	public String getRefuel_dis_n() {
		return refuel_dis_n;
	}
	public void setRefuel_dis_n(String refuel_dis_n) {
		this.refuel_dis_n = refuel_dis_n;
	}
	public String getWkdmoviedis() {
		return wkdmoviedis;
	}
	public void setWkdmoviedis(String wkdmoviedis) {
		this.wkdmoviedis = wkdmoviedis;
	}
	public String getMoviedis() {
		return moviedis;
	}
	public void setMoviedis(String moviedis) {
		this.moviedis = moviedis;
	}
	public String getWkdmoviedis_n() {
		return wkdmoviedis_n;
	}
	public void setWkdmoviedis_n(String wkdmoviedis_n) {
		this.wkdmoviedis_n = wkdmoviedis_n;
	}
	public String getMoviedis_n() {
		return moviedis_n;
	}
	public void setMoviedis_n(String moviedis_n) {
		this.moviedis_n = moviedis_n;
	}
	public String getDitigalfb() {
		return ditigalfb;
	}
	public void setDitigalfb(String ditigalfb) {
		this.ditigalfb = ditigalfb;
	}
	public String getOnlinefb() {
		return onlinefb;
	}
	public void setOnlinefb(String onlinefb) {
		this.onlinefb = onlinefb;
	}
	public String getDitigalfb_n() {
		return ditigalfb_n;
	}
	public void setDitigalfb_n(String ditigalfb_n) {
		this.ditigalfb_n = ditigalfb_n;
	}
	public String getOnlinefb_n() {
		return onlinefb_n;
	}
	public void setOnlinefb_n(String onlinefb_n) {
		this.onlinefb_n = onlinefb_n;
	}
	public String getZeroins() {
		return zeroins;
	}
	public void setZeroins(String zeroins) {
		this.zeroins = zeroins;
	}
	public String getMinins() {
		return minins;
	}
	public void setMinins(String minins) {
		this.minins = minins;
	}
	public String getZeroins_n() {
		return zeroins_n;
	}
	public void setZeroins_n(String zeroins_n) {
		this.zeroins_n = zeroins_n;
	}
	public String getMinins_n() {
		return minins_n;
	}
	public void setMinins_n(String minins_n) {
		this.minins_n = minins_n;
	}
	public String getMileagefb() {
		return mileagefb;
	}
	public void setMileagefb(String mileagefb) {
		this.mileagefb = mileagefb;
	}
	public String getCashfb() {
		return cashfb;
	}
	public void setCashfb(String cashfb) {
		this.cashfb = cashfb;
	}
	public String getMileagefb_n() {
		return mileagefb_n;
	}
	public void setMileagefb_n(String mileagefb_n) {
		this.mileagefb_n = mileagefb_n;
	}
	public String getCashfb_n() {
		return cashfb_n;
	}
	public void setCashfb_n(String cashfb_n) {
		this.cashfb_n = cashfb_n;
	}
	public Integer getAnnual_income() {
		return annual_income;
	}
	public void setAnnual_income(Integer annual_income) {
		this.annual_income = annual_income;
	}
	public String getC_type() {
		return c_type;
	}
	public void setC_type(String c_type) {
		this.c_type = c_type;
	}

	
	
	
}
