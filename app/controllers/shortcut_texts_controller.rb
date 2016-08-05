class ShortcutTextsController < ApplicationController
  before_action :set_shortcut_text, only: [:show, :edit, :update, :destroy]

  # GET /shortcut_texts
  # GET /shortcut_texts.json
  def index
    @shortcut_texts = ShortcutText.all
  end

  # GET /shortcut_texts/1
  # GET /shortcut_texts/1.json
  def show
  end

  # GET /shortcut_texts/new
  def new
    @shortcut_text = ShortcutText.new :teacher_id => params[:teacher_id]
  end

  # GET /shortcut_texts/1/edit
  def edit
  end

  # POST /shortcut_texts
  # POST /shortcut_texts.json
  def create
    @shortcut_text = ShortcutText.new(shortcut_text_params)

    respond_to do |format|
      if @shortcut_text.save
        format.html { redirect_to @shortcut_text, notice: 'Shortcut text was successfully created.' }
        format.json { render :show, status: :created, location: @shortcut_text }
      else
        format.html { render :new }
        format.json { render json: @shortcut_text.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /shortcut_texts/1
  # PATCH/PUT /shortcut_texts/1.json
  def update
    respond_to do |format|
      if @shortcut_text.update(shortcut_text_params)
        format.html { redirect_to @shortcut_text, notice: 'Shortcut text was successfully updated.' }
        format.json { render :show, status: :ok, location: @shortcut_text }
      else
        format.html { render :edit }
        format.json { render json: @shortcut_text.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /shortcut_texts/1
  # DELETE /shortcut_texts/1.json
  def destroy
    @shortcut_text.destroy
    respond_to do |format|
      format.html { redirect_to shortcut_texts_url, notice: 'Shortcut text was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_shortcut_text
      @shortcut_text = ShortcutText.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def shortcut_text_params
      params.require(:shortcut_text).permit(:teacher_id, :body)
    end
end
