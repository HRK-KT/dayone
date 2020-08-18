class UsersController < ApplicationController

  def new 
  end

  def create
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    if current_user.update(user_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def show 
    @user = User.find(params[:id])
    @answers = Answer.where(user_id: current_user.id)
    theme_ids = @answers.pluck(:theme_id)
    @themes = Theme.find(theme_ids)
    get_answer_count(@answers,@themes)
    gon.majority_count_life = @majority_count_life
    gon.minority_count_life = @minority_count_life
    gon.unknown_count_life = @unknown_count_life
    gon.majority_count_culture = @majority_count_culture
    gon.minority_count_culture = @minority_count_culture
    gon.unknown_count_culture = @unknown_count_culture
    gon.majority_count_work = @majority_count_work
    gon.minority_count_work = @minority_count_work
    gon.unknown_count_work = @unknown_count_work
    gon.majority_count_love = @majority_count_love
    gon.minority_count_love = @minority_count_love
    gon.unknown_count_love = @unknown_count_love
    gon.majority_count_religion = @majority_count_religion
    gon.minority_count_religion = @minority_count_religion
    gon.unknown_count_religion = @unknown_count_religion
    gon.majority_count_hobby = @majority_count_hobby
    gon.minority_count_hobby = @minority_count_hobby
    gon.unknown_count_hobby = @unknown_count_hobby
    gon.total_majority_count = @total_majority_count
    gon.total_minority_count = @total_minority_count
    gon.total_unknown_count = @total_unknown_count
  end

  private 

  def user_params
    params.require(:user).permit(:name, :email, :sex, :age, :region, :job, :image )
  end

  def get_answer_count(answers,themes)
    @majority_count_life = 0
    @minority_count_life = 0
    @unknown_count_life = 0
    @majority_count_culture = 0
    @minority_count_culture = 0
    @unknown_count_culture = 0
    @majority_count_work = 0
    @minority_count_work = 0
    @unknown_count_work = 0
    @majority_count_love = 0
    @minority_count_love = 0
    @unknown_count_love = 0
    @majority_count_religion = 0
    @minority_count_religion = 0
    @unknown_count_religion = 0
    @majority_count_hobby = 0
    @minority_count_hobby = 0
    @unknown_count_hobby = 0
    @total_majority_count = 0
    @total_minority_count = 0
    @total_unknown_count = 0

    answers.each do |answer|
      themes.each do |theme|
        if theme.id == answer.theme_id
          if theme.genre == 0
            if answer.answer == "answer1"
              your_ans_count_life = Answer.where(theme_id: theme.id, answer: "answer1").count
            elsif answer.answer == "answer2"
              your_ans_count_life = Answer.where(theme_id: theme.id, answer: "answer2").count
            end
              answers_count_life = Answer.where(theme_id: theme.id).count
              if (your_ans_count_life.to_f / answers_count_life) > 0.5
                @majority_count_life = @majority_count_life + 1
              elsif (your_ans_count_life.to_f / answers_count_life) < 0.5
                @minority_count_life = @minority_count_life + 1
              else
                @unknown_count_life = @unknown_count_life + 1
              end
          elsif theme.genre == 1
            if answer.answer == "answer1"
              your_ans_count_culture = Answer.where(theme_id: theme.id, answer: "answer1").count
            elsif answer.answer == "answer2"
              your_ans_count_culture = Answer.where(theme_id: theme.id, answer: "answer2").count
            end
              answers_count_culture = Answer.where(theme_id: theme.id).count
              if (your_ans_count_culture.to_f / answers_count_culture) > 0.5
                @majority_count_culture = @majority_count_life + 1
              elsif (your_ans_count_culture.to_f / answers_count_culture) < 0.5
                @minority_count_culture = @minority_count_culture + 1
              else
                @unknown_count_culture = @unknown_count_culture + 1
              end
          elsif theme.genre == 2
            if answer.answer == "answer1"
              your_ans_count_work = Answer.where(theme_id: theme.id, answer: "answer1").count
            elsif answer.answer == "answer2"
              your_ans_count_work = Answer.where(theme_id: theme.id, answer: "answer2").count
            end
              answers_count_work = Answer.where(theme_id: theme.id).count
              if (your_ans_count_work.to_f / answers_count_work) > 0.5
                @majority_count_work = @majority_count_work + 1
              elsif (your_ans_count_work.to_f / answers_count_work) < 0.5
                @minority_count_work = @minority_count_work + 1
              else
                @unknown_count_work = @unknown_count_work + 1
              end
          elsif theme.genre == 3
            if answer.answer == "answer1"
              your_ans_count_love = Answer.where(theme_id: theme.id, answer: "answer1").count
            elsif answer.answer == "answer2"
              your_ans_count_love = Answer.where(theme_id: theme.id, answer: "answer2").count
            end
              answers_count_love = Answer.where(theme_id: theme.id).count
              if (your_ans_count_love.to_f / answers_count_love) > 0.5
                @majority_count_love = @majority_count_love + 1
              elsif (your_ans_count_love.to_f / answers_count_love) < 0.5
                @minority_count_love = @minority_count_love + 1
              else
                @unknown_count_love = @unknown_count_love + 1
              end
          elsif theme.genre == 4
            if answer.answer == "answer1"
              your_ans_count_religion = Answer.where(theme_id: theme.id, answer: "answer1").count
            elsif answer.answer == "answer2"
              your_ans_count_religion = Answer.where(theme_id: theme.id, answer: "answer2").count
            end
              answers_count_religion = Answer.where(theme_id: theme.id).count
              if (your_ans_count_religion.to_f / answers_count_religion) > 0.5
                @majority_count_religion = @majority_count_religion + 1
              elsif (your_ans_count_religion.to_f / answers_count_religion) < 0.5
                @minority_count_religion = @minority_count_religion + 1
              else
                @unknown_count_religion = @unknown_count_religion + 1
              end
          elsif theme.genre == 5
            if answer.answer == "answer1"
              your_ans_count_hobby = Answer.where(theme_id: theme.id, answer: "answer1").count
            elsif answer.answer == "answer2"
              your_ans_count_hobby = Answer.where(theme_id: theme.id, answer: "answer2").count
            end
              answers_count_hobby = Answer.where(theme_id: theme.id).count
              if (your_ans_count_hobby.to_f / answers_count_hobby) > 0.5
                @majority_count_hobby = @majority_count_hobby + 1
              elsif (your_ans_count_hobby.to_f / answers_count_hobby) < 0.5
                @minority_count_hobby = @minority_count_hobby + 1
              else
                @unknown_count_hobby = @unknown_count_hobby + 1
              end
          end
        end
      end
    end
    @total_majority_count = @majority_count_life + @majority_count_culture + @majority_count_work + @majority_count_love + @majority_count_religion + @majority_count_hobby
    @total_minority_count = @minority_count_life + @majority_count_culture + @minority_count_work + @minority_count_love + @minority_count_religion + @minority_count_hobby
    @total_unknown_count = @unknown_count_life + @unknown_count_culture + @unknown_count_work + @unknown_count_love + @unknown_count_religion + @unknown_count_hobby
  end


end
