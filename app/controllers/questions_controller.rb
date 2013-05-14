class QuestionsController < ApplicationController

  before_filter :find_exam
  
  def find_exam
    @exam = Exam.find(params[:exam_id])
  end

  # GET /questions
  # GET /questions.json
  def index
    @questions = @exam.questions.all
    @question = @exam.questions.build

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @questions }
    end
  end

  # GET /questions/1
  # GET /questions/1.json
  # def show
  #   @question = Question.find(params[:id])

  #   respond_to do |format|
  #     format.html # show.html.erb
  #     format.json { render json: @question }
  #   end
  # end

  # GET /questions/new
  # GET /questions/new.json
  def new
    @question = @exam.questions.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @question }
    end
  end

  # GET /questions/1/edit
  def edit
    @question = @exam.questions.find(params[:id])
  end

  # POST /questions
  # POST /questions.json
  def create
    @question = @exam.questions.new(params[:question])

    respond_to do |format|
      if @question.save
        format.html { redirect_to exam_questions_path(@exam), notice: 'Question was successfully created.' }
        format.json { render json: exam_questions_path(@exam), status: :created, location: @question }
      else
        format.html {  
          flash[:error] = 'Question description can not be left blank.'
          redirect_to exam_questions_path(@exam)
        }
        format.json { render json: exam_questions_path(@exam).errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /questions/1
  # PUT /questions/1.json
  def update
    @question = @exam.questions.find(params[:id])

    respond_to do |format|
      if @question.update_attributes(params[:question])
        format.html { redirect_to exam_questions_path(@exam), notice: 'Question was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @question.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /questions/1
  # DELETE /questions/1.json
  def destroy
    @question = @exam.questions.find(params[:id])
    @question.destroy

    respond_to do |format|
      format.js
    end
  end
end
