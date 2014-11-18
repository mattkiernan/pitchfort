class Journalist < ActiveRecord::Base
  validates :first_name, presence: true

  has_many :coverage_topics
  has_many :topics, through: :coverage_topics
  has_many :publication_contributions
  has_many :publications, through: :publication_contributions

  def full_name
    "#{first_name} #{last_name}"
  end

  def abbreviate_publications
    check_if_no(publications)
  end

  def abbreviate_topics
    check_if_no(topics)
  end

  def check_if_no(attributes)
    if attributes == []
      "None"
    else
      display(attributes)
    end
  end

  def display(attributes)
    first_attribute = attributes.first.name
    remaining_attributes = attributes.count - 1
    if remaining_attributes > 0
      "#{first_attribute} & #{remaining_attributes} " +
        "other".pluralize(remaining_attributes)
    else
      "#{first_attribute}"
    end
  end
end
