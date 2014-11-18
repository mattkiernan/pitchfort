class Journalist < ActiveRecord::Base
  validates :first_name, presence: true

  has_many :coverage_topics
  has_many :topics, through: :coverage_topics
  has_many :publication_contributions
  has_many :publications, through: :publication_contributions

  def full_name
    "#{first_name} #{last_name}"
  end

  def list_abbreviated_publications
    check_if_no_publications || display_publication_list
  end

  def check_if_no_publications
    if publications == []
      "No publications"
    end
  end

  def display_publication_list
    first_publication = publications.first.name
    remaining_publications = publications.count - 1
    if remaining_publications > 0
      "#{first_publication} & #{remaining_publications} other " +
        "publication".pluralize(remaining_publications)
    else
      "#{first_publication}"
    end
  end

  def list_abbreviated_topics
    check_if_no_topics || display_topic_list
  end

  def check_if_no_topics
    if topics == []
      "No topics"
    end
  end

  def display_topic_list
    first_topic = topics.first.name
    remaining_topics = topics.count
    if remaining_topics > 0
      "Covers #{first_topic} & #{remaining_topics} other " +
        "topic".pluralize(remaining_topics)
    else
      "Covers #{first_topic}"
    end
  end
end
