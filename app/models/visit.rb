class Visit < ActiveRecord::Base
  belongs_to :cat
  belongs_to :cafe

  # returns minutes
  def elapsed_duration
    if self.exited_at
      (self.exited_at - self.entered_at) / 60
    else
      (Time.now - self.entered_at) / 60
    end
  end

end
