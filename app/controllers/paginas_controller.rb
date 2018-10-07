class PaginasController < ApplicationController
  before_action :set_pagina, only: [:show, :edit, :update, :destroy]
  before_action :load_configurations, only: [:new, :edit]

  def load_configurations
    @configuracoes = ConfiguracaoPagina.all
    @all_tags = Tag.all
  end

  # GET /paginas
  # GET /paginas.json
  def index
    @paginas = Pagina.all
  end

  # GET /paginas/1
  # GET /paginas/1.json
  def show
  end

  # GET /paginas/new
  def new
    @pagina = Pagina.new
  end

  # GET /paginas/1/edit
  def edit
    tags = PaginaTag.where(:pagina_id=>@pagina.id)
    @selecteds = []
    for tag in tags
      @selecteds << tag.tag_id
    end
  end

  # POST /paginas
  # POST /paginas.json
  def create
    @pagina = Pagina.new(pagina_params)
    tags = params[:tags]
    for id_tag in tags
      if !id_tag.blank?
        @pagina_tag = PaginaTag.create(:pagina_id => @pagina.id, :tag_id => id_tag.to_i)
      end
    end
    respond_to do |format|
      if @pagina.save
        format.html {redirect_to paginas_url, notice: 'Página criada com sucesso.'}
      else
        format.html {render :new}
        format.json {render json: @pagina.errors, status: :unprocessable_entity}
      end
    end
  end

  # PATCH/PUT /paginas/1
  # PATCH/PUT /paginas/1.json
  def update
    respond_to do |format|
      if @pagina.update(pagina_params)
        @paginas_tag = PaginaTag.where(:pagina_id=>@pagina.id)
        for page_tag in @paginas_tag
          page_tag.destroy
        end
        tags = params[:tags]
        for id_tag in tags
          if !id_tag.blank?
            @pagina_tag = PaginaTag.create(:pagina_id => @pagina.id, :tag_id => id_tag.to_i)
          end
        end
        format.html {redirect_to paginas_url, notice: 'Página atualizada com sucesso.'}
      else
        format.html {render :edit}
        format.json {render json: @pagina.errors, status: :unprocessable_entity}
      end
    end
  end

  # DELETE /paginas/1
  # DELETE /paginas/1.json
  def destroy
    @pagina.destroy
    respond_to do |format|
      format.html {redirect_to paginas_url, notice: 'Pagina removida com sucesso.'}
      format.json {head :no_content}
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_pagina
    @pagina = Pagina.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def pagina_params
    params.require(:pagina).permit(:name, :slug, :configuracao_pagina_id)
  end
end
