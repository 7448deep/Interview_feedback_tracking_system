package com.model;

import java.sql.Blob;

public class Resume 
{
	private int resume_id;
	private int candidate_id;
	private Blob resume;
	public Resume() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Resume(int resume_id, int candidate_id, Blob resume) {
		super();
		this.resume_id = resume_id;
		this.candidate_id = candidate_id;
		this.resume = resume;
	}
	@Override
	public String toString() {
		return "Resume [resume_id=" + resume_id + ", candidate_id=" + candidate_id + ", resume=" + resume + "]";
	}
	public int getResume_id() {
		return resume_id;
	}
	public void setResume_id(int resume_id) {
		this.resume_id = resume_id;
	}
	public int getCandidate_id() {
		return candidate_id;
	}
	public void setCandidate_id(int candidate_id) {
		this.candidate_id = candidate_id;
	}
	public Blob getResume() {
		return resume;
	}
	public void setResume(Blob resume) {
		this.resume = resume;
	}
	
	
}
