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
    num_questions = params[:num_questions].to_i
    test_questions = TestQuestion.includes(:question).where(id: params.values).to_a

    @score = 0
    @correct_answers = []
    @questions = []

    num_questions.times do |i|
      answer_key = params.keys.find { |k| k.include?("answer_#{i + 1}") }
      next unless answer_key

      test_question = test_questions.find { |tq| tq.id == answer_key.split("_").last.to_i }
      user_answer = params[answer_key]

      if user_answer == test_question.question.correct_answer
        @score += 1
      end

      @correct_answers << test_question.question.correct_answer
      @questions << test_question.question.question
    end

    render({ :template => "test_questions/submit_test_results" })
  end

  def reset_test
    session.delete(:path_id)
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
