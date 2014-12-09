require "google/api_client"

class Gmail
  def initialize(user, token, journalist, pitch)
    @user = user
    @journalist = journalist
    @pitch = pitch
    @email_results = []
    @token = token
  end

  def fetch_email
    authorize_user
    search_emails
  end

  def authorize_user
    @client = Google::APIClient.new
    @client.authorization.client_id = ENV['CLIENT_ID']
    @client.authorization.client_secret = ENV['CLIENT_SECRET']
    @client.authorization.grant_type = 'refresh_token'
    @client.authorization.refresh_token = @token
    @client.authorization.fetch_access_token!
    @gmail = @client.discovered_api('gmail', 'v1')
  end

  def search_emails
    search_result = @client.execute(
      api_method: @gmail.users.messages.list,
      parameters:  { 'userId' => @user.email,
                     'q' => "from:#{@journalist.email},
                              subject:#{@pitch.subject}"
    },
    )

    email_list = search_result.data["messages"]
    update_pitch_status(email_list)
    iterate_over_emails(email_list)
  end

   def update_pitch_status(email_list)
     if email_list.present?
       @pitch.update(status:"Replied")
     end
   end

  def iterate_over_emails(email_list)
    email_list.each do |email|
      display_result(email["id"])
    end
    @email_results
  end

  def display_result(email_id)
    display_result = @client.execute(
      api_method: @gmail.users.messages.get,
      parameters:  { 'userId' => @user.email,
                     'id' => email_id,
                     'metadataHeaders'=> "metadata"},
    )
    date = display_result.data["payload"]["headers"].
      find { |h| h['name'] == 'Date' }["value"]
    message =  display_result.data["snippet"][0, 20].html_safe + "..."
    @email_results << {message: message, date: date}
  end
end
