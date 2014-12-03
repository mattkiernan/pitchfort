class Announcement < ActiveRecord::Base
  belongs_to :client
  has_many :pitches

  def pitches_count
    pitches.count
  end

  def pitch_acceptance_rate
    accepted = pitches.where(status: "Accepted").count
    total = pitches.count
    if accepted == 0 || total == 0
      "0%"
    else
      ((accepted.to_f / total.to_f) * 100).round.to_s + "%"
    end
  end
end
