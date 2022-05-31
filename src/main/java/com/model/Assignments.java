package com.model;

import java.sql.Blob;

public class Assignments
{
	private int assignment_id;
	private Blob assignment_problem;
	private Blob assignment_solution;
	public Assignments()
	{
		super();
		// TODO Auto-generated constructor stub
	}
	public Assignments(int assignment_id, Blob assignment_problem, Blob assignment_solution) {
		super();
		this.assignment_id = assignment_id;
		this.assignment_problem = assignment_problem;
		this.assignment_solution = assignment_solution;
	}
	@Override
	public String toString() {
		return "Assignments [assignment_id=" + assignment_id + ", assignment_problem=" + assignment_problem
				+ ", assignment_solution=" + assignment_solution + "]";
	}
	public int getAssignment_id() {
		return assignment_id;
	}
	public void setAssignment_id(int assignment_id) {
		this.assignment_id = assignment_id;
	}
	public Blob getAssignment_problem() {
		return assignment_problem;
	}
	public void setAssignment_problem(Blob assignment_problem) {
		this.assignment_problem = assignment_problem;
	}
	public Blob getAssignment_solution() {
		return assignment_solution;
	}
	public void setAssignment_solution(Blob assignment_solution) {
		this.assignment_solution = assignment_solution;
	}

	
}
