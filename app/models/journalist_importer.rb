require "csv"

class JournalistImporter
  def initialize(file, user)
    @file = file
    @user = user
  end

  def import
    CSV.foreach(@file.path, headers: true) do |row|
      first_name = row["first_name"]
      last_name = row["last_name"]
      email = row["email"]
      phone = row["phone"]
      topics = row["topics"].split(",")
      publications = row["publications"].split(",")
      journalist = Journalist.find_or_create_by(
        first_name: first_name,
        last_name: last_name,
        email: email,
        phone: phone,
        user_id: @user.id
      )
      create_coverage_topics(journalist, topics)
      create_publication_contributions(journalist, publications)
    end
  end

  private

  def create_coverage_topics(journalist, topics)
    topics.each do |topic|
      new_topic = Topic.find_or_create_by(name: topic)
      CoverageTopic.create(
        journalist_id: journalist.id,
        topic_id: new_topic.id
      )
    end
  end

  def create_publication_contributions(journalist, publications)
    publications.each do |publication|
      new_publication = Publication.find_or_create_by(name: publication)
      PublicationContribution.create(
        journalist_id: journalist.id,
        publication_id: new_publication.id
      )
    end
  end
end
