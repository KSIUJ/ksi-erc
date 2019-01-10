class PeriodFacade
  def self.current
    Period.where("begin <= :today AND \"end\" >= :today", {today: Date.today})
  end
end
