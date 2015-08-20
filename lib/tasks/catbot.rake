namespace :catbot do

  task move_cats: :environment do

    Cat.all.each do |cat|
      cat.switch_cafe_if_time!
    end

  end

  task delete_old_visits: :environment do

    cafe_visits = CafeVisit.where("cafe_visits.exited_at < ?", 1.day.ago.beginning_of_day)
    cafe_item_visits = CafeItemVisit.where("cafe_item_visits.exited_at < ?", 1.day.ago.beginning_of_day)
    cafe_visits.delete_all
    cafe_item_visits.delete_all

  end

end
