class SourceFilesController < ApplicationController
  def index
    matching_source_files = SourceFile.all

    @list_of_source_files = matching_source_files.order({ :created_at => :desc })

    render({ :template => "source_files/index.html.erb" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_source_files = SourceFile.where({ :id => the_id })

    @the_source_file = matching_source_files.at(0)

    render({ :template => "source_files/show.html.erb" })
  end

  def create
    the_source_file = SourceFile.new
    the_source_file.name = params.fetch("query_name")
    the_source_file.file_name = params.fetch("query_file_name")

    if the_source_file.valid?
      the_source_file.save
      redirect_to("/source_files", { :notice => "Source file created successfully." })
    else
      redirect_to("/source_files", { :alert => the_source_file.errors.full_messages.to_sentence })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_source_file = SourceFile.where({ :id => the_id }).at(0)

    the_source_file.name = params.fetch("query_name")
    the_source_file.file_name = params.fetch("query_file_name")

    if the_source_file.valid?
      the_source_file.save
      redirect_to("/source_files/#{the_source_file.id}", { :notice => "Source file updated successfully."} )
    else
      redirect_to("/source_files/#{the_source_file.id}", { :alert => the_source_file.errors.full_messages.to_sentence })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_source_file = SourceFile.where({ :id => the_id }).at(0)

    the_source_file.destroy

    redirect_to("/source_files", { :notice => "Source file deleted successfully."} )
  end
end
