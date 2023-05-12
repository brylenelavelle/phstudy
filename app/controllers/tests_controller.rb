class TestsController < ApplicationController
  def index
    matching_tests = Test.all

    @list_of_tests = matching_tests.order({ :created_at => :desc })

    render({ :template => "tests/index.html.erb" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_tests = Test.where({ :id => the_id })

    @the_test = matching_tests.at(0)

    render({ :template => "tests/show.html.erb" })
  end

  def create
    the_test = Test.new
    the_test.source_file_id = params.fetch("query_source_file_id")
    the_test.user_id = params.fetch("query_user_id")

    if the_test.valid?
      the_test.save
      redirect_to("/tests", { :notice => "Test created successfully." })
    else
      redirect_to("/tests", { :alert => the_test.errors.full_messages.to_sentence })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_test = Test.where({ :id => the_id }).at(0)

    the_test.source_file_id = params.fetch("query_source_file_id")
    the_test.user_id = params.fetch("query_user_id")

    if the_test.valid?
      the_test.save
      redirect_to("/tests/#{the_test.id}", { :notice => "Test updated successfully."} )
    else
      redirect_to("/tests/#{the_test.id}", { :alert => the_test.errors.full_messages.to_sentence })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_test = Test.where({ :id => the_id }).at(0)

    the_test.destroy

    redirect_to("/tests", { :notice => "Test deleted successfully."} )
  end
end
