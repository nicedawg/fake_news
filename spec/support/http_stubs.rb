module HttpStubs
  def stub_news_search
    allow_any_instance_of(NewsApiClient)
      .to receive(:get_results_from_api)
      .and_return( 2.times.map { 'The big black bear bit the big black bug and the big black bear bled blood.' })
  end
end
