class TagsController < ApplicationController
  before_action :set_tag, only: [:show, :edit, :update, :destroy]

  # GET /tags
  # GET /tags.json
  def index
    per_page = params[:per_page] || 5
    @tags = if params[:term]
              Tag.where('name LIKE ?', "%#{params[:term]}%")
                  .paginate(:page => params[:page], :per_page => per_page)
            else
              Tag.paginate(:page => params[:page], :per_page => per_page)
            end
  end

  # GET /tags/1
  # GET /tags/1.json
  def show
  end

  # GET /tags/new
  def new
    @tag = Tag.new
  end

  # GET /tags/1/edit
  def edit
  end

  # POST /tags
  # POST /tags.json
  def create
    @tag = Tag.new(tag_params)

    respond_to do |format|
      if @tag.save
        format.html {redirect_to tags_path, notice: 'Tag criada com sucesso.'}
        format.json {render :show, status: :created, location: @tag}
      else
        format.html {render :new}
        format.json {render json: @tag.errors, status: :unprocessable_entity}
      end
    end
  end

  # PATCH/PUT /tags/1
  # PATCH/PUT /tags/1.json
  def update
    respond_to do |format|
      if @tag.update(tag_params)
        format.html {redirect_to tags_path, notice: 'Tag atualizada com sucesso.'}
        format.json {render :show, status: :ok, location: @tag}
      else
        format.html {render :edit}
        format.json {render json: @tag.errors, status: :unprocessable_entity}
      end
    end
  end

  # DELETE /tags/1
  # DELETE /tags/1.json
  def destroy
    @tag.destroy
    respond_to do |format|
      format.html {redirect_to tags_url, notice: 'Tag removida com sucesso.'}
      format.json {head :no_content}
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_tag
    @tag = Tag.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def tag_params
    params.require(:tag).permit(:name)
  end
end
