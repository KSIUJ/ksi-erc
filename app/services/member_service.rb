class MemberService
  def initialize(params)
    @card_id = params[:card_id]
  end

  def active?
    current_period = PeriodFacade.current
    Membership.joins(:member, :period).exists?(members: {card_id: @card_id}, period: current_period)
  end
end

