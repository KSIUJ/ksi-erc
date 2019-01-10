class MembersFacade
  def active_members
    @active_members ||= Member.joins(memberships: :period).where(memberships: {period: PeriodsFacade.current})
  end
end
