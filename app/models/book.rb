class Book < ApplicationRecord
  def full_title
    "#{title} - #{sub_title}"
  end

  # 返却日から貸出料金の計算をする
  def calculate_loan_charge_from(rental_date)
    rental_period = rental_period_from(rental_date)
    rental_period * rental_unit_price_by(rental_period)
  end

  def rental_period_from(rental_date)
    if rental_date > Date.today
      rental_date - Date.today
    else
      0
    end
  end

  def rental_unit_price_by(rental_period)
    case rental_period
    when 1..7
      price * 0.1
    when 8..14
      price * 0.09
    when 15..21
      price * 0.08
    when 22..Float::INFINITY
      price * 0.07
    else
      0
    end.to_i
  end
end
