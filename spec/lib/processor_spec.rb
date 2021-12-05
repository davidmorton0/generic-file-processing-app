# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Processor do
  subject { described_class.new(data, key).call }

  let(:data) { [1, 2, 3, 4, 5, 6] }
  let(:key) { 11 }

  context 'when data is provided' do
    it 'processes the data' do
      expect(subject).to eq [10, 9, 8, 7, 6, 5]
    end
  end

  context 'when data is nil' do
    let(:data) { nil }

    it 'raises an error' do
      expect { subject }.to raise_error('No data provided')
    end
  end

  context 'when data is empty' do
    let(:data) { [] }

    it 'raises an error' do
      expect { subject }.to raise_error('No data provided')
    end
  end

  context 'when key is nil' do
    let(:key) { nil }

    it 'raises an error' do
      expect { subject }.to raise_error('Key cannot be nil')
    end
  end
end
