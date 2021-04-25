class UnitsController < ApplicationController
    before_action :set_uf_by_date 
    def uf
        user = request.headers['X-CLIENTE']
        Request.create(user: user)

        if @unit
            render json: @unit.value
        else
            render json: {message: 'No se encuentra la fecha'}
        end
    end

    private

    def set_uf_by_date
        @unit = Unit.find_by date: params[:date]
        #@unit = Unit.find_by(date: Date.parse(params[:id]))
    end
end
