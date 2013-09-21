require 'spec_helper'

describe Itinerary, 'associations' do
  it { expect(subject).to have_many(:tickets) }
  it { expect(subject).to belong_to(:user) }
end
