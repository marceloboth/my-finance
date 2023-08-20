class IncomesController < AuthenticatedController
  def index
    @incomes = Incomes::Income.all
  end

  def new; end

  def create
    command = Incoming::Commands::CreateIncome.new(
      id: params[:id],
      description: params[:description],
      value: params[:value],
      received_at: Date.parse(params[:received_at].to_s)
    )
    command_bus.call(command)

    redirect_to incomes_path, notice: 'Success'
  end
end
