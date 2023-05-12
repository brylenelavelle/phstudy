class QuestionsController < ApplicationController
  def index
    matching_questions = Question.all

    @list_of_questions = matching_questions.order({ :created_at => :desc })

    render({ :template => "questions/index.html.erb" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_questions = Question.where({ :id => the_id })

    @the_question = matching_questions.at(0)

    render({ :template => "questions/show.html.erb" })
  end

  def create
    the_question = Question.new
    the_question.category_id = params.fetch("query_category_id")
    the_question.wrong_answer_1 = params.fetch("query_wrong_answer_1")
    the_question.wrong_answer_2 = params.fetch("query_wrong_answer_2")
    the_question.wrong_answer_3 = params.fetch("query_wrong_answer_3")
    the_question.correct_answer = params.fetch("query_correct_answer")
    the_question.source_file_id = params.fetch("query_source_file_id")
    the_question.question = params.fetch("query_question")

    if the_question.valid?
      the_question.save
      redirect_to("/questions", { :notice => "Question created successfully." })
    else
      redirect_to("/questions", { :alert => the_question.errors.full_messages.to_sentence })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_question = Question.where({ :id => the_id }).at(0)

    the_question.category_id = params.fetch("query_category_id")
    the_question.wrong_answer_1 = params.fetch("query_wrong_answer_1")
    the_question.wrong_answer_2 = params.fetch("query_wrong_answer_2")
    the_question.wrong_answer_3 = params.fetch("query_wrong_answer_3")
    the_question.correct_answer = params.fetch("query_correct_answer")
    the_question.source_file_id = params.fetch("query_source_file_id")
    the_question.question = params.fetch("query_question")

    if the_question.valid?
      the_question.save
      redirect_to("/questions/#{the_question.id}", { :notice => "Question updated successfully."} )
    else
      redirect_to("/questions/#{the_question.id}", { :alert => the_question.errors.full_messages.to_sentence })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_question = Question.where({ :id => the_id }).at(0)

    the_question.destroy

    redirect_to("/questions", { :notice => "Question deleted successfully."} )
  end
end
