class ConfiguracaoPaginasController < ApplicationController
  before_action :set_configuracao_pagina, only: [:show, :edit, :update, :destroy]

  # GET /configuracao_paginas
  # GET /configuracao_paginas.json
  def index
    per_page = params[:per_page] || 5
    @configuracao_paginas = if params[:term]
                              ConfiguracaoPagina.where('title LIKE ?', "%#{params[:term]}%")
                                  .or(Pagina.where('description LIKE ?', "%#{params[:term]}%"))
                                  .or(Pagina.where('keywords LIKE ?', "%#{params[:term]}%"))
                                  .paginate(:page => params[:page], :per_page => per_page)
                            else
                              ConfiguracaoPagina.paginate(:page => params[:page], :per_page => per_page)
                            end
  end

  # GET /configuracao_paginas/1
  # GET /configuracao_paginas/1.json
  def show
  end

  # GET /configuracao_paginas/new
  def new
    @configuracao_pagina = ConfiguracaoPagina.new
  end

  # GET /configuracao_paginas/1/edit
  def edit
  end

  # POST /configuracao_paginas
  # POST /configuracao_paginas.json
  def create
    @configuracao_pagina = ConfiguracaoPagina.new(configuracao_pagina_params)

    respond_to do |format|
      if @configuracao_pagina.save
        format.html {redirect_to configuracao_paginas_url, notice: 'Configuração de página criada com sucesso.'}
        format.json {render :index, status: :created, location: "index"}
      else
        format.html {render :new}
        format.json {render json: @configuracao_pagina.errors, status: :unprocessable_entity}
      end
    end
  end

  # PATCH/PUT /configuracao_paginas/1
  # PATCH/PUT /configuracao_paginas/1.json
  def update
    respond_to do |format|
      if @configuracao_pagina.update(configuracao_pagina_params)
        format.html {redirect_to configuracao_paginas_url, notice: 'Configuração de Página atualizada com sucesso.'}
        format.json {render :index, status: :ok, location: "index"}
      else
        format.html {render :edit}
        format.json {render json: @configuracao_pagina.errors, status: :unprocessable_entity}
      end
    end
  end

  # DELETE /configuracao_paginas/1
  # DELETE /configuracao_paginas/1.json
  def destroy
    @configuracao_pagina.destroy
    respond_to do |format|
      format.html {redirect_to configuracao_paginas_url, notice: 'Configuração de página removida com sucesso.'}
      format.json {head :no_content}
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_configuracao_pagina
    @configuracao_pagina = ConfiguracaoPagina.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def configuracao_pagina_params
    params.require(:configuracao_pagina).permit(:title, :description, :keywords)
  end
end
