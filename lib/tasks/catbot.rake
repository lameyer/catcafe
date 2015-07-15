namespace :catbot do

  task move_cats: :environment do

    Cat.all.each do |cat|
      cat.switch_cafe_if_time!
    end

  end

  task delete_old_visits: :environment do

    visits = Visit.where("visits.exited_at < ?", 1.day.ago.beginning_of_day)
    visits.destroy_all

  end

end
