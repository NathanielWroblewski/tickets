require 'spec_helper'

describe Ticket, 'associations' do
  it { expect(subject).to belong_to(:itinerary) }
end
