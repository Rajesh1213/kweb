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
		if !current_user.resume.blank? and !params.include? "keywords"
		  params[:keywords] = current_user.resume.technology
		end
	    @search = JobPost.search do
	      fulltext params[:keywords]
	      order_by :updated_at, :desc
	      paginate :page => params[:page] || 1, :per_page => 5
	    end
	    @job_posts = @search.results
		render(:template => "/resumes/home")
	end

	def recruiter_home
		# if !current_user.job_posts.blank? and !params.include? "keywords"
		#   params[:keywords] = current_user.job_posts.order("id desc").limit(1)[0].job_position
		# end
	    @search = Resume.search do
	      fulltext params[:keywords]
	      order_by :updated_at, :desc
	      paginate :page => params[:page] || 1, :per_page => 5
	    end
	    @resumes = @search.results
		render(:template => "/job_posts/home")
	end

	def admin_home
		render(:template => "/home/index")
	end
end
