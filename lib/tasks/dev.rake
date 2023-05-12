if Rails.env.development? || Rails.env.test?
  namespace :dev do
    desc "Load up sample questions from csv"
    task load_sample_questions: :environment do
      require "csv"

      csv_text = File.read(Rails.root.join("lib", "sample_data", "sample-questions-1.csv"))
      csv = CSV.parse(csv_text, :headers => true, :encoding => "ISO-8859-1")
      source_file = SourceFile.create(file_name: "sample-questions-1.csv", name: "sample-questions-1")
      csv.each do |row|
        category = Category.find_or_create_by(name: row.fetch("Category Name"))
        question = Question.find_or_create_by(
          source_file: source_file,
          category: category,
          correct_answer: row.fetch("Correct Answer"),
          question: row.fetch("Question"),
          wrong_answer_1: row.fetch("Wrong Answer 1"),
          wrong_answer_2: row.fetch("Wrong Answer 2"),
          wrong_answer_3: row.fetch("Wrong Answer 3"),
        )
      end
    end

    desc "Create sample users and tests"
    task sample_data: :environment do
      raise "Cannot create sample data. Please upload at least 5 questions." if Question.count < 5

      10.times do |_|
        # create user
        username = Faker::Name.first_name.downcase.split(" ").join("-")
        user = User.find_or_create_by(email: "#{username}@example.com") do |u|
          u.password = "password"
        end

        puts "Created user #{user.email}"
        # create tests
        source_file = SourceFile.all.sample
        test = user.tests.create(source_file: source_file)
      end
    end
  end
end
