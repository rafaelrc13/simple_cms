class SectionsController < ApplicationController

	layout "admin"

	before_filter :confirm_logged_in
	before_filter :find_page


	def index 
		list
		render('list')
	end

	def list 
		@sections = Section.sorted.where(:page_id => @page.id)
	end

	def show 
		@section = Section.find(params[:id])
	end

	def new 
		@section = Section.new(:page_id => @page.id)
		@section_count = @page.sections.size + 1
		@pages = Page.sorted
	end

	def create 
		new_position = params[:section].delete(:position)
		# Instatiate a new object using form parameters
		@section = Section.new(params[:section])
		#Save the object
		if @section.save
			@section.move_to_position(new_position)
			# if succeeds, redirect to list action
			flash[:notice] = "Section created successfully."
			redirect_to(:action =>'list', :page_id => @section.page_id)
		else
			# if save fails, redisplay the form so user can fix problems
			@section_count = @page.sections.size + 1
			@pages = Page.sorted
			render('new')
		end
	end

	def edit 
		@section = Section.find(params[:id])
		@section_count = @page.sections.size 
		@pages = Page.sorted
	end

	def update 
		# Find an object using form parameters
		@section = Section.find(params[:id])
		new_position = params[:section].delete(:position)
		#Save the object
		if @section.update_attributes(params[:section])
			@section.move_to_position(new_position)
			# if succeeds, redirect to list action
			flash[:notice] = "Section updated successfully."
			redirect_to(:action =>'show', :id => @section.id, :page_id => @section.page_id)
		else
			# if save fails, redisplay the form so user can fix problems
			@section_count = @page.sections.size
			@pages = Page.sorted 
			render('edit')
		end
	end

	def delete 
		@section = Section.find(params[:id])
	end

	def destroy 
		Section.find(params[:id]).destroy
		flash[:notice] = "Section deleted successfully."
		redirect_to(:action => 'list', :page_id => @page.id)
	end

	private

	def find_page 
		if params[:page_id]
			@page = Page.find_by_id(params[:page_id])
		end
	end

end
