package com.model;

import java.sql.Timestamp;

//this class have all the variable required regarding candidates also these are the column names for candidate table
public class Candidate
{
	private int candidate_id;
	private String fname;
	private String lname;
	private long mobileno;
	private String emailid;
	private String highqualification;
	private int totalyearofexperience;
	private String previousorg;
	private String coreskills;
	private int appliedforrole;
	private String initialfeedback;
	private int maxCompletedRound;
	private int maxScheduledRound;
	private int candidate_status;
	private int assignment_status;
	private int assignment_id;
	private Timestamp createdOn;
	private int createdBy;
	private int updatedOn;
	private int updatedBy;
	private int isActive;
	public Candidate() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Candidate(int candidate_id, String fname, String lname, long mobileno, String emailid,
			String highqualification, int totalyearofexperience, String previousorg, String coreskills,
			int appliedforrole, String initialfeedback, int maxCompletedRound, int maxScheduledRound,
			int candidate_status, int assignment_status, int assignment_id, Timestamp createdOn, int createdBy,
			int updatedOn, int updatedBy, int isActive) {
		super();
		this.candidate_id = candidate_id;
		this.fname = fname;
		this.lname = lname;
		this.mobileno = mobileno;
		this.emailid = emailid;
		this.highqualification = highqualification;
		this.totalyearofexperience = totalyearofexperience;
		this.previousorg = previousorg;
		this.coreskills = coreskills;
		this.appliedforrole = appliedforrole;
		this.initialfeedback = initialfeedback;
		this.maxCompletedRound = maxCompletedRound;
		this.maxScheduledRound = maxScheduledRound;
		this.candidate_status = candidate_status;
		this.assignment_status = assignment_status;
		this.assignment_id = assignment_id;
		this.createdOn = createdOn;
		this.createdBy = createdBy;
		this.updatedOn = updatedOn;
		this.updatedBy = updatedBy;
		this.isActive = isActive;
	}
	@Override
	public String toString() {
		return "Candidate [candidate_id=" + candidate_id + ", fname=" + fname + ", lname=" + lname + ", mobileno="
				+ mobileno + ", emailid=" + emailid + ", highqualification=" + highqualification
				+ ", totalyearofexperience=" + totalyearofexperience + ", previousorg=" + previousorg + ", coreskills="
				+ coreskills + ", appliedforrole=" + appliedforrole + ", initialfeedback=" + initialfeedback
				+ ", maxCompletedRound=" + maxCompletedRound + ", maxScheduledRound=" + maxScheduledRound
				+ ", candidate_status=" + candidate_status + ", assignment_status=" + assignment_status
				+ ", assignment_id=" + assignment_id + ", createdOn=" + createdOn + ", createdBy=" + createdBy
				+ ", updatedOn=" + updatedOn + ", updatedBy=" + updatedBy + ", isActive=" + isActive + "]";
	}
	public int getCandidate_id() {
		return candidate_id;
	}
	public void setCandidate_id(int candidate_id) {
		this.candidate_id = candidate_id;
	}
	public String getFname() {
		return fname;
	}
	public void setFname(String fname) {
		this.fname = fname;
	}
	public String getLname() {
		return lname;
	}
	public void setLname(String lname) {
		this.lname = lname;
	}
	public long getMobileno() {
		return mobileno;
	}
	public void setMobileno(long mobileno) {
		this.mobileno = mobileno;
	}
	public String getEmailid() {
		return emailid;
	}
	public void setEmailid(String emailid) {
		this.emailid = emailid;
	}
	public String getHighqualification() {
		return highqualification;
	}
	public void setHighqualification(String highqualification) {
		this.highqualification = highqualification;
	}
	public int getTotalyearofexperience() {
		return totalyearofexperience;
	}
	public void setTotalyearofexperience(int totalyearofexperience) {
		this.totalyearofexperience = totalyearofexperience;
	}
	public String getPreviousorg() {
		return previousorg;
	}
	public void setPreviousorg(String previousorg) {
		this.previousorg = previousorg;
	}
	public String getCoreskills() {
		return coreskills;
	}
	public void setCoreskills(String coreskills) {
		this.coreskills = coreskills;
	}
	public int getAppliedforrole() {
		return appliedforrole;
	}
	public void setAppliedforrole(int appliedforrole) {
		this.appliedforrole = appliedforrole;
	}
	public String getInitialfeedback() {
		return initialfeedback;
	}
	public void setInitialfeedback(String initialfeedback) {
		this.initialfeedback = initialfeedback;
	}
	public int getMaxCompletedRound() {
		return maxCompletedRound;
	}
	public void setMaxCompletedRound(int maxCompletedRound) {
		this.maxCompletedRound = maxCompletedRound;
	}
	public int getMaxScheduledRound() {
		return maxScheduledRound;
	}
	public void setMaxScheduledRound(int maxScheduledRound) {
		this.maxScheduledRound = maxScheduledRound;
	}
	public int getCandidate_status() {
		return candidate_status;
	}
	public void setCandidate_status(int candidate_status) {
		this.candidate_status = candidate_status;
	}
	public int getAssignment_status() {
		return assignment_status;
	}
	public void setAssignment_status(int assignment_status) {
		this.assignment_status = assignment_status;
	}
	public int getAssignment_id() {
		return assignment_id;
	}
	public void setAssignment_id(int assignment_id) {
		this.assignment_id = assignment_id;
	}
	public Timestamp getCreatedOn() {
		return createdOn;
	}
	public void setCreatedOn(Timestamp createdOn) {
		this.createdOn = createdOn;
	}
	public int getCreatedBy() {
		return createdBy;
	}
	public void setCreatedBy(int createdBy) {
		this.createdBy = createdBy;
	}
	public int getUpdatedOn() {
		return updatedOn;
	}
	public void setUpdatedOn(int updatedOn) {
		this.updatedOn = updatedOn;
	}
	public int getUpdatedBy() {
		return updatedBy;
	}
	public void setUpdatedBy(int updatedBy) {
		this.updatedBy = updatedBy;
	}
	public int getIsActive() {
		return isActive;
	}
	public void setIsActive(int isActive) {
		this.isActive = isActive;
	}

}
