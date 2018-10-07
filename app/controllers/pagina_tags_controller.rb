class PaginaTagsController < ApplicationController
  before_action :set_pagina_tag, only: [:show, :edit, :update, :destroy]

  # GET /pagina_tags
  # GET /pagina_tags.json
  def index
    @pagina_tags = PaginaTag.all
  end

  # GET /pagina_tags/1
  # GET /pagina_tags/1.json
  def show
  end

  # GET /pagina_tags/new
  def new
    @pagina_tag = PaginaTag.new
  end

  # GET /pagina_tags/1/edit
  def edit
  end

  # POST /pagina_tags
  # POST /pagina_tags.json
  def create
    @pagina_tag = PaginaTag.new(pagina_tag_params)

    respond_to do |format|
      if @pagina_tag.save
        format.html { redirect_to @pagina_tag, notice: 'Pagina tag was successfully created.' }
        format.json { render :show, status: :created, location: @pagina_tag }
      else
        format.html { render :new }
        format.json { render json: @pagina_tag.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pagina_tags/1
  # PATCH/PUT /pagina_tags/1.json
  def update
    respond_to do |format|
      if @pagina_tag.update(pagina_tag_params)
        format.html { redirect_to @pagina_tag, notice: 'Pagina tag was successfully updated.' }
        format.json { render :show, status: :ok, location: @pagina_tag }
      else
        format.html { render :edit }
        format.json { render json: @pagina_tag.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pagina_tags/1
  # DELETE /pagina_tags/1.json
  def destroy
    @pagina_tag.destroy
    respond_to do |format|
      format.html { redirect_to pagina_tags_url, notice: 'Pagina tag was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pagina_tag
      @pagina_tag = PaginaTag.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def pagina_tag_params
      params.require(:pagina_tag).permit(:pagina_id, :tag_id)
    end
end
