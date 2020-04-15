# frozen_string_literal: true

require './lib/domain/collectives/upcoming_collective_specification.rb'
require './spec/support/shared_examples/specification_behaviour.rb'

RSpec.describe Collectives::UpcomingCollectiveSpecification do
  subject(:spec) { described_class.new }

  it_behaves_like 'a specification' do
    let(:valid_canidate) { build(:collective, :with_medium_contributers) }
    let(:invalid_candidate) { build(:collective, :with_low_contributers) }
  end
end
