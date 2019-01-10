class MemberService
  def initialize(params)
    @card_id = params[:card_id]
  end

  def active?
    Membership.joins(:member, :period).exists?(members: {card_id: @card_id}, period: PeriodsFacade.current)
  end
end

