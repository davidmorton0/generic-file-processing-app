# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Outputer do
  subject { described_class.new(processed_data).call }

  let(:processed_data) { [10, 9, 8, 7, 6] }
  let(:expected_response) do
    <<~MESSAGE
      First record: 10
      Last record: 6
      10 | 9 | 8 | 7 | 6
    MESSAGE
  end

  it 'outputs the processed_data' do
    expect { subject }.to output(expected_response).to_stdout
  end
end
