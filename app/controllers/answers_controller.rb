class AnswersController < ApplicationController
  before_action :set_current_user
  # before_action :get_randam_theme ,only: :new

  def index
    @answers = Answer.where(user_id: current_user.id)
    theme_ids = @answers.pluck(:theme_id)
    @themes = Theme.find(theme_ids)
  end

  def new
    # 検索からきた場合、特定の問題に答えられるように分岐
    if request.referer&.include?("/themes/search")
      get_designated_theme
    else
      # 答えられる回答なければリダイレクト
      if @response == 0
        redirect_to root_path
      end
      get_randam_theme
      @answer = Answer.new
    end
  end

  def create
    @answer = Answer.new(answer_params)
    if @answer.save
      answers_path
    else
      redirect_to root_path
    end

  end

  def show
    @answer = Answer.find(params[:id])
    theme_id = @answer.theme_id
    @theme = Theme.find(theme_id)
 
    @answers_count = Answer.where(theme_id: theme_id).count
    @your_ans_count = Answer.where(theme_id: theme_id, answer: @answer.answer).count
  end

  private
  def answer_params
    params.require(:answer).permit(:answer,:theme_id).merge(user_id: current_user.id)
  end

  def set_current_user
    @current_user = User.find_by(id: session[:user_id])
  end

  # ランダムに取得した問題をanswer.newにセット
  def get_randam_theme
    # 必要なID(Answer,Theme)を取得
    @answers = Answer.where(user_id: current_user.id)
    theme_ids = @answers.pluck(:theme_id)
    find_theme_ids = Theme.pluck(:id)
    # 未回答のTheme :idを特定
    theme_ids.each do |theme|
      find_theme_ids.delete(theme)
       # 未回答０なら分岐
      if find_theme_ids.empty?
        return @response = 0
      end
    end
    # theme_idをセット
    num = rand(0..(find_theme_ids.length - 1))
    vacant_id = find_theme_ids[num]
    @theme = Theme.find(vacant_id)
    @theme_id = @theme.id
  end

  # 指定された問題をanswer.newにセット
  def get_designated_theme
    @theme = Theme.find(params[:theme_id])
    @theme_id = @theme.id
    @answer = Answer.new
  end
    

end
