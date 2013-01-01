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
		logger.info"PARAMS >>> #{params.inspect}"
	    @search = JobPost.search do
	      fulltext params[:keywords]
	    end
	    @job_posts = @search.results
    	logger.info"@job_posts #{@job_posts.inspect}"
		render(:template => "/resumes/home")
	end

	def recruiter_home
		logger.info"PARAMS >>> #{params.inspect}"
	    @search = Resume.search do
	      fulltext params[:keywords]
	    end
	    @resumes = @search.results
    	logger.info"@resumes #{@resumes.inspect}"
		render(:template => "/job_posts/home")
	end

	def admin_home
		render(:template => "/home/index")
	end
end
