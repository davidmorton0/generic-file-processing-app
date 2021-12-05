# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Main do
  subject { described_class.new(filename).call }

  let(:filename) { 'input.txt' }
  let(:result) do
    <<~RESULT
      First record: 10
      Last record: 5
      10 | 9 | 8 | 7 | 6 | 5
    RESULT
  end

  it 'outputs the scores' do
    expect { subject }.to output(result).to_stdout
  end
end
