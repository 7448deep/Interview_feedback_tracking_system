package com.model;

public class Interview_Schedule
{
	private int interview_schedule_id;
	private int candidate_id;
	private int employee_id;
	private String date;
	private int round_no;
	private int iscomplete;
	private String roundFeedback;
	private int round_type;
	private int tech_round_no;
	private int hr_round_no;
	private String start_time;
	private String end_time;
	private String platform;
	private String meetingLink;

	public Interview_Schedule()
	{
		super();
		// TODO Auto-generated constructor stub
	}

	public Interview_Schedule(int interview_schedule_id, int candidate_id, int employee_id, String date, int round_no,
			int iscomplete, String roundFeedback, int round_type, int tech_round_no, int hr_round_no, String start_time,
			String end_time, String platform, String meetingLink)
	{
		super();
		this.interview_schedule_id = interview_schedule_id;
		this.candidate_id = candidate_id;
		this.employee_id = employee_id;
		this.date = date;
		this.round_no = round_no;
		this.iscomplete = iscomplete;
		this.roundFeedback = roundFeedback;
		this.round_type = round_type;
		this.tech_round_no = tech_round_no;
		this.hr_round_no = hr_round_no;
		this.start_time = start_time;
		this.end_time = end_time;
		this.platform = platform;
		this.meetingLink = meetingLink;
	}

	@Override
	public String toString()
	{
		return "Interview_Schedule [interview_schedule_id=" + interview_schedule_id + ", candidate_id=" + candidate_id
				+ ", employee_id=" + employee_id + ", date=" + date + ", round_no=" + round_no + ", iscomplete="
				+ iscomplete + ", roundFeedback=" + roundFeedback + ", round_type=" + round_type + ", tech_round_no="
				+ tech_round_no + ", hr_round_no=" + hr_round_no + ", start_time=" + start_time + ", end_time="
				+ end_time + ", platform=" + platform + ", meetingLink=" + meetingLink + "]";
	}

	public int getInterview_schedule_id()
	{
		return interview_schedule_id;
	}

	public void setInterview_schedule_id(int interview_schedule_id)
	{
		this.interview_schedule_id = interview_schedule_id;
	}

	public int getCandidate_id()
	{
		return candidate_id;
	}

	public void setCandidate_id(int candidate_id)
	{
		this.candidate_id = candidate_id;
	}

	public int getEmployee_id()
	{
		return employee_id;
	}

	public void setEmployee_id(int employee_id)
	{
		this.employee_id = employee_id;
	}

	public String getDate()
	{
		return date;
	}

	public void setDate(String date)
	{
		this.date = date;
	}

	public int getRound_no()
	{
		return round_no;
	}

	public void setRound_no(int round_no)
	{
		this.round_no = round_no;
	}

	public int getIscomplete()
	{
		return iscomplete;
	}

	public void setIscomplete(int iscomplete)
	{
		this.iscomplete = iscomplete;
	}

	public String getRoundFeedback()
	{
		return roundFeedback;
	}

	public void setRoundFeedback(String roundFeedback)
	{
		this.roundFeedback = roundFeedback;
	}

	public int getRound_type()
	{
		return round_type;
	}

	public void setRound_type(int round_type)
	{
		this.round_type = round_type;
	}

	public int getTech_round_no()
	{
		return tech_round_no;
	}

	public void setTech_round_no(int tech_round_no)
	{
		this.tech_round_no = tech_round_no;
	}

	public int getHr_round_no()
	{
		return hr_round_no;
	}

	public void setHr_round_no(int hr_round_no)
	{
		this.hr_round_no = hr_round_no;
	}

	public String getStart_time()
	{
		return start_time;
	}

	public void setStart_time(String start_time)
	{
		this.start_time = start_time;
	}

	public String getEnd_time()
	{
		return end_time;
	}

	public void setEnd_time(String end_time)
	{
		this.end_time = end_time;
	}

	public String getPlatform()
	{
		return platform;
	}

	public void setPlatform(String platform)
	{
		this.platform = platform;
	}

	public String getMeetingLink()
	{
		return meetingLink;
	}

	public void setMeetingLink(String meetingLink)
	{
		this.meetingLink = meetingLink;
	}

}
