class CoursesController < ApplicationController
  def index
    @courses = Course.all

    render("course_templates/index.html.erb")
  end

  def show
    @course = Course.find(params.fetch("id_to_display"))

    render("course_templates/show.html.erb")
  end

  def new_form
    @course = Course.new

    render("course_templates/new_form.html.erb")
  end

  def create_row
    @course = Course.new

    @course.user_id = params.fetch("user_id")
    @course.starts_at = params.fetch("starts_at")
    @course.ends_at = params.fetch("ends_at")
    @course.message_sent = params.fetch("message_sent")
    @course.professor = params.fetch("professor")
    @course.location = params.fetch("location")

    if @course.valid?
      @course.save

      redirect_back(:fallback_location => "/courses", :notice => "Course created successfully.")
    else
      render("course_templates/new_form_with_errors.html.erb")
    end
  end

  def edit_form
    @course = Course.find(params.fetch("prefill_with_id"))

    render("course_templates/edit_form.html.erb")
  end

  def update_row
    @course = Course.find(params.fetch("id_to_modify"))

    @course.user_id = params.fetch("user_id")
    @course.starts_at = params.fetch("starts_at")
    @course.ends_at = params.fetch("ends_at")
    @course.message_sent = params.fetch("message_sent")
    @course.professor = params.fetch("professor")
    @course.location = params.fetch("location")

    if @course.valid?
      @course.save

      redirect_to("/courses/#{@course.id}", :notice => "Course updated successfully.")
    else
      render("course_templates/edit_form_with_errors.html.erb")
    end
  end

  def destroy_row
    @course = Course.find(params.fetch("id_to_remove"))

    @course.destroy

    redirect_to("/courses", :notice => "Course deleted successfully.")
  end
end
