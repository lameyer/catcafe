module ApplicationHelper

  def format_money(amount)
    "$#{(amount.to_f / 100).round}"
  end

end
