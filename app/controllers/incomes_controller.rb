class IncomesController < AuthenticatedController
  def index
    @incomes = Incomes::Income.where(user_id: current_user.id)
  end

  def new; end

  def create
    command = Incoming::Commands::CreateIncome.new(
      id: params[:id],
      description: params[:description],
      value: params[:value],
      received_at: Date.parse(params[:received_at].to_s),
      user_id: current_user.id
    )
    command_bus.call(command)

    redirect_to incomes_path, notice: 'Success'
  end
end
