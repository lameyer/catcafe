namespace :catbot do

  task move_cats: :environment do

    Cat.all.each do |cat|
      cat.switch_cafe_if_time!
    end

  end

end
