module RecommendationsHelper
	STOP_WORDS = %w( a about above across after afterwards again against all almost alone along already also although always am among amongst amoungst amount an and another any anyhow becoming been before beforehand behind being below beside besides between beyond bill both bottom but by call can cannot cant co con could couldnt cry de describe detail do done down due during each eg either else elsewhere empty enough etc even ever every everyone everything everywhere except few fill find fire first for former formerly found from front full further get give go had has hasnt have he hence her here hereafter hereby herein hereupon hers herself him himself his how however i ie if in inc indeed interest into is it its itself keep last latter latterly least less ltd made many may me meanwhile might mill mine more moreover most mostly move much must my myself name namely neither never nevertheless next no nobody none noone nor not nothing now nowhere of off often on once only onto or other others otherwise our ours ourselves out over ownpart per perhaps please put rather re same see seem seemed seeming seems serious several she should show side since sincere so some somehow someone something sometime sometimes somewhere still such system take than that the their them themselves then thence there thereafter thereby therefore therein thereupon these they thick thin third this those though through throughout thru thus to together too top toward towards un under until up upon us very via want was we well were what whatever when whence whenever where whereafter whereas whereby wherein whereupon wherever whether which while whither who whoever whole whom whose why will with within without would yet you your yours yourself yourselves the )

	def get_recommendations(user_itinerary)
		locations = user_itinerary.locations
		tickets = Ticket.at_locations(locations)
		itineraries = filter_similar_itineraries(tickets)
		recommendations = itineraries.map(&:tickets).map {|col| col.to_a }.flatten
		# filter_times(recommendations, user_itinerary.tickets )
	end

	def filter_similar_itineraries(tickets)
		ticket_count = Hash.new(0)
		tickets.flatten.each { |ticket| ticket_count[ticket.itinerary_id] += 1 }
		similar_itineraries = []
		ticket_count.each do |key, value|
			similar_itineraries << Itinerary.find(key) if value >= 2
		end
		similar_itineraries
	end

	def filter_times(tickets, user_tickets)

	end

end