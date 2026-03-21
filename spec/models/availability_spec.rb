require 'rails_helper'

RSpec.describe Availability, type: :model do
  let(:initial_time) { DateTime.now }
  let(:start_time) { initial_time }
  let(:end_time) { initial_time + 1.hour }
  let(:status) { :available }

  subject { FactoryBot.build(:availability, start_time:, end_time:, status:) }
  
  it 'is valid with valid attributes' do
    expect(subject).to be_valid
  end

  context 'without a start time' do
    let(:start_time) { nil }
    it 'is invalid' do
      expect(subject).not_to be_valid
    end
  end

  context 'without an end time' do
    let(:end_time) { nil }
    it 'is invalid' do
      expect(subject).not_to be_valid
    end
  end

  context 'without status' do
    let(:status) { nil }
    it 'is invalid' do
      expect(subject).not_to be_valid
    end
  end

  context 'with end time before start time' do
    let(:end_time) { DateTime.now - 2.hour }
    it 'is invalid' do
      expect(subject).not_to be_valid
    end
  end
end
