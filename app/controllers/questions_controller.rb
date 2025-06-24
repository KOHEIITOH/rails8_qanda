class QuestionsController < ApplicationController
  # 質問一覧表示
  def index
    @questions = Question.all
    p @questions
  end

  #質問の詳細ページ表示
  def show
    # p params[:id]
    @question = Question.find(params[:id])
    # p @question
  end

  # 質問の作成
  def new
    @question = Question.new
  end

  # 質問の登録
  def create
    # p params
    # p question_params

    # Questionモデルを初期化
    @question = Question.new(question_params)
    # QuestionモデルをDBへ保存
    if @question.save
      # showアクションにリダイレクト
      redirect_to @question
    else
      render 'new', status: :unprocessable_entity
    end
  end

  #質問の編集（後でコメントアウト）
  def edit
    @question = Question.find(params[:id])
  end

  # 質問の更新（後でコメントアウト）
  def update
    @question = Question.find(params[:id])

    if @question.update(question_params)
      redirect_to @question
    else
      render 'edit', status: :unprocessable_entity
    end
  end

  #質問の削除
  def destroy
    @question = Question.find(params[:id])
    @question.destroy
    redirect_to questions_path
  end

  private
    def question_params
      params.require(:question).permit(:title, :name, :content)
    end
end
