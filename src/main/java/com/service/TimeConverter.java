package com.service;

public class TimeConverter
{
	public static String changeTimeTo12Hours(String timein24hours)
	{
		int hours = Integer.parseInt("" + timein24hours.charAt(0) + timein24hours.charAt(1));

		int min = Integer.parseInt("" + timein24hours.charAt(3) + timein24hours.charAt(4));
		String timeIn12Hours = "";
		if (hours >= 0 && hours <= 24 && min >= 0 && min <= 60)
		{
			String AMorPM = "AM";
			// checking AM PM
			if (hours >= 12)
				AMorPM = "PM";
			// Checking 12Am
			if (hours == 0)
			{
				hours = 12;
			} else
			{
				if (hours == 12)
				{
					hours = 12;
				} else
				{
					hours = (hours % 12);
				}
			}
			// Adding Zero before one digit value
			String hrs;
			String min_;
			if (hours < 10)
			{
				hrs = "0" + hours;
			} else
			{
				hrs = "" + hours;
			}
			if (min < 10)
			{
				min_ = "0" + min;
			} else
			{
				min_ = "" + min;
			}
			timeIn12Hours = hrs + ":" + min + " " + AMorPM;
		}
		return timeIn12Hours;
	}
}
