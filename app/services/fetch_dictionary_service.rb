class FetchDictionaryService
  BASE_DIR = Rails.root.join('public', 'dictionaries')

  attr_accessor :username, :filepath, :status, :errors

  def initialize(username)
    self.username = username
    self.filepath = nil
    self.status = 'ERROR'
    self.errors = []
  end

  def fetch
    begin
      fetch_tweets
      self.status = 'OK'
    rescue UsernameDoesNotExist
      self.errors << 'The requested username does not exist'
    rescue UsernameIsProtected
      self.errors << 'The requested username is protected'
    rescue => e
      self.errors << "An error occurred - #{e.message}"
    end

    {
      filepath: filepath,
      status: status,
      errors: errors,
    }
  end

  class UsernameDoesNotExist < Exception; end
  class UsernameIsProtected < Exception; end

  private

  def fetch_tweets
    # TODO: actually use username to get tweets from twitter
    # TODO: make sure proper exceptions are thrown
    FileUtils.mkdir_p BASE_DIR
    filepath = BASE_DIR.join("#{username}-#{Time.now.to_i}.txt")
    File.open(filepath, 'wb') do |f|
      self.class.trump_tweets_fixture.each do |tweet|
        f.puts tweet
      end
    end
    self.filepath = filepath.to_s
  end

  def self.trump_tweets_fixture
    [
      'The only things the Democrats do well is “Resist,” which is their campaign slogan, and “Obstruct.” Cryin’ Chuck Schumer has almost 400 great American people that are waiting “forever” to serve our Country! A total disgrace. Mitch M should not let them go home until all approved!',
      'Democrats, who want Open Borders and care little about Crime, are incompetent, but they have the Fake News Media almost totally on their side!',
      'Congressman David Kustoff has been a champion for the Trump Agenda - I greatly appreciate his support. David is strong on crime and borders, loves our Military, Vets and Second Amendment. Get out and vote for David on Thursday, August 2nd. He has my full and total Endorsement!',
      'We have accomplished an economic turnaround of HISTORIC proportions!',
      '...John is strong on crime and borders, loves our Military, our Vets and our Second Amendment. He will be a star. He has my full and total Endorsement!',
      '....I did NOT know of the meeting with my son, Don jr. Sounds to me like someone is trying to make up stories in order to get himself out of an unrelated jam (Taxi cabs maybe?). He even retained Bill and Crooked Hillary’s lawyer. Gee, I wonder if they helped him make the choice!',
      '....,the only Collusion with Russia was with the Democrats, so now they are looking at my Tweets (along with 53 million other people) - the rigged Witch Hunt continues! How stupid and unfair to our Country....And so the Fake News doesn’t waste my time with dumb questions, NO,....',
      'Arrived back in Washington last night from a very emotional reopening of a major U.S. Steel plant in Granite City, Illinois, only to be greeted with the ridiculous news that the highly conflicted Robert Mueller and his gang of 13 Angry Democrats obviously cannot find Collusion...',
    ]
  end
end
