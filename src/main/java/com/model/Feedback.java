package com.model;

public class Feedback
{
	private int feedback_id, interview_schedule_id, rating;
	private String comment, skill_id;

	public Feedback()
	{
		super();

	}

	public Feedback(int feedback_id, int interview_schedule_id, int rating, String comment, String skill_id)
	{
		super();
		this.feedback_id = feedback_id;
		this.interview_schedule_id = interview_schedule_id;
		this.rating = rating;
		this.comment = comment;
		this.skill_id = skill_id;
	}

	@Override
	public String toString()
	{
		return "Feedback [feedback_id=" + feedback_id + ", interview_schedule_id=" + interview_schedule_id + ", rating="
				+ rating + ", comment=" + comment + ", skill_id=" + skill_id + "]";
	}

	public int getFeedback_id()
	{
		return feedback_id;
	}

	public void setFeedback_id(int feedback_id)
	{
		this.feedback_id = feedback_id;
	}

	public int getInterview_schedule_id()
	{
		return interview_schedule_id;
	}

	public void setInterview_schedule_id(int interview_schedule_id)
	{
		this.interview_schedule_id = interview_schedule_id;
	}

	public int getRating()
	{
		return rating;
	}

	public void setRating(int rating)
	{
		this.rating = rating;
	}

	public String getComment()
	{
		return comment;
	}

	public void setComment(String comment)
	{
		this.comment = comment;
	}

	public String getSkill_id()
	{
		return skill_id;
	}

	public void setSkill_id(String skill_id)
	{
		this.skill_id = skill_id;
	}

}
