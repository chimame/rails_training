class Book < ApplicationRecord
  def full_title
    "#{title} - #{sub_title}"
  end

  # 返却日から貸出料金の計算をする
  def calculate_loan_charge_from(rental_date)
    if rental_date > Date.today
      rental_period = rental_date - Date.today
    else
      rental_period = 0
    end

    case rental_period
    when 1..7
      unit_price = price * 0.1
    when 8..14
      unit_price = price * 0.09
    when 15..21
      unit_price = price * 0.08
    when 22..Float::INFINITY
      unit_price = price * 0.07
    else
      unit_price = 0
    end

    rental_period * unit_price.to_i
  end
end
