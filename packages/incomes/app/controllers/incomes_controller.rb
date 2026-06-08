class IncomesController < AuthenticatedController
  def index
    @incomes = Income.where(user_id: current_user.id)
  end

  def new
  end

  def create
    contract = IncomesContract::Create.new.call(
      id: SecureRandom.uuid,
      description: params[:description],
      value: params[:value],
      received_at: params[:received_at],
      user_id: current_user.id
    )

    contract.to_monad.fmap do |income|
      create_command(income: income.to_h)

      redirect_to incomes_path, notice: 'Success'
    end.or do |result|
      @errors = result.errors.to_h
      @income = OpenStruct.new(result.to_h)

      render :new, status: :unprocessable_entity
    end
  end

  def edit
    if params[:id].present?
      @income = Income.find(params[:id])
    end
  end

  def update
    contract = IncomesContract::Update.new.call(
      id: params[:id],
      description: params[:description],
      value: params[:value],
      received_at: params[:received_at],
      user_id: current_user.id
    )

    contract.to_monad.fmap do |income|
      update_command(income: income.to_h)

      redirect_to incomes_path, notice: 'Success'
    end.or do |result|
      pp result.to_h
      @errors = result.errors.to_h
      @income = OpenStruct.new(result.to_h)

      render :edit, status: :unprocessable_entity
    end
  end

  private

  def create_command(income: {})
    command = Incoming::Commands::CreateIncome.new(income)
    command_bus.call(command)
  end

  def update_command(income: {})
    command = Incoming::Commands::UpdateIncome.new(income)
    command_bus.call(command)
  end
end
