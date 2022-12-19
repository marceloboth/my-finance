class IncomesController < ApplicationController
  def index
    @incomes = Incomes::Income.all
  end

  def new; end

  def create
    command = Incoming::CreateIncome.new(value: params[:value], description: params[:description])
    command_bus.call(command)
    redirect_to incomes_path, notice: "Success"
  end
end
