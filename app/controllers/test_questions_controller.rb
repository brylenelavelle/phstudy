class TestQuestionsController < ApplicationController
  def index
    matching_test_questions = TestQuestion.all

    @list_of_test_questions = matching_test_questions.order({ :created_at => :desc })

    render({ :template => "test_questions/index.html.erb" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_test_questions = TestQuestion.where({ :id => the_id })

    the_test_question = matching_test_questions.at(0)

    render({ :template => "test_questions/show.html.erb" })
  end

  def create
    question_ids = params[:question_ids].scan(/\d+/).map(&:to_i)

    TestQuestion.where(test_id: session[:user_id]).delete_all

    @list_of_test_questions = []
    question_ids.each do |question_id|
      @question = Question.where(:id => question_id).first

      @list_of_test_questions.push(@question)

      the_test_question = TestQuestion.new
      the_test_question.test_id = session[:user_id]
      the_test_question.question_id = question_id

      the_test_question.save
    end

    redirect_to("/test_questions", { :notice => "Test question created successfully." })
  end

  def submit_test
    @score = 0

    test_questions = TestQuestion.where(test_id: session[:user_id])
    @list_of_test_questions = test_questions.map(&:question)
  
    @list_of_test_questions.each do |question|
      user_answer = params["answer_#{question.id}"]
      correct_answer = question.correct_answer
  
      if user_answer == correct_answer
        @score += 1
      end
    end
  render({ :template => "test_questions/submit_test_results" })
end

  def reset_test
    session[:path_id] = 0
    session.delete(:score)
    redirect_to "/test_questions", notice: "Test reset successfully."
  end

  def destroy
    the_id = params.fetch("path_id")
    the_test_question = TestQuestion.where({ :id => the_id }).at(0)

    the_test_question.destroy

    redirect_to("/test_questions", { :notice => "Test question deleted successfully." })
  end
end
