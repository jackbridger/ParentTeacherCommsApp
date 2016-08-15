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

    if @shortcut_text.save
      redirect_to(root_path, :notice => "Shortcut text was successfully created.")
    else
      redirect_to(root_path, :notice => "Shortcut text was not successfully created.")
    end

  end

  # PATCH/PUT /shortcut_texts/1
  # PATCH/PUT /shortcut_texts/1.json
  def update
    if @shortcut_text.update(shortcut_text_params)
      redirect_to(root_path, :notice => "Shortcut text was successfully updated.")
    else
      redirect_to(root_path, :notice => "Shortcut text was not successfully updated.")
    end
  end

  # DELETE /shortcut_texts/1
  # DELETE /shortcut_texts/1.json
  def destroy
    if @shortcut_text.destroy
       redirect_to(root_path, :notice => "Shortcut textwas successfully deleted.")
    else
        redirect_to(root_path, :notice => "Shortcut text was successfully deleted.")

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
