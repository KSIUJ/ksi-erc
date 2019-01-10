class PeriodsFacade
  def self.current
    Period.where("begin <= :today AND \"end\" >= :today", {today: Date.today}).take
  end
end
