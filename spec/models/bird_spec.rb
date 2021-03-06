require 'rails_helper'

RSpec.describe Bird, type: :model do
  it { is_expected.to validate_presence_of(:name) }
  it { is_expected.to validate_presence_of(:family) }
  it { is_expected.to validate_presence_of(:continents) }

  it 'sets default value for visible' do
    bird = create(:bird)
    expect(bird.visible).to eq(false)
  end

  it 'min continent should be equal to 1' do
    expect {
      create(:bird, continents: [''])
    }.to raise_error(Mongoid::Errors::Validations)
  end

  describe '#scopes' do
    describe '#visible' do
      it 'returns a list of visible birds' do
        bird = create(:bird, visible: true)
        expect(Bird.visible).to include(bird)
      end
    end
  end
end
