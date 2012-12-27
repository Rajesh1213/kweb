class HomeController < ApplicationController
	before_filter :authenticate_user!

	def index
		
	end

	def home
		case(current_user.type_of_user)
		when "job_seeker" then job_seeker_home
		when "recruiter" then recruiter_home
		else admin_home
		end
	end

	protected

	def job_seeker_home
		render(:template => "/resumes/home")
	end

	def recruiter_home
		render(:template => "/job_posts/home")
	end

	def admin_home
		render(:template => "/home/index")
	end
end
