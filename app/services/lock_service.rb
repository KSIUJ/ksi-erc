class LockService
  def initialize(params)
    @card_id = params[:card_id]
    @lock_name = params[:lock_name]
  end

  def authorized?
    MemberService.new(params).active?
  end
end
