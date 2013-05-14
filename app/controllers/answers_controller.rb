class AnswersController < ApplicationController

  before_filter :find_question
  
  def find_question
    @exam = Exam.find(params[:exam_id])
    @question = @exam.questions.find(params[:question_id])
  end

  # GET /answers
  # GET /answers.json
  def index
    @answers = @question.answers.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @answers }
    end
  end

  # GET /answers/1
  # GET /answers/1.json
  # def show
  #   @answer = @question.find(params[:id])

  #   respond_to do |format|
  #     format.html # show.html.erb
  #     format.json { render json: @answer }
  #   end
  # end

  # GET /answers/new
  # GET /answers/new.json
  def new
    @answer = @question.answers.new

    respond_to do |format|
      format.html { render :template => "answers/form"}
      format.json { render json: @answer }
    end
  end

  # GET /answers/1/edit
  def edit
    @answer = @question.answers.find(params[:id])

    respond_to do |format|
      format.html { render :template => "answers/form"}
      format.json { render json: @answer }
    end
  end

  # POST /answers
  # POST /answers.json
  def create
    @answer = @question.answers.new(params[:answer])

    respond_to do |format|
      if @answer.save
        format.html { redirect_to exam_questions_path(@exam), notice: 'Answer was successfully created.' }
        format.json { render json: exam_questions_path(@exam), status: :created, location: @answer }
      else
        format.html { render action: "new" }
        format.json { render json: exam_questions_path(@exam).errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /answers/1
  # PUT /answers/1.json
  def update
    @answer = @question.answers.find(params[:id])

    respond_to do |format|
      if @answer.update_attributes(params[:answer])
        format.html { redirect_to exam_questions_path(@exam), notice: 'Answer was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: exam_questions_path(@exam).errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /answers/1
  # DELETE /answers/1.json
  def destroy
    @answer = @question.answers.find(params[:id])
    @answer.destroy

    respond_to do |format|
      format.js
      format.html { redirect_to answers_url }
      format.json { head :no_content }
    end
  end
end
