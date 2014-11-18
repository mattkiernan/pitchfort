class PublicationContribution < ActiveRecord::Base
  belongs_to :journalist
  belongs_to :publication
end
