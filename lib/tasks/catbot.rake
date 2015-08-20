namespace :catbot do

  task move_cats: :environment do

    Cat.all.shuffle.each do |cat|
      cat.leave_current_cafe_if_time!
      cat.leave_current_cafe_item_if_time!
    end

    Cat.all.shuffle.each do |cat|
      cat.find_cafe!
      cat.find_cafe_item!
    end

  end

  task delete_old_visits: :environment do

    cafe_visits = CafeVisit.where("cafe_visits.exited_at < ?", 1.day.ago.beginning_of_day)
    cafe_item_visits = CafeItemVisit.where("cafe_item_visits.exited_at < ?", 1.day.ago.beginning_of_day)
    cafe_visits.delete_all
    cafe_item_visits.delete_all

  end

  task reset_all_visits: :environment do

    CafeVisit.delete_all
    CafeItemVisit.delete_all

  end

end
